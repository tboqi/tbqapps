<div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>添加新产品</h3>
      </div>
      <!-- End .content-box-header -->
      <div class="content-box-content">
        <div class="tab-content default-tab" id="tab2">
          <form id="productForm" action="<?php echo url::site('product/save')?>" method="post" enctype="multipart/form-data">
            <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
              <label>标题</label>
              <input class="text-input large-input" type="text" id="title" name="title" />
            </p>
            <p>
              <label>分类</label>
              <select name="category_id" id="category_id" class="small-input">
                <option value="0">未分类</option>
								<?php foreach ($categories as $category) { ?>
								<option value="<?php echo $category->id; ?>"<?php if (isset($product) && $category->id == $product->category_id) echo ' selected'; ?>><?php echo $category->name; ?></option>
								<?php } ?>
              </select>
            </p>
            <p>
            	<label>上传图片</label>
            	<input type="file" name="file" id="file" class="fileUpload">
            </p>
            <p>
              <label>描述</label>
              <textarea class="text-input textarea" id="desc" name="desc" cols="79" rows="15"></textarea>
            </p>
            <p>
              <input class="button" type="submit" value="Submit" />
            </p>
            </fieldset>
            <div class="clear"></div>
            <!-- End .clear -->
          </form>
        </div>
        <!-- End #tab2 -->
      </div>
      <!-- End .content-box-content -->
    </div>
    <!-- End .content-box -->
