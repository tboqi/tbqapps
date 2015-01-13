<div id="container">
<form id="fm-form" method="post" action="<?php echo url::site('admin/user/editPassword'); ?>">
<fieldset>
	<legend>修改密码</legend>
	<div class="fm-opt">
		<label for="newPass">新密码:</label>
		<input id="newPass" name="newPass" type="password"/>
	</div>
	<div class="fm-opt">
		<label for="newPass2">新密码确认:</label>
		<input name="newPass2" id="newPass2" type="password"/>
	</div>
</fieldset>
<div class="fm-req" id="fm-submit">
	<input type="submit" value="Submit" name="Submit">
</div>
</form>
</div>
<script type="text/javascript">
$(document).ready(function() { 
	form_submit('fm-form');
});
</script>