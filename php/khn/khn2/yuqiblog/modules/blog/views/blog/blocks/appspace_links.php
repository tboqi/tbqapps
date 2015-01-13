<?php if (isset($links) && is_array($links) && count($links) > 0) { ?>
<div id="tags">
<?php foreach ($links as $link) { ?>
<p><a href="<?php echo $link->url; ?>" title="<?php echo $link->description; ?>" target="_blank"><?php echo $link->name; ?></a></p>
<?php } ?>
</div>
<?php } ?>