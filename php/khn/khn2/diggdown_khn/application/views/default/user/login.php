<script type="text/javascript">
$().ready(function() {
	$('#loginForm').ajaxForm({ target: '#userLogin' }); 
});
</script>
<h1>登录</h1>
<?php
echo form::open ( 'user/doLogin', array ('id' => "loginForm" ) );

echo form::label ( 'your username', 'username' );
$edata = array ('name' => 'username', 'id' => 'username', 'size' => '25' );
echo form::input ( $edata );

echo form::label ( 'your password', 'password' );
$ndata = array ('name' => 'password', 'id' => 'password', 'size' => '25' );
echo form::password ( $ndata );

echo form::submit ( 'submit', 'login' );
echo form::close ();

?><a href="<?php echo url::site("user/regist"); ?>">注册</a>