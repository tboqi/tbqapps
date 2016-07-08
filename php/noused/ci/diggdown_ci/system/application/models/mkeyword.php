<?php
class MKeyword extends MY_Model{
  function __construct(){
    parent::__construct();
    $this->table = "keywords";
  }
	
  function insert($keyword, $downID) {
  	//检查keyword是否存在
  	$sql = "select * from keywords where keyword=?";
  	$query = $this->db->query($sql, array($keyword));
  	if($query->num_rows() > 0) {
  		$row = $query->row();
  		$keywordID = $row->id;
  	} else {
  		$this->db->insert("keywords", array("keyword" => $keyword));
  		$keywordID = $this->db->insert_id();
  	}
  	$this->db->insert( 'keyword_download', array("download_id" => $downID, "keyword_id" => $keywordID) );
  }
  
  function findKeywordsWithMostDownloads($num) {
  	$sql = "select count(kd.keyword_id) c, keyword_id, k.keyword from keyword_download kd
		left join keywords k on k.id=kd.keyword_id
		group by kd.keyword_id
		order by c desc limit 0, ?";
		$array = array($num);
		return $this->objects($sql, $array);
  }
	
	function keywordsOfDownloadID($downloadID) {
		$sql = "select k.* from keyword_download kd
		left join keywords k on k.id=kd.keyword_id
		where kd.download_id=?";
		return $this->objects($sql, array($downloadID));
	}
	
	function deleteByDownloadID($downloadID) {
		$this->db->delete('keyword_download', array('download_id' => $downloadID)); 
	}
}