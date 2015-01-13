<?php
class Base_Model extends Model {
	
	protected $table = '';
	protected $cache = '';
	

	protected $list_fields = '*';
	protected $detail_fields = '*';
	
	function __construct() {
		parent::__construct ();
		$this->cache = new Cache('database');
	}
	
	/**
	 * 
	 * @param $field_value 1维数组
	 * @param $table 表名
	 */
	function delete_by($field_value, $table = '') {
		if (!$table) {
			$table = $this->table;
		}
		
		$fv_array = array();
		
		foreach ($field_value as $field => $value) {
			$fv_array[] = "`{$field}` = '{$value}'";
		}
		$fv = implode(' and ', $fv_array);
		
		$sql = "select id from #__{$table} where {$fv}";
		$query = $this->db->query($sql);
		foreach($query as $row) {
			$this->cache->delete(hcache::parse_key ( 'model', 'Base_Model', 'get', 
				array('table' => $table, 'id' => intval($row['id']) ) ));
		}
		
		$sql = "delete from #__{$table} where {$fv}";
		
		$this->db->query($sql);
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
	/**
	 * 比is_existed更灵活，推荐使用
	 * @param key-value数组 $array
	 * @param 表名 $table
	 */
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
	/**
	 * 推荐使用function existed($array, $table='')
	 * @param  $field
	 * @param  $value
	 * @param  $id
	 */
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
		$query = $this->db->select($this->list_fields)->from ( $this->table )->get ();
		return $query->result_array ();
	}
	
	function count($table = '') {
		if (empty ( $table )) {
			$table = $this->table;
		}
		return $this->db->count_records ( $table );
	}
	
	function update($array, $id, $table = '') {
		$id = intval($id);
		if (empty ( $table )) {
			$table = $this->table;
		}
		
		if ($this->db->update ( $this->table, $array, array ('id' => $id ) )) {
			$this->cache->delete(hcache::parse_key ( 'model', 'Base_Model', 'get', 
				array('table' => $table, 'id' => $id ) ));
			return $id;
		} else {
			return false;
		}
	}
	
	function delete($id, $table = '') {
		$id = intval ( $id );
		if (empty ( $table )) {
			$table = $this->table;
		}
		if ($this->db->delete ( $this->table, array ( 
				'id' => $id 
		) )) {
			$this->cache->delete ( hcache::parse_key ( 'model', 'Base_Model', 'get', array ( 
					'table' => $table, 
					'id' => $id 
			) ) );
			return true;
		} else {
			return false;
		}
	}
	
	function get($id, $table = '') {
		$id = intval($id);
		if (empty ( $table )) {
			$table = $this->table;
		}
		
		$key = hcache::parse_key('model', 'Base_Model', 'get', array ( 
					'table' => $table, 
					'id' => $id 
			) );
		
		$object = $this->cache->get ( $key );
		if (is_null($object)) {
			$query = $this->db->select($this->detail_fields)->getwhere ( $this->table, array ('id' => $id ) );
			$object = $query->current ();
			$this->cache->set ( $key, $object );
		}
		
		return $object;
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
			return array();
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
	function get_by($array, $table = '') {
		if(!is_array($array)) return FALSE;
		if (empty ( $table )) {
			$table = $this->table;
		}
		$key = hcache::parse_key('model', 'Base_Model', 'get_by', array(serialize($array), $table) );
		
		$object = $this->cache->get ( $key );
		if (is_null($object)) {
			$query = $this->db->select($this->detail_fields)->getwhere ( $table, $array );
			$object = $query->current ();
			$this->cache->set ( $key, $object );
		}
		
		return $object;
	}
	
	function find_by($array, $table = '') {
		if (empty ( $table )) {
			$table = $this->table;
		}
		
		$query = $this->db->select($this->list_fields)->getwhere ( $table, $array );
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
	
	function count_by($array = FALSE, $table = '') {
		if ($table == '' ) {
			$table = $this->table;
		}
		
		if (empty($array) || !is_array($array) || count($array) < 1) {
			$where = '';
		} else {
			$and_array = array();
			foreach ($array as $key => $value) {
				$and_array[] = "`{$key}` = '{$value}'";
			}
			$where = 'where ' . implode(' AND ', $and_array);
		}
		
		$sql = "select count(*) from #__{$table} {$where} ";
		
		return $this->getone($sql);
 	}
}