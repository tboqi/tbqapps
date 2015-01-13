<?php
error_reporting(0);
$w = (int)$_POST['width'];
$h = (int)$_POST['height'];
$img = imagecreatetruecolor($w, $h);
imagefill($img, 0, 0, 0x669966);
$rows = 0;
$cols = 0;
for($rows = 0; $rows < $h; $rows++){
	$c_row = explode(",", $_POST['px' . $rows]);
	for($cols = 0; $cols < $w; $cols++){
		$value = $c_row[$cols];
		if($value != ""){
			$hex = $value;
			while(strlen($hex) < 6){
				$hex = "0" . $hex;
			}
			$r = hexdec(substr($hex, 0, 2));
			$g = hexdec(substr($hex, 2, 2));
			$b = hexdec(substr($hex, 4, 2));
			$test = imagecolorallocate($img, $r, $g, $b);
			imagesetpixel($img, $cols, $rows, $test);
		}
	}
}
$filename="upfiles/".date("Y-m-d-H-i-s",time()).".jpg";
header("Content-type:image/jpeg");
imagejpeg($img, $filename, 90);
header("Location: $filename");
?>