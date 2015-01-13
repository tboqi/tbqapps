<?php
if (! (Auth::instance ()->logged_in ( 'ADMIN' ))) {
	?>
<script>location.href='<?php
	echo url::site ( 'user/login' );
	?>';</script>
<?php
}
?>