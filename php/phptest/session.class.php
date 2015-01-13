<?php
/**
 * GD_session class

 */
class session {

  var $_crypt = 'HAz#Fu_aThaXaJe93Spe';
  function __construct( ) {
    $this->arr = array();
    $this->lifetime = ini_get( 'session.gc_maxlifetime' );

    session_set_save_handler(
      array(&$this, 'open'),
      array(&$this, 'close'),
      array(&$this, 'read'),
      array(&$this, 'write'),
      array(&$this, 'destroy'),
      array(&$this, 'gc')
    );

    register_shutdown_function('session_write_close');
    session_start();
  }
   
  function open( ) {
    return( TRUE );
  }

  function close( ) {
    return( TRUE );
  }

  function read( $sid ) {
    //1
    echo "read<br>" ;
    $this->arr["sid"] = $sid;
    return "read_" . $sid;
  }

  function write( $sid, $data ) {
    //2
    echo $sid.'<br>';
    echo $data.'<br>';
  }

  function destroy( $sid ) {
    $del = "DELETE FROM ".$this->tablePrefix.$this->tableName." WHERE sessionID = '$sid'";
    $this->execute( $del );
  }

  function gc( ) {
    $del = "DELETE FROM ".$this->tablePrefix.$this->tableName." WHERE session_time < " . time( ) - $this->lifetime;
    $this->execute( $del );
    return;
  }

  function make_crypt( $uname ) {
    $sql = "SELECT 1 FROM ".$this->tablePrefix.$this->tableName." WHERE session_id = '" . session_id() . "'";
    $request = $this->execute( $sql );
    if( count($request) < 1) {
      return( FALSE );
    }

    $sql = "UPDATE ".$this->tablePrefix.$this->tableName." SET session_crypt = AES_ENCRYPT('$uname', '$this->_crypt') WHERE session_id = '" . session_id() . "'";
    $this->execute( $sql );
  }

  function verify( $uname ) {
    $sql = "SELECT 1 FROM ".$this->tablePrefix.$this->tableName." WHERE session_id = '".session_id()."' AND session_crypt = AES_ENCRYPT('$uname','$this->_crypt')";
    $this->db->query( $sql );
    $request = $this->execute( $sql );
    return count($request);
  }


  public function kill( ) {
    foreach( $_COOKIE as $name ) {
      setcookie( $name, '', time() - 42000, '/' );
    }
     
    session_destroy( );
  }

  public function add( $field, $value ) {
    $_SESSION[$field] = $value;
  }


  public function remove( $field ) {
    unset( $_SESSION[$field] );
  }


  public function set_cookie( $name, $value, $timeout_seconds = 0 ) {
    if ( $timeout_seconds ) {
      $timeout_seconds += time();
    }
    setcookie( $name, $value, $timeout_seconds, '/' );
  }
}
new session();
$_SESSION['a1'] = array(1,2);
print_r($_SESSION);
unset( $_SESSION['a1'] );
?>