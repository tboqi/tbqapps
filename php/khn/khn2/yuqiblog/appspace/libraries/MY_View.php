<?php
class View extends View_Core {
	
	/**
	 * Attempts to load a view and pre-load view data.
	 *
	 * @throws  Kohana_Exception  if the requested view cannot be found
	 * @param   string  view name
	 * @param   array   pre-load data
	 * @param   string  type of file: html, css, js, etc.
	 * @return  void
	 */
	public function __construct($name = NULL, $data = NULL, $type = NULL) {
		$theme = Session::instance()->get('current_space_theme');
		if (file_exists(APPPATH . 'views/' . $theme . '/' . $name . EXT)) {
			$name = $theme . '/' . $name;
		}
		parent::__construct($name, $data, $type);
	}
}