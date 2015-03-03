<div class="post">
	<h2 class="title"><a href="<?php echo url::site('article/detail/' . $article->id);?>"><?php echo $article->title; ?></a></h2>
	<p class="meta"><?php echo date('Y-m-d H:i', $article->create_time); ?> 阅读次数：<?php echo $article->read_times; ?>
	</p>
	<div class="entry">
		<?php
		if($showContent) {
			echo $article->content;
		} else {
			echo $article->summary;
		}?>
	</div>
	<p class="meta">
		<?php if (!empty($article->tabs_detail)) { ?>
		标签：<?php
			$tabs = json_decode($article->tabs_detail);
			if (!empty($tabs)) {
				$split = '';
				foreach ($tabs as $tab) {
					echo $split; ?><a href="<?php echo URL::site("article/tab/{$tab->id}"); ?>"><?php echo $tab->tab; ?></a><?php 
					$split = ', ';
				}
			}
		} ?> 分类：<a href="<?php echo URL::site("article/category/{$article->category_id}"); ?>"><?php echo $article->category_name; ?></a>
	</p>
</div>