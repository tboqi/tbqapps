package com.cc.cw.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.dao.MemberDAO;
import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.Member;
import com.cc.cw.service.MemberService;

public class MemberServiceImpl implements MemberService{
	protected final Log log = LogFactory.getLog(getClass());
	private MemberDAO dao;
	
	public MemberDAO getDao() {
		return dao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	public int regist(Member member) {
		if(dao.existsUUID(member.getUuid())){
			member.setUuid(HashUtil.getUUID());
		}
		if(!dao.exists(member.getEmail())){
			log.debug("can add member");
			return dao.add(member);
		}
		else{
			log.debug("can not add member");
			return 0;
		}
	}

	public Member get(int id) {
		return dao.get(id);
	}
	
	public Member getByUUID(String uuid){
		return dao.getByUUID(uuid);
	}

	public boolean update(Member member) {
		return dao.update(member) > 0;
	}
	
	public boolean queryByIp(String ip , int id){
		return dao.queryByIp(ip ,id) > 0;
	}

	public Member login(String key ,String password,String loginType) throws IllegalArgumentException{
		if(loginType.trim().equals("email")){
			//用email登录
			log.debug("login by email");
			return dao.loginByEmail(key,password);
		}else if(loginType.trim().equals("id")){
			//用id登录
			log.debug("login by id");
			return dao.loginById(key,password);
		}else{
			throw new IllegalArgumentException("Login error!The  login type must be 'email' or 'id', don't have this login type :" + loginType);
		}
	}
	
	public boolean increaseMemberPrivilege(Member member){
		member.setPrivilege(member.getPrivilege() + 2);
		return update(member);
	}
	
	/**
	 * 更新member Privilege
	 * @param id
	 * @param value
	 * @return
	 */
	public boolean updatePrivilege(int id,int value){
		return dao.updatePrivilege(id, value) > 0;
	}
	
	/**
	 * 通过Id更新指定字段的值
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public int updateFieldValueById(int id ,String field , Object value){
		return dao.updateFieldValueById(id, field, value);
	}
	/**
	 * 标识用户已经激活
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean setMemberEnable(int id){
		return dao.setMemberEnable(id) > 0;
	}
	
	/**
	 * 更新用户uuid
	 * @param memberId
	 * @param uuid
	 * @return
	 */
	public boolean updateUUID(int memberId,String uuid){
		return dao.updateUUID(memberId, uuid) > 0;
	}

	public boolean updateCover(int memberId, String coverPath) {
		return dao.updateCover(memberId, coverPath) > 0;
	}

	public boolean updatePassword(int memberId, String password) {
		return dao.updatePassword(memberId, password) > 0;
	}

	public boolean updateUserName(int memberId, String userName) {
		return dao.updateUserName(memberId, userName) > 0;
	}

	public Member getByEmail(String email) {
		return dao.getByEmail(email);
	}
	
	public List<Member> getActivityMember(int page ,int count){
		int start = 0;
		if(page >= 1){
			start = (page - 1) * count;
		}
		return dao.getActivityMember(start,count);
	}

	public List<Member> getByFriendId(int myid, int page, int count) {
		int start = 0;
		if(page >= 1){
			start = (page - 1) * count;
		}
		return dao.getByFriendId(myid, start, count);
	}

	public List<Member> getByNewFriendId(int myid, int page, int count) {
		int start = 0;
		if(page >= 1){
			start = (page - 1) * count;
		}
		return dao.getByNewFriendId(myid, start, count);
	}

	public int addMemberPrivilege(int id, int addValue) {
		if(id>0){
			Member m = this.get(id);
			this.updatePrivilege(id, m.getPrivilege()+addValue);
			return m.getPrivilege()+addValue;
		}
		return 0;
	}

	public List<Member> getMemberSearch(String key, String property) {
		return dao.getMemberSearch(key, property);
	}

	public void updateState(int mid) {
		dao.updateState(mid);
	}

	public void unScreen(int mid) {
		dao.unScreen(mid);
	}

	public List<Member> getMember(int start, int num) {
		return dao.getMember(start, num);
	}

	public int getMemberCount() {
		return dao.getMemberCount();
	}

	public void updateCommend(int id, int commend) {
		dao.updateCommend(id, commend);
	}

	public List<Member> findLikeKey(String key) {
		return dao.getMember(key);
	}

	public List<Member> find() {
		return dao.find();
	}
	public List<Member> findCommendMember(int count){
		return dao.findCommendMember(count);
	}
}
