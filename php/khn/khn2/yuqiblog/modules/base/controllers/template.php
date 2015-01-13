<?php
abstract class Template_Controller extends Controller {
	
	// Template view name
	protected $template_file = 'template';
	
	private $page_title = '';
	
	protected $template = null;
	
	private $keywords = '';
	
	private $description = '';
	
	private $slogan = '';
	
	public $logged_user = null;
	
	/**
	 * Template loading and setup routine.
	 */
	public function __construct() {
		parent::__construct ();
		
		$this->run_before_view();
		// Load the template
		$this->template = new View ( $this->template_file );
		if (Auth::instance()->logged_in() || Auth::instance()->auto_login()) {
			$this->logged_user = Auth::instance()->get_user();
		}
	}
	
	public function run_before_view() {
		
	}
	
	/**
	 * Render the loaded template.
	 */
	protected function _render($content) {
		$this->template->content = $content;
		if (! empty ( $this->page_title )) {
			$this->template->page_title = $this->page_title;
		}
		if (! empty ( $this->keywords )) {
			$this->template->keywords = $this->keywords;
		}
		if (! empty ( $this->description )) {
			$this->template->description = $this->description;
		}
		if (! empty ( $this->slogan )) {
			$this->template->slogan = $this->slogan;
		}
		$this->template->website_title = 'yuqiblog';
		$this->template->render ( TRUE );
		return;
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
}