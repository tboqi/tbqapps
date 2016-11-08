<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Article extends Controller_Template
{

    public function action_index()
    {
        $article_model = new Model_Article();

        $limit = 10;

        //分页
        $pagination = Pagination::factory(array(
            'total_items' => $article_model->count(),
            'items_per_page' => $limit,
        )
        );

        $pagination->route_params(array('controller' => $this->request->controller(),
            'action' => $this->request->action()));

        $start = $pagination->offset;
        $content = View::factory('article/articles');
        $content->articles = $article_model->find($limit, $start);
        $content->pagination = $pagination;

        $this->template->content = $content;

        $this->sub_title = '文章列表';
    }

    public function action_category()
    {
        $article_model = new Model_Article();

        $category_id = intval($this->request->param('param1'));

        $limit = 10;

        //分页
        $pagination = Pagination::factory(array(
            'total_items' => $article_model->count_by_category_id($category_id),
            'items_per_page' => $limit,
        )
        );
        $pagination->route_params(array('controller' => $this->request->controller(),
            'action' => $this->request->action(),
            'param1' => $category_id,
        )
        );
        $start = $pagination->offset;
        $content = View::factory('article/articles');
        $content->articles = $article_model->find_by_category_id($category_id,
            $limit, $start);

        $content->pagination = $pagination;

        $this->template->content = $content;

        $model_category = new Model_Article_Category();
        $category = $model_category->get($category_id);
        $this->sub_title = "分类 {$category->name} 下的文章列表";
        $this->keywords = $this->description = $category->name;
    }

    public function action_tab()
    {
        $article_model = new Model_Article();

        $tab_id = intval($this->request->param('param1'));

        $limit = 10;

        //分页
        $pagination = Pagination::factory(array(
            'total_items' => $article_model->count_by_tab_id($tab_id),
            'items_per_page' => $limit,
        )
        );
        $pagination->route_params(array('controller' => $this->request->controller(),
            'action' => $this->request->action(),
            'param1' => $tab_id,
        )
        );
        $start = $pagination->offset;
        $content = View::factory('article/articles');
        $content->articles = $article_model->find_by_tab_id($tab_id,
            $limit, $start);

        $content->pagination = $pagination;

        $this->template->content = $content;

        $model_tab = new Model_Article_Tab();
        $tab = $model_tab->get($tab_id);
        $this->sub_title = "标签 {$tab->tab} 下的文章列表";
        $this->keywords = $this->description = $tab->tab;
    }

    public function action_create()
    {
        $content = '';

        //验证是否登录状态
        if ($user = Auth::instance()->logged_in()) {
            $content = View::factory('article/article_form');
            $content->title = '添加文章';
            $model_article_category = new Model_Article_Category();
            $content->categories = $model_article_category->find_all();
        } else {
            $content = '没有权限';
        }

        $this->template->content = $content;
        $this->sub_title = "创建文章";
        $this->set_js_array('fck/fckeditor.js');
        $this->set_js_array('jquery.form.js');
        $this->set_js_array('yuqi_utils.js');
        $this->template->js = '
window.onload = function()
{
var fck1 = new FCKeditor(\'content\');
fck1.Width = 560;
fck1.Height = 400;
fck1.BasePath = "' . Resource::js('fck/') . '";
fck1.ReplaceTextarea() ;
}';
    }

    public function action_edit()
    {
        $content = '';

        //验证是否登录状态
        if (Auth::instance()->logged_in()) {
            $content = View::factory('article/article_form');
            $content->title = '编辑文章';
            $model_article_category = new Model_Article_Category();
            $content->categories = $model_article_category->find_all();
            $id = intval($this->request->param('param1'));
            $model_article = new Model_Article();
            $content->article = $model_article->get($id);
        } else {
            $content = '没有权限';
        }

        $this->template->content = $content;
        $this->sub_title = "编辑文章";
        $this->set_js_array('fck/fckeditor.js');
        $this->set_js_array('jquery.form.js');
        $this->set_js_array('yuqi_utils.js');
        $this->template->js = '
window.onload = function()
{
var fck1 = new FCKeditor(\'content\');
fck1.Width = 560;
fck1.Height = 400;
fck1.BasePath = "' . Resource::js('fck/') . '";
fck1.ReplaceTextarea() ;
}';
    }

    public function action_save()
    {
        $article = array();
        $article['title'] = trim($_POST['title']);
        $article['content'] = trim($_POST['content']);
        $article['summary'] = trim($_POST['summary']);
        $article['refurl'] = trim($_POST['refurl']);
        if (empty($article['refurl'])) {
            $article['ref'] = 0;
        } else {
            $article['ref'] = 1;
        }

        $article['create_time'] = time();
        $article['update_time'] = time();
        $article['category_id'] = intval($_POST['category_id']);
        $model_article_category = new Model_Article_Category();
//         $category = $model_article_category->get($article ['category_id']);

        $tabs = trim($_POST['tabs']);
        $tabs = explode(',', $tabs);

        $model_article = new Model_Article();
        $model_article_tab = new Model_Article_Tab();
        $id = intval($_POST['id']);
        $tabs_detail = array();
        foreach ($tabs as $tab) {
            $tab_id = $model_article_tab->get_tab_id($tab);
            $tabs_detail[] = array('id' => $tab_id, 'tab' => $tab);
        }
        if (count($tabs_detail) > 0) {
            $article['tabs_detail'] = json_encode($tabs_detail);
        } else {
            $article['tabs_detail'] = '';
        }
        if ($id < 1) {
            $id = $model_article->insert($article);
        } else {
            $model_article->update($article, $id);
        }
        $model_article->update_article_tab_link($tabs_detail, $id);

        header("location:" . URL::site('article/index'));exit;
    }

    public function action_detail()
    {
        $model_article = new Model_Article();
        $id = intval($this->request->param('param1'));
        //阅读次数
        $model_article->add_read_times($id);

        $content = View::factory('article/detail');
        $content->article = $model_article->get($id);
        $this->template->content = $content;
        $this->sub_title = $content->article->title;
        $this->keywords = $content->article->category_name;
        if (!empty($content->article->tabs_detail)) {
            $tabs = json_decode($content->article->tabs_detail);
            $split = ',';
            foreach ($tabs as $tab) {
                $this->keywords .= $split . $tab->tab;
            }
        }
        $this->description = $content->article->summary;
    }

    public function action_del()
    {
        if (Auth::instance()->logged_in()) {
            $model_article = new Model_Article();
            $id = intval($this->request->param('param1'));
            $model_article->del($id);
        } else {
            echo '没有权限';
        }

        header("location:" . URL::site('article/index'));exit;
    }

} // End Article
