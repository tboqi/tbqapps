<?php foreach ($downloads as $down) {
	?>
	<a href="<?php echo url::site("download/detail/" . $down->id ); ?>"><?php echo $down->title; ?></a>
	<?php
}
?>