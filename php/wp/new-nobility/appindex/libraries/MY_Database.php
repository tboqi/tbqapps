<?php
class Database extends Database_Core {
	
	public function __construct($config = array()) {
		parent::__construct ( $config );
	}
	
	/**
	 * Runs a query into the driver and returns the result.
	 *
	 * @param   string  SQL query to execute
	 * @return  Database_Result
	 */
	public function query($sql = '') {
		if ($sql == '')
			return FALSE;
		
		if (($this->config ['table_prefix'] != '' and $this->config ['swap_pre'] != '') and ($this->config ['table_prefix'] != $this->config ['swap_pre'])) {
			$sql = preg_replace ( "/(\W)" . $this->config ['swap_pre'] . "(\S+?)/", "\\1" . $this->config ['table_prefix'] . "\\2", $sql );
		}
		
		// No link? Connect!
		$this->link or $this->connect ();
		
		// Start the benchmark
		$start = microtime ( TRUE );
		
		if (func_num_args () > 1) //if we have more than one argument ($sql)
{
			$argv = func_get_args ();
			$binds = (is_array ( next ( $argv ) )) ? current ( $argv ) : array_slice ( $argv, 1 );
		}
		
		// Compile binds if needed
		if (isset ( $binds )) {
			$sql = $this->compile_binds ( $sql, $binds );
		}
		
		// Fetch the result
		$result = $this->driver->query ( $this->last_query = $sql );
		
		// Stop the benchmark
		$stop = microtime ( TRUE );
		
		if ($this->config ['benchmark'] == TRUE) {
			// Benchmark the query
			self::$benchmarks [] = array ('query' => $sql, 'time' => $stop - $start, 'rows' => count ( $result ) );
		}
		
		return $result;
	}
}