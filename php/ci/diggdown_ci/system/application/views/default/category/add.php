<h1><?php echo $pageTitle; ?></h1>
<?php
echo $this->validation->error_string;
?>
<?php 
echo form_open('category/doSave');

echo form_label('分类','name');
$edata = array('name' => 'name', 'id' => 'name', 'size' => '25');
echo form_input($edata);

echo form_submit('submit','保存');
echo form_close();
?>