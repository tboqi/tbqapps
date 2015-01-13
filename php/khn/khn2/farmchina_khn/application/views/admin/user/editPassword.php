<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php new View("admin/meta"); ?>
<title>菜单</title>
</head>

<body>
<h1>修改密码</h1>
<?php 
if(isset($errors) && is_array($errors) && count($errors) > 0) {
    ?>
    <ul>
       <?php foreach ($errors as $e) { ?>
       <li><?php echo $e; ?></li>
       <?php } ?>
    </ul>
    <?php 
}
?>
<?php
echo form::open ( 'admin/user/editPassword', array ('id' => "editPassword" ) );

echo form::label ( 'oldpassword', '旧密码' );
$edata = array ('name' => 'oldpassword', 'id' => 'oldpassword', 'size' => '25' );
echo form::password ( $edata );

echo form::label ( 'newpassword', '新密码' );
$ndata = array ('name' => 'newpassword', 'id' => 'newpassword', 'size' => '25' );
echo form::password ( $ndata );
echo form::label ( 'passwordconfirm', '密码确认' );
$ndata = array ('name' => 'passwordconfirm', 'id' => 'passwordconfirm', 'size' => '25' );
echo form::password ( $ndata );

echo form::hidden("flag", "do");

echo form::submit ( 'submit', '确定' );
echo form::close ();

?>
</body>
</html>