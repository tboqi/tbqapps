<?php
abstract class Sub_Template_Controller extends Template_Controller {
	protected $navigation;
	/**
	 * Template loading and setup routine.
	 */
	public function __construct() {
		parent::__construct ();
	}
	
	protected function sub_template($view, $title) {
		$template = new View('appindex_sub_template');
		$template->subtitle = $title;
		$template->navigation = $this->navigation;
		$template->content = $view;
		return $template;
	}
}