<div class="pagination">
	<?php if ($first_page !== FALSE): ?>
	<a href="<?php echo HTML::chars($page->url(1)) ?>" title="First Page">&laquo; First</a>
	<?php endif ?>
	<?php if ($previous_page !== FALSE): ?>
	<a href="<?php echo HTML::chars($page->url($previous_page)) ?>" title="Previous Page">&laquo; Previous</a> 
	<?php endif ?>
	<?php if ($current_page - 2 > 0): ?>
	<a href="<?php echo HTML::chars($page->url($current_page - 2)) ?>" class="number" title="1"><?php echo $current_page - 2; ?></a> 
	<?php endif ?>
	<?php if ($current_page - 1 > 0): ?>
	<a href="<?php echo HTML::chars($page->url($current_page - 1)) ?>" class="number" title="2"><?php echo $current_page - 1; ?></a> 
	<?php endif ?>
	<a href="<?php echo HTML::chars($page->url($current_page)) ?>" class="number current" title="3"><?php echo $current_page; ?></a> 
	<?php if ($current_page + 1 <= $total_pages): ?>
	<a href="<?php echo HTML::chars($page->url($current_page + 1)) ?>" class="number" title="4"><?php echo $current_page + 1; ?></a> 
	<?php endif ?>
	<?php if ($current_page + 2 <= $total_pages): ?>
	<a href="<?php echo HTML::chars($page->url($current_page + 2)) ?>" class="number" title="4"><?php echo $current_page + 2; ?></a> 
	<?php endif ?>
	<?php if ($next_page !== FALSE): ?>
	<a href="<?php echo HTML::chars($page->url($next_page)) ?>" title="Next Page">Next &raquo;</a>
	<?php endif ?>
	<?php if ($last_page !== FALSE): ?>
	<a href="<?php echo HTML::chars($page->url($last_page)) ?>" title="Last Page">Last &raquo;</a> 
	<?php endif ?>
</div>