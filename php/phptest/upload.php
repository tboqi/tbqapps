<?php
if($_SERVER['REQUEST_METHOD'] == "POST"){
  
  $uploaddir = 'D:/chentuinibak/test/';
  $uploadfile = $uploaddir. $_FILES['fileField']['name'];
  print "<pre>";
  if (move_uploaded_file($_FILES['fileField']['tmp_name'], $uploaddir . $_FILES['fileField']['name'])) {
     print "File is valid, and was successfully uploaded.  Here's some more debugging info:/n";
     print_r($_FILES);
  } else {
     print "Possible file upload attack!  Here's some debugging info:/n";
     print_r($_FILES);
  }
  print "</pre>";
  exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
<input type="hidden" name="MAX_FILE_SIZE" value="3000000">
  <input type="file" name="fileField" id="fileField" />
  <input type="submit">
</form>
</body>
</html>
