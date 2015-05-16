<?php
class Router {
	private $module_name;
	private $class;
	private $method;
	private $parameters = array();
	private $is_admin = false;
	
	private $path = '';
	
	function __construct() {
		$this->fetch_path();
		
		if ($this->path == '') {
			$this->parse_default_uri_info();
		} else {
			$this->parse_uri_info();
		}
	}
	
	private function parse_uri_info() {
		$path = explode('/', $this->path);
		if ($path[0] == 'admin') {
			$this->is_admin = true;
			$this->module_name = isset($path[1]) ? $path[1] : 'index';
			$this->class = $this->parse_class();
			$this->method = isset($path[2]) ? $path[2] : 'index';
			if (count($path) > 3) {
				for ($i = 3; $i < count($path); $i++) {
					$this->parameters[] = $path[$i];
				}
			}
		} else {
			$this->module_name = isset($path[0]) ? $path[0] : 'index';
			$this->class = $this->parse_class();
			$this->method = isset($path[1]) ? $path[1] : 'index';
			if (count($path) > 2) {
				for ($i = 2; $i < count($path); $i++) {
					$this->parameters[] = $path[$i];
				}
			}
		}
	}
	
	private function parse_class() {
		$class = ucfirst($this->module_name) . '_Controller';
		if ($this->is_admin) {
			$class = 'Admin_' . $class;
		}
		return $class;
	}
	
	private function parse_default_uri_info() {
		$this->module_name = 'index';
		$this->class = $this->parse_class('');
		$this->method = 'index';
	}
	
	private function fetch_path() {
		$path = (isset($_SERVER['PATH_INFO'])) ? $_SERVER['PATH_INFO'] : @getenv('PATH_INFO');
		$path = trim($path, '/');
		if ($path != '')
		{
			$this->path = $path;
		}
	}
	
	public function __get($name) {
		return $this->$name;
	}
}