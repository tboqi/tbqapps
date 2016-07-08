<?php

include_once dirname ( __FILE__ ) . '/../CIUnit.php';
class testWelcome extends CIUnit_TestCase {
	function setUp() {
		$this->CI = set_controller ( 'shicai' );
	}
	public function testWelcomeController() {
		$this->CI->index ();
		$out = output ();
		$this->assertSame ( 0, preg_match ( '/(error|notice)/i', $out ) );//总体输出是否有错误
// 		var_dump($this->CI->simpletpl->_tpl_vars);//这里可以测试每个变量的值是否正确
		$this->assertEquals('xkgreen', $this->CI->simpletpl->theme);//验证模版是否正确
	}
	
// 	public function testDetail() {
// 		$this->CI->detail(1);
// 		$out = output ();
// 		echo '----------',var_dump($out), '+++++++++++++';
// 		$this->assertSame('1', $out);
// 	}
}