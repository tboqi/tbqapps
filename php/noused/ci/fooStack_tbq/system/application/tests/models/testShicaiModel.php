<?php
include_once dirname ( __FILE__ ) . '/../CIUnit.php';

class testShicaiModel extends CIUnit_TestCase {
	function setUp() {
		$this->CI->load->model ( 'foodstore/raw_food_model' );
		$this->raw_food_model = $this->CI->raw_food_model;
// 		$this->dbfixt('users');
	}
	function testDetail() {
		$shicai = $this->raw_food_model->detail ( 2116 );
		$this->assertEquals ( '蓝莓', $shicai['food_name'] );
	}
}