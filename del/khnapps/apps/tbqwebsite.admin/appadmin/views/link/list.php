<div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>链接管理</h3>
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
                <th>链接</th>
                <th>分类</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($links as $link) { ?>
              <tr>
                <td>
                  <input type="checkbox" />
                </td>
                <td><?php echo $link->name; ?></td>
                <td><?php echo $link->url; ?></td>
                <td><?php echo $link->category_id; ?></td>
                <td>
                  <!-- Icons -->
                  <a href="<?php echo url::site('link/edit/' . $link->id )?>" title="Edit" class="edit"><img src="<?php echo Resource::image("icons/pencil.png"); ?>" alt="Edit" /></a> 
                  <a href="<?php echo url::site('link/del/' . $link->id )?>" title="Delete"><img src="<?php echo Resource::image("icons/cross.png"); ?>" alt="Delete" /></a></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <!-- End #tab1 -->
        <div class="tab-content" id="tab2">
          <form id="linkForm" action="<?php echo url::site('link/save'); ?>" method="post">
            <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
              <label>分类</label>
              <select name="category_id" id="category_id" class="small-input">
                <option value="0">未分类</option>
								<?php foreach ($categories as $category) { ?>
								<option value="<?php echo $category->id; ?>"<?php if (isset($article) && $category->id == $article->category_id) echo ' selected'; ?>><?php echo $category->name; ?></option>
								<?php } ?>
              </select>
            </p>
            <p>
              <label>名称</label>
              <input class="text-input large-input" type="text" id="name" name="name" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>分类名称</small> </p>
            <p>
              <label>URL</label>
              <input class="text-input large-input" type="text" id="url" name="url" />
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
<script type="text/javascript" src="<?php echo Resource::js_common('jquery.form.js'); ?>"></script>
<script type="text/javascript" src="<?php echo Resource::js_common('yuqi_utils.js'); ?>"></script>
<script type="text/javascript">
$(function(){
	$('#linkForm').ajaxForm( {
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