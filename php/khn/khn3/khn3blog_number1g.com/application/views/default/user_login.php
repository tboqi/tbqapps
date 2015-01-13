<form id="formUserLogin" method="post" action="<?php echo url::site ( 'user/login' ); ?>" class="uniForm">
<fieldset>
	<h3>登录</h3>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 帐号</label> 
		<input name="username" id="username" size="35" maxlength="50" type="text" class="textInput required validateCallback my_code_callback" />
		<p class="formHint"></p>
	</div>
	<div class="ctrlHolder">
		<label for=""><em>*</em> 密码</label>
		<input name="password" id="password" size="35" maxlength="50" type="password" class="textInput validateEmail" />
		<p class="formHint"></p>
	</div>
</fieldset>
<div class="buttonHolder">
	<button type="submit" class="primaryAction">Submit</button>
</div>
<input type="hidden" name="url" value="<?php echo $url; ?>" />
</form>
<script>
$(function(){
	form_submit('formUserLogin');
});
</script>