<?php
$this->breadcrumbs=array(
	'Users'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List users', 'url'=>array('index')),
	array('label'=>'Create users', 'url'=>array('create')),
	array('label'=>'Update users', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete users', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage users', 'url'=>array('admin')),
);
?>

<h1>View users #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'username',
		'password',
		'email',
	),
)); ?>
