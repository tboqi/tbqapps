<html>
<head>
<script type="text/javascript" src="jquery-1.2.3.js"></script>
<script type="text/javascript" src="jquery.form.js"></script>

<script type="text/javascript">
// wait for the DOM to be loaded
$().ready(function() {
// bind 'myForm' and provide a simple callback function
$('#myForm').ajaxForm(function() {
    alert("Thank you for your comment!");
  });
});

function append() {
  $('#actionplantable').append("<tr><td><input type=\"text\" name=\"name2\" /></td></tr>");
}
</script>
</head>
<body>
<form id="myForm" action="append2.php" enctype="multipart/form-data" method="post"> 
<table id="actionplantable" border="0" cellpadding="0" cellspacing="0">
<tr><td>
Name: <input type="text" name="name" /> 
<input type="submit" value="Submit Comment" /> 
<input type="button" value="append" onclick="append();" /> 
</td></tr>
</table>
</form>
</body>
</html
