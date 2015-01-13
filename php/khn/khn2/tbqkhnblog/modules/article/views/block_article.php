<div class="post">
	<h2 class="title"><a href="<?php echo url::site('article/view/' . $article->id);?>"><?php echo $article->title; ?></a></h2>
	<p class="meta"><?php echo date('Y-m-d H:i', $article->create_time); ?> 
	作者 <a href="<?php echo url::base();?>article/user/<?php echo $article->user_id; ?>"><?php echo $article->user->nickname; ?></a></p>
	<div class="entry">
		<?php echo $article->content ?>
	</div>
	<p class="meta">
		<?php 
		$tabs = article::get_tabs_by_artid($article->id); 
		if (isset($tabs) && is_array($tabs) && count($tabs)) {
			?>
			标签：
			<?php 
			foreach($tabs as $tab) {
				$split = '';
				?>
				<?php echo $split; ?><a href="<?php echo url::site('article/tab/' . $tab->id);?>"><?php echo $tab->tab; ?></a>
				<?php 
				$split = ', '; 
			}
			?>
		<?php } ?>
		<?php 
		$categories = article::get_categories_by_artid($article->id); 
		if (isset($categories) && is_array($categories) && count($categories)) {
			?>
			分类：
			<?php 
			foreach($categories as $category) {
				$split = '';
				?>
				<?php echo $split; ?><a href="<?php echo url::site('article/category/' . $category->id);?>"><?php echo $category->name; ?></a>
				<?php 
				$split = ', '; 
			}
			?>
		<?php } ?>
		<?php //<a href="#">查看评论</a>?>
		<?php if($displaySummary) { ?>
		<a href="<?php echo url::site('article/view/' . $article->id);?>">更多</a>
		<?php } else { if(isset($article->refurl)) { ?>
		<a href="<?php echo $article->refurl;?>" target="_blank">原文</a>
		<?php } }?>
	</p>
</div>