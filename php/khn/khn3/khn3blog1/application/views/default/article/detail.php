<?php block_Article::article($article, 'detail'); ?>
<div>
	<h2>评论</h2>
	<form class="uniForm" action="<?php echo url::site('comment/save'); ?>" id="commentForm" method="post">
	<fieldset>
		<div class="ctrlHolder">
			<label for=""><em>*</em> email</label>
			<input class="textInput" id="user_email" name="user_email" value="" type="text" />
			<p class="formHint"></p>
		</div>
		<div class="ctrlHolder">
			<label for=""><em>*</em> 昵称</label>
			<input class="textInput" id="user_name" name="user_name" value="" type="text" />
			<p class="formHint"></p>
		</div>
		<div class="ctrlHolder">
			<label for=""><em>*</em> 内容</label>
			<textarea class="textarea" rows="4" cols="20" id="content" name="content"></textarea>
			<p class="formHint"></p>
		</div>
	</fieldset>
	<div class="buttonHolder"><button type="submit" class="primaryAction">Submit</button></div>
	<input type="hidden" name="article_id" value="<?php echo $article->id; ?>" />
	</form>
	<div>
		<?php foreach($comments as $comment) { ?>
		<div>
			<?php echo $comment->user_name; ?> 说：<?php echo $comment->content; ?><br/><?php echo date('Y-m-d H:i', $comment->create_time); ?>
		</div>
		<?php } ?>
	</div>
</div>