<table border="1">
	<thead><tr><th>最新下载列表</th></tr></thead>
	<tbody>
	<?php 
	if($newestDownloads && is_array($newestDownloads) && count($newestDownloads) > 0) {
	foreach ($newestDownloads as $download) {
		?>
		<tr><td><a target="_blank" href="<?php echo url::site("download/detail/" . $download->id ); ?>"><?php echo $download->title; ?></a></td></tr>
		<?php
	}
	}
	?>
	</tbody>
</table>
<table border="1">
	<thead><tr><th>最热门下载</th></tr></thead>
	<?php foreach ($hostestDownloads as $download) {
		?>
		<tr><td><a target="_blank" href="<?php echo url::site("download/detail/" . $download->id ); ?>"><?php echo $download->title; ?></a></td></tr>
		<?php
	}
	?>
</table>