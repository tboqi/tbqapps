<?php
class Controller_Tools extends Controller_Base {

    function action_index() {
    }
    public function action_json2arr() {
        if ($this->request->method() == 'POST') {
            if (empty($_POST['jsonstr'])) {
                $msg = "不能为空";
                $this->show_json_error(1, $msg);
            } else {
                $arr = json_decode($_POST['jsonstr'], 1);
                if (empty($arr)) {
                    $msg = "不是json格式字符串";
                    $this->show_json_error(2, $msg);
                } else {
                    $str = var_export($arr, 1);
                    $this->show_json_succ(['str' => $str]);
                }
            }
            return;
        }
        $this->tpl = 'tools/json2arr';
        $this->data = [];
    }
    public function action_serialize() {
        if ($this->request->method() == 'POST') {
            if (empty($_POST['str'])) {
                $msg = "不能为空";
                $this->show_json_error(1, $msg);
            } else {
                $str = $_POST['str'];
                $str = stripslashes($str);
                $arr = @unserialize($str);
                if (empty($arr)) {
                    $msg = "格式错误";
                    $this->show_json_error(2, $msg);
                } else {
                    $str = var_export($arr, 1);
                    $this->show_json_succ(['str' => $str]);
                }
            }
            return;
        }
        $this->tpl = 'tools/serialize';
        $this->data = [];
    }
    public function action_md5() {
        if ($this->request->method() == 'POST') {
            if (empty($_POST['str'])) {
                $msg = "不能为空";
                $this->show_json_error(1, $msg);
            } else {
                $str = $_POST['str'];
                $this->show_json_succ(['str' => md5($str)]);
            }
            return;
        }
        $this->tpl = 'tools/md5';
        $this->data = [];
    }
}
