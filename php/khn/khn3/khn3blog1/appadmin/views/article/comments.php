<div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>文章评论管理</h3>
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
                <th>文章标题</th>
                <th>评论时间</th>
                <th>评论人</th>
                <th>评论内容</th>
                <th>操作</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <td colspan="6">
                  <div class="bulk-actions align-left">
                    <select name="dropdown">
                      <option value="option1">Choose an action...</option>
                      <option value="option2">Edit</option>
                      <option value="option3">Delete</option>
                    </select>
                    <a class="button" href="#" onclick="alert('没有完成');return false;">Apply to selected</a> </div>
                    <?php echo $pagination; ?>
                  <!-- End .pagination -->
                  
                  <div class="clear"></div>
                </td>
              </tr>
            </tfoot>
            <tbody>
              <?php foreach ($comments as $comment) { ?>
              <tr>
                <td>
                  <input type="checkbox" />
                </td>
                <td><?php echo $comment->title; ?></td>
                <td><?php echo date('Y-m-d H:i', $comment->create_time); ?></td>
                <td><?php echo $comment->user_name; ?></td>
                <td><?php echo $comment->content; ?></td>
                <td>
                  <!-- Icons -->
                  <a class="del" href="<?php echo url::site('article_comment/del/' . $comment->id )?>" title="Delete"><img src="<?php echo Resource::image("icons/cross.png"); ?>" alt="Delete" /></a></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <!-- End #tab1 -->
      </div>
      <!-- End .content-box-content -->
    </div>
<script type="text/javascript">
$(function(){
	$('tbody a.del').click( function(){
		var thisObj = $(this);
		$.get(thisObj.attr('href'), function(data){
			thisObj.parent().parent().remove();
		});
		return false;
	});
});
</script>