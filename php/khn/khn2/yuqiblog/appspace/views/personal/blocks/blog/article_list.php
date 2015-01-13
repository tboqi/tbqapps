<?php if (isset ( $articles ) && is_array ( $articles ) && count ( $articles ) >= 1) { ?>
<?php foreach ( $articles as $article ) { ?>
<h2><?php echo $article->title; ?></h2>  	 	
<?php echo article::summary ( $article->content ); ?>
<div class="box">
	<a href="<?php echo url::site_userid ( 'article/read/' . $article->id ); ?>">阅读全文</a> 
	| <a href="#"><?php echo intval ( $article->comments ); ?> 评论</a> 
	| 作者 <a href="<?php echo url::site ( '?user_id=' . $article->user_id ); ?>"><?php echo $article->nickname; ?></a>
	<?php if ($this->logged_user) { ?>
	| <a href="<?php echo url::site('article/edit/' . $article->id); ?>">编辑</a>
	| <a href="<?php echo url::site('article/delete/' . $article->id); ?>">删除</a>
	<?php } ?>
</div>
<br />
<br />
<?php } ?>
<?php
	echo $pagination;
} else {
	echo '没有文章';
}
?>