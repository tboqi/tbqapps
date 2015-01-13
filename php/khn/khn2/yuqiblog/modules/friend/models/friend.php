<?php
class Friend_Model extends Base_Model {
	function __construct() {
		parent::__construct();
		$this->table = 'friends';
	}
	
	function request($my_id, $friend_id) {
		$arr = array(
			'my_id' => $my_id,
			'friend_id' => $friend_id,
			'is_request' => 1,
			'request_time' => time(),
			'is_replied' => 0,
			'reply_time' => 0,
		);
		if ($msgid = $this->create($arr)) {
			$my_user = ORM::factory('user', $my_id);
			$title = sprintf('%s邀请您为好友', $my_user->nickname);
			$content = sprintf('<a href="%s">%s</a>邀请您为好友，<a href="%s">接受</a>还是<a href="%s">拒绝</a>', url::site('?user_id' . $my_id), $my_user->nickname, url::site('friend/accept/' . $msgid), url::site('friend/decline/' . $msgid));
			$message_model = new Message_Model();
			return $message_model->send_message($title, $content, 0, $friend_id);
		}
		return false;
	}
	/**
	 * 	邀请人 是否已经邀请过  被邀请人  
	 *
	 * @param 邀请人id $my_id
	 * @param 被邀请人id $friend_id
	 * @return 邀请过返回true，没邀请过返回false
	 */
	function has_requested($my_id, $friend_id) {
		return $this->existed(array('my_id' => $my_id, 'friend_id' => $friend_id));
	}
	/**
	 * 邀请人 是否 已经被 被邀请人  邀请过
	 *
	 * @param 邀请人id $my_id
	 * @param 被邀请人id $friend_id
	 * @return 被邀请过返回true，没被邀请过返回false
	 */
	function has_been_requested($my_id, $friend_id) {
		return $this->existed(array('friend_id' => $my_id, 'my_id' => $friend_id));
	}
	
	function accept($id) {
		$friend = $this->get($id);
		$message_model = new Message_Model();
		
		$this->db->begin();
		$friend->is_replied = 1;
		$friend->reply_time = time();
		$this->update($friend, $id);
		
		$arr = array('my_id' => 0, 'friend_id' => $friend->my_id, 'is_request' => 0, 'request_time' => 0, 'is_replied' => 1, 'reply_time' => time());
		$this->create($arr);
		
		$friend_user = ORM::factory('user', $friend->friend_id);
		$title = sprintf('%s接受了您的邀请', $friend_user->nickname);
		$content = sprintf('<a href="%s">%s</a>接受了您的邀请！', url::site('?user_id=' . $friend_user->id), $friend_user->nickname);
		$message_model->send_message($title, $content, 0, $friend->my_id);
		
		$this->db->commit();
		return true;
	}
	
	function decline($id) {
		$friend = $this->get($id);
		$friend_user = ORM::factory('user', $friend->friend_id);
		$message_model = new Message_Model();
		
		$this->db->begin();
		
		$this->delete($id);
		
		$title = sprintf('%s拒绝了您的邀请', $friend_user->nickname);
		$content = sprintf('<a href="%s">%s</a>拒绝了您的邀请！', url::site('?user_id=' . $friend_user->id), $friend->username);
		$message_model->send_message($title, $content, $friend->friend_id, $friend->my_id);
		
		$this->db->commit();
		return true;
	}
	
	function my_friends($my_id) {
		$sql = "select f.my_id, my.username as my_username, my.nickname as my_nickname, f.friend_id, friend.username as friend_username, friend.nickname as friend_nickname
		from #__friends f
		left join #__users my on my.id=f.my_id
		left join #__users friend on friend.id=f.friend_id
		where (f.is_replied=1) and f.my_id={$my_id}";
		return $this->result_from_sql($sql);
	}
	
	function is_friends($user1, $user2) {
		$sql = "select count(*) from #__friends 
		where (my_id={$user1->id} and friend_id={$user2->id})
		or (my_id={$user2->id} and friend_id={$user1->id})";
		if ($this->getone($sql) > 0) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}