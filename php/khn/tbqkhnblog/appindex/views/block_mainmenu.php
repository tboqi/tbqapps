<div align="center">
    <a href="<?php echo url::site(); ?>">首页</a> 
    <?php if (isset($categories) && is_array($categories) && count($categories) > 0) {?>
    <?php foreach ($categories as $cate) { ?>
    | <a href="<?php echo url::site('article/category/' . $cate->id); ?>"><?php echo $cate->name; ?></a>
    <?php } ?>
    <?php } ?>
</div>