<?php defined('SYSPATH') OR die('No direct access allowed.');

// Load core files
require SYSPATH.'core/utf8.php';
require SYSPATH.'core/Router.php';
require SYSPATH.'core/html.php';

header('Content-Type: text/html; charset=UTF-8');

Router::find_uri();
Router::setup();

echo 'Router::$arguments', '<br>';
var_dump(Router::$arguments);
echo 'Router::$complete_uri', '<br>';
var_dump(Router::$complete_uri);
echo 'Router::$controller', '<br>';
var_dump(Router::$controller);
echo 'Router::$controller_path', '<br>';
var_dump(Router::$controller_path);
echo 'Router::$current_uri', '<br>';
var_dump(Router::$current_uri);
echo 'Router::$method', '<br>';
var_dump(Router::$method);
echo 'Router::$query_string', '<br>';
var_dump(Router::$query_string);
echo 'Router::$routed_uri', '<br>';
var_dump(Router::$routed_uri);
echo 'Router::$rsegments', '<br>';
var_dump(Router::$rsegments);
echo 'Router::$segments', '<br>';
var_dump(Router::$segments);
echo 'Router::$$url_suffix', '<br>';
var_dump(Router::$url_suffix);


exit;
// Prepare the environment
Kohana::setup();

// End kohana_loading
Benchmark::stop(SYSTEM_BENCHMARK.'_kohana_loading');

// Start system_initialization
Benchmark::start(SYSTEM_BENCHMARK.'_system_initialization');

// Prepare the system
Event::run('system.ready');

// Determine routing
Event::run('system.routing');

// End system_initialization
Benchmark::stop(SYSTEM_BENCHMARK.'_system_initialization');

// Make the magic happen!
Event::run('system.execute');

// Clean up and exit
Event::run('system.shutdown');