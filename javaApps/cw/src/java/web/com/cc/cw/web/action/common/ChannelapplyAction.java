package com.cc.cw.web.action.common;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.ChannelCategory;
import com.cc.cw.domain.Member;
import com.cc.cw.service.ChannelCategoryService;
import com.cc.cw.service.ChannelService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.web.interceptor.MemberAware;

/**
 * 频道
 * 
 * @author
 */
public class ChannelapplyAction extends SessionActionSupport implements
		MemberAware {

	private static final long serialVersionUID = 3001480652662690422L;
	private Member member;
	private String[] spliter = {",","，","%","#"," ","&",".","。","\\","/"," "};
	// 表单的数据
	private String chname;
	private String description;
	private String key;
	private boolean loginFlag;//隐藏域
	private String msg;
	
//	 频道action所需服务
	private ChannelService channelService;
	private ChannelCategoryService channelCategoryService;
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		if(loginFlag){
			if(!ValidateUtil.checkString(chname)){
				msg = getText("error_channel_namenotnull");
				return INPUT;
			}
			if(!ValidateUtil.checkString(description)){
				msg = getText("error_channel_descnotnull");
				return INPUT;
			}
			if(!ValidateUtil.checkString(key)){
				msg = getText("error_channel_keywordsnotnull");
				return INPUT;
			}
			Channel ch = new Channel();
			ch.setMemberId(member.getId());
			ch.setName(Convert.getHtmlRealText(chname));
			String keywords = Convert.getHtmlRealText(key);
			ch.setKeywords(keywords);
			ch.setDescription(Convert.getHtmlRealText(description));
			if (channelService.add(ch) > 0) {// 当返回的ImpeachId大于0为成功
				keywords = replaceSplit(keywords);
				String[] tags = keywords.split(";");
				Set<String> tagSet = new HashSet(Arrays.asList(tags));
				
				for(String tag : tagSet){
					if(tag==null || tag.trim().equals(""))continue;
					ChannelCategory cc = new ChannelCategory();
					cc.setContent(tag);
					channelCategoryService.add(cc);
				}
				msg = getText("info_operation_success");
				return SUCCESS;
			}else{
				msg = getText("error_operation_error");
				return INPUT;
			}
		}
		return INPUT;
	}

	public String getChname() {
		return chname;
	}

	public void setChname(String chname) {
		this.chname = chname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Member getMember() {
		return member;
	}


	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}
	public void setLoginFlag(boolean loginFlag) {
		this.loginFlag = loginFlag;
	}
	
	private String replaceSplit(String strCont){
		String retCont = strCont;
		for(int i=0;i<spliter.length;i++){
			retCont = retCont.replace(spliter[i], ";");
		}
		return retCont;
	}

	public void setChannelCategoryService(
			ChannelCategoryService channelCategoryService) {
		this.channelCategoryService = channelCategoryService;
	}

	public String getMsg() {
		return msg;
	}
}
