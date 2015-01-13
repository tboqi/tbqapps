<?php
$dbc=new com("adodb.connection"); 
$dbc->open("driver=microsoft access driver (*.mdb);dbq=e:\db1.mdb"); 
$rs=$dbc->execute("select * from dm_xzqh"); 
$i=0; 
while (!$rs->eof){ 
$i+=1;
print_r($rs->fields);
//$fld0=$rs->fields["代码"]; 
//$fld0=$rs->fields["Password"];
//.... 
//echo "$fld0->value $fld1->value ...."; 
$rs->movenext(); 
} 
$rs->close(); 
?>