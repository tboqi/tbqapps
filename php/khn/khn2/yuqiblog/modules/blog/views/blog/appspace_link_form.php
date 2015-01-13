<h1><?php echo $id > 0 ? '编辑' : '新建'; ?>链接</h1>
<form id="form2" name="form2" method="post" action="">
  <table border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td>链接名</td>
      <td><input name="name" type="text" id="name" size="60" value="<?php echo isset($link) ? $link->name : ''; ?>" /></td>
    </tr>
    <tr>
      <td>链接地址</td>
      <td><input name="url" type="text" id="url" size="60" value="<?php echo isset($link) ? $link->url : ''; ?>" /></td>
    </tr>
    <tr>
      <td>描述</td>
      <td><textarea name="description" cols="60" rows="3" id="description"><?php echo isset($link) ? $link->description : ''; ?></textarea></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input name="id" type="hidden" id="id" value="<?php echo $id; ?>" />
      <input type="submit" name="button" id="button" value="保存" /></td>
    </tr>
  </table>
</form>