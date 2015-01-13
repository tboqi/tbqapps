package com.cc.cw.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.MemberDAO;
import com.cc.cw.domain.Member;

public class MemberDAOImpl extends SqlMapClientDaoSupport implements MemberDAO {

	public Member get(int id){
		return (Member)this.getSqlMapClientTemplate().queryForObject("member.get", id);
	}
	
	public int add(Member member){
		return (Integer)this.getSqlMapClientTemplate().insert("member.add",member);
	}
	
	public int update(Member member){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("password", member.getPassword());
		map.put("userName", member.getUserName());
		map.put("privilege", member.getPrivilege());
		map.put("privilegeDecimalValue", member.getPrivilegeDecimalValue());
		map.put("lastLoginTime", member.getLastLoginTime());
		map.put("ip", member.getIp());
		map.put("id", new Integer(member.getId()));
		return this.getSqlMapClientTemplate().update("member.update", map);
	}
	
	@SuppressWarnings("unchecked")
	public int queryByIp(String ip ,int id){
		Map map = new HashMap();
		map.put("ip", ip);
		map.put("id", id);
		return (Integer)this.getSqlMapClientTemplate().queryForObject("member.queryByIp", map);
	}
	
	public boolean exists(String key){
		Object obj = this.getSqlMapClientTemplate().queryForObject("member.exists", key);
		if(obj != null){
			return ((Integer)obj) > 0;
		}
		else{
			return false;
		}
	}
	
	public boolean existsUUID(String key){
		Object obj = this.getSqlMapClientTemplate().queryForObject("member.existsUUID", key);
		if(obj != null){
			return ((Integer)obj) > 0;
		}
		else{
			return false;
		}
	}
	
	private Member loginByKeyword(String key,String password ,String columnName){
		Map<String,String> map = new HashMap<String,String>();
		map.put("column", columnName);
		map.put("key", key);
		map.put("password", password);
		return (Member)this.getSqlMapClientTemplate().queryForObject("member.loginByKeyword", map);
	}
	
	public Member loginByEmail(String email,String password) {
		return this.loginByKeyword(email, password, "Email");
	}
	
	public Member loginById(String id,String password){
		return this.loginByKeyword(id, password, "Id");
	}
	
	/**
	 * 更新member Privilege
	 * @param id
	 * @param value
	 * @return
	 */
	public int updatePrivilege(int id,int value){
		return updateFieldValueById(id,"Privilege",value);
	}
	
	/**
	 * 通过Id更新指定字段的值
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public int updateFieldValueById(int id ,String field , Object value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("field", field);
		map.put("value", value);
		return this.getSqlMapClientTemplate().update("member.updateFieldValueById",map);
	}
	
	public int setMemberEnable(int id){
		return this.updateFieldValueById(id, "State", Member.STATE_ENABLE);
	}
	
	/**
	 * 更新用户uuid
	 * @param memberId
	 * @param uuid
	 * @return
	 */
	public int updateUUID(int memberId,String uuid){
		return updateFieldValueById(memberId,"Uuid",uuid);
	}
	
	public Member getByUUID(String uuid){
		return (Member) this.getSqlMapClientTemplate().queryForObject("member.getByUUID", uuid);
	}

	public int updateCover(int memberId, String coverPath) {
		return updateFieldValueById(memberId,"CoverPath",coverPath);
	}

	public int updatePassword(int memberId, String password) {
		return updateFieldValueById(memberId,"Password",password);
	}

	public int updateUserName(int memberId, String userName) {
		return updateFieldValueById(memberId,"UserName",userName);
	}

	public Member getByEmail(String email) {
		return (Member)this.getSqlMapClientTemplate().queryForObject("member.getByEmail", email);
	}

	@SuppressWarnings("unchecked")
	public List<Member> getActivityMember(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		List<Integer> memberIdList =  this.getSqlMapClientTemplate().queryForList("member.getActivityMember", map);
		List<Member> activityList = new ArrayList();
		for(int id : memberIdList){
			Member member = this.get(id);
			if(member != null)
				activityList.add(member);
		}
		return activityList;
	}
	@SuppressWarnings("unchecked")
	public List<Member> getByFriendId(int myid, int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("myid", myid);
		List<Member> myfriendlist = this.getSqlMapClientTemplate().queryForList("member.getByFriendId", map);
		return myfriendlist;
	}
	@SuppressWarnings("unchecked")
	public List<Member> getByNewFriendId(int myid, int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("myid", myid);
		List<Member> mynewfriendlist = this.getSqlMapClientTemplate().queryForList("member.getByNewFriendId", map);
		return mynewfriendlist;
	}

	@SuppressWarnings("unchecked")
	public List<Member> getMemberSearch(String key, String property) {
		Map map = new HashMap();
		map.put("key", key);
		map.put("property", property);
		List<Member> list = this.getSqlMapClientTemplate().queryForList("member.getMemberSearch", map);
		return list;
	}

	public void updateState(int mid) {
		getSqlMapClientTemplate().update("member.updateState", new Integer(mid));
	}

	public void unScreen(int mid) {
		getSqlMapClientTemplate().update("member.unScreen", new Integer(mid));
	}

	@SuppressWarnings("unchecked")
	public List<Member> getMember(int start, int num) {
		HashMap map = new HashMap();
		map.put("start", new Integer(start));
		map.put("num", new Integer(num));
		return getSqlMapClientTemplate().queryForList("member.getMember", map);
	}

	public int getMemberCount() {
		return (Integer)getSqlMapClientTemplate().queryForObject("member.getMemberCount", null);
	}

	@SuppressWarnings("unchecked")
	public void updateCommend(int id, int commend) {
		HashMap map = new HashMap();
		map.put("id", new Integer(id));
		map.put("commend", new Integer(commend));
		getSqlMapClientTemplate().update("member.commend", map);
	}

	@SuppressWarnings("unchecked")
	public List<Member> getMember(String key) {
		return getSqlMapClientTemplate().queryForList("member.getMemberLikeKey", key);
	}

	@SuppressWarnings("unchecked")
	public List<Member> find() {
		return getSqlMapClientTemplate().queryForList("member.find", null);
	}
	@SuppressWarnings("unchecked")
	public List<Member> findCommendMember(int count){
		List<Member> list = getSqlMapClientTemplate().queryForList("member.findCommendMember", count);;
		return list;
	}
	}
