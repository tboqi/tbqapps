<?php
/* Template Name: Custom Front Page */

get_header(); ?>

<div id="container" class="one-column">
	<div id="content" role="main">
		<div>
			<?php
			// show random child page, or page from ALL pages
			$tmp = get_option('tot_options');
			if($tmp[rdo_featured_page]=="random_child") {
				$pages = get_pages("child_of=$tmp[drp_parent_page]");
				$ind = rand(0, count($pages) - 1);
				$featured_image = tot_get_featured_image($pages, $ind);
			}
			else { // if not random_child, must be random all (with exceptions)
				$excludes = $tmp[txt_page_ids];
				if ($excludes == "") { // get all pages
					$pages = get_pages();
				}
				else{
					$pages = get_pages("exclude=$excludes");
				}
				$ind = rand(0, count($pages) - 1);
				$featured_image = tot_get_featured_image($pages, $ind);
			}

			$tmp = get_option('tot_options');
			if($tmp[rdo_read_more]=="always") { // always show 'Read More' button
				$excerpt = n_words_rm(strip_tags($pages[$ind]->post_content), 60, 1, $pages[$ind]->ID); //only show text on the excerpts, and limit to 60 words
			}
			else {  // conditionally show 'Read More' button
				$excerpt = n_words_rm(strip_tags($pages[$ind]->post_content), 60, 0, $pages[$ind]->ID); //only show text on the excerpts, and limit to 60 words
			}

			?>
			<table cellspacing="0" class="carousel_t">
				<tr>
					<td id="tb_cell1">
						<img src="<?php echo $featured_image; ?>" />
					</td>
					<td id="tb_cell2">
						<div>
							<h2><a href="<?php echo get_page_link($pages[$pageInd]->ID); ?>" ><?php echo $pages[$pageInd]->post_title ?></a></h2>
							<?php echo $excerpt; // show excerpt and read more button only if content more than 60 words ?>
						</div>
					</td>
				</tr>
			</table>

			<div>
				<?php
					$tmp = get_option('tot_options');
					$message = $tmp[front_page_message]; 
					if($tmp[front_page_message]!="") { ?>
						<div id="welcome">
							<table class="welcome_t">
								<tr>
									<?php
									if($tmp[chk_show_thumb]=="1") { ?>
										<td id="td1"><?php echo $message; ?></td>
										<td id="td2"><img src="<?php bloginfo( 'stylesheet_directory' ); ?>/images/home_thumb.jpg"></td>							
									<?php }
									else { ?>
										<td id="td1"><?php echo $message; ?></td>
									<?php } ?>
								</tr>
							</table>
						</div>
					<?php } ?>

<?php
	$tmp = get_option('tot_options');
	if($tmp[chk_latest_posts]=="1") { ?> 
				<h3 class="lposts">Latest Posts..</h3>
				<table id="lposts_tbl">
					<tr>
						<?php
							$lastposts = get_posts('numberposts=3');
							$i = 0;
							$col = array('#cdcdcd', '#ddd', '#eee'); //div background colours
							shuffle($col);
							foreach($lastposts as $post) :
							setup_postdata($post);
							if($i <= 1) { ?>
								<td id="lp_td1">
							<?php }
							else { ?>
								<td id="lp_td2">
							<?php } ?>
								<div style="background:<?php echo $col[$i];$i++; ?>;padding:15px;height:300px;">
									<h2><a href="<?php the_permalink(); ?>" id="post-<?php the_ID(); ?>"><?php the_title(); ?></a></h2>
									<p><span><small><?php the_time('F j, Y'); ?></small></span><span><small> by <?php the_author(); ?></small></span></p>
									<?php echo n_words(strip_tags(get_the_content()), 45); //only show text on the excerpts ?>
								</div>
								</td>
							<?php endforeach; ?>
					</tr>
				</table>
	<?php }
?>

			</div>
		</div>
	</div><!-- #content -->
</div><!-- #container -->
<?php get_footer(); ?>