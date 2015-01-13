package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.Member;

public interface MemberService {

	
	public int regist(Member member);
	
	public boolean update(Member member);
	/**
	 * 修改用户昵称
	 * @param memberId
	 * @param userName
	 * @return boolean
	 */
	public boolean updateUserName(int memberId, String userName);
	/**
	 * 修改用户头像
	 * @param memberId
	 * @param coverPath
	 * @return boolean
	 */
	public boolean updateCover(int memberId, String coverPath);
	/**
	 * 修改用户密码
	 * @param memberId
	 * @param password
	 * @return boolean
	 */
	public boolean updatePassword(int memberId, String password);
	
	public Member get(int id);
	
	public Member getByUUID(String uuid);
	
	
	
	public boolean queryByIp(String ip , int id);
	
	
	
	/**
	 * 用户登录方法，需传入登录类型　email 或 id
	 * @param key
	 * @param password
	 * @param loginType
	 * @return
	 * @throws IllegalArgumentException
	 */
	public Member login(String key ,String password,String loginType) throws IllegalArgumentException;
	
	/**
	 * 给会员增加分数，通过Ip查询结合最后登录时间，查找是否有符合条件的纪录
	 * ，如果有，说明这个用户在今天登录过，将不再给分
	 * @param member
	 * @return
	 */
	public boolean increaseMemberPrivilege(Member member);
	
	/**
	 * 更新member Privilege
	 * @param id
	 * @param value
	 * @return
	 */
	public boolean updatePrivilege(int id,int value);
	
	/**
	 * 通过Id更新指定字段的值
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public int updateFieldValueById(int id ,String field , Object value);
	
	/**
	 * 标识用户已经激活
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean setMemberEnable(int id);
	
	/**
	 * 更新用户uuid
	 * @param memberId
	 * @param uuid
	 * @return
	 */
	public boolean updateUUID(int memberId,String uuid);
	
	/**
	 * 通过email 获得member
	 * @param email
	 * @return
	 */
	public Member getByEmail(String email);
	
	/**
	 * 获得最活跃会员
	 * @return
	 */
	public List<Member> getActivityMember(int page , int count);
	
	/**
	 * 获得某用户的随机好友信息
	 * @param myid
	 * @param page
	 * @param count
	 * @return
	 */
	public List<Member> getByFriendId(int myid, int page, int count );
	/**
	 * 获得某用户的最近新增好友信息
	 * @param myid
	 * @param page
	 * @param count
	 * @return
	 */
	public List<Member> getByNewFriendId(int myid, int page, int count );
	
	/**
	 * 根据用户ID 给该用户加上指定票数，并返回加票后改用户的实际票数
	 * @param id
	 * @param addValue
	 * @return
	 */
	public int addMemberPrivilege(int id, int addValue);

	public List<Member> getMemberSearch(String key, String property);

	public void updateState(int mid);

	public void unScreen(int mid);

	public int getMemberCount();

	public List<Member> getMember(int start, int num);
	
	public void updateCommend(int id, int commend);

	public List<Member> findLikeKey(String key);

	public List<Member> find();
	public List<Member> findCommendMember(int count);
}
