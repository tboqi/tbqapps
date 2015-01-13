<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class url extends url_Core {
	
	public static function site_index($uri = '', $protocol = FALSE) {
		$uri = parent::site ( $uri, $protocol );
		if (strpos ( $uri, 'space.php' )) {
			$uri = str_replace ( 'space.php', 'index.php', $uri );
		} elseif (strpos ( $uri, 'admin.php' )) {
			$uri = str_replace ( 'admin.php', 'index.php', $uri );
		}
		return $uri;
	}
	
	public static function site_admin($uri = '', $protocol = FALSE) {
		$uri = parent::site ( $uri, $protocol );
		if (strpos ( $uri, 'space.php' )) {
			$uri = str_replace ( 'space.php', 'admin.php', $uri );
		} elseif (strpos ( $uri, 'index.php' )) {
			$uri = str_replace ( 'index.php', 'admin.php', $uri );
		}
		return $uri;
	}
	
	public static function site_space($uri = '', $protocol = FALSE) {
		$uri = parent::site ( $uri, $protocol );
		if (strpos ( $uri, 'index.php' )) {
			$uri = str_replace ( 'index.php', 'space.php', $uri );
		} elseif (strpos ( $uri, 'admin.php' )) {
			$uri = str_replace ( 'admin.php', 'space.php', $uri );
		}
		return $uri;
	}
	
	public static function site_userid($uri = '', $protocol = FALSE) {
		$uri = parent::site ( $uri, $protocol );
		if (empty ( $_GET ['user_id'] )) {
			return $uri;
		} else {
			return $uri . '?user_id=' . $_GET ['user_id'];
		}
	}
	/**
	 * 获得space下对应的theme的css, img, js资源
	 *
	 * @param string $theme
	 * @param string $css
	 * @return string
	 */
	public static function space_source($theme, $source) {
		return url::base () . 'appspace/views/' . $theme . '/' . $source;
	}
	
	/**
	 * Sends a page redirect header and runs the system.redirect Event.
	 *
	 * @param  mixed   string site URI or URL to redirect to, or array of strings if method is 300
	 * @param  string  HTTP method of redirect
	 * @return void
	 */
	public static function redirect_index($uri = '', $method = '302') {
		if (Event::has_run ( 'system.send_headers' )) {
			return FALSE;
		}
		
		$codes = array ('refresh' => 'Refresh', '300' => 'Multiple Choices', '301' => 'Moved Permanently', '302' => 'Found', '303' => 'See Other', '304' => 'Not Modified', '305' => 'Use Proxy', '307' => 'Temporary Redirect' );
		
		// Validate the method and default to 302
		$method = isset ( $codes [$method] ) ? ( string ) $method : '302';
		
		if ($method === '300') {
			$uri = ( array ) $uri;
			
			$output = '<ul>';
			foreach ( $uri as $link ) {
				$output .= '<li>' . html::anchor ( $link ) . '</li>';
			}
			$output .= '</ul>';
			
			// The first URI will be used for the Location header
			$uri = $uri [0];
		} else {
			$output = '<p>' . html::anchor ( $uri ) . '</p>';
		}
		
		// Run the redirect event
		Event::run ( 'system.redirect', $uri );
		
		if (strpos ( $uri, '://' ) === FALSE) {
			// HTTP headers expect absolute URLs
			$uri = url::site_index ( $uri, request::protocol () );
		}
		
		if ($method === 'refresh') {
			header ( 'Refresh: 0; url=' . $uri );
		} else {
			header ( 'HTTP/1.1 ' . $method . ' ' . $codes [$method] );
			header ( 'Location: ' . $uri );
		}
		
		// We are about to exit, so run the send_headers event
		Event::run ( 'system.send_headers' );
		
		exit ( '<h1>' . $method . ' - ' . $codes [$method] . '</h1>' . $output );
	}
	
	public static function redirect_admin($uri = '', $method = '302') {
		if (Event::has_run ( 'system.send_headers' )) {
			return FALSE;
		}
		
		$codes = array ('refresh' => 'Refresh', '300' => 'Multiple Choices', '301' => 'Moved Permanently', '302' => 'Found', '303' => 'See Other', '304' => 'Not Modified', '305' => 'Use Proxy', '307' => 'Temporary Redirect' );
		
		// Validate the method and default to 302
		$method = isset ( $codes [$method] ) ? ( string ) $method : '302';
		
		if ($method === '300') {
			$uri = ( array ) $uri;
			
			$output = '<ul>';
			foreach ( $uri as $link ) {
				$output .= '<li>' . html::anchor ( $link ) . '</li>';
			}
			$output .= '</ul>';
			
			// The first URI will be used for the Location header
			$uri = $uri [0];
		} else {
			$output = '<p>' . html::anchor ( $uri ) . '</p>';
		}
		
		// Run the redirect event
		Event::run ( 'system.redirect', $uri );
		
		if (strpos ( $uri, '://' ) === FALSE) {
			// HTTP headers expect absolute URLs
			$uri = url::site_admin ( $uri, request::protocol () );
		}
		
		if ($method === 'refresh') {
			header ( 'Refresh: 0; url=' . $uri );
		} else {
			header ( 'HTTP/1.1 ' . $method . ' ' . $codes [$method] );
			header ( 'Location: ' . $uri );
		}
		
		// We are about to exit, so run the send_headers event
		Event::run ( 'system.send_headers' );
		
		exit ( '<h1>' . $method . ' - ' . $codes [$method] . '</h1>' . $output );
	}
}
 
