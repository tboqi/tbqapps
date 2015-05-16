<div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>文章管理</h3>
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
              <?php foreach ($articles as $article) { ?>
              <tr>
                <td>
                  <input type="checkbox" />
                </td>
                <td><a target="_blank" href="<?php echo URL::site_common('article/detail/' . $article->id);?>" title="<?php echo $article->title;?>"><?php echo $article->title;?></a></td>
                <td>
                  <!-- Icons -->
                  <?php /*<a href="#" title="Edit"><img src="<?php echo Resource::image("icons/pencil.png"); ?>" alt="Edit" /></a>*/?>
                  <a href="<?php echo url::site('article/del/' . $article->id)?>" title="Delete" class="del"><img src="<?php echo Resource::image("icons/cross.png"); ?>" alt="Delete" /></a>
                  <?php /*<a href="#" title="Edit Meta"><img src="<?php echo Resource::image("icons/hammer_screwdriver.png"); ?>" alt="Edit Meta" /></a> </td>*/?>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <!-- End #tab1 -->
      </div>
      <!-- End .content-box-content -->
    </div>
    <!-- End .content-box -->
<script type="text/javascript">
$(function(){
	$('tbody a.del').click(function(){
		if(confirm('确定要删除吗？删除后无法恢复')){
			var thisObj = $(this);
			$.get(thisObj.attr('href'), function(data){
				thisObj.parent().parent().remove();
			});
		}
		return false;
	});
});
</script>