<?php echo form::open ( 'user/doLogin', array ('id' => "loginForm" ) ); ?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
    <td colspan="2">
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
    </td>
  </tr>
  <tr>
    <td>帐号：</td>
    <td>
    	<?php 
    	$edata = array ('name' => 'username', 'id' => 'username', 'size' => '10' );
			echo form::input ( $edata ); 
			?>
		</td>
  </tr>
  <tr>
    <td>密码：</td>
    <td>
			<?php 
			$ndata = array ('name' => 'password', 'id' => 'password', 'size' => '10' );
			echo form::password ( $ndata );
			?>
		</td>
  </tr>
  <tr>
    <td colspan="2"><a href="<?php echo url::site("user/regist"); ?>">注册</a> 
    <?php echo form::submit ( 'submit', 'login' ); ?></td>
  </tr>
</table>
<?php echo form::close (); ?>