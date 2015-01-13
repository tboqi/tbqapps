<?php
class Controller extends Controller_Core {
	
	protected $data;
	public $auto_render = TRUE;
	protected $pageTitle = '';
	protected $globalTitle = '';
	protected $slogan = '';
	
	function __construct() {
		parent::__construct ();
		
		$this->globalTitle = "下载挖掘";
		$this->slogan = "我喜欢的下载，希望你也喜欢！"; //口号

		$this->data ['messages'] = array ();
		$this->themes = "default";
		$this->data ['themes'] = $this->themes;
		$this->template = 'template';
		
		if (cookie::get ( "userinfo" )) {
			$userarr = explode ( "_", cookie::get ( "userinfo" ) );
			if (count ( $userarr ) == 2) {
				$username = $userarr [0];
				$password = $userarr [1];
				$this->userLogin ( $username, $password );
			}
		}
		
		$this->session = Session::instance ();
		$myid = intval ( $this->session->get ( 'userid' ) );
		if ($myid >= 1) {
			$this->my = $this->MUser->get ( $myid );
			$this->data ['my'] = $this->my;
		}
		
		if ($this->auto_render == TRUE) {
			// Render the template immediately after the controller method
			Event::add ( 'system.post_controller', array ($this, '_render' ) );
		}
	}
	
	public function _render() {
		if ($this->auto_render == TRUE) {
			// Render the template when the class is destroyed
			$this->template->render ( TRUE );
		}
	}
	
	protected function setData($varName, $varValue) {
		$this->data [$varName] = $varValue;
	}
	
	protected function run($viewPage, $isAll = true) {
		if ($isAll) {
			$this->template = new View ( "{$this->themes}/{$this->template}" );
			$this->template->pageTitle = $this->pageTitle;
			$this->template->globalTitle = $this->globalTitle;
			$this->template->slogan = $this->slogan;
			$this->template->themes = $this->themes;
			$this->MCategory = new Category_Model ( );
			$this->template->categoriesWithMostDownloads = $this->MCategory->findCategoriesWithMostDownloads ( 10 );
			$this->MKeyword = new Keyword_Model ( );
            $this->template->keywordsWithMostDownloads = $this->MKeyword->findKeywordsWithMostDownloads ( 10 );
			
			$this->template->include = new View ( $this->themes . "/" . $viewPage );
			$this->dataToTemplate ('include');
		} else {
			$this->template = new View ( $this->themes . "/" . $viewPage );
			$this->dataToTemplate ();
		}
	}
	
	protected function dataToTemplate($include = '') {
		foreach ( $this->data as $key => $value ) {
			if ($include == '') {
				$this->template->$key = $value;
			} else {
				$this->template->$include->$key = $value;
			}
		}
	}
	
	protected function setMessage($message) {
		array_push ( $this->data ['messages'], $message );
	}
	
	protected function checkUser() {
		if (intval ( $this->session->userdata ( 'userid' ) ) < 1) {
			$this->setMessage ( "您没有登录" );
			redirect ( "" );
			exit ();
		}
	}
	
	protected function userLogin($username, $password) {
		$currentUser = $this->MUser->userLogin ( $username, $password );
		if ($currentUser && is_object ( $currentUser )) {
			$userInfo = "{$username}_$password"; //userid, user name, 未加密的密码;
			$encryptedUserinfo = $this->encrypt->encode ( $userInfo );
			$cookie = array ('name' => 'userinfo', 'value' => $encryptedUserinfo, 'expire' => 30 * 24 * 60 * 60, 'path' => '/', 'prefix' => '' );
			set_cookie ( $cookie );
			$array = array ('userid' => $currentUser->id );
			$this->session->set_userdata ( $array );
			$this->my = $this->MUser->get ( $currentUser->id );
			$this->setData ( "my", $this->my );
		} else {
			$message = "用户名或密码错误";
			$this->setData ( "message", $message );
		}
	}
	
	protected function clean($string) {
		return $this->input->xss_clean ( $string );
	}
	
	protected function post($string) {
		return $this->input->post ( $string );
	}
	
	function message($message, $redirectURL) {
		$this->setData ( "message", $message );
		$this->setData ( "redirectURL", $redirectURL );
		$this->load->vars ( $this->data );
		$this->load->view ( $this->themes . "/message" );
	}
}