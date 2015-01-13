<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );
/**
 *
 * @author     唐伯琦
 */
abstract class Template_Controller extends Controller {
	
	// Template view name
	public $template = 'template';
	
	private $website_title = '尘土的博客'; //站点标题，全局显示
	private $page_title = ''; //页标题
	private $keywords = ''; //关键字
	private $description = ''; //描述
	private $slogan = ''; //口号, 显示在站点标题后面
	

	public $logged_user = null;
	
	/**
	 * Template loading and setup routine.
	 */
	public function __construct() {
		parent::__construct ();
		Auth::instance ()->auto_login();
	}
	
	/**
	 * 显示视图数据
	 * $displayAll = true; 显示模板内容，否则显示 content内容
	 * @param $content string
	 * @param $data array（$k => value）
	 * @param $displayAll boolean
	 */
	protected function initContent($content, $data = NULL, $displayAll = TRUE) {
		if ($displayAll) {
			$view = new View ( $this->template );
			$view->website_title = $this->website_title;
			$view->page_title = $this->page_title;
			$view->keywords = $this->keywords;
			$view->description = $this->description;
			$view->slogan = $this->slogan;
			$view->content = new View ( $content, $data );
			$adminmenu_model = new Adminmenu_Model();
			$view->menus = $adminmenu_model->menus();
		} else {
			$view = new View ( $content, $data );
		}
		$view->render ( TRUE );
		
		$this->profiler = new Profiler;
		$output = $this->profiler->render(TRUE);
	}
	
	protected function set_page_title($title) {
		$this->page_title = $title;
	}
	
	protected function set_keywords($keywords) {
		$this->keywords = $keywords;
	}
	
	protected function set_description($description) {
		$this->description = $description;
	}
	
	protected function set_slogan($slogan) {
		$this->slogan = $slogan;
	}
	
	protected function showmessage($msg, $redirect_url, $delay_time) {
		$this->auto_render = false;
		$content = new View ( 'message', array ('msg' => $msg, 
												'redirect_url' => $redirect_url, 
												'delay_time' => $delay_time ) );
		$content->render ( TRUE );
	}
} // End Template_Controller