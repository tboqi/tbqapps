<?php
class Controller_Tools extends Controller_Base {

    function action_index() {
    }
    public function action_json2arr() {
        if ($this->request->method() == 'POST') {
            if (empty($_POST['jsonstr'])) {
                $message = "不能为空";
            } else {
                $arr = json_decode($_POST['jsonstr']);
                if (empty($arr)) {
                    $message = "不是json格式字符串";
                } else {
                    $message = "操作成功";
                }
            }
            $arr = [
                "statusCode" => "200",
                "message" => $message,
                "navTabId" => "",
                "rel" => "",
                "callbackType" => "",
                "forwardUrl" => "",
                "confirmMsg" => "",
            ];
            $str = var_export($arr, 1);
            die(json_encode($arr));
            //die('<pre>' . $str . '</pre>');
        }
        $this->tpl = 'tools/json2arr';
        $this->data = [];
    }
}
