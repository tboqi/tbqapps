<?php defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' ); ?>

<div class="box">
<form method="post" action="<?php echo url::site ( 'user/login' ); ?>">
	<input type="text" name="username" id="username" /><br />
	<input type="password" name="password" id="password" /><br />
	<input type="hidden" name="url" value="<?php echo $url; ?>" />
	<input type="submit" />
</form>
</div>
