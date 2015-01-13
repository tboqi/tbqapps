<?php if (isset($links) && is_array($links) && count($links) > 0) { ?>
<div class="left_menu_title">链接</div>
<?php foreach ($links as $link) { ?>
<a href="<?php echo $link->url; ?>" title="<?php echo $link->description; ?>" target="_blank"><?php echo $link->name; ?></a>
<?php } ?>
<?php } ?>