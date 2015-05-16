<?php foreach ($articles as $article): ?>
<?php block_Article::article($article); ?>
<?php endforeach ?>
<?php echo $pagination; ?>