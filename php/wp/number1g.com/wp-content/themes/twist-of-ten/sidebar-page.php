<?php
/**
 * The Sidebar containing the primary and secondary widget areas.
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */
?>
		<?php
		$tmp = get_option('tot_options');

if (isset($tmp['rdo_search_box'])) {
	if($tmp['rdo_search_box']=="showsidebar") { ?>
		<div id="menu-bar-search">
			<ul class="xoxo">
				<li id="search" class="widget-container widget_search">
					<?php get_search_form(); ?>
				</li>
			</ul>
		</div><!-- #menu-bar-search -->
	<?php }
}
		
		// A second sidebar for widgets, just because.
		if ( is_active_sidebar( 'secondary-widget-area' ) ) : ?>
			<div id="secondary" class="widget-area" role="complementary">
				<?php
				$tmp = get_option('tot_options');
				if($tmp[chk_sidebar_banner]=="1") { ?>
					<div id="top-advert-block">
						<div><a href="<?php echo home_url( '/' ); ?>"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/ads/advert-150x150.png" /></a></div>
					</div>
				<?php } ?>

				<ul class="xoxo">
					<?php dynamic_sidebar( 'secondary-widget-area' ); ?>
				</ul>

				<?php
				$tmp = get_option('tot_options');
				if($tmp[chk_sidebar_banner]=="1") { ?>
					<div id="bottom-advert-block">
						<div><a href="<?php echo home_url( '/' ); ?>"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/ads/advert-150x350.png" /></a></div>
					</div>
				<?php } ?>
			</div><!-- #secondary .widget-area -->
		<?php else : ?>
			<div id="secondary" class="widget-area" role="complementary">
				<?php
				$tmp = get_option('tot_options');

if (isset($tmp['chk_sidebar_banner'])) {
	if($tmp['chk_sidebar_banner']=="1") { ?>
		<div id="top-advert-block">
			<div><a href="<?php echo home_url( '/' ); ?>"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/ads/advert-150x150.png" /></a></div>
		</div>
		<div id="advert-spacer"></div>
		<div id="bottom-advert-block">
			<div><a href="<?php echo home_url( '/' ); ?>"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/ads/advert-150x350.png" /></a></div>
		</div>
	<?php } ?>
<?php } ?>


			</div><!-- #secondary .widget-area -->
		<?php endif; ?>