<form class="uniForm" action="<?php echo url::site('article_category/save'); ?>" id="categoryForm" method="post">
<fieldset>
	<h3><?php echo $title; ?></h3>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 分类名</label>
		<input class="textInput" id="category_name" name="category_name" value="<?php echo isset($category) ? $category->name : ''; ?>" type="text" />
		<p class="formHint"></p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 显示顺序（从小到大）</label>
		<input class="textInput" id="show_order" name="show_order" value="<?php echo isset($category) ? $category->show_order : ''; ?>" type="text" />
		<p class="formHint"></p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 描述</label>
		<textarea class="textarea" rows="4" cols="20" id="description" name="description"><?php echo isset($category) ? $category->description : ''; ?></textarea>
		<p class="formHint"></p>
	</div>
</fieldset>
<div class="buttonHolder"><button type="submit" class="primaryAction">Submit</button></div>
<input type="hidden" name="id" value="<?php echo isset($category) ? $category->id : 0; ?>" />
</form>
<script>
$(function(){
	form_submit('categoryForm');
});
</script>