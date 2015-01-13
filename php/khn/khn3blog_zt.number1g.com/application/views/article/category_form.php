<h1><?php echo $title; ?></h1>
<form action="<?php echo url::site('article_category/save'); ?>" id="categoryForm" method="post">
<table>
    <tr>
        <td>分类名</td>
        <td><input id="category_name" name="category_name" value="<?php echo isset($category) ? $category->name : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td>显示顺序（从小到大）</td>
        <td><input id="show_order" name="show_order" value="<?php echo isset($category) ? $category->show_order : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td>描述</td>
        <td><textarea rows="4" cols="20" id="description" name="description"><?php echo isset($category) ? $category->description : ''; ?></textarea></td>
    </tr>
    <tr>
        <td colspan="2"><input id="save_category" name="save_category" value="保存" type="submit" /></td>
    </tr>
</table>
<input type="hidden" name="id" value="<?php echo isset($category) ? $category->id : 0; ?>" />
</form>