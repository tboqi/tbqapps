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
        $tree = [
            [
                "text" => '钱包接口测试',
                "isexpand" => true,
                "children" => [
                    ["url" => URL::site('qianbao/chongzhi'), "text" => "充值"],
                    ["url" => URL::site('qianbao/tuihuo'), "text" => "退货退款"],
                    ["url" => URL::site('qianbao/duizhang'), "text" => "对账文件接口"],
                ],
            ],
        ];
        $data = [
            'tree1' => $tree,
        ];
        die('var indexdata = ' . json_encode($data));
    }

    function action_home() {
        echo 'home';
        exit;
    }
} // End Welcome
