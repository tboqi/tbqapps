<?php
class Block_Product_Category {
	
	static function category_list() {
		$model_product_category = new Model_Product_Category();
		$view = Helper_View::create_view('blocks/product/category_list');
		$view->category_list = $model_product_category->find_all('id,name');
		echo $view->render();
	}
} 