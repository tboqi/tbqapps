<?php
class Message_Model extends Base_Model {
	private $fields = 'm.id, m.title, m.content, m.to_id, to.username as to_username, to.nickname as to_nickname, m.create_time, m.from_id, from.username as from_username, from.nickname as from_nickname, m.is_read';
	function __construct() {
		parent::__construct();
		$this->table = 'messages';
	}
	
	function set_message_to_read($msgid){
		return $this->db->update($this->table, array('is_read' => 1), array('id' => $msgid));
	}
	
	function remove_message($msgid, $owner_id) {
		$msg = $this->get($msgid);
		if ($msg->to_id == $owner_id) {
			return $this->db->update($this->table, array('to_remove' => 1, 'to_remove_time' => time()), array('id' => $msgid));
		} elseif ($msg->from_id == $owner_id) {
			return $this->db->update($this->table, array('from_remove' => 1, 'from_remove_time' => time()), array('id' => $msgid));
		} else {
			return false;
		}
	}
	
	function restore_message($msgid, $owner_id) {
		$msg = $this->get($msgid);
		if ($msg->to_id == $owner_id) {
			return $this->db->update($this->table, array('to_remove' => 0), array('id' => $msgid));
		} elseif ($msg->from_id == $owner_id) {
			return $this->db->update($this->table, array('from_remove' => 0), array('id' => $msgid));
		} else {
			return false;
		}
	}
	
	function removed_messages($owner_id, $start = 0, $num = 10) {
		$sql = "select {$this->fields}
		from #__messages m
		left join #__users `to` on to.id=m.to_id
		left join #__users `from` on from.id=m.from_id
		where (m.to_id=? and m.to_remove=1)
		or (m.from_id=? and m.from_remove=1)
		order by m.create_time desc
		limit ?, ?";
		return $this->result_from_sql($sql, array($owner_id, $owner_id, $start, $num));
	}
	
	function removed_messages_count($owner_id) {
		$sql = "select count(*) from #__messages m
		where (m.to_id=? and m.to_remove=1)
		or (m.from_id=? and m.from_remove=1)";
		return $this->getone($sql, array($owner_id, $owner_id));
	}
	
	function inbox_messages($owner_id, $start = 0, $num = 10) {
		$sql = "select {$this->fields}
		from #__messages m
		left join #__users `to` on to.id=m.to_id
		left join #__users `from` on from.id=m.from_id
		where m.to_id=? and m.to_remove=0
		order by m.is_read desc, m.create_time desc
		limit ?, ?";
		return $this->result_from_sql($sql, array($owner_id, $start, $num));
	}
	
	function inbox_messages_count($owner_id) {
		$sql = "select count(*) from #__messages m
		where (m.to_id=? and m.to_remove=0)";
		return $this->getone($sql, array($owner_id));
	}
	
	function outbox_messages($owner_id, $start = 0, $num = 10) {
		$sql = "select {$this->fields}
		from #__messages m
		left join #__users `to` on to.id=m.to_id
		left join #__users `from` on from.id=m.from_id
		where m.from_id=? and m.from_remove=0
		order by m.create_time desc
		limit ?, ?";
		return $this->result_from_sql($sql, array($owner_id, $start, $num));
	}
	
	function outbox_messages_count($owner_id) {
		$sql = "select count(*) from #__messages m
		where (m.from_id=? and m.from_remove=0)";
		return $this->getone($sql, array($owner_id));
	}
	
	function unread_messages($owner_id, $start = 0, $num = 10) {
		$sql = "select {$this->fields}
		from #__messages m
		left join #__users `to` on to.id=m.to_id
		left join #__users `from` on from.id=m.from_id
		where m.to_id=? and m.to_remove=0 and m.is_read = 0
		order by m.create_time desc
		limit ?, ?";
		return $this->result_from_sql($sql, array($owner_id, $start, $num));
	}
	
	function unread_messages_count($owner_id) {
		$sql = "select count(*) from #__messages m
		where m.to_id=? and m.to_remove=0 and m.is_read = 0";
		return $this->getone($sql, array($owner_id));
	}
	/**
	 * array('from_id' => from_id, 'to_id' => to_id...)
	 *
	 * @param array $message
	 * @return boolean
	 */
	function send_message($title, $content, $from_id, $to_id) {
		$message = array(
			'from_id' => $from_id,
			'to_id' => $to_id,
			'create_time' => time(),
			'is_read' => 0,
			'title' => $title,
			'content' => $content,
		);
		if ($from_id < 1) {
			$message['system_message'] = 1;
		}
		return $this->create($message);
	}
	
	function get($id) {
		$sql = "select {$this->fields} from #__messages m
		left join #__users `to` on to.id=m.to_id
		left join #__users `from` on from.id=m.from_id
		where m.id=$id";
		return $this->getrow($sql);
	}
}