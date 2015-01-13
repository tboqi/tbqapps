package com.cc.cw.web.action.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.web.CwConfiguration;
import com.cc.cw.web.interceptor.MemberAware;

/**
 * 用户管理action
 * 1、更新用户信息
 * 2、查询发表过的文章及回复过的文章
 * 3、浏览、回复、删除短消息
 * @author wangyx
 *
 */
public class UserManageAction extends SessionActionSupport implements MemberAware{

	private static final long serialVersionUID = -3337612205146396112L;
	public static final String VIEW = "view";
	//###########################################用户相关
	private Member member;
	private MemberService memberService;
	private MessageService messageService;
	private String password_cnf;
	private String userName;
	private String descript;
	private int gender;
	private int memberId;
	private Member viewMember;
	
	//###########################################文章相关
	private SimpleArticleService articleService;
	private List<SimpleArticle> articleList;
	private List<SimpleArticle> collectArticleList;
	private List<SimpleArticle> voteArticleList;
	
    //###########################################用户好友相关
	private List<Member> friendList;
	private List<Member> newfriendList;
	
	//############################################页面元素
	private boolean success;
	
	private String requestURI;
	/** 未读邮件数量 */
	private int unReadMsg;
	/** 操作结果提示信息 */
	private String msg;
	/** 第二天，用来判断那些文章到达截止日期 */
	private Date currentDate;
	
	private ChannelService cs;
	/** 用户所有频道，用于发起投票时选择 */
	private List<Channel> channelList;


	/** 跳转到用户管理页面 */
	@SuppressWarnings("unchecked")
	public String execute(){
		Calendar c = Calendar.getInstance();
		GregorianCalendar g = new GregorianCalendar(c.get(Calendar.YEAR),c.get(Calendar.MONTH),c.get(Calendar.DATE)+1);
		currentDate = g.getTime();
		String returnPath = VIEW;//判断用户是否访问自己的空间
		member = (Member)session.get("member");
		if(member != null){
			if(memberId == 0){//如果memberid等于0，说明是查看自己的信息
				returnPath = SUCCESS;
				memberId = member.getId();
				unReadMsg = messageService.getUnReadMessageCount(memberId);
//				requestURI = ServletActionContext.getRequest().getRequestURI();
			}else if(memberId != member.getId()){//如果memberId不等于登录用户的id，转向查看用户空间页面
				returnPath = VIEW;
			}else{//否则转向用户空间
				returnPath = SUCCESS;
			}
			
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			channelList = cs.getByMemberId(1, count, member.getId());
		}
		//获得被访用户的信息
//		viewMember = memberService.get(memberId);
		//获得被访用户发布文章列表
		articleList = articleService.getArticlesByMemberId(memberId,1,10);
		//获得被访用户收录文章列表
		collectArticleList = articleService.getAllMyCollectedArticles(memberId, 1, 10);
		//获得被访用户发起投票的文章列表
//		voteArticleList = articleService.getAllMyVoteArticles(memberId, 1, 5);
		//获取被访用户的随机好友
//		friendList = memberService.getByFriendId(memberId, 1, 4);
		//获取被访用户的最新好友
//		newfriendList = memberService.getByNewFriendId(memberId, 1, 4);
		//获取被访用户的最新访客
		initleft(memberId);
		return returnPath;
	}
	
	private void initleft(int memberId){
		//获得被访用户的信息
		viewMember = memberService.get(memberId);
		//获取被访用户的随机好友
		friendList = memberService.getByFriendId(memberId, 1, 4);
		//获取被访用户的最新好友
		newfriendList = memberService.getByNewFriendId(memberId, 1, 4);
		//获取被访用户的最新访客
	}
	public String viewMyInfo(){
		member = (Member)session.get("member");
		initleft(member.getId());
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		
		return INPUT;
	}
	
	/** 更新用户昵称 */
	@SuppressWarnings("unchecked")
	public String updateName(){
		member = (Member)session.get("member");
		if(member == null){
			msg = getText("error_member_null");
			return SUCCESS;
		}
		String name = member.getUserName();//获得旧昵称，用于记录日志
		member.setUserName(userName.trim());
		success = memberService.updateUserName(member.getId(), userName);
		if(descript!=null && !descript.equals("")){
			memberService.updateFieldValueById(member.getId(), "gender", gender);
			memberService.updateFieldValueById(member.getId(), "descript", descript);
			member.setDescript(descript);
			member.setGender(gender);
		}
		initleft(member.getId());
		if(success){
			session.put("member", member);//更新session
			msg = getText("info_operation_success");
			log.info("member "+member.getId()+" updateName FROM: "+name.trim()+" TO: "+member.getUserName().trim()+" is SUCCESS!");
			return INPUT;
		}
		else{
			msg = getText("error_operation_error");
			log.info("member "+member.getId()+" updateName FROM: "+name.trim()+" TO: "+member.getUserName().trim()+" is FAILED!");
			return INPUT;
		}
	}
	
	/** 更新用户密码 */
	public String updatePwd(){
		member = (Member)session.get("member");
		if(member == null){
			msg = getText("error_member_null");
			return SUCCESS;
		}
		String pwd = member.getPassword();
		member.setPassword(password_cnf.trim());
		success = memberService.updatePassword(member.getId(), password_cnf);
		initleft(member.getId());
		if(success){
			msg = getText("info_operation_success");
			log.info("member "+member.getId()+" updatePwd FROM: "+pwd+" TO: "+member.getPassword()+" is SUCCESS!");
			return INPUT;
		}
		else{
			msg = getText("error_operation_error");
			log.info("member "+member.getId()+" updatePwd FROM: "+pwd.trim()+" TO: "+member.getPassword().trim()+" is FAILED!");
			return INPUT;
		}
	}
	
	

	private static String baseDir = CwConfiguration.create().get("upload.dir");
	File doc;
	private String docContentType;
	private String docFileName;
	private String coverPath;
	
	/** 更新用户头像 */
	@SuppressWarnings("unchecked")
	public String updateCover(){
		log.info("baseDir=="+baseDir);
		log.info("doc=="+doc);
		if(doc == null){
			msg = getText("error_member_uploadcover");
			initleft(member.getId());
			return INPUT;
		}
		log.info("doc.length()=="+doc.length());
		log.info("docContentType=="+docContentType);
		log.info("docFileName=="+docFileName);
		
		member = (Member)session.get("member");
		if(member == null){
			msg = getText("error_member_null");
			return INPUT;
		}
		File coverFile = new File(baseDir+"/userCovers/"+member.getId());
		if(!coverFile.exists())
			coverFile.mkdirs();
		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(doc));
			File f = new File(coverFile,docFileName);
			coverPath = f.getAbsolutePath();
			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(f));
			byte [] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		log.info("coverPath=="+coverPath);
		String path = member.getCoverPath();//记录日志
		member.setCoverPath(coverPath.trim());
		initleft(member.getId());
		success = memberService.updateCover(member.getId(), coverPath);
		if(success){
			msg = getText("info_operation_success");
			log.info("member "+member.getId()+" updatePwd FROM: "+member.getCoverPath().trim()+" TO: "+path.trim()+" is SUCCESS!");
			session.put("member", member);
			return INPUT;
		}
		else{
			msg = getText("error_operation_error");
			log.info("member "+member.getId()+" updatePwd FROM: "+member.getCoverPath().trim()+" TO: "+path.trim()+" is FAILED!");
			return INPUT;
		}
	}
	
	private int articleId;
	private int channelId;
	private Channel channel;


	public String removeCollection(){
		channelId = articleService.getCollectArticleChannelId(articleId, member.getId());
		boolean flag = articleService.deleteCollectionArticle(articleId ,channelId);
		if(flag){
			channel = cs.getById(channelId);
			channel.setArticleNums(channel.getArticleNums() - 1);
			cs.update(channel);
		}
		return SUCCESS;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}
	public void setPassword_cnf(String password_cnf) {
		this.password_cnf = password_cnf;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}
	public List<SimpleArticle> getArticleList() {
		return articleList;
	}
	public List<SimpleArticle> getCollectArticleList() {
		return collectArticleList;
	}
	public List<SimpleArticle> getVoteArticleList() {
		return voteArticleList;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getMemberId() {
		return memberId;
	}
	public Member getMember() {
		return member;
	}
	public Member getViewMember() {
		return viewMember;
	}
	public String getMsg() {
		return msg;
	}
	public void setDoc(File doc) {
		this.doc = doc;
	}
	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}
	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}
	public String getCoverPath() {
		return coverPath;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getCurrentDate() {
		return currentDate;
	}

	public List<Channel> getChannelList() {
		return channelList;
	}

	public void setCs(ChannelService cs) {
		this.cs = cs;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getChannelId() {
		return channelId;
	}
	public Channel getChannel() {
		return channel;
	}

	public List<Member> getFriendList() {
		return friendList;
	}

	public List<Member> getNewfriendList() {
		return newfriendList;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public int getUnReadMsg() {
		return unReadMsg;
	}
	public String getRequestURI(){
		return requestURI;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}
}
