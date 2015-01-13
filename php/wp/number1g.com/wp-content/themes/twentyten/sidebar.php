<?php
/**
 * The Sidebar containing the primary and secondary widget areas.
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */
?>

		<div id="primary" class="widget-area" role="complementary">
			<ul class="xoxo">
			<li id="search" class="widget-container widget_search">
				<?php get_search_form(); ?>
			</li>
			<?php /* li id="meta" class="widget-container">
				<h3 class="widget-title">评论最多</h3>
				<ul>
				<?php get_mostcommented(); ?>
				</ul>
			</li */ ?>
			<li id="meta" class="widget-container">
				<!-- Feedsky FEED发布代码开始 -->
				<script language="javascript"><!-- 
				main_sub="c1s17d";
				more_subs="zhuaxia_02,rojo_02,google_02,netvibes_02,yahoo_02,newsgator_02,bloglines_02,xianguo_02,nazha_02,youdao_02,qq_02,douban_02,bangkan_02";
				is_new="no";
				--> </script>
				<script language="javascript" src="http://www.feedsky.com/jsout/publishlist_v2.js?burl=xingui&out_html=true"></script>
				<!-- Feedsky FEED发布代码结束 -->
			</li>
			<li id="meta" class="widget-container">
				<h3 class="widget-title">随机文章</h3>
				<ul>
				<?php random_posts(15); ?>
				</ul>
			</li>
<?php
	/* When we call the dynamic_sidebar() function, it'll spit out
	 * the widgets for that widget area. If it instead returns false,
	 * then the sidebar simply doesn't exist, so we'll hard-code in
	 * some default sidebar stuff just in case.
	 */
	if ( ! dynamic_sidebar( 'primary-widget-area' ) ) : ?>

			<li id="archives" class="widget-container">
				<h3 class="widget-title"><?php _e( 'Archives', 'twentyten' ); ?></h3>
				<ul>
					<?php wp_get_archives( 'type=monthly' ); ?>
				</ul>
			</li>

			<li id="meta" class="widget-container">
				<h3 class="widget-title"><?php _e( 'Meta', 'twentyten' ); ?></h3>
				<ul>
					<?php wp_register(); ?>
					<li><?php wp_loginout(); ?></li>
					<?php wp_meta(); ?>
				</ul>
			</li>

		<?php endif; // end primary widget area ?>
		</div><!-- #primary .widget-area -->

<?php
	// A second sidebar for widgets, just because.
	if ( is_active_sidebar( 'secondary-widget-area' ) ) : ?>

		<div id="secondary" class="widget-area" role="complementary">
			<ul class="xoxo">
				<?php dynamic_sidebar( 'secondary-widget-area' ); ?>
			</ul>
		</div><!-- #secondary .widget-area -->

<?php endif; ?>
