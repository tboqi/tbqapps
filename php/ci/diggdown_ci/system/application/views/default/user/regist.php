<h1><?php echo $pageTitle;?></h1>
<?php echo $this->validation->error_string; ?>
<?php 
echo form_open('user/regist');

echo form_label('用户名','username');
$edata = array('name' => 'username', 'id' => 'username', 'size' => '25');
echo form_input($edata);

echo form_label('妮称','nickname');
$edata = array('name' => 'nickname', 'id' => 'nickname', 'size' => '25');
echo form_input($edata);

echo form_label('密码','password');
$ndata = array('name' => 'password', 'id' => 'password', 'size' => '25');
echo form_password($ndata);

echo form_label('password confirm','passwd2');
$ndata = array('name' => 'passwd2', 'id' => 'passwd2', 'size' => '25');
echo form_password($ndata);

echo form_label('email','email');
$ndata = array('name' => 'email', 'id' => 'email', 'size' => '25');
echo form_input($ndata);

echo form_hidden("flag", "do");

echo form_submit('submit','submit');
echo form_close();

?>