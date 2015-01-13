<?php if ($articles) { ?>
<table>
  <tr>
    <th colspan="2">标题</th>
  </tr>
  <?php foreach ($articles as $article) { ?>
  <tr>
    <td>
    	<a target="_blank" href="<?php echo url::site("article/detail/" . $article->id ); ?>">
    	<?php echo $article->title; ?></a>
    </td>
    <td>
    	<a target="_blank" 
    	href="<?php echo url::site("articles/findByCategory/" . $article->category_id ); ?>">
    	<?php echo $article->category_name; ?></a>
    </td>
  </tr>
 	<?php } ?>
 	<tr><td><?php echo $this->pagination; ?></td></tr>
	<tr><td colspan="2"><?php echo $this->pagination->create_links(); ?></td></tr>
</table>
<?php } else {
	echo "没有结果";
}?>