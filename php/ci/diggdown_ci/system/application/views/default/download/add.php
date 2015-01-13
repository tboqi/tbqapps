<script type="text/javascript">
window.onload = function()
{
var fck = new FCKeditor('down[description]');
fck.Width = "80%";
fck.Height = 300;
fck.BasePath = "<?php echo base_url(); ?>fck/";
fck.ReplaceTextarea() ;
}
</script>
<h1><?php echo $pageTitle; ?></h1>
<?php 
$hidden = array('down[id]' => isset($download) ? $download->id : 0);
echo form_open('download/doSave', '', $hidden);

echo form_label('标题','title');
$edata = array('name' => 'down[title]', 'id' => 'title', 'size' => '25', 'value' => isset($download) ? $download->title : "");
echo form_input($edata);

echo form_label("分类");
$edata = array('name' => 'down[category_id]', 'id' => 'category_id');
echo form_dropdown("down[category_id]", $options, isset($download) ? $download->categoryID : 0);

echo form_label("下载地址");
$edata = array('name' => 'down[link]', 'id' => 'link', 'value' => isset($download) ? $download->link : "");
echo form_input($edata);

echo form_label("描述");
$edata = array('name' => 'down[description]', 'id' => 'description', 'value' => isset($download) ? $download->description : "");
echo form_textarea($edata);

echo form_label("关键字(多个关键字请用“|”分开)");
$edata = array('name' => 'keywords', 'id' => 'keywords');
if(isset($download) && isset($download->keyword)) {
	$edata['value'] = $download->keyword;
}
echo form_input($edata);

echo form_submit('submit','保存');
echo form_close();
?>