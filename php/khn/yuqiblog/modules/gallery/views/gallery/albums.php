<h3>我的相册</h3>
<table width="400" border="1" cellspacing="0" cellpadding="0">
	<?php 
	if (isset($albums) && is_array($albums) && count($albums) > 0) { 
		foreach ($albums as $k => $album) {
			if ($k % 4 == 0) {
				echo $k == 0 ? '<tr>' : '</tr><tr>';
			}
			?>
			<td><a href="<?php echo url::site('photo/album/' . $album->id); ?>"><?php echo $album->name; ?></a>(20)</td>
			<?php
		}
	} else {
		?>
		<tr><td>还没有相册</td>
		<?php 
	}
	?>
  </tr>
</table>