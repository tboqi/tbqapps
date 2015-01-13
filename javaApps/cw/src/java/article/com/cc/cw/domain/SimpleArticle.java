package com.cc.cw.domain;

import java.util.Date;

/**
 * 普通文章类
 * @author lsd037
 *
 */
public class SimpleArticle extends Article{
	
	/** 截止日期，开局日期 */
	private Date endDate;
	/** 支持、反对投票数 */
	private int supportCount;
	private int unSupportCount;
	
	/** 标示文章状态， */
	private int state;
	/** 未开局、已开局 */
	public static final int STATE_UNOPEN = 0;
	public static final int STATE_OPEN = 1;
	
	private int channelId;
	
	/** 获胜方类型 支持方胜利为1 反对方获胜为2 默认为0*/
	private int voteResultType;
	public static final int RESULTTYPE_SUPPORT = 1;
	public static final int RESULTTYPE_UNSUPPORT = 2;
	/** 文章公开类型：0为允许其他人发起投票，1为只能自己发起投票 */
	public int publishType;
	/** 收藏此文章要花费的票数 */
	public int rate;
	/** 文章首选图片 */
	public String imgSrc;
	/** 二次投票发起者的id */
	private int secVoteMemId;
	/** 第一次投票的周期 */
	private int firstVoteCycle;
	/** 第一次投票的结果 */
	private String firstResult;
	
	private String fromUrl;//传闻来源网址
	private int status;
	
	public int getSecVoteMemId() {
		return secVoteMemId;
	}
	public void setSecVoteMemId(int secVoteMemId) {
		this.secVoteMemId = secVoteMemId;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getEndDate() {
		return endDate;
	}
	public int getSupportCount() {
		return supportCount;
	}
	public void setSupportCount(int supportCount) {
		this.supportCount = supportCount;
	}
	public int getUnSupportCount() {
		return unSupportCount;
	}
	public void setUnSupportCount(int unSupportCount) {
		this.unSupportCount = unSupportCount;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	public int getVoteResultType() {
		return voteResultType;
	}
	public void setVoteResultType(int voteResultType) {
		this.voteResultType = voteResultType;
	}
	public int getPublishType() {
		return publishType;
	}
	public void setPublishType(int publishType) {
		this.publishType = publishType;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getFirstVoteCycle() {
		return firstVoteCycle;
	}
	public void setFirstVoteCycle(int firstVoteCycle) {
		this.firstVoteCycle = firstVoteCycle;
	}
	public String getFirstResult() {
		return firstResult;
	}
	public void setFirstResult(String firstResult) {
		this.firstResult = firstResult;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj == null || !(obj instanceof SimpleArticle)){
			return false;
		}else{
			SimpleArticle s = (SimpleArticle) obj;
			if(this.getId() == s.getId()){
				return true;
			}else{
				return false;
			}
		}
	}
	@Override
	public int hashCode() {
		return this.getTitle().hashCode() + this.getId()*120 + this.getMemberId()*13;
	}
	public String getFromUrl() {
		return fromUrl;
	}
	public void setFromUrl(String fromUrl) {
		this.fromUrl = fromUrl;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
