package com.cc.cw.web.action.common;

import com.cc.cw.domain.Member;
import com.cc.cw.service.MemberService;
import com.cc.cw.util.URLCoderUtil;

/**
 * 会员通过点击验证邮件的链接进入此action，用于验证用户，激活用户
 * @author dzh
 * 上午10:50:09
 */
public class MemberAffirmAction extends BaseActionSupport{
	
	private static final long serialVersionUID = -3883382242329437525L;
	//action的result name
	private static final String INFO = "info";

	//action所需服务
	private MemberService memberService;
	
	//action所需数据
	private String uuid;
	private String userName;
	
	//info页面所需数据
	private String msg;
	
	public String execute(){
		try{
			userName = URLCoderUtil.decode(userName,"UTF-8");
			log.info("uuid    " + uuid);
			log.info("userName    " + userName);
			
			Member member = memberService.getByUUID(uuid);
			if(member != null){
				if(member.getUserName().equals(userName)){
					log.info("member affirm success!");
					//更新用户state;
					memberService.setMemberEnable(member.getId());
					msg = getText("info_member_affirm_success");
					return INFO;//跳转到提示页面，告知用户激活成功
				}else {
					log.info("member affirm error");
					String errorMsg = "error_member_affirm_error";
					this.addActionError(getText(errorMsg));
					return ERROR;
				}
			}
			else {//用户验证错误
				log.info("do not have this user");
				log.info("member affirm error");
				String errorMsg = "error_member_affirm_error";
				this.addActionError(getText(errorMsg));
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.info("member affirm error");
			String errorMsg = "error_member_affirm_error";
			this.addActionError(getText(errorMsg));
			return ERROR;//失败，跳转到错误页面
		}
	}

	//所有服务、数据的get set方法

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
