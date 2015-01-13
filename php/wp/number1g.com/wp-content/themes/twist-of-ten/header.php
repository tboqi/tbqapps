<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<title><?php
	/*
	 * Print the <title> tag based on what is being viewed.
	 * We filter the output of wp_title() a bit -- see
	 * twentyten_filter_wp_title() in functions.php.
	 */
	wp_title( '|', true, 'right' );

	?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<?php
	/* We add some JavaScript to pages with the comment form
	 * to support sites with threaded comments (when in use).
	 */
	if ( is_singular() && get_option( 'thread_comments' ) )
		wp_enqueue_script( 'comment-reply' );

	/* Always have wp_head() just before the closing </head>
	 * tag of your theme, or you will break many plugins, which
	 * generally use this hook to add elements to <head> such
	 * as styles, scripts, and meta tags.
	 */
	wp_head();
?>
</head>

<body <?php body_class(); ?>>
<div id="wrapper" class="hfeed">
	<div id="header">
	<?php if ( has_nav_menu( 'top-right' ) ) { wp_nav_menu( array( 'menu_id' => 'menu-pc_topright', 'container_class' => 'menu-pc_topright-container', 'theme_location' => 'top-right' ) ); } // show top right menu if specific menu assigned (i.e. don't show default ?>
		<?php  // show menu that has been selected in the Top Right Menu location ?>
		<div id="rss-subscribe"><a href="<?php bloginfo('rss2_url'); ?>" title="Subscribe"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/rss-small.png"></a></div>
		<div id="masthead">
			<div id="branding" role="banner">
				<?php $heading_tag = ( is_home() || is_front_page() ) ? 'h1' : 'div'; ?>
				<<?php echo $heading_tag; ?> id="site-title">
					<span>
						<a href="<?php echo home_url( '/' ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a>
					</span>
					<div id="site-description"><?php bloginfo( 'description' ); ?></div>
				</<?php echo $heading_tag; ?>>

<?php
	$tmp = get_option('tot_options');

	if (isset($tmp['chk_header_banner'])) {
		if($tmp['chk_header_banner']=="1") { ?>
			<div id="header-ad"><a href="<?php bloginfo('url'); ?>" title="Header Advert"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/ads/header-ad.png"></a></div>
		<?php }	
	}
?>
				<?php // Check if this is a post/page, and if thumbnail, and if it's a big one!
					if ( is_singular() &&
							has_post_thumbnail( $post->ID ) &&
							( /* $src, $width, $height */ $image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'post-thumbnail' ) ) &&
							$image[1] >= HEADER_IMAGE_WIDTH ) :
						// Houston, we have a new header image!
						echo get_the_post_thumbnail( $post->ID, 'post-thumbnail' );
					else : ?>
						<img src="<?php header_image(); ?>" width="<?php echo HEADER_IMAGE_WIDTH; ?>" height="<?php echo HEADER_IMAGE_HEIGHT; ?>" alt="" />
					<?php endif; ?>
			</div><!-- #branding -->

			<div id="access" role="navigation">
			  <?php /*  Allow screen readers / text browsers to skip the navigation menu and get right to the good stuff */ ?>
				<div class="skip-link screen-reader-text"><a href="#content" title="<?php esc_attr_e( 'Skip to content', 'twentyten' ); ?>"><?php _e( 'Skip to content', 'twentyten' ); ?></a></div>
				<?php /* Our navigation menu.  If one isn't filled out, wp_nav_menu falls back to wp_page_menu.  The menu assiged to the primary position is the one used.  If none is assigned, the menu with the lowest ID is used.  */ ?>
				<?php wp_nav_menu( array( 'container_class' => 'menu-header', 'theme_location' => 'primary' ) ); ?>

				<?php
					$tmp = get_option('tot_options');

if (isset($tmp['rdo_search_box'])) {
					if($tmp['rdo_search_box']=="showheader") { ?>
						<div id="menu-bar-search">
							<form role="search" method="get" id="searchform" action="<?php bloginfo('url'); ?>/" >
								<table id="search-table">
									<tr>
										<td><label class="hidden" for="s"><?php __('Search for:'); ?></label></td>
										<td><input type="text" value="<?php esc_attr(apply_filters('the_search_query', get_search_query())); ?>" name="s" id="s" /></td>
										<td id="submit_btn"><input type="submit" id="searchsubmit" value="<?php echo esc_attr(__('Search')); ?>" /></td>
									</tr>
								</table>
							</form>
						</div><!-- #menu-bar-search -->
					<?php }
}
?>

			</div><!-- #access -->
		</div><!-- #masthead -->
	</div><!-- #header -->

	<div id="main">
