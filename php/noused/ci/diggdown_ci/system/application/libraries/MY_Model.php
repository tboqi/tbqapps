<?php
class MY_Model extends Model {
	function __construct() {
		parent::Model ();
		$this->load->database ();
	}
	
	protected function object($sql, $array) {
		$query = $this->db->query ( $sql, $array );
		if ($query->num_rows () > 0) {
			return $query->row ();
		} else {
			return FALSE;
		}
	}
	
	protected function objects($sql, $array = array()) {
		if ( isset($array) && is_array($array) && count($array) <= 0 ) {
			$query = $this->db->query ( $sql );
		} else {
			$query = $this->db->query ( $sql, $array );
		}
		
		if ($query->num_rows () > 0) {
			return $query->result ();
		} else {
			return FALSE;
		}
	}
	
	function insert($data) {
		$this->db->insert ( $this->table, $data );
	}
	
	function isExist($array) {
		$query = $this->db->get_where ( $this->table, $array );
		if ($query->num_rows () > 0) {
			return $query->row ();
		} else {
			return FALSE;
		}
	}
	
	function update($data) {
		if (is_array ( $data )) {
			$id = $data ['id'];
		} elseif (is_object ( $data )) {
			$id = $data->id;
		} else {
			return FALSE;
		}
		$this->db->where ( 'id', $id );
		$this->db->update ( $this->table, $data );
		return TRUE;
	}
	
	function get($id) {
		$query = $this->db->get_where ( $this->table, array ('id' => $id ) );
		if ($query->num_rows () > 0) {
			return $query->row ();
		} else {
			return FALSE;
		}
	}
	
	function delete($array) {
		$this->db->delete ( $this->table, $array );
	}
	
	function getone($sql) {
		$query = $this->db->query ( $sql );
		if ($query->num_rows () > 0) {
			$row = $query->row ();
			return $row->c;
		} else {
			return FALSE;
		}
	}
}
