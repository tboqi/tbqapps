<?php
//system("/usr/bin/mp3splt /root/mp3splt_installation/sample.mp3 0.0 0.30 -o /root/mp3splt_installation/sample_split3.mp3");
echo '<pre>';

// Outputs all the result of shellcommand "ls", and returns
// the last output line into $last_line. Stores the return value
// of the shell command in $retval.
$last_line = system('/bin/ls /root/mp3test', $retval);

// Printing additional info
echo '
</pre>
<hr />Last line of the output: ' . $last_line . '
<hr />Return value: ' . $retval .'<hr />';
print_r($last_line);
?> 