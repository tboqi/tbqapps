<?php
//preg_match('/[^a-zA-Z0-9]/', 'abcd!123$efg&lkj000', $match);
//preg_match('/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/', 'a.b@dd.coma.b@dd.coma.b@dd.com', $match);
//preg_match_all('/^[a-zA-Z0-9]+/', 'abcd!123$efg&lkj000', $match);
//print_r($match);

//if(eregi("^[a-zA-Z]://(\w(-\w)*)(\.(\w(-\w)*))*(\?\s*)?$", 'http://xtg50018.blog.163.com/blog/static/8111322220102475023299' )) {
//	echo 1;
//} else {
//	echo 0;
//}

/*
$str = 'a1234';
if (preg_match("/^[a-zA-Z0-9]{4,16}$/", $str)) {
echo "验证成功";} else {
echo "验证失敗";}
*/

$str = '15克';
if (preg_match("/^[0-9]+(克|两)$/", $str, $arr)) {
	print_r($arr);
} else {
	echo "222222222\n";
}
//$str = 'sichuanpaocai_16.html';
//if (preg_match("/^[0-9]*.html$/", $str)) {
//	echo "验证成功";
//} else {
//	echo "验证失敗";
//}
