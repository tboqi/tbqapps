<?php
class Adminmenu_Model extends Base_Model {
	function __construct() {
		parent::__construct ();
	}
	
	function menus() {
		$menus = $this->cache->get ( hcache::parse_key ( 'model', 'Adminmenu_Model', 'menus' ) );
		
		if (is_null($menus) ) {
			$query = $this->db->select($this->list_fields)->getwhere ( 'adminmenus', array ( 
					'parent_id' => 0 
			) );
			if ($query->count () > 0) {
				$menus = $query->result_array ();
				foreach ( $menus as $key => $menu ) {
					$query = $this->db->select($this->list_fields)
						->getwhere ( 'adminmenus', array ( 
							'parent_id' => $menu->id 
					) );
					if ($query->count () > 0) {
						$menus [$key]->submenus = $query->result_array ();
					}
				}
				$this->cache->set ( $key, $menus );
			} else {
				return array ();
			}
		}
		return $menus;
	}
}