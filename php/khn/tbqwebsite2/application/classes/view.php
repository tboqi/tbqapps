<?php
class View extends Kohana_View {
	protected static function capture($kohana_view_filename, array $kohana_view_data)
	{
		// Import the view variables to local namespace
		extract($kohana_view_data, EXTR_SKIP);
	
		if (View::$_global_data)
		{
			// Import the global view variables to local namespace
			extract(View::$_global_data, EXTR_SKIP);
		}
	
		// Capture the view output
		ob_start();
	
		try
		{
			// Load the view within the current scope
			include $kohana_view_filename;
		}
		catch (Exception $e)
		{
			// Delete the output buffer
			ob_end_clean();
	
			// Re-throw the exception
			throw $e;
		}
	
		// Get the captured output and close the buffer
		ob_end_flush();
		sleep(1);
// 		return ob_get_clean();
	}
}