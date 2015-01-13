<?php
echo "<pre>";
//print_r(get_loaded_extensions());
print_r(get_extension_funcs('rot13'));
echo rot13_test('My first php extension');
echo "</pre>";