<?php if ($downloads) { ?>
<table>
  <tr>
    <th>标题</th>
  </tr>
  
  <?php foreach ($downloads as $down) { ?>
  <tr>
    <td>
    	<a target="_blank" href="<?php echo site_url("download/detail/" . $down->id ); ?>"><?php echo $down->title; ?></a>
    	<?php if($down->user_id == $this->session->userdata('userid')) { ?>
    	<a href="<?php echo site_url("download/edit/{$down->id}") ?>">编辑</a>
    	<a href="<?php echo site_url("download/delete/{$down->id}") ?>">删除</a>
    	<?php } ?>
    </td>
  </tr>
 	<?php } ?>
	<tr><td><?php echo $this->pagination->create_links(); ?></td></tr>
</table>
<?php } else {
	echo "没有结果";
}?>