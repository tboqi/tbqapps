<?php foreach ($articles as $article): ?>
<?php Block_Article::article($article); ?>
<?php endforeach ?>
<?php echo $pagination; ?>
