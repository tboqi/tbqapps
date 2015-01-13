<?php
class MY_Controller extends Controller {
	
	protected $data;

	function __construct() {
		parent::Controller();
		
		$this->load->helper(array('url', 'form', 'date', 'cookie'));
		
		$this->load->library('session');
		$this->load->library('pagination');
		$this->load->library('encrypt');
		$this->load->library('validation');
		
		$this->load->model('MUser');
		
		$this->data['globalTitle'] = "下载挖掘";
		$this->setData('slogan', "我喜欢的下载，希望你也喜欢！"); //口号
		
		$this->data['messages'] = array();
		$this->themes = "default";
		$this->data['themes'] = $this->themes;
		
		$decode = $this->encrypt->decode(get_cookie("userinfo"));
		if ( !empty($decode) ) {
			$userarr = explode("_", $decode);
			$username = $userarr[0];
			$password = $userarr[1];
			$this->userLogin($username, $password);
		}
		
		$myid = intval($this->session->userdata('userid'));
		if($myid >= 1) {
			$this->my = $this->MUser->get($myid);
			$this->data['my'] = $this->my;
		}
//		print_r($this->my);exit;
	}
	
	protected function setData($varName, $varValue) {
		$this->data[$varName] = $varValue;
	}
	
	protected function run($viewPage, $isAll=true) {
		if($isAll) {
			$this->load->model('MCategory','',TRUE);
			$this->data['categoriesWithMostDownloads'] = $this->MCategory->findCategoriesWithMostDownloads(10);
			
			$this->load->model ( 'MKeyword', '', TRUE );
			$this->data ['keywordsWithMostDownloads'] = $this->MKeyword->findKeywordsWithMostDownloads ( 10 );
		
			$this->data['include'] = $this->themes . "/" . $viewPage;
			$this->load->vars( $this->data );
			$this->load->view( $this->themes . '/template' );
		} else {
			$this->load->vars( $this->data );
			$this->load->view( $this->themes . "/" . $viewPage );
		}
	}
	
	protected function setMessage($message) {
		array_push($this->data['messages'], $message);
	}
	
	protected function checkUser() {
		if(intval($this->session->userdata('userid')) < 1) {
			$this->setMessage("您没有登录");
			redirect("");
			exit;
		}
	}

	protected function userLogin($username, $password) {
		$currentUser = $this->MUser->userLogin($username, $password);
		if($currentUser && is_object($currentUser)) {
    	$userInfo = "{$username}_$password"; //userid, user name, 未加密的密码;
    	$encryptedUserinfo = $this->encrypt->encode($userInfo);
    	$cookie = array(
                   'name'   => 'userinfo',
                   'value'  => $encryptedUserinfo,
                   'expire' => 30 * 24 * 60 * 60,
                   'path'   => '/',
                   'prefix' => '',
               );
			set_cookie($cookie); 
      $array = array('userid' => $currentUser->id);
      $this->session->set_userdata($array);
      $this->my = $this->MUser->get($currentUser->id);
			$this->setData("my", $this->my);
    } else {
      $message = "用户名或密码错误";
      $this->setData("message", $message);
    }
	}

	protected function clean($string) {
		return $this->input->xss_clean($string);
	}
	
	protected function post($string) {
		return $this->input->post($string);
	}
	
	function message($message, $redirectURL) {
		$this->setData("message", $message);
		$this->setData("redirectURL", $redirectURL);
		$this->load->vars( $this->data );
		$this->load->view( $this->themes . "/message" );
	}
}