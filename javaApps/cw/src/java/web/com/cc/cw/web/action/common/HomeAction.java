package com.cc.cw.web.action.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cc.cw.domain.AtomLabel;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.FriendLink;
import com.cc.cw.domain.IndexPic;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UserLabel;
import com.cc.cw.domain.Vote;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.ChangePicService;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.FriendLinkService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.UserChannelService;
import com.cc.cw.service.UserLabelService;
import com.cc.cw.service.VoteService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.FileUtil;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.CwConfiguration;
import com.cc.cw.web.data.StaticNewArticles;
import com.opensymphony.webwork.ServletActionContext;

/**
 * 首页action
 * @author dzh
 * 上午10:12:42
 */
public class HomeAction extends SessionActionSupport {

	private static final long serialVersionUID = -2255843022436875843L;
	private IndexPic indexPic;
	private ChangePicService cPicService;
	//所需服务
	/** 文章服务 由spring负责实例化 */
	private SimpleArticleService simpleArticleService;
	/** 子标签服务 由spring负责实例化 */
	private AtomLabelService	 atLabelService;
	
	private ChannelService channelService;
	private FriendLinkService friendLinkService;
	
	//页面需要的数据
	/** 首页热门标签 */
	private List<AtomLabel> hotLabelList;
	/** 最热文章 */
	private List<SimpleArticle> hottestList;
	/** 最热文章图片 */
	private List<Map<String, Object>> hottestPicList;
	
	/** 本周看点图片，每日凌晨两点更新 */
	private List<Map<String, String>> weekPicList;
	
	/** 本月最热文章 */
	private List<SimpleArticle> monthList;
	/** 本周最热文章，每日凌晨两点更新 */
	private List<SimpleArticle> weekList;
	/** 最新文章,两分钟更新一次 */
	private List<Map> newListMap;
	/** 反对有理 */
	private List<SimpleArticle> againstList;
	/** 支持到底 */
	private List<SimpleArticle> suggestList;
	/** 二次投票 */
	private List<SimpleArticle> secondVoteList;
	
	/** 个性化首页服务 */
	private UserLabelService ulService;
	private UserChannelService uChService;
	
	private List<Channel> channelList;
	
	private VoteService voteService;
	private List<Map<String,String>> voteListMap;
	private MemberService memberService;
	private List<FriendLink> flinkList;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		loginErrors();//处理登录错误消息
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String uuid = "";
		int memberId = 0;
		if(member == null){
			uuid = (String)session.getAttribute("uuid");
		}
		else{
			uuid = member.getUuid();
			memberId = member.getId();
			session.removeAttribute("requestPageUri");//清空session
		}
		
		initHotPics2();
//		weekPicList = (List)GlobalData.globalData.get("weekPic");
//		weekList = (List)GlobalData.globalData.get("weekList");
		newListMap = (List<Map>)StaticNewArticles.globalData.get("newListMap");

		String baseDir = CwConfiguration.create().get("index.againstlist.path");
		againstList = queryVoteResultList(baseDir,false);
		baseDir = CwConfiguration.create().get("index.supportlist.path");
		suggestList = queryVoteResultList(baseDir,true);
		
//		secondVoteList = simpleArticleService.getSecondVoteArticles(1, 3);
		voteListMap = getNewVoteList();
		
		//初始化header中的标签
		getLabels(uuid);
		flinkList = friendLinkService.getLinkIndex();
//		broadcastList = broadcastService.getBroadcastOrderByDate(0, 10);
		if(uuid != null && !uuid.trim().equals("") && memberId > 0){
			//展现个性化首页，初始化最热文章s
			getHotArticlesList(uuid, memberId);
			//频道
			getChannelList(uuid);
			indexPic = cPicService.getIndexPic();
			return SUCCESS;
		}else{
			//默认首页
			//hottestList = simpleArticleService.getHottestArticles(1, 20);
			//加上广播台后改为10条
			hottestList = simpleArticleService.getHottestArticles(1, 10);
			channelList = channelService.getHotChannelsTuijian(1, 6);
		}
		
		//首页的图片更换
		indexPic = cPicService.getIndexPic();
		
		return SUCCESS;

	}
	
	/**
	 * 查询最近结束投票的文章
	 * @param filePath - 文件路径
	 * @param getSupport - 是否查询判断为真的文章
	 * @return
	 */
	private List<SimpleArticle> queryVoteResultList(String filePath,boolean getSupport){
		File file = new File(filePath);
		List<SimpleArticle> aList = new ArrayList<SimpleArticle>();
		if(file.exists() && ((new Date().getTime()-file.lastModified()) < 5 * 60 * 1000)){
			String content = FileUtil.readFile(filePath);
			String[] items = content.split(System.getProperty("line.separator"));
			if(items != null && items.length > 0){
				for(String item : items){
					SimpleArticle article = new SimpleArticle();
					if(item == null || item.trim().equals("")) continue;
					String[] values = item.split("~");
					article = simpleArticleService.getById(Integer.parseInt(values[0]));
					if(article.getStatus() == -1) break;
					
					aList.add(article);
				}
			}
			if(aList.size() < 12){
				if(getSupport)
					aList = simpleArticleService.getSupportArticles(1, 12);
				else
					aList = simpleArticleService.getUnsupportArticles(1, 12);
				
				if(aList != null && aList.size() > 0){
					StringBuilder builder = new StringBuilder();
					for(SimpleArticle article : aList){
						builder.append(article.getId());
						builder.append("~");
						builder.append(article.getTitle());
						builder.append(System.getProperty("line.separator"));
					}
					FileUtil.saveStringToFile(builder.toString(), filePath);
				}
			}
		}else{
			if(getSupport)
				aList = simpleArticleService.getSupportArticles(1, 12);
			else
				aList = simpleArticleService.getUnsupportArticles(1, 12);
			
			if(aList != null && aList.size() > 0){
				StringBuilder builder = new StringBuilder();
				for(SimpleArticle article : aList){
					builder.append(article.getId());
					builder.append("~");
					builder.append(article.getTitle());
					builder.append(System.getProperty("line.separator"));
				}
				FileUtil.saveStringToFile(builder.toString(), filePath);
			}
		}
		return aList;
	}
	
	/**
	 * 获得最热文章列表
	 *
	 */
	@SuppressWarnings("unchecked")
	public void getHotArticlesList(String uuid, int memberId){
		String baseDir = CwConfiguration.create().get("index.hot.path");
		String memberDir = "";
		String temp = "" + memberId;
		if(temp.length()>4){
			memberDir = temp.substring(0,temp.length()-4) + "/" + temp.substring(temp.length()-4);
		}else{
			memberDir = "0/" + temp;
		}
		File dir = new File(baseDir+memberDir);
		if(!dir.exists())dir.mkdirs();
		String fileName = baseDir+memberDir+"/hotarticles.txt";
		File file = new File(fileName);	
		int hotArticleCount = 10;	//页面显示最热文章数量
		if(file.exists() && ((new Date().getTime()-file.lastModified())<24*60*60*1000)){
			String[] items = loadPriFile(fileName);
			if(items!=null && items.length>0)
				hottestList = new ArrayList<SimpleArticle>();
			for(int i=0;items!=null && i<items.length;i+=2){
				if(items[i]==null || items[i+1]==null)continue;
				int id = Integer.parseInt(items[i]);
				String title = items[i+1];
				if(id<=0)continue;
				SimpleArticle article = new SimpleArticle();
				article = simpleArticleService.getById(id);
				if(article == null || article.getStatus() == -1) break;
//				SimpleArticle article = simpleArticleService.getById(id);
//				if(article == null) continue;
				hottestList.add(article);
			}
//			如果有被屏蔽的文章重新生成hotarticles.txt
			if(hottestList.size() < 10){
				hottestList = ulService.getFavoriteLabelArticles(uuid, 5, 1, hotArticleCount , memberId);
				if(hottestList != null){
					if(hottestList.size() <= hotArticleCount-1){//如果取出数量不足10条，则补齐
						int needCount = hotArticleCount - hottestList.size();//应继续取剩余数量的文章
						StringBuffer sb = new StringBuffer();
						for(int i = 0 ; i < hottestList.size() ; i++){//获得已经取出的文章id，避免重复
							SimpleArticle item = hottestList.get(i);
							if(item==null)continue;
							if(i<hottestList.size()-1){
								sb.append(item.getId());
								sb.append(",");
							}else{
								sb.append(item.getId());
							}
						}

						if(!sb.toString().equals(""))
							hottestList.addAll(simpleArticleService.getHottestArticles(1, needCount,sb.toString()));
						else
							hottestList.addAll(simpleArticleService.getHottestArticles(1, needCount));
					}
				}else{
					hottestList = simpleArticleService.getHottestArticles(1, hotArticleCount);
				}
				writePriFile(fileName);
			}
		}else{
			hottestList = ulService.getFavoriteLabelArticles(uuid, 5, 1, hotArticleCount , memberId);
			if(hottestList != null){
				if(hottestList.size() <= hotArticleCount-1){//如果取出数量不足10条，则补齐
					int needCount = hotArticleCount - hottestList.size();//应继续取剩余数量的文章
					StringBuffer sb = new StringBuffer();
					for(int i = 0 ; i < hottestList.size() ; i++){//获得已经取出的文章id，避免重复
						SimpleArticle item = hottestList.get(i);
						if(item==null)continue;
						if(i<hottestList.size()-1){
							sb.append(item.getId());
							sb.append(",");
						}else{
							sb.append(item.getId());
						}
					}

					if(!sb.toString().equals(""))
						hottestList.addAll(simpleArticleService.getHottestArticles(1, needCount,sb.toString()));
					else
						hottestList.addAll(simpleArticleService.getHottestArticles(1, needCount));
				}
			}else{
				hottestList = simpleArticleService.getHottestArticles(1, hotArticleCount);
			}
			writePriFile(fileName);
		}
	}
	
	public String[] loadPriFile(String fileName){
		String[] items = null;
		File file = new File(fileName);
		if(!file.exists()){
			return null;
		}
		items = new String[40];
		try {
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String tempStr = "";
			int i = 0;
			while((tempStr = br.readLine())!=null){
				if(i>40)break;
				if(tempStr==null){
					items[i] = "0";
				}
				else{
					items[i] = tempStr;
				}
				i++;
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return items;		
	}
	
	public void writePriFile(String fileName){
		if(hottestList==null || hottestList.size()<=0)return;
		File file = new File(fileName);
		if(!file.exists()){
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(file)));
			for(int i = 0 ; i < hottestList.size() ; i++){
				SimpleArticle item = hottestList.get(i);
				if(item==null)continue;
				String tempStr = "";
				tempStr = String.valueOf(item.getId());
				pw.println(tempStr);
				tempStr = Convert.getText(item.getTitle());
				pw.println(tempStr);
			}
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获得频道列表
	 */
	@SuppressWarnings("unchecked")
	public void getChannelList(String uuid){
		int channelCount = 6;
		channelList = uChService.getUserChannels(uuid, 1, channelCount);
		if(channelList != null){
			if(channelList.size() < channelCount){
				int needCount = channelCount - channelList.size();
				StringBuffer sb = new StringBuffer();
				for(int i = 0 ; i < channelList.size() ; i++){
					if(i<channelList.size()-1){
						sb.append(channelList.get(i).getId());
						sb.append(",");
					}else{
						sb.append(channelList.get(i).getId());
					}
				}
//				log.debug("needCount --> " + needCount);
//				log.debug("channel Id --> " + sb.toString());
				if(!sb.toString().trim().equals("")){
					channelList.addAll(channelService.getHotChannelsTuijian(1, needCount,sb.toString()));
				}
				else{
					channelList.addAll(channelService.getHotChannelsTuijian(1, needCount));
				}
			}
			}else{
			channelList = channelService.getHotChannelsTuijian(1, channelCount);
			
		}
	}
	
	/**
	 * 初始化标签列表，用户最喜欢的标签和最热标签
	 * @param uuid
	 */
	@SuppressWarnings("unchecked")
	public void getLabels(String uuid){
		int labelCount = 10;
		StringBuffer sb = new StringBuffer();
		if(uuid != null && !uuid.trim().equals("")){
			List<UserLabel> labels = ulService.getFavoriteLabels(uuid, 3);
			hotLabelList = new ArrayList();
			if(labels!=null){
				for(int i = 0 ; i < labels.size(); i++){
					if(i<labels.size()-1){
						sb.append("'"+labels.get(i).getLabel()+"'");
						sb.append(",");
					}else{
						sb.append("'"+labels.get(i).getLabel()+"'");
					}
					AtomLabel alb = new AtomLabel();
					alb.setContent(labels.get(i).getLabel());
					hotLabelList.add(alb);
				}
//				log.debug("sb --> " + sb.toString());
				if(!sb.toString().trim().equals("")){
					List<AtomLabel> hotLabels = atLabelService.getHotAtomLabel(1,labelCount - hotLabelList.size(),sb.toString());
					hotLabelList.addAll(hotLabels);
				}else{
					hotLabelList = atLabelService.getHotAtomLabel(1, labelCount);
				}
			}
		}else{
			hotLabelList = atLabelService.getHotAtomLabel(1, labelCount);
		}
	}
	/**
	 * 得到6个推荐的用户
	 *
	 */
	private void initHotPics2(){
		hottestPicList = new ArrayList<Map<String,Object>>();
		List<Member> list = memberService.findCommendMember(6);
		for(int i=0; i<list.size();i++){
			Map<String, Object> picMap = new HashMap<String, Object>();
			Member member = list.get(i);
			picMap.put("memberId", member.getId());
			picMap.put("memberName", member.getUserName());
			picMap.put("imgSrc", member.getCoverPath());
			picMap.put("iWidth", 84);
			picMap.put("iHeight", 84);
			hottestPicList.add(picMap);
		}
	}
	
	/**
	 * 得到五张最热文章的图片
	 * 
	 * @param hotPicList
	 * @return List<Map<String, String>>
	 * @throws MalformedURLException
	 */
	private void initHotPics() {
		if (hottestPicList == null) {
			hottestPicList = new ArrayList<Map<String, Object>>();
		}
		int start = 1;
		while(hottestPicList.size() <= 6){
			List<SimpleArticle> list = getHotArticles(start, 5);
			if (list == null || list.size() <= 0) {
				log.debug("do not have hot article");
				return;
			}
			for(int i = 0 ; i < list.size() ; i++){
				if(i == list.size()-1){//到达for循环结尾时将开始(star)变量加一，方便取后五篇文章
					start += 1;
				}
				Map<String, Object> picMap = new HashMap<String, Object>();
				SimpleArticle article = list.get(i);
				if (article == null)
					continue;
				String title = article.getTitle();
				String content = article.getContent();
				String img = ArticleHelper.getCoverSrc(content);
				// 如果没有图片，则取下一条数据
				if (img == null || img.trim().equals(""))
					continue;
				picMap.put("articleId", "" + article.getId());
				picMap.put("title", title);
				picMap.put("imgSrc", img);
				picMap.put("iWidth", 84);
				picMap.put("iHeight", 84);
				hottestPicList.add(picMap);
				if (hottestPicList.size() >= 6) {//如果图片到达六张，则不继续循环，免得超过六张，陷入死循环
					return;
				}
			}
		}
	}
	
	//从LoginAction获得登录失败的消息
	@SuppressWarnings("unchecked")
	private void loginErrors(){
		Map<String , Object> map = (Map<String,Object>)session.get("errorMap");
		if(map == null || map.size() <= 0){
			return;
		}else{
			Set<String> keys = map.keySet();
			for(String key : keys){
				this.addFieldError(key, map.get(key).toString());
			}
			session.remove("errorMap");
		}
	}
	
	private List<SimpleArticle> getHotArticles(int page,int count){
		return simpleArticleService.getHottestArticles(page,count);
	}
	
	/**
	 * 查询正在进行投票的文章
	 * @return
	 */
	private List<Map<String,String>> getNewVoteList(){
		String baseDir = CwConfiguration.create().get("index.vote.path");
		File file = new File(baseDir);
		if(file.exists() && ((new Date().getTime()-file.lastModified()) < 5 * 60 * 1000)){
			String content = FileUtil.readFile(baseDir);
			String[] items = content.split(System.getProperty("line.separator"));
			if(items != null && items.length > 0){
				voteListMap = new ArrayList<Map<String,String>>();
				
				for(String item : items){
					if(item == null || item.trim().equals("")) continue;
					String[] values = item.split("~");
					if(simpleArticleService.getById(Integer.parseInt(values[2])) == null 
							|| simpleArticleService.getById(Integer.parseInt(values[2]))
							.getStatus() == -1)break;
					Map<String,String> map = new HashMap<String,String>();
					String uuName = values[1];
					if(uuName.contains("&7E;"))uuName = uuName.replaceAll("&7E;", "~");
					map.put("userId", values[0]);
					map.put("userName", uuName);
					map.put("articleId",values[2]);
					map.put("title", values[3]);
					map.put("voteType",values[4]);
					
					voteListMap.add(map);
				}
			}
			if (voteListMap.size() < 10){
				List<Vote> voteList = voteService.getNewVote(1, 10);
				if(voteList != null && voteList.size() > 0){
					voteListMap = new ArrayList<Map<String,String>>();
					StringBuilder builder = new StringBuilder();
					Member voteMember = null;
					for(Vote vote : voteList){
						Map<String,String> map = new HashMap<String,String>();
						if(vote.getMemberId() == 1000000){
							voteMember = new Member();
							voteMember.setId(1000000);
							voteMember.setUserName("游客");
						}else{
							voteMember = memberService.get(vote.getMemberId());
							if(voteMember == null) continue;
						}
						if(vote.getResourceType().equals("Article")){
							SimpleArticle article = simpleArticleService.getById(vote.getResourceId());
							if(article == null) continue;
							map.put("userId", ""+voteMember.getId());
							map.put("userName", voteMember.getUserName());
							map.put("articleId",""+article.getId());
							map.put("title", article.getTitle());
							String voteType = "支持票";
							if(vote.getVoteCategory().equalsIgnoreCase("UnSupport"))
								voteType = "反对票";
							map.put("voteType",voteType);
							voteListMap.add(map);
							
							String uName = voteMember.getUserName();
							if(uName.contains("~")){
								uName = uName.replaceAll("~", "&7E;");
							}
							
							builder.append(voteMember.getId());
							builder.append("~");
							builder.append(uName);
							builder.append("~");
							builder.append(article.getId());
							builder.append("~");
							builder.append(article.getTitle());
							builder.append("~");
							builder.append(voteType);
							builder.append(System.getProperty("line.separator"));
						}
					}
					
					FileUtil.saveStringToFile(builder.toString(), baseDir);
				}
			}
		}else{
			List<Vote> voteList = voteService.getNewVote(1, 10);
			if(voteList != null && voteList.size() > 0){
				voteListMap = new ArrayList<Map<String,String>>();
				StringBuilder builder = new StringBuilder();
				Member voteMember = null;
				for(Vote vote : voteList){
					Map<String,String> map = new HashMap<String,String>();
					if(vote.getMemberId() == 1000000){
						voteMember = new Member();
						voteMember.setId(1000000);
						voteMember.setUserName("游客");
					}else{
						voteMember = memberService.get(vote.getMemberId());
						if(voteMember == null) continue;
					}
					if(vote.getResourceType().equals("Article")){
						SimpleArticle article = simpleArticleService.getById(vote.getResourceId());
						if(article == null) continue;
						map.put("userId", ""+voteMember.getId());
						map.put("userName", voteMember.getUserName());
						map.put("articleId",""+article.getId());
						map.put("title", article.getTitle());
						String voteType = "支持票";
						if(vote.getVoteCategory().equalsIgnoreCase("UnSupport"))
							voteType = "反对票";
						map.put("voteType",voteType);
						voteListMap.add(map);
						
						String uName = voteMember.getUserName();
						if(uName.contains("~")){
							uName = uName.replaceAll("~", "&7E;");
						}
						
						builder.append(voteMember.getId());
						builder.append("~");
						builder.append(uName);
						builder.append("~");
						builder.append(article.getId());
						builder.append("~");
						builder.append(article.getTitle());
						builder.append("~");
						builder.append(voteType);
						builder.append(System.getProperty("line.separator"));
					}
				}
				
				FileUtil.saveStringToFile(builder.toString(), baseDir);
			}
		}
		
		return voteListMap;
	}
	
	//所有数据的get方法和服务的set方法
	
	public List<Channel> getChannelList() {
		return channelList;
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
	
	public List<SimpleArticle> getMonthList() {
		return monthList;
	}

	public List<SimpleArticle> getWeekList() {
		return weekList;
	}

	public List<AtomLabel> getHotLabelList(){
		return hotLabelList;
	}
	
	public void setAtLabelService(AtomLabelService labelService){
		this.atLabelService = labelService;
	}

	@SuppressWarnings("unchecked")
	public List<Map> getNewListMap() {
		return newListMap;
	}

	public List<Map<String, Object>> getHottestPicList() {
		return hottestPicList;
	}

	public void setUlService(UserLabelService ulService) {
		this.ulService = ulService;
	}

	public void setUChService(UserChannelService chService) {
		uChService = chService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public List<SimpleArticle> getHottestList() {
		return hottestList;
	}
	
	public List<SimpleArticle> getAgainstList() {
		return againstList;
	}
	public List<SimpleArticle> getSuggestList() {
		return suggestList;
	}
	public List<Map<String, String>> getWeekPicList() {
		return weekPicList;
	}
	public void setHottestPicList(List<Map<String, Object>> hottestPicList) {
		this.hottestPicList = hottestPicList;
	}
	public List<SimpleArticle> getSecondVoteList() {
		return secondVoteList;
	}
	
	public List<Map<String, String>> getVoteListMap() {
		return voteListMap;
	}

	public void setVoteService(VoteService voteService) {
		this.voteService = voteService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public ChangePicService getCPicService() {
		return cPicService;
	}

	public void setCPicService(ChangePicService picService) {
		cPicService = picService;
	}

	public IndexPic getIndexPic() {
		return indexPic;
	}

	public void setIndexPic(IndexPic indexPic) {
		this.indexPic = indexPic;
	}

	public List<FriendLink> getFlinkList() {
		return flinkList;
	}

	public void setFlinkList(List<FriendLink> flinkList) {
		this.flinkList = flinkList;
	}

	public FriendLinkService getFriendLinkService() {
		return friendLinkService;
	}

	public void setFriendLinkService(FriendLinkService friendLinkService) {
		this.friendLinkService = friendLinkService;
	}
	
}
