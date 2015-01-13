<?php
// outputs the username that owns the running php/httpd process
// (on a system with the "whoami" executable in the path)
echo exec('/usr/local/bin/lame --decode /var/www/html/prod/ahjah/jboss/server/default/ahjah-download/128f1c6af3fe83fc35b2006663baed95.mp3 raw && /usr/local/bin/oggenc raw -o /var/www/html/prod/ahjah/jboss/server/default/ahjah-media/128f1c6af3fe83fc35b2006663baed95.ogg &');
?> 