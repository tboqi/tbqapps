<?php
class Controller_Product extends Controller_Template {
	function action_index() {
		$limit = 20;
		
		$product_model = new Model_Product();
		// 分页
		$pagination = Pagination::factory ( array (
				'total_items' => $product_model->count (),
				'items_per_page' => $limit,
				'view' => 'pagination/admin' 
		) );
		$pagination->route_params(array('controller' => $this->request->controller(),
				'action' => $this->request->action()));
		
		$this->sub_title = '产品管理';
		$content = Helper_View::create_view('product/list');
		$start = $pagination->offset;
		$content->products = $product_model->find ( $limit, $start);
		$content->pagination = $pagination;
		$this->template->content = $content;
	}
	
	function action_create() {
		$this->sub_title = '新产品';
		$category_model = new Model_Product_Category();
		$content = Helper_View::create_view('product/create');
		$content->categories = $category_model->find_all();
		$this->template->content = $content;
	}
	
	function action_save() {
		$product = array ();
		$product['title'] = trim($_POST['title']);
		$product['desc'] = trim($_POST['desc']);
		
		$filename = md5(mt_rand() . time()) . '.jpg';
		Upload::save($_FILES['file'], $filename);
	
		$product ['create_time'] = time ();
		$product ['update_time'] = time ();
		$product ['category_id'] = intval($_POST['category_id']);
		$model_product_category = new Model_Product_Category();
		$category = $model_product_category->get($product ['category_id'], 'name');
		$product ['category_name'] = $category->name;
		$product['img'] = $filename;
	
		$model_product = new Model_Product();
		$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
		$tabs_detail = array();
		if ($id < 1) {
			$id = $model_product->insert($product);
		} else {
			$model_product->update($product, $id);
		}
	
		header("location:" . URL::site('product/index'));exit;
	}
	
	function action_del() {
		$this->auto_render = FALSE;
		if( Auth::instance ()->logged_in()) {
			$model_product = new Model_Product();
			$id = intval($this->request->param('param1'));
			$model_product->del($id);
		} else {
			echo '没有权限';
		}
		
// 		header("location:" . URL::site('product/index'));exit;
	}
	
	function action_edit() {
		
		$content = '此功能没有完成';
		
		//验证是否登录状态
// 		if(Auth::instance ()->logged_in()) {
// 			$content = Helper_View::create_view('product/product_form');
// 			$content->title = '编辑产品';
// 			$model_product_category = new Model_Product_Category();
// 			$content->categories = $model_product_category->find_all('id,name');
// 			$id = intval($this->request->param('param1'));
// 			$model_product = new Model_Product();
// 			$content->product = $model_product->get($id);
// 		} else {
// 			$content = '没有权限';
// 		}
		
		$this->template->content = $content;
		$this->sub_title = "编辑产品";
	}
}