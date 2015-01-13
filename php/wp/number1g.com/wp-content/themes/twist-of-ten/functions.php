<?php
/**
 *
 * Sets up the theme and provides some helper functions. Some helper functions
 * are used in the theme as custom template tags. Others are attached to action and
 * filter hooks in WordPress to change core functionality.
 *
 *
 * When using a child theme (see http://codex.wordpress.org/Theme_Development and
 * http://codex.wordpress.org/Child_Themes), you can override certain functions
 * (those wrapped in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before the parent
 * theme's file, so the child theme functions would be used.
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are instead attached
 * to a filter or action hook. The hook can be removed by using remove_action() or
 * remove_filter() and you can attach your own function to the hook.
 *
/*******************************************/
/* START - Twist of Ten Specific Functions */
/*******************************************/

// FYI: tot_ suffix is derived from [t]wist [o]f [t]en :-)

// ONLY run when theme activated
if ( is_admin() && isset($_GET['activated'] ) && $pagenow == "themes.php" ) {
  setup_default_options();
} 

/* Enable favicon */
function childtheme_favicon() { ?>
	<link rel="shortcut icon" href="<?php echo bloginfo('stylesheet_directory'); ?>/images/favicon.ico">
<?php }
add_action('wp_head', 'childtheme_favicon');

/* special version of n_word function to include condition rendering of 'Read More' button */
function n_words_rm($string, $num_words, $read_more, $id)
{
	if ($string==null) { $string = "Page content empty.."; }
	$array = explode(" ", $string);
	if (count($array) > $num_words)
	{
		array_splice($array, $num_words);
		$string = implode(" ", $array)." ...";
		$string = "<p id=\"p1\">".$string."</p>"; // add html tags around raw content
		if($read_more!=1) { // show read more button if excerpt word count is less than content
			$string .= "<p id=\"p2\"><a href=\"".get_page_link($id)."\"><img src=\"".get_bloginfo( 'stylesheet_directory' )."/images/read-more.png\" /></a></p>";
		}
	}
	if($read_more==1) { // always show read more button
		$string .= "<p id=\"p2\"><a href=\"".get_page_link($id)."\"><img src=\"".get_bloginfo( 'stylesheet_directory' )."/images/read-more.png\" /></a></p>";
	}
	return $string;
}

/* function to return 'n' number of words from a string */
function n_words($string, $num_words)
{
	$array = explode(" ", $string);
	if (count($array) > $num_words)
	{
		array_splice($array, $num_words);
		$string = implode(" ", $array)." ...";
	}
	return $string;
}

/* Setup default theme options */
function setup_default_options()
{
	// Define default option settings

	$args = array('parent' => 0, 'number' => 1);
	$pages = get_pages($args); // get first parent page to set drop down initial value

	$message = '<h3>Welcome To Our Site!</h3>
<div id="d1"><small>Try refreshing the home page to get a random featured post displayed! Also, every page refresh the three latest posts displayed below have a random rotating background color.</small></div>
<div id="d2">There are theme options in the admin control panel to: turn on/off the header banner and search box; control the featured page by specifying child pages to use; here are two different menu locations to customise; plus you can easily remove, or change, this message too!</div>';
	$tmp = get_option('tot_options');
    if(($tmp['chk_default_options_db']=='1')||(!is_array($tmp))) {
		delete_option('tot_options'); // so we don't have to reset all the 'off' checkboxes too! (don't think this is needed but leave for now)
		$arr = array("chk_header_banner" => "1", "rdo_search_box" => "showheader", "chk_show_thumb" => "1", "front_page_message" => $message, "rdo_featured_page" => "random_child", "rdo_read_more" => "always", "chk_default_options_db" => "", "chk_sidebar_banner" => "1", "chk_latest_posts" => "1", "drp_parent_page" => $pages[0]->ID);
		update_option('tot_options', $arr);
	}
}

// Init theme options to white list our options
function tot_init(){
	register_setting( 'tot_theme_options', 'tot_options', 'tot_validate_options' );
}
add_action('admin_init', 'tot_init' );

// Add menu page
function tot_add_options_page() {
		add_theme_page('Theme Options', 'Theme Options', 'manage_options', 'tot_admin_options_menu', 'tot_render_form');
}
add_action('admin_menu', 'tot_add_options_page');

// get featured image url (or default.jpg): $obj = $page object, $ind = page index
function tot_get_featured_image($obj, $ind) {
	if(count($obj) > 0) { // check we have a page to work with!
		$featured_image = wp_get_attachment_image_src(get_post_thumbnail_id($obj[$ind]->ID), 'full'); // try for url
		if($featured_image[0]==null) { // use default if not found
			// get default image if no page featured image specified
			$featured_image[0] = get_bloginfo('stylesheet_directory' )."/images/featured-images/default.jpg";
			return $featured_image[0];
		}
		else { // use featured image url
			return $featured_image[0];
		}
	}
	else { // no child pages so grab default.jpg
		$featured_image[0] = get_bloginfo('stylesheet_directory' )."/images/featured-images/default.jpg";
		return $featured_image[0];
	}
}

// Draw the menu page itself
function tot_render_form() {
	// show updated message when theme settings have been updated
	if (isset($_GET['updated'])) {
		if ( $_GET['updated'] ) echo '<div id="theme_options_updated" class="updated"><p>Twist of Ten theme options saved.</p></div>';
	}

    echo '<link rel="stylesheet" href="'.get_bloginfo('template_url').'/theme_options.css" type="text/css" media="all" />';

	?>
	<div class="wrap">
		<div class="icon32" id="icon-options-general"><br></div>
		<h2>Twist of Ten Options</h2>
		<p class="sub_header">Configure theme options below</p>
		<form method="post" action="options.php">
			<?php settings_fields('tot_theme_options'); ?>
			<?php $options = get_option('tot_options'); ?>
			<?php // global $options; ?>
			<table class="form-table">
				<tr valign="top">
					<th scope="row">Site Header</th>
					<td>
						<label><input name="tot_options[chk_header_banner]" type="checkbox" value="1" <?php if (isset($options['chk_header_banner'])) {
											checked('1', $options['chk_header_banner']);		
										} ?> /> Show advert banner?</label>
					</td>
				</tr>
				<tr valign="top">
					<th scope="row">Search Box</th>
					<td>
						<label><input name="tot_options[rdo_search_box]" type="radio" value="showheader" <?php checked('showheader', $options['rdo_search_box']); ?> /> Show in header.</label><br />
						<label><input name="tot_options[rdo_search_box]" type="radio" value="showsidebar" <?php checked('showsidebar', $options['rdo_search_box']); ?> /> Show in sidebar.</label><br />
						<label><input name="tot_options[rdo_search_box]" type="radio" value="shownone" <?php checked('shownone', $options['rdo_search_box']); ?> /> Don't show.</label>
					</td>
				</tr>
				<tr valign="top">
					<th scope="row">Random Featured Page</th>
					<td>
						<label><input name="tot_options[rdo_featured_page]" type="radio" value="random_child" <?php checked('random_child', $options['rdo_featured_page']); ?> /> Show child pages (select parent)</label><span style="margin-left:53px;">
						<?php
							$args = array('depth' => 1, 'name' => 'tot_options[drp_parent_page]', 'selected' => $options['drp_parent_page']);
							wp_dropdown_pages( $args );
						?></label><br />
						<span style="color:#666666;margin-left:2px;">Note: parent must contain child pages.</span><br />
						<label><input name="tot_options[rdo_featured_page]" type="radio" value="random_all" <?php checked('random_all', $options['rdo_featured_page']); ?> /> All pages (excluding specific page IDs)</label><span style="margin-left:18px;">
						<input name="tot_options[txt_page_ids]" size="40" type="text" value="<?php if (isset($options['txt_page_ids'])) {
								echo $options['txt_page_ids'];
							  } ?>" />
						</span><br />
						<span style="color:#666666;margin-left:2px;">Comma separated list of page IDs (leave blank to include ALL pages).</span>
					</td>
				</tr>
				<tr valign="top">
					<th scope="row">Read More Button</th>
					<td>
						<label><input name="tot_options[rdo_read_more]" type="radio" value="always" <?php checked('always', $options['rdo_read_more']); ?> /> Always show 'Read More' button.</label><br />
						<label><input name="tot_options[rdo_read_more]" type="radio" value="conditional" <?php checked('conditional', $options['rdo_read_more']); ?> /> Don't show 'Read More' button if featured text contains all page text.</label><br />
					</td>
				</tr>
				<tr>
					<th scope="row">Front Page Message</th>
					<td>
						<label><input name="tot_options[chk_show_thumb]" type="checkbox" value="1" <?php if (isset($options['chk_show_thumb'])) { checked('1', $options['chk_show_thumb']); } ?> /> Show homepage thumbnail?</label><br />
						<textarea name="tot_options[front_page_message]" rows="10" cols="70" type='textarea'><?php echo $options['front_page_message']; ?></textarea><br /><span style="color:#666666;margin-left:2px;">Style rules defined here should be placed in: <span style="font-family:courier new;">twist-of-ten/style.css</span></span>
					</td>
				</tr>
				<tr valign="top">
					<th scope="row">Page Sidebar</th>
					<td>
						<label><input name="tot_options[chk_sidebar_banner]" type="checkbox" value="1" <?php if (isset($options['chk_sidebar_banner'])) { checked('1', $options['chk_sidebar_banner']); } ?> /> Show advert banners?</label>
					</td>
				</tr>
				<tr valign="top">
					<th scope="row">Front Page Posts</th>
					<td>
						<label><input name="tot_options[chk_latest_posts]" type="checkbox" value="1" <?php if (isset($options['chk_latest_posts'])) { checked('1', $options['chk_latest_posts']); } ?> /> Show last three posts?</label>
					</td>
				</tr>
				<tr><td colspan="2"><div style="margin-top:5px;"></div></td></tr>
				<tr valign="top" style="border-top:#dddddd 1px solid;">
					<th scope="row">Theme Options</th>
					<td>
						<label><input name="tot_options[chk_default_options_db]" type="checkbox" value="1" <?php if (isset($options['chk_default_options_db'])) { checked('1', $options['chk_default_options_db']); } ?> /> Restore defaults upon theme deactivation/reactivation</label>
						<br /><span style="color:#666666;margin-left:2px;">Only check this if you want to reset theme settings upon reactivation</span>
					</td>
				</tr>
			</table>
			<p class="submit">
			<input type="submit" class="button-primary" value="<?php _e('Save Changes') ?>" />
			</p>
		</form>

<div>
<p style="margin-top:20px;"><strong><a href="http://www.presscoders.com/forums/forumdisplay.php?7-Twist-of-Ten" target="_blank">Theme Support Forum</a></strong> | <a href="http://www.presscoders.com" target="_blank">PressCoders.com</a> | <a href="http://twitter.com/dgwyer" target="_blank">Twitter</a></p>
</div>

<?php	
}

// Sanitize and validate input. Accepts an array, return a sanitized array.
function tot_validate_options($input) {
	 // strip html from textboxes
	$input['front_page_message'] = wp_filter_nohtml_kses($input['front_page_message']);
	return $input;
}

/*****************************************/
/* END - Twist of Ten Specific Functions */
/*****************************************/

/**
 * Set the content width based on the theme's design and stylesheet.
 *
 * Used to set the width of images and content. Should be equal to the width the theme
 * is designed for, generally via the style.css stylesheet.
 */
if ( ! isset( $content_width ) )
	$content_width = 640;

/** Tell WordPress to run twistoften_setup() when the 'after_setup_theme' hook is run. */
add_action( 'after_setup_theme', 'twistoften_setup' );

if ( ! function_exists( 'twistoften_setup' ) ):
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which runs
 * before the init hook. The init hook is too late for some features, such as indicating
 * support post thumbnails.
 *
 * To override twistoften_setup() in a child theme, add your own twistoften_setup to your child theme's
 * functions.php file.
 *
 * @uses add_theme_support() To add support for post thumbnails and automatic feed links.
 * @uses register_nav_menus() To add support for navigation menus.
 * @uses add_custom_background() To add support for a custom background.
 * @uses add_editor_style() To style the visual editor.
 * @uses load_theme_textdomain() For translation/localization support.
 * @uses add_custom_image_header() To add support for a custom header.
 * @uses register_default_headers() To register the default custom header images provided with the theme.
 * @uses set_post_thumbnail_size() To set a custom post thumbnail size.
 *
 */
function twistoften_setup() {
	// This theme styles the visual editor with editor-style.css to match the theme style.
	add_editor_style();

	// This theme uses post thumbnails
	add_theme_support( 'post-thumbnails' );

	// Add default posts and comments RSS feed links to head
	add_theme_support( 'automatic-feed-links' );

	// Make theme available for translation
	// Translations can be filed in the /languages/ directory
	load_theme_textdomain( 'twistoften', TEMPLATEPATH . '/languages' );

	$locale = get_locale();
	$locale_file = TEMPLATEPATH . "/languages/$locale.php";
	if ( is_readable( $locale_file ) )
		require_once( $locale_file );

	// This theme uses wp_nav_menu() in two locations.
	register_nav_menus( array(
		'primary' => __( 'Primary Navigation', 'twistoften' ),
		'top-right' => __( 'Secondary Navigation', 'twistoften' )
	) );

	// This theme allows users to set a custom background
	add_custom_background();

	// Your changeable header business starts here
	define( 'HEADER_TEXTCOLOR', '' );
	// No CSS, just IMG call. The %s is a placeholder for the theme template directory URI.
	define( 'HEADER_IMAGE', '%s/images/headers/path.jpg' );

	// The height and width of your custom header. You can hook into the theme's own filters to change these values.
	// Add a filter to twentyten_header_image_width and twentyten_header_image_height to change these values.
	define( 'HEADER_IMAGE_WIDTH', apply_filters( 'twentyten_header_image_width', 940 ) );
	define( 'HEADER_IMAGE_HEIGHT', apply_filters( 'twentyten_header_image_height', 198 ) );

	// We'll be using post thumbnails for custom header images on posts and pages.
	// We want them to be 940 pixels wide by 198 pixels tall.
	// Larger images will be auto-cropped to fit, smaller ones will be ignored. See header.php.
	set_post_thumbnail_size( HEADER_IMAGE_WIDTH, HEADER_IMAGE_HEIGHT, true );

	// Don't support text inside the header image.
	define( 'NO_HEADER_TEXT', true );

	// Add a way for the custom header to be styled in the admin panel that controls
	// custom headers. See twentyten_admin_header_style(), below.
	add_custom_image_header( '', 'twentyten_admin_header_style' );

	// ... and thus ends the changeable header business.

	// Default custom headers packaged with the theme. %s is a placeholder for the theme template directory URI.
	register_default_headers( array(
		'crystal' => array(
			'url' => '%s/images/headers/crystal.jpg',
			'thumbnail_url' => '%s/images/headers/crystal-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Crystal', 'twistoften' )
		),
		'electricblue' => array(
			'url' => '%s/images/headers/electricblue.jpg',
			'thumbnail_url' => '%s/images/headers/electricblue-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Eelectric Blue', 'twistoften' )
		),
		'goldletter' => array(
			'url' => '%s/images/headers/goldletter.jpg',
			'thumbnail_url' => '%s/images/headers/goldletter-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Gold Letter', 'twistoften' )
		),
		'redgradient' => array(
			'url' => '%s/images/headers/red-gradient.jpg',
			'thumbnail_url' => '%s/images/headers/red-gradient-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Red Gradient', 'twistoften' )
		),
		'grass' => array(
			'url' => '%s/images/headers/grass.jpg',
			'thumbnail_url' => '%s/images/headers/grass-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Grass', 'twistoften' )
		),
		'squares' => array(
			'url' => '%s/images/headers/squares.jpg',
			'thumbnail_url' => '%s/images/headers/squares-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Squares', 'twistoften' )
		),
		'swirl' => array(
			'url' => '%s/images/headers/swirl.jpg',
			'thumbnail_url' => '%s/images/headers/swirl-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Swirl', 'twistoften' )
		),
		'path' => array(
			'url' => '%s/images/headers/path.jpg',
			'thumbnail_url' => '%s/images/headers/path-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Path', 'twistoften' )
		)
	) );
}
endif;

if ( ! function_exists( 'twentyten_admin_header_style' ) ) :
/**
 * Styles the header image displayed on the Appearance > Header admin panel.
 *
 * Referenced via add_custom_image_header() in twistoften_setup().
 *
 * @since Twenty Ten 1.0
 */
function twentyten_admin_header_style() {
?>
<style type="text/css">
/* Shows the same border as on front end */
#headimg {
	border-bottom: 1px solid #000;
	border-top: 4px solid #000;
}
/* If NO_HEADER_TEXT is false, you would style the text with these selectors:
	#headimg #name { }
	#headimg #desc { }
*/
</style>
<?php
}
endif;

/**
 * Makes some changes to the <title> tag, by filtering the output of wp_title().
 *
 * If we have a site description and we're viewing the home page or a blog posts
 * page (when using a static front page), then we will add the site description.
 *
 * If we're viewing a search result, then we're going to recreate the title entirely.
 * We're going to add page numbers to all titles as well, to the middle of a search
 * result title and the end of all other titles.
 *
 * The site title also gets added to all titles.
 *
 * @since Twenty Ten 1.0
 *
 * @param string $title Title generated by wp_title()
 * @param string $separator The separator passed to wp_title(). Twenty Ten uses a
 * 	vertical bar, "|", as a separator in header.php.
 * @return string The new title, ready for the <title> tag.
 */
function twentyten_filter_wp_title( $title, $separator ) {
	// Don't affect wp_title() calls in feeds.
	if ( is_feed() )
		return $title;

	// The $paged global variable contains the page number of a listing of posts.
	// The $page global variable contains the page number of a single post that is paged.
	// We'll display whichever one applies, if we're not looking at the first page.
	global $paged, $page;

	if ( is_search() ) {
		// If we're a search, let's start over:
		$title = sprintf( __( 'Search results for %s', 'twistoften' ), '"' . get_search_query() . '"' );
		// Add a page number if we're on page 2 or more:
		if ( $paged >= 2 )
			$title .= " $separator " . sprintf( __( 'Page %s', 'twistoften' ), $paged );
		// Add the site name to the end:
		$title .= " $separator " . get_bloginfo( 'name', 'display' );
		// We're done. Let's send the new title back to wp_title():
		return $title;
	}

	// Otherwise, let's start by adding the site name to the end:
	$title .= get_bloginfo( 'name', 'display' );

	// If we have a site description and we're on the home/front page, add the description:
	$site_description = get_bloginfo( 'description', 'display' );
	if ( $site_description && ( is_home() || is_front_page() ) )
		$title .= " $separator " . $site_description;

	// Add a page number if necessary:
	if ( $paged >= 2 || $page >= 2 )
		$title .= " $separator " . sprintf( __( 'Page %s', 'twistoften' ), max( $paged, $page ) );

	// Return the new title to wp_title():
	return $title;
}
add_filter( 'wp_title', 'twentyten_filter_wp_title', 10, 2 );

/**
 * Get our wp_nav_menu() fallback, wp_page_menu(), to show a home link.
 *
 * To override this in a child theme, remove the filter and optionally add
 * your own function tied to the wp_page_menu_args filter hook.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_page_menu_args( $args ) {
	$args['show_home'] = true;
	return $args;
}
add_filter( 'wp_page_menu_args', 'twentyten_page_menu_args' );

/**
 * Sets the post excerpt length to 40 characters.
 *
 * To override this length in a child theme, remove the filter and add your own
 * function tied to the excerpt_length filter hook.
 *
 * @since Twenty Ten 1.0
 * @return int
 */
function twentyten_excerpt_length( $length ) {
	return 40;
}
add_filter( 'excerpt_length', 'twentyten_excerpt_length' );

/**
 * Returns a "Continue Reading" link for excerpts
 *
 * @since Twenty Ten 1.0
 * @return string "Continue Reading" link
 */
function twentyten_continue_reading_link() {
	return ' <a href="'. get_permalink() . '">' . __( 'Continue reading <span class="meta-nav">&rarr;</span>', 'twistoften' ) . '</a>';
}

/**
 * Replaces "[...]" (appended to automatically generated excerpts) with an ellipsis and twentyten_continue_reading_link().
 *
 * To override this in a child theme, remove the filter and add your own
 * function tied to the excerpt_more filter hook.
 *
 * @since Twenty Ten 1.0
 * @return string An ellipsis
 */
function twentyten_auto_excerpt_more( $more ) {
	return ' &hellip;' . twentyten_continue_reading_link();
}
add_filter( 'excerpt_more', 'twentyten_auto_excerpt_more' );

/**
 * Adds a pretty "Continue Reading" link to custom post excerpts.
 *
 * To override this link in a child theme, remove the filter and add your own
 * function tied to the get_the_excerpt filter hook.
 *
 * @since Twenty Ten 1.0
 * @return string Excerpt with a pretty "Continue Reading" link
 */
function twentyten_custom_excerpt_more( $output ) {
	if ( has_excerpt() && ! is_attachment() ) {
		$output .= twentyten_continue_reading_link();
	}
	return $output;
}
add_filter( 'get_the_excerpt', 'twentyten_custom_excerpt_more' );

/**
 * Remove inline styles printed when the gallery shortcode is used.
 *
 * Galleries are styled by the theme in Twenty Ten's style.css.
 *
 * @since Twenty Ten 1.0
 * @return string The gallery style filter, with the styles themselves removed.
 */
function twentyten_remove_gallery_css( $css ) {
	return preg_replace( "#<style type='text/css'>(.*?)</style>#s", '', $css );
}
add_filter( 'gallery_style', 'twentyten_remove_gallery_css' );

if ( ! function_exists( 'twentyten_comment' ) ) :
/**
 * Template for comments and pingbacks.
 *
 * To override this walker in a child theme without modifying the comments template
 * simply create your own twentyten_comment(), and that function will be used instead.
 *
 * Used as a callback by wp_list_comments() for displaying the comments.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_comment( $comment, $args, $depth ) {
	$GLOBALS['comment'] = $comment;
	switch ( $comment->comment_type ) :
		case '' :
	?>
	<li <?php comment_class(); ?> id="li-comment-<?php comment_ID(); ?>">
		<div id="comment-<?php comment_ID(); ?>">
		<div class="comment-author vcard">
			<?php echo get_avatar( $comment, 40 ); ?>
			<?php printf( __( '%s <span class="says">says:</span>', 'twistoften' ), sprintf( '<cite class="fn">%s</cite>', get_comment_author_link() ) ); ?>
		</div><!-- .comment-author .vcard -->
		<?php if ( $comment->comment_approved == '0' ) : ?>
			<em><?php _e( 'Your comment is awaiting moderation.', 'twistoften' ); ?></em>
			<br />
		<?php endif; ?>

		<div class="comment-meta commentmetadata"><a href="<?php echo esc_url( get_comment_link( $comment->comment_ID ) ); ?>">
			<?php
				/* translators: 1: date, 2: time */
				printf( __( '%1$s at %2$s', 'twistoften' ), get_comment_date(),  get_comment_time() ); ?></a><?php edit_comment_link( __( '(Edit)', 'twistoften' ), ' ' );
			?>
		</div><!-- .comment-meta .commentmetadata -->

		<div class="comment-body"><?php comment_text(); ?></div>

		<div class="reply">
			<?php comment_reply_link( array_merge( $args, array( 'depth' => $depth, 'max_depth' => $args['max_depth'] ) ) ); ?>
		</div><!-- .reply -->
	</div><!-- #comment-##  -->

	<?php
			break;
		case 'pingback'  :
		case 'trackback' :
	?>
	<li class="post pingback">
		<p><?php _e( 'Pingback:', 'twistoften' ); ?> <?php comment_author_link(); ?><?php edit_comment_link( __('(Edit)', 'twistoften'), ' ' ); ?></p>
	<?php
			break;
	endswitch;
}
endif;

/**
 * Register widgetized areas, including two sidebars and four widget-ready columns in the footer.
 *
 * To override twentyten_widgets_init() in a child theme, remove the action hook and add your own
 * function tied to the init hook.
 *
 * @since Twenty Ten 1.0
 * @uses register_sidebar
 */
function twentyten_widgets_init() {
	// Area 1, located at the top of the sidebar.
	register_sidebar( array(
		'name' => __( 'Primary Widget Area', 'twistoften' ),
		'id' => 'primary-widget-area',
		'description' => __( 'The primary widget area', 'twistoften' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );

	// Area 2, located below the Primary Widget Area in the sidebar. Empty by default.
	register_sidebar( array(
		'name' => __( 'Secondary Widget Area', 'twistoften' ),
		'id' => 'secondary-widget-area',
		'description' => __( 'The secondary widget area', 'twistoften' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );

	// Area 3, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'First Footer Widget Area', 'twistoften' ),
		'id' => 'first-footer-widget-area',
		'description' => __( 'The first footer widget area', 'twistoften' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );

	// Area 4, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Second Footer Widget Area', 'twistoften' ),
		'id' => 'second-footer-widget-area',
		'description' => __( 'The second footer widget area', 'twistoften' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );

	// Area 5, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Third Footer Widget Area', 'twistoften' ),
		'id' => 'third-footer-widget-area',
		'description' => __( 'The third footer widget area', 'twistoften' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );

	// Area 6, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Fourth Footer Widget Area', 'twistoften' ),
		'id' => 'fourth-footer-widget-area',
		'description' => __( 'The fourth footer widget area', 'twistoften' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
}
/** Register sidebars by running twentyten_widgets_init() on the widgets_init hook. */
add_action( 'widgets_init', 'twentyten_widgets_init' );

/**
 * Removes the default styles that are packaged with the Recent Comments widget.
 *
 * To override this in a child theme, remove the filter and optionally add your own
 * function tied to the widgets_init action hook.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_remove_recent_comments_style() {
	global $wp_widget_factory;
	remove_action( 'wp_head', array( $wp_widget_factory->widgets['WP_Widget_Recent_Comments'], 'recent_comments_style' ) );
}
add_action( 'widgets_init', 'twentyten_remove_recent_comments_style' );

if ( ! function_exists( 'twentyten_posted_on' ) ) :
/**
 * Prints HTML with meta information for the current post—date/time and author.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_posted_on() {
	printf( __( '<span class="%1$s">Posted on</span> %2$s <span class="meta-sep">by</span> %3$s', 'twistoften' ),
		'meta-prep meta-prep-author',
		sprintf( '<a href="%1$s" title="%2$s" rel="bookmark"><span class="entry-date">%3$s</span></a>',
			get_permalink(),
			esc_attr( get_the_time() ),
			get_the_date()
		),
		sprintf( '<span class="author vcard"><a class="url fn n" href="%1$s" title="%2$s">%3$s</a></span>',
			get_author_posts_url( get_the_author_meta( 'ID' ) ),
			sprintf( esc_attr__( 'View all posts by %s', 'twistoften' ), get_the_author() ),
			get_the_author()
		)
	);
}
endif;

if ( ! function_exists( 'twentyten_posted_in' ) ) :
/**
 * Prints HTML with meta information for the current post (category, tags and permalink).
 *
 * @since Twenty Ten 1.0
 */
function twentyten_posted_in() {
	// Retrieves tag list of current post, separated by commas.
	$tag_list = get_the_tag_list( '', ', ' );
	if ( $tag_list ) {
		$posted_in = __( 'This entry was posted in %1$s and tagged %2$s. Bookmark the <a href="%3$s" title="Permalink to %4$s" rel="bookmark">permalink</a>.', 'twistoften' );
	} elseif ( is_object_in_taxonomy( get_post_type(), 'category' ) ) {
		$posted_in = __( 'This entry was posted in %1$s. Bookmark the <a href="%3$s" title="Permalink to %4$s" rel="bookmark">permalink</a>.', 'twistoften' );
	} else {
		$posted_in = __( 'Bookmark the <a href="%3$s" title="Permalink to %4$s" rel="bookmark">permalink</a>.', 'twistoften' );
	}
	// Prints the string, replacing the placeholders.
	printf(
		$posted_in,
		get_the_category_list( ', ' ),
		$tag_list,
		get_permalink(),
		the_title_attribute( 'echo=0' )
	);
}
endif;
