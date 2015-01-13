package com.cc.cw.domain;

import java.util.Date;

public class UnionUser {

	private Integer id;

	private String account;

	private String password;

	private String domainName;

	private String mainWebsiteName;

	private String mainWebsiteUrl;

	private String websiteType;

	private String realName;

	private Integer male;

	private String shenfenzheng;

	private String email;

	private String qq;

	private String phone;

	private String handset;

	private Integer payType;

	private String address;

	private String postcode;

	private String bank;

	private String cardNum;

	private String recommender;

	private String header;

	private String footer;

	private Date addTime;
	
	private String websiteName;
	private String keyword;
	private String description;
	
	public UnionUser() {
		super();
	}

	public UnionUser(Integer id, String account, String password,
			String domainName, String mainWebsiteName, String mainWebsiteUrl,
			String websiteType, String realName, Integer male,
			String shenfenzheng, String email, String qq, String phone,
			String handset, Integer payType, String address, String postcode,
			String bank, String cardNum, String recommender, String header,
			String footer, Date addTime, String websiteName) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.domainName = domainName;
		this.mainWebsiteName = mainWebsiteName;
		this.mainWebsiteUrl = mainWebsiteUrl;
		this.websiteType = websiteType;
		this.realName = realName;
		this.male = male;
		this.shenfenzheng = shenfenzheng;
		this.email = email;
		this.qq = qq;
		this.phone = phone;
		this.handset = handset;
		this.payType = payType;
		this.address = address;
		this.postcode = postcode;
		this.bank = bank;
		this.cardNum = cardNum;
		this.recommender = recommender;
		this.header = header;
		this.footer = footer;
		this.addTime = addTime;
		this.websiteName = websiteName;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

	public String getHandset() {
		return handset;
	}

	public void setHandset(String handset) {
		this.handset = handset;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMainWebsiteName() {
		return mainWebsiteName;
	}

	public void setMainWebsiteName(String mainWebsiteName) {
		this.mainWebsiteName = mainWebsiteName;
	}

	public String getMainWebsiteUrl() {
		return mainWebsiteUrl;
	}

	public void setMainWebsiteUrl(String mainWebsiteUrl) {
		this.mainWebsiteUrl = mainWebsiteUrl;
	}

	public Integer getMale() {
		return male;
	}

	public void setMale(Integer male) {
		this.male = male;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getPayType() {
		return payType;
	}

	public void setPayType(Integer payType) {
		this.payType = payType;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getRecommender() {
		return recommender;
	}

	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}

	public String getShenfenzheng() {
		return shenfenzheng;
	}

	public void setShenfenzheng(String shenfenzheng) {
		this.shenfenzheng = shenfenzheng;
	}

	public String getWebsiteType() {
		return websiteType;
	}

	public void setWebsiteType(String websiteType) {
		this.websiteType = websiteType;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getWebsiteName() {
		return websiteName;
	}

	public void setWebsiteName(String websiteName) {
		this.websiteName = websiteName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
