<?php foreach ($downloads as $down) {
	?>
	<a href="<?php echo site_url("download/detail/" . $down->id ); ?>"><?php echo $down->title; ?></a>
	<?php
}
?>