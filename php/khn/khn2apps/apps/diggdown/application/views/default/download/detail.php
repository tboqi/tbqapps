<table>
	<tr>
		<td><h1><?php echo $pageTitle; ?></h1></td>
	</tr>
	<tr>
		<td><?php $datestring = "%Y-%m-%d %h:%i";
		echo mdate($datestring, $download->create_time); ?></td>
	</tr>
	<tr>
		<td><a href="<?php echo url::site("download/downloadsOfCategory/{$download->categoryID}"); ?>"><?php echo $download->categoryName; ?></a></td>
	</tr>
	<?php if($download->keywords && is_array($download->keywords)) { ?>
	<tr>
		<td>
			<?php foreach ($download->keywords as $keyword) { ?>
			<a href="<?php echo url::site("download/downloadsOfkeyword/{$keyword->id}"); ?>"><?php echo $keyword->keyword; ?></a>
			<?php } ?>
		</td>
	</tr>
	<?php } ?>
	<tr>
		<td><?php echo $download->nickname; ?></td>
	</tr>
	<tr>
		<td><?php echo $download->description; ?></td>
	</tr>
	<tr>
		<td>
			<a href="<?php echo $download->link; ?>" target="_blank">下载</a>
			<?php if($download->user_id == $this->session->userdata('userid')) { ?>
    	<a href="<?php echo url::site("download/edit/{$download->id}") ?>">编辑</a>
    	<a href="<?php echo url::site("download/delete/{$download->id}") ?>">删除</a>
    	<?php } ?>
		</td>
	</tr>
</table>