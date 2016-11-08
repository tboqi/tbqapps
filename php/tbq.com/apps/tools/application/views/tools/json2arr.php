<div class="pageContent">
	<form method="post" action="<?php echo URL::site('tools/json2arr');?>" class="pageForm">
		<div class="pageFormContent" layoutH="56">
            <dl class="nowrap">
                <dt>json：</dt>
                <dd><textarea name="jsonstr" cols="80" rows="2"></textarea></dd>
            </dl>
		</div>
		<div class="formBar">
			<ul>
                <li><div class="button"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
    </form>
</div>
<div><pre></pre></div>
<script src="http://static.tbq.com/jquery/jquery.form.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
    var options={
        dataType:'json',
        beforeSubmit:function(formData, jqForm, options){
            //console.log('beforeSubmit');
            //console.log(formData);
            //console.log(jqForm);
            //console.log(options);
            return true;
        },
        success:function(responseText, statusText, xhr, $form){
            if(responseText.error_code==0){
                $('pre').html(responseText.data.str);
            }else{
                alert(responseText.msg);
            }
        },
        type:'post',
        timeout:300
    };
    $('form').ajaxForm(options);
})
</script>
