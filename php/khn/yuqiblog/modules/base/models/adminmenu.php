<?php
class Adminmenu_Model extends Model {
	function menus() {
		$db = new database ( );
		$query = $db->getwhere ( 'adminmenus', array ('parent_id' => 0 ) );
		if ($query->count () > 0) {
			$menus = $query->result_array ();
			foreach ( $menus as $key => $menu ) {
				$query = $db->getwhere ( 'adminmenus', array ('parent_id' => $menu->id ) );
				if ($query->count () > 0) {
					$menus [$key]->submenus = $query->result_array ();
				}
			}
			return $menus;
		} else {
			return false;
		}
	}
}