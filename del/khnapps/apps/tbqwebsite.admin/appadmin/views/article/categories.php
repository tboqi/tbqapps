<div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>文章分类管理</h3>
        <ul class="content-box-tabs">
          <li><a href="#tab1" class="default-tab">列表</a></li>
          <!-- href must be unique and match the id of target div -->
          <li><a href="#tab2">添加</a></li>
        </ul>
        <div class="clear"></div>
      </div>
      <!-- End .content-box-header -->
      <div class="content-box-content">
        <div class="tab-content default-tab" id="tab1">
          <table>
            <thead>
              <tr>
                <th>
                  <input class="check-all" type="checkbox" />
                </th>
                <th>名称</th>
                <th>描述</th>
                <th>顺序</th>
                <th>文章数</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($categories as $category) { ?>
              <tr>
                <td>
                  <input type="checkbox" />
                </td>
                <td><?php echo $category->name; ?></td>
                <td><?php echo $category->description; ?></td>
                <td><?php echo $category->show_order; ?></td>
                <td><?php echo $category->num; ?></td>
                <td>
                  <!-- Icons -->
                  <a href="<?php echo url::site('article_category/edit/' . $category->id )?>" title="Edit" class="edit"><img src="<?php echo Resource::image("icons/pencil.png"); ?>" alt="Edit" /></a> 
                  <a href="<?php echo url::site('article_category/del/' . $category->id )?>" title="Delete"><img src="<?php echo Resource::image("icons/cross.png"); ?>" alt="Delete" /></a></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <!-- End #tab1 -->
        <div class="tab-content" id="tab2">
          <form id="categoryForm" action="<?php echo url::site('article_category/save'); ?>" method="post">
            <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
              <label>名称</label>
              <input class="text-input small-input" type="text" id="category_name" name="category_name" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>分类名称</small> </p>
            <p>
              <label>描述</label>
              <input class="text-input large-input" type="text" id="description" name="description" />
            </p>
            <p>
              <label>显示顺序</label>
              <input class="text-input small-input" type="text" id="show_order" name="show_order" /></p>
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
<script type="text/javascript" src="<?php echo Resource::js_common('jquery.form.js'); ?>"></script>
<script type="text/javascript" src="<?php echo Resource::js_common('yuqi_utils.js'); ?>"></script>
<script type="text/javascript">
$(function(){
	$('#categoryForm').ajaxForm( {
		dataType :'json',
		beforeSubmit :beforeSubmit,
		success :function(data) {
			if (data.status == 1) {
				$('.notification').html('<div>添加成功</div>');
				location.href = data.url;
			} else {
				var errorsHtml = '';
				$.each(data.errors, function(field, msg) {
					errorsHtml += '<div>' + msg + '</div>';
				});
				$('.notification').html(errorsHtml);
				$b = $(":submit");
				$b[0].disabled = false;
			}
		}
	});
	$('tbody a.edit').click(function(){
		alert('此功能未完成');
		return false;
	});
});
</script>