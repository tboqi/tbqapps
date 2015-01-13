<script type="text/javascript">
$().ready(function() {
	$('#loginForm').ajaxForm({ target: '#userLogin' }); 
});
</script>
<h1>登录</h1>
<?php echo $this->validation->error_string; ?>
<?php
echo form_open ( 'user/doLogin', array ('id' => "loginForm" ) );

echo form_label ( 'your username', 'username' );
$edata = array ('name' => 'username', 'id' => 'username', 'size' => '25' );
echo form_input ( $edata );

echo form_label ( 'your password', 'password' );
$ndata = array ('name' => 'password', 'id' => 'password', 'size' => '25' );
echo form_password ( $ndata );

echo form_submit ( 'submit', 'login' );
echo form_close ();

?><a href="<?php echo site_url("user/regist"); ?>">注册</a>