<script type="text/javascript">
$(document).ready(function() { 
	form_submit('categoryForm');
});
</script>
<h1><?php echo $title; ?></h1>
<form action="<?php echo url::site('admin/category/save'); ?>" id="categoryForm" method="post">
<table>
    <tr>
        <td>分类名</td>
        <td><input id="category_name" name="category_name" value="<?php echo isset($category) ? $category->title : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td colspan="2"><input id="save_category" name="save_category" value="保存" type="submit" /></td>
    </tr>
</table>
<input type="hidden" name="id" value="<?php echo isset($id) ? $id : 0; ?>" />
</form>