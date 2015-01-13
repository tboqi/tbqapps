<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class user_block_Core {
	
	public static function online_users($number_rows) {
		$db = new Database ( );
		$expiration = Kohana::config ( 'session.expiration' );
		if ($expiration == 0) {
			$expiration = 60 * 15;
		}
		$sql = "select u.id, u.username, u.nickname, u.regist_time, u.email, u.last_login, u.avatar, u.logins, s.last_activity from #__users u left join #__sessions s on s.session_id=u.session_id where s.last_activity > UNIX_TIMESTAMP() - {$expiration} %s limit {$number_rows}";
		if (Auth::instance ()->logged_in ()) {
			$sql = sprintf ( $sql, 'and id!=' . Auth::instance ()->get_user ()->id );
		} else {
			$sql = sprintf ( $sql, '' );
		}
		$query = $db->query ( $sql );
		$view = new View ( 'user/blocks/appindex_online_users' );
		$view->online_users = $query->result_array ();
		return $view;
	}
	
	public static function new_users($number_rows) {
		$db = new Database ( );
		$sql = "select u.id, u.username, u.nickname, u.regist_time, u.email, u.last_login, u.avatar, u.logins from #__users u order by u.id desc limit {$number_rows}";
		$query = $db->query ( $sql );
		$view = new View ( 'user/blocks/appindex_users' );
		$view->users = $query->result_array ();
		$view->block_title = '新用户';
		return $view;
	}
	
	public static function active_users($num) {
		$db = new Database ( );
		$view = new View('user/blocks/appindex_users');
		$sql = "select u.id, u.username, u.nickname, u.regist_time, u.email, u.last_login, u.avatar, u.logins
		from #__users u
		left join (select count(*) c, user_id from #__articles group by user_id) ac on ac.user_id=u.id
		order by ac.c desc limit {$num}";
		$query = $db->query ( $sql );
		$view->users = $query->result_array ();
		$view->block_title = '活跃用户';
		return $view;
	}
}
 
