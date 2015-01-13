<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title><?php echo $pageTitle;?>::<?php echo $globalTitle;?>----<?php echo $slogan;?></title>
<script type="text/javascript" src="<?php echo url::base(); ?>js/jquery-1.2.3.pack.js"></script>
<script type="text/javascript" src="<?php echo url::base(); ?>js/jquery.form.js"></script>
<script type="text/javascript" src="<?php echo url::base(); ?>fck/fckeditor.js"></script>
<style>label { display:block;}</style>
</head>
<body>
<?php /* header start */ ?>
<table border='1' width="100%" height="80"><tr>
<td><a href="<?php echo url::site(); ?>">首页</a></td>
<?php
if ($categoriesWithMostDownloads) {
	foreach ($categoriesWithMostDownloads as $category) {
		?><td><a href="<?php echo url::site("download/downloadsOfCategory/" . $category->id); ?>"><?php echo $category->name;?></a>(<?php echo intval($category->catenum);?>)</td><?php
	}
}
?>
<td><a href="<?php echo url::site("category/all"); ?>">所有分类</a></td></tr></table>
<?php /* header end */ ?>

<?php /* +++++++++这里是主要内容 */ ?>
<table width="100%">
	<tr>
		<td width="200">
			<table width="200">
				<tr>
					<td><form method="post" action="<?php echo url::site("search/index"); ?>">
					搜索：<input type="text" name="key" id="key" value="<?php echo $this->input->request("key"); ?>" />
					<input type="submit" />
					</form></td>
				</tr>
			</table>
			<table border='1' width="100%">
				<tr><td id="userLogin">
				<?php if ($this->session->get('userid') > 0) {
					echo new View($themes . "/user/userMenu");
				} else {
					echo new View($themes . "/user/login");
				}
				?>
				</td></tr>
			</table>
			<?php if ($keywordsWithMostDownloads ) { ?>
			<table border='1' width="100%">
				<tr><td>
				<?php
				foreach ($keywordsWithMostDownloads as $keyword) {
					?>
					<a href="<?php echo url::site("download/downloadsOfkeyword/{$keyword->keyword_id}") ?>"><?php echo $keyword->keyword; ?></a> 
					<?php
				}
				?>
				</td></tr>
			</table>
			<?php } ?>
		</td>
		<td><?php echo $include;?></td>
	</tr>
</table>
<?php /* +++++++++这里是主要内容 */ ?>

<table border='1' width="100%" height="80"><tr><td>---------footer</td></tr></table>
</body>
</html>