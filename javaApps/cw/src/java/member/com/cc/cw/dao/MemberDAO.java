package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Member;

public interface MemberDAO {

	/**
	 * 根据会员id查找会员
	 * @param id
	 * @return
	 */
	public Member get(int id);
	
	/**
	 * 添加会员
	 * @param member
	 * @return
	 */
	public int add(Member member);
	
	/**
	 * 更新会员
	 * @param member
	 * @return
	 */
	public int update(Member member);

	/**
	 * 通过Ip查询结合最后登录时间，查找是否有符合条件的纪录，
	 * 如果有，说明这个用户在今天登录过，将不再给分
	 * @param ip
	 * @param id
	 * @return
	 */
	public int queryByIp(String ip ,int id);
	
	/**
	 * 根据email查找会员是否存在
	 * @param id
	 * @return
	 */
	public boolean exists(String key);
	
	/**
	 * 根据UUID查找会员是否存在
	 * @param id
	 * @return
	 */
	public boolean existsUUID(String key);
	
	/**
	 * 根据 email 登录
	 * @param email
	 * @param password
	 * @return
	 */
	public Member loginByEmail(String email,String password);
	
	/**
	 * 根据 id 登录
	 * @param id
	 * @param password
	 * @return
	 */
	public Member loginById(String id,String password);
	
	/**
	 * 更新member Privilege
	 * @param id
	 * @param value
	 * @return
	 */
	public int updatePrivilege(int id,int value);
	
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
	public int setMemberEnable(int id);
	
	/**
	 * 更新用户uuid
	 * @param memberId
	 * @param uuid
	 * @return
	 */
	public int updateUUID(int memberId,String uuid);
	
	/**
	 * 根据uuid获得member
	 * @param uuid
	 * @return
	 */
	public Member getByUUID(String uuid);
	/**
	 * 修改用户昵称
	 * @param userName
	 * @return int
	 */
	public int updateUserName(int memberId, String userName);
	/**
	 * 修改用户头像
	 * @param coverPath
	 * @return int
	 */
	public int updateCover(int memberId, String coverPath);
	/**
	 * 修改用户密码
	 * @param password
	 * @return int
	 */
	public int updatePassword(int memberId, String password);

	/**
	 * 根据email获得member
	 * @param email
	 * @return
	 */
	public Member getByEmail(String email);

	/**
	 * 获得最活跃用户
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Member> getActivityMember(int start, int count);
	
	/**
	 * 获得某用户的随机好友信息
	 * @param myid
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Member> getByFriendId(int myid, int start, int count );
	/**
	 * 获得某用户的最近新增好友信息
	 * @param myid
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Member> getByNewFriendId(int myid, int start, int count );

	public List<Member> getMemberSearch(String key, String property);

	public void updateState(int mid);//更改为屏蔽

	public void unScreen(int mid);//bu屏蔽

	public List<Member> getMember(int start, int num);

	public int getMemberCount();
	
	public void updateCommend(int id, int commend);

	public List<Member> getMember(String key);

	public List<Member> find();
	
	public List<Member> findCommendMember(int count);//获得推荐的会员
}
