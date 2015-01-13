<h1><?php echo $pageTitle ?></h1>
<?php echo $this->validation->error_string; ?>
<?php
echo form_open ( 'user/editPassword', array ('id' => "editPassword" ) );

echo form_label ( '旧密码', 'oldpassword' );
$edata = array ('name' => 'oldpassword', 'id' => 'oldpassword', 'size' => '25' );
echo form_password ( $edata );

echo form_label ( '新密码', 'newpassword' );
$ndata = array ('name' => 'newpassword', 'id' => 'newpassword', 'size' => '25' );
echo form_password ( $ndata );
echo form_label ( '密码确认', 'passwordconfirm' );
$ndata = array ('name' => 'passwordconfirm', 'id' => 'passwordconfirm', 'size' => '25' );
echo form_password ( $ndata );

echo form_hidden("flag", "do");

echo form_submit ( 'submit', '确定' );
echo form_close ();

?>