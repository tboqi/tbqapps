<?php if ($downloads) { ?>
<table>
  <tr>
    <th>标题</th>
  </tr>
  
  <?php foreach ($downloads as $down) { ?>
  <tr>
    <td>
    	<a target="_blank" href="<?php echo url::site("download/detail/" . $down->id ); ?>"><?php echo $down->title; ?></a>
    	<?php if($down->user_id == $this->session->get('userid')) { ?>
    	<a href="<?php echo url::site("download/edit/{$down->id}") ?>">编辑</a>
    	<a href="<?php echo url::site("download/delete/{$down->id}") ?>">删除</a>
    	<?php } ?>
    </td>
  </tr>
 	<?php } ?>
	<tr><td><?php echo $this->pagination->create_links(); ?></td></tr>
</table>
<?php } else {
	echo "没有结果";
}?>