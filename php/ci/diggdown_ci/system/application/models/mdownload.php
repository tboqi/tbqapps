<?php
class MDownload extends MY_Model {
	function __construct() {
		parent::__construct ();
		$this->sql = "select d.id, d.create_time, d.title, d.description, d.link, 
		u.username, u.nickname, u.email, u.id as user_id,
		c.name as categoryName, c.id as categoryID 
		from downloads d
		left join users u on u.id=d.user_id
		left join categories c on c.id=d.category_id";
		$this->table = 'downloads';
	}
	
	function findByUserid($userid) {
		$sql = $this->sql . " where u.id=?";
		$array = array ($userid );
		return $this->objects ( $sql, $array );
	}
	
	function get($downID) {
		$sql = $this->sql . " where d.id=?";
		$array = array ($downID );
		$download = $this->object( $sql, $array );
		$CI = &get_instance();
		$CI->load->model("MKeyword");
		$download->keywords = $CI->MKeyword->keywordsOfDownloadID($downID);
		return $download;
	}
	
	function newestDownloads($num) {
		$sql = "select * from downloads order by create_time desc limit 0, ?";
		$array = array ($num );
		return $this->objects ( $sql, $array );
	}
	
	function delete($id) {
		$this->db->delete('keyword_download', array('download_id' => $id)); 
		$this->db->delete('downloads', array('id' => $id)); 
	}
	
	function hostestDownloads($num) {
		$sql = "select * from downloads order by num desc limit 0, ?";
		$array = array ($num );
		return $this->objects ( $sql, $array );
	}
	
	function downloadsOfCategory($cateID, $page, $num) {
		$sql = "select * from downloads where category_id=? limit ?, ?";
		$array = array ($cateID, $page, $num );
		return $this->objects ( $sql, $array );
	}
	
	function downloadsCountOfCategory($cateID) {
		$sql = "select * from downloads where category_id=?";
		$query = $this->db->query ( $sql, array ($cateID ) );
		return $query->num_rows ();
	}
	
	function downloadsOfkeyword($keyID, $page, $num) {
		$sql = "select * from downloads d where id in (select download_id from keyword_download where keyword_id=?) limit ?, ?";
		$array = array ($keyID, $page, $num );
		return $this->objects ( $sql, $array );
	}
	
	function downloadsCountOfKeyword($keyID) {
		$sql = "select * from downloads d where id in (select download_id from keyword_download where keyword_id=?)";
		$query = $this->db->query ( $sql, array ($keyID ) );
		return $query->num_rows ();
	}
	
	function myDownloadsOfCategory($cateID, $userID, $page, $num) {
		$sql = "select * from downloads where user_id=? and category_ID=? order by create_time desc limit ?, ?";
		$array = array ($userID, $cateID, $page, $num );
		return $this->objects ( $sql, $array );
	}
	
	function myDownloadsCountOfCategory($cateID, $userID) {
		$sql = "select * from downloads where user_id=? and category_ID=?";
		$query = $this->db->query ( $sql, array ($userID, $cateID ) );
		return $query->num_rows();
	}
}