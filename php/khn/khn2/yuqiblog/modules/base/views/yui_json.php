<?php
header ( 'Content-type: application/json' );
?>
{
"recordsReturned":<?php
echo $recordsReturned;
?>,
"totalRecords":<?php
echo $totalRecords;
?>,
"startIndex":<?php
echo $startIndex;
?>,
"sort":"<?php
echo $sort;
?>",
"dir":"<?php
echo $dir;
?>",
"records":
    [<?php
				$array = array ();
				foreach ( $result as $row ) {
					$array [] = json_encode ( $row );
				}
				echo implode ( ', ', $array );
				?>]
}