<h1><?php echo $pageTitle;?></h1>
<?php echo $this->validation->error_string; ?>
<?php 
echo form_open('user/edit');

echo form_label('妮称','nickname');
$edata = array('name' => 'nickname', 'id' => 'nickname', 'size' => '25', 'value' => $my->nickname);
echo form_input($edata);

echo form_hidden("flag", "do");

echo form_submit('submit','submit');
echo form_close();

?>