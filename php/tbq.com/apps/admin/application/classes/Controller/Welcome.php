<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Welcome extends Controller_Base {

    protected $show_header = false;

    public function action_index() {
        $this->tpl = 'welcome/index';

        $session = Session::instance();
        $data = $session->as_array();
        $this->data = $data;
    }

    public function action_main() {
        die('Welcome/main');
    }

} // End Welcome
