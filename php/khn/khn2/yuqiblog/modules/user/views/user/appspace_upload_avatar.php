<h1>上传头像</h1>
<?php if (!empty($msg) ) {?>
<div><?php echo $msg; ?></div>
<?php }?>
<form action="" method="post" enctype="multipart/form-data" name="avatar_form" id="avatar_form">
  <table width="100" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td><input type="file" name="avatar" id="avatar" /></td>
      <td><input type="submit" name="button" id="button" value="确定" /></td>
    </tr>
  </table>
  <input type="hidden" name="MAX_FILE_SIZE" value="30000" />
</form>