<div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>联系方式</h3>
        <div class="clear"></div>
      </div>
      <!-- End .content-box-header -->
      <div class="content-box-content">
        <div class="tab-content default-tab" id="tab1">
          <form id="websiteBaseinfoForm" action="<?php echo url::site('website/contact'); ?>" method="post">
            <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
              <label>厂名</label>
              <input class="text-input small-input" type="text" id="name" name="name" value="<?php echo isset($contact->name) ? $contact->name : ''; ?>" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>title</small> </p>
            <p>
              <label>联系人</label>
              <input class="text-input small-input" type="text" id="linkman" name="linkman" value="<?php echo isset($contact->linkman) ? $contact->linkman : ''; ?>" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>title</small> </p>
            <p>
              <label>电话</label>
              <input class="text-input small-input" type="text" id="dianhua" name="dianhua" value="<?php echo isset($contact->dianhua) ? $contact->dianhua : ''; ?>" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>title</small> </p>
            <p>
              <label>邮箱</label>
              <input class="text-input small-input" type="text" id="email" name="email" value="<?php echo isset($contact->email) ? $contact->email : ''; ?>" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>title</small> </p>
            <p>
              <label>地址</label>
              <input class="text-input small-input" type="text" id="dizhi" name="dizhi" value="<?php echo isset($contact->dizhi) ? $contact->dizhi : ''; ?>" />
              <span class="input-notification information png_bg">Successful message</span>
              <!-- Classes for input-notification: success, error, information, attention -->
              <br />
              <small>title</small> </p>
            <p>
              <input class="button" type="submit" value="Submit" />
            </p>
            </fieldset>
            <input type="hidden" name="id" value="<?php echo isset($contact->id) ? $contact->id : 0; ?>" />
            <div class="clear"></div>
            <!-- End .clear -->
          </form>
        </div>
      </div>
      <!-- End .content-box-content -->
    </div>
<script type="text/javascript" src="<?php echo Resource::js_common('jquery.form.js'); ?>"></script>
<script type="text/javascript" src="<?php echo Resource::js_common('yuqi_utils.js'); ?>"></script>
<script type="text/javascript">
$(function(){
	$('#websiteBaseinfoForm').ajaxForm( {
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