<?php 
$colors = array('FF7600', 'ffffff', '039FAF', 'DE2159'); 
$font_size = array(12, 14, 16 ,18, 20);
?>
<div style="_height:px; width:px;font-family:Arial; border: 1px solid #FFFFFF; text-align:left;">
<div style="padding:2px;">
	<?php if (isset($tabs) && is_array($tabs) && count($tabs) > 0) { ?>
	<?php foreach ($tabs as $tab ) {?>
    <a href="<?php echo url::site('article/tab/' . $tab->id);?>" style="font-size:<?php echo $font_size[array_rand($font_size)]; ?>px;text-decoration:none; color: #<?php echo $colors[array_rand($colors)]; ?>;"><?php echo $tab->tab; ?></a>
    <?php } ?>
	<?php } ?>
</div>
</div>