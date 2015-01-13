<form class="uniForm" action="<?php echo url::site('article/save'); ?>" id="article_form" method="post">
<fieldset>
	<h3><?php echo $title; ?></h3>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 标题</label>
		<input class="textInput" id="title" name="title" value="<?php echo isset($article) ? $article->title : ''; ?>" type="text" />
		<p class="formHint"></p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 分类（<a href="<?php echo URL::site('article_category/create'); ?>">创建分类</a>）</label>
		<select class="selectInput" id="category_id" name="category_id">
			<option value="0">未分类</option>
			<?php foreach ($categories as $category) { ?>
			<option value="<?php echo $category->id; ?>"<?php if (isset($article) && $category->id == $article->category_id) echo ' selected'; ?>><?php echo $category->name; ?></option>
			<?php } ?>
		</select>
		<p class="formHint">This is a form hint.</p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 摘要</label>
		<textarea class="textarea" rows="4" cols="20" id="summary" name="summary"><?php echo isset($article) ? $article->summary : ''; ?></textarea>
		<p class="formHint"></p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 内容</label>
		<textarea rows="4" cols="20" id="content" name="content"><?php echo isset($article) ? $article->content : ''; ?></textarea>
		<p class="formHint"></p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 标签</label>
		<input class="textInput" id="tabs" name="tabs" value="<?php
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
			}?>" type="text" />
		<p class="formHint"></p>
	</div>
</fieldset>
<div class="buttonHolder"><button type="submit" class="primaryAction">Submit</button></div>
<input type="hidden" name="id" value="<?php echo isset($article) ? $article->id : 0; ?>" />
</form>
<script type="text/javascript" src="<?php echo Resource::js('fck/fckeditor.js');?>"></script>
<script>
$(function(){
	form_submit_fck('article_form');
});
window.onload=function() {
	var fck1 = new FCKeditor('content');
	fck1.Width = 560;
	fck1.Height = 400;
	fck1.BasePath = "<?php echo Resource::js('fck/') ?>";
	fck1.ReplaceTextarea() ;
}
</script>