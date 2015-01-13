<form id="form1" name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <td>分类</td>
      <td><select name="categories" size="6" multiple="multiple" id="categories">
      	<?php foreach($categories as $cate) { ?>
        <option value="<?php echo $cate->id; ?>"><?php echo $cate->name; ?></option>
        <?php } ?>
      </select></td>
    </tr>
    <tr>
      <td>标签</td>
      <td><input type="text" name="tabs" id="tabs" /></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="button" id="button" value="提交" /></td>
    </tr>
  </table>
  <input name="art_id" type="hidden" value="<?php echo $art_id; ?>" />
</form>