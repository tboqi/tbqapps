<?php
$this->breadcrumbs=array(
	'Users'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List users', 'url'=>array('index')),
	array('label'=>'Manage users', 'url'=>array('admin')),
);
?>

<h1>Create users</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>