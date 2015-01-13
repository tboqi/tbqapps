package com.cc.cw.web.union;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cc.cw.domain.AtomLabel;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UnionUser;
import com.cc.cw.domain.UserLabel;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.UnionUserService;
import com.cc.cw.service.UserLabelService;
import com.cc.cw.util.Convert;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.action.common.BaseActionSupport;
import com.cc.cw.web.data.GlobalData;
import com.opensymphony.webwork.ServletActionContext;

public class UnionIndexAction extends BaseActionSupport {

	private static final long serialVersionUID = 2577960100723880585L;

	/** 文章服务 由spring负责实例化 */
	private SimpleArticleService simpleArticleService;

	/** 子标签服务 由spring负责实例化 */
	private AtomLabelService atLabelService;
	private UserLabelService ulService;
	private UnionUserService unionUserService;
	/** 获取静态全局数据的工具类 */
	private GlobalData globalData;

	/**
	 * 最新的带图片的文章，
	 */
	private SimpleArticle theLastArticleWithPic;
	
	private List<SimpleArticle> last2Article;
	
	private List<SimpleArticle> last10Article;
	
	private List<AtomLabel> hotLabelList;
	
	private List<SimpleArticle> hottestList;//推荐文章
	
	private List<SimpleArticle> suggestList;//真的
	
	private List<SimpleArticle> againstList;//假的
	
	private List<SimpleArticle> weekList; //本周看点
	
	private UnionUser uu;

	@SuppressWarnings("unchecked")
	public String execute() {
		String domainName = ServletActionContext.getRequest().getServerName();
		String ip = ServletActionContext.getRequest().getRemoteAddr();
		unionUserService.saveIp(ip, domainName);
		uu = (UnionUser)unionUserService.getWebsiteConfigMap(domainName);
		//super.getConfigMap();
		theLastArticleWithPic = getLastArticleWithPic();
		last2Article = getNewArticleList(0, 2);
		last10Article = getNewArticleList(2, 10);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String uuid = (String)session.getAttribute("uuid");
		getLabels(uuid);
		
		hottestList = simpleArticleService.getHottestArticles(1, 13);
		suggestList = simpleArticleService.getSupportArticles(1, 10);
		againstList = simpleArticleService.getUnsupportArticles(1, 10);
		weekList = globalData.getWeekList();
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public void getLabels(String uuid){
		int labelCount = 15;
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
				//log.info("labels --> " + sb.toString());
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

	private List<SimpleArticle> getNewArticleList(int start, int num) {
		List<SimpleArticle> list = simpleArticleService.getNewArticles(start, num);
		for(SimpleArticle article : list){
			String content = article.getContent();
			if(content==null)content="无内容";
			content=Convert.getText(content);
			
			if(content.length()>80)content=content.substring(0,75)+"...";
			article.setContent(content);
		}
		return list;
	}

	private SimpleArticle getLastArticleWithPic() {
		String pic = null;
		List<SimpleArticle> list = null;
		SimpleArticle article = null;

		list = simpleArticleService.getNewArticles(0, 1);
		if (list == null || list.size() <= 0) {
			return null;
		}
		article = list.get(0);
		pic = ArticleHelper.getCoverSrc(article.getContent());
		article.setImgSrc(pic);

		return article;
	}

	public AtomLabelService getAtLabelService() {
		return atLabelService;
	}

	public void setAtLabelService(AtomLabelService atLabelService) {
		this.atLabelService = atLabelService;
	}

	public GlobalData getGlobalData() {
		return globalData;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}

	public SimpleArticleService getSimpleArticleService() {
		return simpleArticleService;
	}

	public void setSimpleArticleService(
			SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}

	public SimpleArticle getTheLastArticleWithPic() {
		return theLastArticleWithPic;
	}

	public void setTheLastArticleWithPic(SimpleArticle theLastArticleWithPic) {
		this.theLastArticleWithPic = theLastArticleWithPic;
	}

	public List<SimpleArticle> getLast2Article() {
		return last2Article;
	}

	public void setLast2Article(List<SimpleArticle> last2Article) {
		this.last2Article = last2Article;
	}

	public List<SimpleArticle> getLast10Article() {
		return last10Article;
	}

	public void setLast10Article(List<SimpleArticle> last10Article) {
		this.last10Article = last10Article;
	}

	public List<AtomLabel> getHotLabelList() {
		return hotLabelList;
	}

	public void setHotLabelList(List<AtomLabel> hotLabelList) {
		this.hotLabelList = hotLabelList;
	}

	public UserLabelService getUlService() {
		return ulService;
	}

	public void setUlService(UserLabelService ulService) {
		this.ulService = ulService;
	}

	public List<SimpleArticle> getHottestList() {
		return hottestList;
	}

	public void setHottestList(List<SimpleArticle> hottestList) {
		this.hottestList = hottestList;
	}

	public List<SimpleArticle> getSuggestList() {
		return suggestList;
	}

	public void setSuggestList(List<SimpleArticle> suggestList) {
		this.suggestList = suggestList;
	}

	public List<SimpleArticle> getAgainstList() {
		return againstList;
	}

	public void setAgainstList(List<SimpleArticle> againstList) {
		this.againstList = againstList;
	}

	public List<SimpleArticle> getWeekList() {
		return weekList;
	}

	public void setWeekList(List<SimpleArticle> weekList) {
		this.weekList = weekList;
	}

	public UnionUserService getUnionUserService() {
		return unionUserService;
	}

	public void setUnionUserService(UnionUserService unionUserService) {
		this.unionUserService = unionUserService;
	}


	public UnionUser getUu() {
		return uu;
	}

	public void setUu(UnionUser uu) {
		this.uu = uu;
	}
}
