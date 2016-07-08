<html>
<head>
<title>接口列表</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.min.js"></script>
<style type="text/css">
body {
	background-color: #fff;
	margin: 40px;
	font-family: Lucida Grande, Verdana, Sans-serif;
	font-size: 14px;
	color: #4F5155;
}

a {
	color: #003399;
	background-color: transparent;
	font-weight: normal;
}

h1 {
	color: #444;
	background-color: transparent;
	border-bottom: 1px solid #D0D0D0;
	font-size: 16px;
	font-weight: bold;
	margin: 24px 0 2px 0;
	padding: 5px 0 6px 0;
}

code {
	font-family: Monaco, Verdana, Sans-serif;
	font-size: 12px;
	background-color: #f9f9f9;
	border: 1px solid #D0D0D0;
	color: #002166;
	display: block;
	margin: 14px 0 14px 0;
	padding: 12px 10px 12px 10px;
}
</style>
<script type="text/javascript">
function update(url, key, plist) {
	length = plist.length;
	if(length < 1) {
		$.post(url, 
		  	function(data){
		    	alert("刷新成功");
		  	}); 
	} else {
		arrayObj = new Array()
		$.each( plist, function(i, n){
			obj = $('#p' + key + '_' + n);
			$.each(obj, function(j, m) {
				//alert('i=' + i + ', j=' + j + ', v=' + m.value);
				arrayObj.push(m.value);
			});
		}); 
		$.post(url, { plist: arrayObj },
	  		function(data){
	    		alert("刷新成功");
	  		}); 
	}
	return false;
}
</script>
</head>
<body>

<h1>接口列表</h1>
<?php if(isset($interfaces) && is_array($interfaces) && count($interfaces) > 0) { ?>
<table>
	<?php foreach ($interfaces as $key => $interface) { 
		$parameters = unserialize($interface->parameters); ?>
	<tr>
		<td><?php echo $interface->name; ?></td>
		<td>参数：
			<?php 
			$updateParameters = $key;
			if (isset($parameters) && is_array($parameters) && count($parameters) > 0) {
				$s = $l = '';
				foreach ($parameters as $k => $v){ 
					$l .= $s . '\'' . $v . '\'';
					$s = ',';
					echo $v . '=<input type="text" name="p' . $key . '[' . $v . ']" id="p' . $key . '_' . $v . '" size="10">'; 
				}
				$updateParameters = $key . ',' . $l;
			} else {
				$l = '';
				echo '无';
			}
			?>
		</td>
		<td>缓存时间：<?php echo $interface->cachetime; ?>秒</td>
		<td><a href="<?php echo site_url("welcome/del/{$interface->id}"); ?>">del</a></td>
		<td><a href="<?php echo site_url("welcome/edit/{$interface->id}"); ?>">edit</a></td>
		<td><a href="#"
			onclick="update('<?php echo site_url("welcome/update/{$interface->id}"); ?>', <?php echo $key; ?>, [<?php echo $l;?>]);return false;">update</a></td>
	</tr>
	<?php } ?>
</table>
<?php } ?>
<div><a href="<?php echo site_url("welcome/add"); ?>">add</a></div>
</body>
</html>