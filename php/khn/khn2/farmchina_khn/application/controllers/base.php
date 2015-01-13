<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

abstract class Base_Controller extends Controller {
	
	// Template view name
	private $globalTitle = '中国农业网';
	private $slogan = '提供给您最好的农业咨询！';
	protected $pageTitle = '';
	
	protected $my = null;
	
	public function __construct() {
		parent::__construct ();
		
		$this->themes = 'default';
		
		$this->template = "{$this->themes}/template";
		
		$userinfo = cookie::get ( 'userinfo' );
		//$userinfo = empty ( $userinfo ) ? '' : $this->encrypt->decode ( $userinfo );
		if (! empty ( $userinfo )) {
			$userarr = explode ( "_", $userinfo );
			$username = $userarr [0];
			$password = $userarr [1];
			$this->userLogin ( $username, $password );
		}
		
		$myid = intval ( $this->session->get ( 'userid', 0 ) );
		if ($myid >= 1) {
			$this->my = $this->MUser->get ( $myid );
		}
		
		if ($this->auto_render == TRUE) {
			// Render the template immediately after the controller method
			Event::add ( 'system.post_controller', array ($this, '_render' ) );
		}
	}
	
	protected function userLogin($username, $password) {
		$currentUser = $this->MUser->userLogin ( $username, $password );
		if ($currentUser && is_object ( $currentUser )) {
			$userInfo = "{$username}_$password"; //userid, user name, 未加密的密码;
			$encryptedUserinfo = $this->encrypt->encode ( $userInfo );
			$cookie = array ('name' => 'userinfo', 'value' => $encryptedUserinfo, 'expire' => 30 * 24 * 60 * 60, 'path' => '/', 'prefix' => '' );
			cookie::set ( $cookie );
			$array = array ('userid' => $currentUser->id );
			$this->session->set ( $array );
			$this->my = $this->MUser->get ( $currentUser->id );
			$this->setData ( "my", $this->my );
		} else {
			$message = "用户名或密码错误";
			$this->setData ( "message", $message );
		}
	}
	
	protected function run($viewPage) {
		// Load the template
		$this->template = new View ( $this->template );
		
		$this->template->content = new View ( $this->themes . "/" . $viewPage );
		
		//globals 
		$this->template->globalTitle = $this->globalTitle;
		$this->template->pageTitle = $this->pageTitle;
		$this->template->slogan = $this->slogan;
		$this->template->myjavascripts = $this->myjavascripts;
		
		//公告
		$this->template->gonggao = $this->MArticle->gonggao ();
		//categories
		$this->template->categoriesExceptGonggao = $this->MCategory->allExceptGonggao ();
		
		$this->template->myjavascripts = $this->myjavascripts;
		
		foreach ( $this->data as $key => $value ) {
			$this->template->content->$key = $value;
		}
		
		$this->dataToTemplate ();
	}
	
	protected function runAjax($viewPage) {
		$this->template = new View ( $this->themes . "/" . $viewPage );
		$this->dataToTemplate ();
	}
	
	public function index() {
	
	}
	
	protected function checkUser() {
		if (intval ( $this->session->userdata ( 'userid' ) ) < 1) {
			$this->setMessage ( "您没有登录" );
			redirect ( "" );
			exit ();
		}
	}
}