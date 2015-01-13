<table>
	<tr>
		<td><h1><?php echo $pageTitle; ?></h1></td>
	</tr>
	<tr>
		<td><?php $datestring = "Y年m月d日";
		echo date($datestring, $article->create_time); ?></td>
	</tr>
	<tr>
		<td><a href="<?php echo url::site("article/findByCategory/{$article->category_id}"); ?>"><?php echo $article->category_name; ?></a></td>
	</tr>
	<tr>
		<td><?php echo $article->content; ?></td>
	</tr>
</table>