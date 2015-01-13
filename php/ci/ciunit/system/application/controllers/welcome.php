<?php

class Welcome extends Controller {

	function Welcome()
	{
		parent::Controller();
	}
	
	function index()
	{
		$this->load->model('user_model');
		$this->load->view('welcome_message', array('a' => $this->user_model->get_userid(), 
				'b' => $this->user_model->get_username() ) );
	}

	function view()
	{
		$this->load->model('user_model');
		$this->load->view('welcome_view' );
	}
}

/* End of file welcome.php */
/* Location: ./system/application/controllers/welcome.php */