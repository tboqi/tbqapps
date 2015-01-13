<?php

class Welcome extends Controller {
	
	function Welcome() {
		parent::Controller ();
		$this->load->database ();
		$this->load->helper ( 'url' );
		$this->load->helper ( 'datacenter' );
	}
	
	function index() {
		$query = $this->db->get ( 'interfaces' );
		$interfaces = array ();
		foreach ( $query->result () as $row ) {
			$interfaces [] = $row;
		}
		$this->load->view ( 'welcome_message', array ('interfaces' => $interfaces ) );
	}
	
	function add() {
		if ($_POST) {
			$parameters = $this->input->post ( 'parameters', true );
			if (! $parameters) {
				$parameters = '';
			} else {
				$parameters = serialize ( $parameters );
			}
			$data = array ('name' => trim ( $this->input->post ( 'name', true ) ), 'desc' => trim ( $this->input->post ( 'desc', true ) ), 'sql' => trim ( $this->input->post ( 'sql', true ) ), 'cachetime' => trim ( $this->input->post ( 'cachetime', true ) ), 'parameters' => $parameters );
			
			$this->db->insert ( 'interfaces', $data );
			redirect ( '/', 'location', 301 );
		}
		$this->load->view ( 'interface_form' );
	}
	
	function edit($id) {
		$id = intval ( $id );
		if ($_POST) {
			$parameters = $this->input->post ( 'parameters', true );
			if (! $parameters) {
				$parameters = '';
			} else {
				$parameters = serialize ( $parameters );
			}
			$data = array ('name' => trim ( $this->input->post ( 'name', true ) ), 'desc' => trim ( $this->input->post ( 'desc', true ) ), 'sql' => trim ( $this->input->post ( 'sql', true ) ), 'cachetime' => trim ( $this->input->post ( 'cachetime', true ) ), 'parameters' => $parameters );
			$this->db->where ( 'id', $id );
			$this->db->update ( 'interfaces', $data );
			redirect ( '/', 'location', 301 );
		}
		$query = $this->db->get_where ( 'interfaces', array ('id' => $id ) );
		$row = $query->row ();
		$this->load->view ( 'interface_form_edit', array ('interface' => $row ) );
	}
	
	function del($id) {
		$id = intval ( $id );
		$this->db->delete ( 'interfaces', array ('id' => $id ) );
		redirect ( '/', 'location', 301 );
	}
	
	function soap() {
		$server = new SoapServer ( null, array ('soap_version' => SOAP_1_2, 'uri' => "http://localhost/soapserver/" ) );
		$server->addFunction ( 'displayData' );
		$server->handle ();
	}
	
	function update($id) {
		$interface = getInterface($id);
		updateData($interface, $_POST['plist']);
	}
}

/* End of file welcome.php */
/* Location: ./system/application/controllers/welcome.php */