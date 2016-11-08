<div class="pageContent">
	<form method="post" action="<?php echo URL::site('tools/md5');?>" class="pageForm">
		<div class="pageFormContent" layoutH="56">
            <dl class="nowrap">
                <dt>str：</dt>
                <dd><textarea name="str" cols="80" rows="2"></textarea></dd>
            </dl>
		</div>
		<div class="formBar">
			<button type="submit">保存</button>
            <button type="button" class="close">取消</button>
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
