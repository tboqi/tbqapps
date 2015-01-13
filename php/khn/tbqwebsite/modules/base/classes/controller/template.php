<?php defined('SYSPATH') or die('No direct script access.');

abstract class Controller_Template extends Controller {
	
	/**
	 * @var  View  page template
	 */
	public $template = 'template';
	
	/**
	 * @var  boolean  auto render template
	 **/
	public $auto_render = TRUE;
	
	private $auth_config;
	private $title;
	protected $sub_title;
	protected $keywords;
	protected $description;
	private $js_array = array('jquery.js');
	
	public function before() {
		parent::before();

		if ($this->auto_render === TRUE)
		{
			// Load the template
			$this->template = Helper_View::create_view($this->template);
			$this->template->controller = $this->request->controller();
			$this->template->action = $this->request->action();
		}
		
		$this->auth_config = Kohana::$config->load('auth');
		Cookie::$salt = 'blog';
		$this->auto_login();

		$model_website = new Model_Website();
		$this->website_baseinfo = $model_website->get_new();
		$this->title = $this->get_title();
	}
	private $website_baseinfo;
	private function get_title() {
		//return Kohana::$config->load('site.web_title');
		return $this->website_baseinfo->title;
	}
	/**
	 * ① 得到用户名、用户密码(加密后)、cookie有效时间(配置文件auth中的lifetime)
	 * ② 自定义的一个webKey(配置文件auth中的hash_key)
	 * ③ 将上两步得到的四个值得新连接成一个新的字符串，再进行MD5加密，
	 * 这样就得到了一个MD5明文字符串
	 * ④ 将用户名、cookie有效时间、MD5明文字符串使用“：”间隔连接起来，
	 * 再对这个连接后的新字符串进行Base64编码
	 * ⑤ 设置一个cookieName,将cookieName和上一步产生的Base64编码写入到客户端。
	 * 
	 * 
	 */
	protected function remember_login($username, $password) {
		$password_hash = Auth::instance()->hash($password);
		$cookie_lifetime = $this->auth_config['lifetime'];
		$webkey = $this->auth_config['hash_key'];
		$md5str = md5("{$username}{$password_hash}{$cookie_lifetime}{$webkey}");
		$base64str = base64_encode("{$username}:{$cookie_lifetime}:{$md5str}");
		$cookie_name = $this->auth_config['session_key'];
		Cookie::set($cookie_name, $base64str, $cookie_lifetime);
	}
	
	/**
	 * ① 根据设置的cookieName，得到cookieValue，如果值为空，就不帮用户进行自动登陆；
	 * 否则执行读取方法
	 * ② 将cookieValue进行Base64解码，将取得的字符串以split(“:”)进行拆分，
	 * 得到一个String数组cookieValues（此操作与保存阶段的第4步正好相反），
	 * 这一步将得到三个值：
	 *   cookieValues[0] ---- 用户名
	 *   cookieValues[1] ---- cookie有效时间
	 *   cookieValues[2] ---- MD5明文字符串
	 * ③ 判断cookieValues的长度是否为3，如果不为3则进行错误处理。
	 * ④ 如果长度等于3，取出第二个,即cookieValues[1]，此时将会得到有效时间（long型），
	 * 将有效时间与服务器系统当前时间比较，如果小于当前时间，则说明cookie过期，进行错误处理。
	 * /////这一步没有做
	 * ⑤ 如果cookie没有过期，就取cookieValues[0]，这样就可以得到用户名了，
	 * 然后去数据库按用户名查找用户。
	 * ⑥ 如果上一步返回为空，进行错误处理。
	 * 如果不为空，那么将会得到一个已经封装好用户信息的User实例对象user
	 * ⑦ 取出实例对象user的用户名、密码、cookie有效时间（即cookieValues[1]）、webKey，
	 * 然后将四个值连接起来，然后进行MD5加密，
	 * 这样做也会得到一个MD5明文字符串（此操作与保存阶段的第3步类似）
	 * ⑧ 将上一步得到MD5明文与cookieValues[2]进行equals比较，
	 * 如果是false，进行错误处理；
	 * 如果是true，则将user对象添加到session中，帮助用户完成自动登陆
	 * 
	 * 
	 */
	protected function auto_login() {
		$cookie_name = $this->auth_config['session_key'];
		$base64str = Cookie::get($cookie_name);
		if (empty($base64str)) {
			return false;
		}
		$str = base64_decode($base64str);
		$arr = explode(':', $str);
		if (count($arr) != 3) {
			return false;
		}
		$username = $arr[0];
		$lifetime = $arr[1];
		$res = false;
		if (isset($this->auth_config['users'][$username])) {
			$password_hash = $this->auth_config['users'][$username];
			$webkey = $this->auth_config['hash_key'];
			$md5str = md5("{$username}{$password_hash}{$lifetime}{$webkey}");
			if ($md5str == $arr[2]) {
				$res = Auth::instance()->force_login($username);
			}
		}
		return $res;
	}

	protected function auth_destroy() {
		$cookie_name = $this->auth_config['session_key'];
		Cookie::delete($cookie_name);
	}

	protected function set_js_array($js) {
		$this->js_array[] = $js;
	}
	
	function after() {
		if ($this->auto_render === TRUE)
		{
			$this->template->title = $this->sub_title . ' - ' . $this->title;
			$this->template->keywords = empty($this->keywords) ? $this->website_baseinfo->keywords : $this->keywords;
			$this->template->description = empty($this->description) ? $this->website_baseinfo->description : $this->description;
			$this->template->js_array = $this->js_array;
			$this->response->body($this->template->render());
		}

		parent::after();
	}
}
