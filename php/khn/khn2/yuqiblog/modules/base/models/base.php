<?php
class Base_Model extends Model {
	
	protected $table = '';
	
	function __construct() {
		parent::__construct ();
	}
	
	function create($array, $table = '') {
		if (is_object($array)) {
			$array = get_object_vars($array);
		}
		if (!$table) {
			$table = $this->table;
		}
		$query = $this->db->insert ( $table, $array );
		if ($query) {
			return $query->insert_id ();
		} else {
			return false;
		}
	}
	
	function existed($array, $table='') {
		if (empty($table)) {
			$table = $this->table;
		}
		$query = $this->db->getwhere ( $table, $array );
		if ($query->count () > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	function is_existed($field, $value, $id = 0) {
		$array = array ($field => $value );
		if ($id > 0) {
			$array ['id !='] = $id;
		}
		
		$query = $this->db->getwhere ( $this->table, $array );
		if ($query->count () > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	function find_all() {
		$query = $this->db->from ( $this->table )->get ();
		if ($query->count () > 0) {
			return $query->result_array ();
		} else {
			return false;
		}
	}
	
	function count() {
		return $this->db->count_records ( $this->table );
	}
	
	function update($array, $id) {
		if (is_object($array)) {
			$array = get_object_vars($array);
		}
		if ($this->db->update ( $this->table, $array, array ('id' => $id ) )) {
			return $id;
		} else {
			return false;
		}
	}
	
	function delete($id) {
		if ($this->db->delete ( $this->table, array ('id' => $id ) )) {
			return true;
		} else {
			return false;
		}
	}
	
	function get($id) {
		$query = $this->db->getwhere ( $this->table, array ('id' => $id ) );
		return $query->current ();
	}
	
	function result_from_sql($sql, $array = false) {
		if ($array) {
			$query = $this->db->query ( $sql, $array );
		} else {
			$query = $this->db->query ( $sql );
		}
		if ($query->count () > 0) {
			return $query->result_array ();
		} else {
			return false;
		}
	}
	
	/**
	 * 根据输入的数组返回对应的表的一条记录
	 * 数组的结构为
	 * array( 'field1' => value1, ...)
	 *
	 * @param array $array
	 * @return boolean 如果输入的不是array或者有误
	 * @return array 一条记录
	 */
	function get_by($array) {
		$query = $this->db->getwhere ( $this->table, $array );
		return $query->current ();
	}
	
	function find_by($array) {
		$query = $this->db->getwhere ( $this->table, $array );
		return $query->result_array();
	}
	
	function getone($sql, $array = false ) {
		if ($array) {
			$query = $this->db->query($sql, $array);
		} else {
			$query = $this->db->query($sql);
		}
		$query->result(FALSE, MYSQL_NUM);
		$row = $query->current();
		return $row[0];
	}
	
	function getrow($sql, $array = false) {
		if ($array) {
			$query = $this->db->query($sql, $array);
		} else {
			$query = $this->db->query($sql);
		}
		return $query->current();
	}
}