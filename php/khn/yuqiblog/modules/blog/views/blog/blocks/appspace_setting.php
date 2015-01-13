<form id="form_setting" name="form_setting" method="post" action="<?php echo url::site('space/setting'); ?>">
  <table border="0" cellspacing="1" cellpadding="0">
    <tr>
      <th colspan="2">空间设置</th>
    </tr>
    <tr>
      <td>空间名</td>
      <td><input name="name" type="text" id="name" size="30" value="<?php echo !empty($space) ? $space->name : ''; ?>" /></td>
    </tr>
    <tr>
      <td>模板</td>
      <td><select name="theme" id="theme">
      	<?php foreach ($themes as $theme) { ?>
      	<option value="<?php echo $theme; ?>"<?php if (!empty($space) && $theme == $space->theme) { echo ' selected'; } ?>><?php echo $theme; ?></option>
      	<?php } ?>
      </select></td>
    </tr>
    <tr>
      <td>空间介绍</td>
      <td><textarea name="description" cols="30" rows="6" id="description"><?php echo !empty($space) ? $space->description : ''; ?></textarea></td>
    </tr>
    <tr>
      <td>空间口号</td>
      <td><input name="slogan" type="text" id="slogan" size="30" value="<?php echo !empty($space) ? $space->slogan : ''; ?>" /></td>
    </tr>
    <tr>
      <td>关键字</td>
      <td><input name="keywords" type="text" id="keywords" size="30" value="<?php echo !empty($space) ? $space->keywords : ''; ?>" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="确定" /></td>
    </tr>
  </table>
</form>