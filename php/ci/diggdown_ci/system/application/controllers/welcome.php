<?php
class Welcome extends MY_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$this->setData ( 'pageTitle', "首页" );
		
		$this->load->model('MDownload','',TRUE);
		$this->setData("newestDownloads", $this->MDownload->newestDownloads(10));
		$this->setData("hostestDownloads", $this->MDownload->hostestDownloads(10));
		
//		$this->load->library('email');
//$this->email->from('tboqi301709@gmail.com', '唐伯琦');
//$this->email->to('tangboqi@gmail.com');
//$this->email->subject('email subject斯多夫所附似懂非懂所附');
//$this->email->message('this is the mail content斯多夫斯多夫斯多夫所附撒');
//$this->email->send();
		
		$this->run ( 'home' );
	}
}