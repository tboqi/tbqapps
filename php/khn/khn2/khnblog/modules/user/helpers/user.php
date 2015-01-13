<?php
class user_Core {
	/**
	 * 以宽做等比例缩放
	 *
	 * @param user object $user
	 * @param int $width
	 * @param int $hight
	 * @return string
	 */
	static function avatar($user, $width = 100, $hight = NULL, $master = Image::WIDTH) {
		$wh = '';
		if (empty($user->avatar)) {
			$img = url::base() . 'images/noavatar.png';
			$wh = (empty($width) ? '' : "width=\"{$width}\" ") . (empty($hight) ? '' : "height=\"{$hight}\"");
		} else {
			$avatar_dir = "upload/{$user->id}/avatar/";
			if (file_exists(DOCROOT . $avatar_dir . "{$width}x{$hight}_{$user->avatar}")) {
				$img = url::base() . "{$avatar_dir}{$width}x{$hight}_{$user->avatar}";
			} else {
				if (file_exists(DOCROOT . $avatar_dir . $user->avatar)) {
					$img = "{$avatar_dir}{$width}x{$hight}_{$user->avatar}";
					Image::factory(DOCROOT . $avatar_dir . $user->avatar)->resize($width, $hight, $master)->save(DOCROOT . $img);
					$img = url::base() . $img;
				} else {
					$img = url::base() . 'images/noavatar.png';
					$wh = empty($width) ? '' : "width=\"{$width}\" " . empty($hight) ? '' : "height=\"{$hight}\"";
				}
			}
		}
		return sprintf('<img border="0" src="%s" alt="%s" title="%s" %s />', $img, $user->nickname, $user->nickname, $wh);
	}
	
	static function search($key, $start, $num) {
		$sql = "select * from #__users where username like '%{$key}%' or  nickname like '%{$key}%' limit {$start}, {$num}";
		$db = new Database();
		return $db->query($sql)->result_array();
	}
	
	static function find_all($start, $num) {
		$sql = "select * from #__users limit {$start}, {$num}";
		$db = new Database();
		return $db->query($sql)->result_array();
	}
	
	static function count_all() {
		$db = new Database();
		return $db->count_records ( 'users' );
	}
	
	static function count_search($key) {
		$db = new Database();
		$sql = "select count(*) from #__users where username like '%{$key}%' or  nickname like '%{$key}%'";
		$query = $db->query($sql);
		$query->result(FALSE, MYSQL_NUM);
		$row = $query->current();
		return $row[0];
	}
}