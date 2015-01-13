<?php

class View {
	
	function __construct() {
	}
	
	function display($filename, $vars = array()) {
		$filename = DOC_ROOT . 'views/' . $filename . '.php';
		
		ob_start();
		
		try
		{
			// Load the view within the current scope
			include $filename;
		}
		catch (Exception $e)
		{
			// Delete the output buffer
			ob_end_clean();
		
			// Re-throw the exception
			throw $e;
		}
		
		// Get the captured output and close the buffer
		return ob_get_clean();
	}
}