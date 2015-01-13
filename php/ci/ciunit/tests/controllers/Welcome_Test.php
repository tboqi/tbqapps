<?php
define('BASEPATH', '/media/data/workspace/phpapp/ciunit/system/');
define('TESTPATH', '/media/data/workspace/phpapp/ciunit/tests/');
define('APPPATH', BASEPATH . 'application/');
define('EXT', '.php');

// CI Version
define('CI_VERSION',	'1.7.3');

/*
 * ------------------------------------------------------
 *  Load the global functions
 * ------------------------------------------------------
 */
require(TESTPATH.'core/Common'.EXT);

/*
 * ------------------------------------------------------
 *  Load the compatibility override functions
 * ------------------------------------------------------
 */
require(BASEPATH.'codeigniter/Compat'.EXT);

/*
 * ------------------------------------------------------
 *  Load the framework constants
 * ------------------------------------------------------
 */
require(APPPATH.'config/constants'.EXT);
require(BASEPATH.'codeigniter/Base5'.EXT);

$CFG =& load_class('Config');
$URI =& load_class('URI');
$RTR =& load_class('Router');
$OUT =& load_class('Output');


class Welcome_Test extends PHPUnit_Framework_TestCase {
	
	public function testIndex() {
		global $RTR, $URI, $CFG, $OUT;
		$directory = '';
		$class = 'welcome';
		$method = 'index';
		include TESTPATH.'core/CodeIgniter.php';
		$this->assertEquals($OUT->params['view'], 'welcome_message');
		$this->assertEquals($OUT->params['vars']['a'], 1);
		$this->assertEquals($OUT->params['vars']['b'], 'abc');
	}
	
	public function testView() {
		global $RTR, $URI, $CFG, $OUT;
		$directory = '';
		$class = 'welcome';
		$method = 'view';
		include TESTPATH.'core/CodeIgniter.php';
		$this->assertEquals($OUT->params['view'], 'welcome_view');
	}
}