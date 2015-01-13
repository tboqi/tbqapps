<?php
/* Template Name: Blog */

get_header(); ?>

		<div id="container">
			<div id="content" role="main">
		
			<?php
				$temp = $wp_query;
				$wp_query = null;
				$wp_query = new WP_Query();
				$wp_query->query('posts_per_page=10&paged='.$paged);
				$cntr = 0;
				while ($wp_query->have_posts()) : $wp_query->the_post();
				$cntr++;

				/* if($cntr==0) { // use this if/else if you want to not show the first post
					$cntr++;
					continue; // skip this while iteration, and go to next one
				} else {
					$cntr++;
				} */
			?>
            
            <div class="<?php sticky_class(); ?>" id="post-<?php the_ID(); ?>"> 
                <h2><a href="<?php the_permalink() ?>" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
                <div>
                    <span><?php the_time('F jS, Y') ?> by <?php the_author() ?> </span>
                    <span>Categories: <?php the_category(', '); ?></span>
                    <span><?php comments_number('No Responses','One Response','% Responses'); ?></span>
                </div>

                <div><?php the_excerpt(); ?></div>
            </div>
           
            <?php endwhile; ?>
            
			<div class="navigation">
				<div class="alignleft"><?php next_posts_link('&laquo; Older Entries') ?></div>
				<div class="alignright"><?php previous_posts_link('Newer Entries &raquo;') ?></div>
			</div>            
            

			</div><!-- #content -->
		</div><!-- #container -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
