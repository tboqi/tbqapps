
<h1><?php echo $title; ?></h1>
<form action="<?php echo url::site('article/save'); ?>" id="article_form" method="post">
<table>
    <tr>
        <td>标题</td>
        <td><input id="title" name="title" style="width: 450px;" value="<?php echo isset($article) ? $article->title : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td>分类</td>
        <td><select name="category_id" id="category_id">
				  <?php foreach ($categories as $category) { ?>
				  <option value="<?php echo $category->id; ?>"<?php if (isset($article) && $category->id == $article->category_id) echo ' selected'; ?>><?php echo $category->name; ?></option>
				  <?php } ?>
				</select><a href="<?php echo URL::site('article_category/create'); ?>">创建分类</a></td>
    </tr>
    <tr>
        <td>摘要</td>
        <td><textarea name="summary" id="summary" style="width: 450px; height: 110px;"><?php echo isset($article) ? $article->summary : ''; ?></textarea></td>
    </tr>
    <tr>
        <td>内容</td>
        <td><textarea name="content" id="content" style="width: 450px; height: 110px;"><?php echo isset($article) ? $article->content : ''; ?></textarea></td>
    </tr>
    <tr>
        <td>标签</td>
        <td><input id="tabs" name="tabs" value="<?php
			if (empty($article) || empty($article->tabs_detail)) {
				echo '';
			} else {
				$article->tabs_detail = json_decode($article->tabs_detail);
				if (!empty($article->tabs_detail)) {
					$split = '';
					foreach ($article->tabs_detail as $tab) {
						echo $split, $tab->tab;
						$split = ', ';
					}
				}
			}?>" type="text" /></td>
    </tr>
    <tr>
        <td>原文地址</td>
        <td><input id="refurl" name="refurl" value="<?php echo isset($article) ? $article->refurl : ''; ?>" type="text" /></td>
    </tr>
    <tr>
        <td colspan="2"><input value="保存" type="submit" /></td>
    </tr>
</table>
<input type="hidden" name="id" value="<?php echo isset($article) ? $article->id : 0; ?>" />
</form>