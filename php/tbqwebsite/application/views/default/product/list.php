    <div class="fl leftSide">
    	<div class="leftHead">产品分类</div>
            <?php echo Block_Product_Category::category_list();?>
        </div>
        <div class="inProList">
        	<ul>
                <?php foreach ($items as $item) {?>
                <li class="mr0"><a href="<?php echo URL::site('product/item/' . $item->id);?>"><img src="<?php echo URL::base();?>upload/<?php echo $item->id?>" /></a></li>
                <?php }
?>
            </ul>
        </div>
    </div>
