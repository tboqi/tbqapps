<?php
class Controller_Index extends Controller_Template {

    function action_index() {
        $this->sub_title = '首页';
        $content = Helper_View::create_view('index');
        $this->template->content = $content;
    }

    function before() {
        parent::before();
        if (Auth::instance()->logged_in()) {
        } else {
            Request::factory()->redirect(URL::site('user/login', true));
        }
    }
}