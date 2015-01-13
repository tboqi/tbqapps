<?php
print_r($_POST);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script src='jquery-1.2.3.pack.js' type='text/javascript'></script>
<script src='jquery.multiselects.packed.js' type='text/javascript'></script>
<script type="text/javascript">
$(document).ready(function() {
  $("#select_left").multiSelect("#select_right", {trigger: "#options_right"});
  $("#select_right").multiSelect("#select_left", {trigger: "#options_left"});
})
</script>
</HEAD>

<BODY>
<form action="" method="POST">
<select name="left[]" id="select_left" multiple="multiple">
  <option>Item 1</option>
  <option>Item 2</option>
</select></td>

<a id="options_right" href="#">move right</a>
<a id="options_left" href="#">move left</a>

<select name="right[]" id="select_right" multiple="multiple">
  <option>Item 3</option>
  <option>Item 4</option>
</select>
<input type="submit" />
</BODY>
</HTML>
