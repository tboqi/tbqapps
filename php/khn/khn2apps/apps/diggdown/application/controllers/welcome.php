<?php
class Welcome_Controller extends Controller {
	
	function index() {
		$this->pageTitle = '首页';
		
		$downloadModel = new Download_Model();
		$this->setData("newestDownloads", $downloadModel->newestDownloads(10));
		$this->setData("hostestDownloads", $downloadModel->hostestDownloads(10));
		
//		$this->load->library('email');
//$this->email->from('tboqi301709@gmail.com', '唐伯琦');
//$this->email->to('tangboqi@gmail.com');
//$this->email->subject('email subject斯多夫所附似懂非懂所附');
//$this->email->message('this is the mail content斯多夫斯多夫斯多夫所附撒');
//$this->email->send();
		
		$this->run ( 'home' );
	}
}