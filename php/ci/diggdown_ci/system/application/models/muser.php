<?php
class MUser extends MY_Model{
  function __construct(){
    parent::__construct();
    $this->table = "users";
  }

  function addUser() {
    $now = date("Y-m-d H:i:s");
    $passwd = $this->input->xss_clean($this->input->post('passwd'));
    $data = array(
            'username' => $this->input->xss_clean($this->input->post('username')),
            'email' => $this->input->xss_clean($this->input->post('email')),
            'passwd' => md5($passwd),
            'date_created' => $now,
            'date_updated' => $now
    );

    $this->db->insert('users', $data);
  }

  function userLogin($username, $password) {
    $sql = "SELECT * FROM users where username=?";
    $user = $this->object($sql, array($username));
    
    if(!empty($user) && is_object($user) && isset($user->password) && md5($password) == $user->password) {
    	return $user;
    } else {
    	return FALSE;
    }
  }
}