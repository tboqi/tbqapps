<?php
class Controller_Index extends Controller_Template {

    function action_index() {
        $content = Helper_View::create_view('welcome/index');
        $this->template->content = $content;
        $this->sub_title = '首页';
    }

    function before() {
        parent::before();
    }
}
