<?php
class friend_Core {
	static function is_friend($user1, $user2) {
		$friend_model = new Friend_Model();
		if ($friend_model->is_friends($user1, $user2)) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}