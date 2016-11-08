<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Welcome extends Controller_Base {

    protected $show_header = false;
    protected $need_login = false;

    public function action_index() {
        $this->tpl = 'welcome/index';

        $session = Session::instance();
        $data = $session->as_array();
        $this->data = $data;
    }

    public function action_ajax() {
        $this->show_type = 'json';
        $this->data = ['aa' => 0, 'bb' => 'test'];
    }

    public function action_indexdata() {
        $data = [
            [
                "text" => '钱包接口测试',
                "isexpand" => false,
                "children" => [
                    ["url" => URL::site('qianbao/chongzhi'), "text" => "充值"],
                ],
            ],
            [
                "text" => '工具集',
                "isexpand" => false,
                "children" => [
                    ["url" => URL::site('tools/json2arr'), "text" => "json2arr"],
                ],
            ],
        ];
        die('var indexdata = ' . json_encode($data));
    }

} // End Welcome
