<?php
class Base_Model extends Model {
	function __construct() {
		parent::__construct ();
		$this->db = new Database();
	}
	
	function all() {
		$query = $this->db->get ( $this->table );
		return $query->result_array();
//		if ($query->num_rows () > 0) {
//			return $query->result ();
//		} else {
//			return FALSE;
//		}
	}
	
	protected function object($sql, $array = array()) {
		if (isset ( $array ) && is_array ( $array ) && count ( $array ) <= 0) {
			$query = $this->db->query ( $sql );
		} else {
			$query = $this->db->query ( $sql, $array );
		}
		return $query->current ();
//		if ($query->num_rows () > 0) {
//			return $query->row ();
//		} else {
//			return FALSE;
//		}
	}
	
	protected function objects($sql, $array = array()) {
		if (isset ( $array ) && is_array ( $array ) && count ( $array ) <= 0) {
			$query = $this->db->query ( $sql );
		} else {
			$query = $this->db->query ( $sql, $array );
		}
		return $query->result_array();
		
//		if ($query->num_rows () > 0) {
//			return $query->result ();
//		} else {
//			return FALSE;
//		}
	}
	
	function insert($data) {
		$query = $this->db->insert ( $this->table, $data );
		return $query->insert_id ();
	}
	
	function isExist($array) {
		$query = $this->db->getwhere ( $this->table, $array );
		return $query->current ();
//		if ($query->num_rows () > 0) {
//			return $query->row ();
//		} else {
//			return FALSE;
//		}
	}
	
	function update($data) {
		if(is_object($data)) {
			$data = get_object_vars($data);
		}
		$id = $data ['id'];
//		if (is_array ( $data )) {
//			$id = $data ['id'];
//		} elseif (is_object ( $data )) {
//			$id = $data->id;
//		} else {
//			return FALSE;
//		}
		$this->db->update($this->table, $data, array('id' => $id));
		return TRUE;
	}
	
	function get($id) {
		$query = $this->db->getwhere ( $this->table, array ('id' => $id ) );
		return $query->current ();
//		if ($query->num_rows () > 0) {
//			return $query->row ();
//		} else {
//			return FALSE;
//		}
	}
	
	function delete($array) {
		$this->db->delete ( $this->table, $array );
	}
	
	function getone($sql) {
		$query = $this->db->query ( $sql );
		return $query->current ();
//		if ($query->num_rows () > 0) {
//			$row = $query->row ();
//			return $row->c;
//		} else {
//			return FALSE;
//		}
	}
}