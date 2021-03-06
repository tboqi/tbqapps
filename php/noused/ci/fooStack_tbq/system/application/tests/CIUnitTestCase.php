<?php

/*
* fooStack, CIUnit for CodeIgniter
* Copyright (c) 2008-2009 Clemens Gruenberger
* Released under the MIT license, see:
* http://www.opensource.org/licenses/mit-license.php
*/

/**
* Extending the default phpUnit Framework_TestCase Class
* providing eg. fixtures, custom assertions, utilities etc.
*/
class CIUnit_TestCase extends PHPUnit_Framework_TestCase {

  function __construct($name = NULL, array $data = array(), $dataName = '')
  {
    //$args = func_get_args();
    //call_user_func_array(array($this, 'parent::__construct'), $args);
    parent::__construct($name, $data, $dataName);
    $this->CI = &get_instance();
    //log_message('debug', get_class($this).' CIUnit_TestCase initialized');
  }

  /**
  * loads a database fixture
  * for each given fixture, we look up the yaml file and insert that into the corresponding table
  * names are by convention
  * 'users' -> look for 'users_fixt.yml' fixture: 'fixtures/users_fixt.yml'
  * table is assumed to be named 'users'
  * dbfixt can have multiple strings as arguments, like so:
  * $this->dbfix('users', 'items', 'prices');
  */
  function dbfixt()
  {
    $this->CI->db = $this->CI->config->item('db');

    $fixts = func_get_args();
    $this->load_fixt($fixts);

    foreach( $fixts as $fixt )
    {
      $fixt_name = $fixt . '_fixt';
      CIUnit::$fixture->load($fixt, $this->$fixt_name);
    }

    log_message('debug', 'Table fixtures "' . join('", "', $fixts) . '" loaded');
  }

  /**
  * fixture wrapper, for arbitrary number of arguments
  */
  function fixt()
  {
    $fixts = func_get_args();
    $this->load_fixt($fixts);
  }

  /**
  * loads a fixture from a yaml file
  */
  protected function load_fixt($fixts)
  {
    foreach ( $fixts as $fixt )
    {
      $fixt_name = $fixt . '_fixt';
      $this->$fixt_name= CIUnit::$spyc->YAMLLoad(
        TESTSPATH . 'fixtures/' . $fixt . '_fixt.yml'
      );
    }
  }

  /**
  * filters an array of values (or arrays) so that $key=>$value pairs of filter
  * are satisfied by the array. $value can be a regular expression for 2dim arr,
  * or $key if its a one dim array
  */
  function filter_arr($array, $filter)
  {
    $out=array();
    foreach ( $array as $key => $val )
    {
        $add_row = false;
        if ( is_array($val) )
        {
            //2-dim array
            foreach ( $filter as $field => $to_match )
            {
               if ( isset($val[$field]) )
               {
                 if ($val[$field] == $to_match) $add_row = true;

                 if ($this->is_regexp($to_match) &&
                     preg_match($to_match, $val[$field]) )
                 {
                    $add_row = true;
                 }
               }
            }
        }
        else
        {
             //1-dim array
             if ( is_string($filter) )
             {
                $to_match = $filter;
             }
             else
             {
                $to_match = $filter[0];
             }

             if ( $val == $to_match ) $add_row = true;
             //additional key check filter

             if( $this->is_regexp($to_match) &&
                 preg_match($to_match, $val) )
             {
                $add_row = true;
             }

             if( isset($filter[1]) &&
                 $this->is_regexp($filter[1]) &&
                 !preg_match($filter[1], $key) )
             {
                $add_row = false;
             }
        }
        if ($add_row) $out[$key] = $val;
    }
    return $out;
  }

    /**
    * very simple test to see if string looks like a regular expression
    * but its just a first check for the obvious
    */
    function is_regexp($to_match)
    {
        if (substr($to_match, 0, 1) == '/' &&
            (substr($to_match,-1) == '/' ||
             substr($to_match,-2) == '/i') )
        {
            return True;
        }
        return False;
    }

    /**
    * simple timer function
    * start timer with: $start = $this->timeit();
    * stop timer with: $taken_time = $this->timeit($start);
    * can be done unlimited times for arbitrary starting points
    */
    function timeit($timearr=array())
    {
        if ( $timearr != array() )
        {
            $end = explode(' ', microtime());
            return $end[0]-$timearr[0]+$end[1]-$timearr[1];
        }
        else
        {
            return explode(' ', microtime());
        }
    }

//=== Custom CIUnit Assertions ===

    /**
    * asserts that $arr2 wholly contains $arr
    */
    function assertContaining($arr, $arr2, $msg='')
    {
        //print_r($arr);
        //print_r($arr2);
        if( 0 != count(array_diff_assoc($arr, $arr2)) )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                 "The given array does not contain the expected array!\n\n" .
                 "Given: " . print_r($arr2, True) .
                 "\nExpected to contain: " . print_r($arr, True) .
                 "\nDifference: " . print_r(array_diff_assoc($arr, $arr2), True)
            );
        }
        //PHPUnit_Framework_Assert::assertEquals(0, count(array_diff_assoc($arr, $arr2)), $msg);
    }


    /**
    * asserts an integer difference
    */
    function assertDifference($diff, $count1, $count2)
    {
        PHPUnit_Framework_Assert::assertEquals($diff, $count2-$count1);
    }


    /**
    * asserts an integer difference, with calling of an action in between);
    */
    function assertDifferenceOfAction($diff, $count1, $action, $count2)
    {
        PHPUnit_Framework_Assert::assertEquals($diff, $count2-$count1);
    }


    /**
    * asserts a key in the error array returned by the "errors()" method of that object
    */
    function assertContainsError($key, $obj)
    {
        $errors = $obj->errors();
        if ( !isset($errors[$key]) )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                get_class($obj) . " doesn't contain expected error: " . $key
            );
        }
    }


    /**
    * asserts a number of elements of $arr
    */
    function assertCounts($count, $arr, $msg='')
    {
        if ( $count != count($arr) )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                "Array doesn't ".
                "contain right number of elements.\n\nExpected array count: ".
                "$count\nGot: " . count($arr)
            );
        }
    }


    /**
    * asserts that $num1 and $num2 neglecting a tiny fraction
    */
    function assertAlmostEquals($num1, $num2, $msg='')
    {
        $diff = abs($num1 - $num2);
        $epsilon = 0.000001;

        if ( $diff > $epsilon )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                "The expected number $num1 \n" .
                "differs from given number $num2 by $diff\n, " .
                "thus more than $epsilon.\n".
                $msg
            );
        }
    }

}


if (@include('PHPUnit/Extensions/SeleniumTestCase.php'))
{
class CIUnit_TestCase_Selenium extends PHPUnit_Extensions_SeleniumTestCase {

  function __construct()
  {
    $args = func_get_args();
    call_user_func_array(array($this, 'parent::__construct'), $args); 
    $this->CI = &get_instance();
    //log_message('debug', get_class($this).' CIUnit_TestCase initialized');
  }

  /**
  * loads a database fixture
  * for each given fixture, we look up the yaml file and insert that into the corresponding table
  * names are by convention
  * 'users' -> look for 'users_fixt.yml' fixture: 'fixtures/users_fixt.yml'
  * table is assumed to be named 'users'
  */
  function dbfixt()
  {
    //can have multiple strings as arguments!
    $fixts = func_get_args();
    $this->CI->db = $this->CI->config->item('db');

    $this->load_fixt($fixts);
    //log_message('debug', 'fixtures loaded as instance variables');
    foreach( $fixts as $fixt )
    {
      $fixt_name = $fixt . '_fixt';
      CIUnit::$fixture->load($fixt, $this->$fixt_name);
    }
    //log_message('debug', 'all fixtures loaded');
  }

  /**
  * fixture wrapper, for arbitrary number of arguments
  */
  function fixt()
  {
    $fixts = func_get_args();
    $this->load_fixt($fixts);
  }

  /**
  * loads a fixture from a yaml file
  */
  protected function load_fixt($fixts)
  {
    foreach( $fixts as $fixt ){
      $fixt_name = $fixt . '_fixt';
      $this->$fixt_name= CIUnit::$spyc->YAMLLoad(
        TESTSPATH . 'fixtures/' . $fixt . '_fixt.yml'
      );
    }
  }

  /**
  * filters an array of values (or arrays) so that $key=>$value pairs of filter
  * are satisfied by the array. $value can be a regular expression for 2dim arr,
  * or $key if its a one dim array
  */
  function filter_arr($array, $filter)
  {
    $out=array();

    foreach( $array as $key => $val )
    {
        $add_row=false;
        if( is_array($val) )
        {
            //2-dim array
            foreach( $filter as $field => $to_match )
            {
               if( isset($val[$field]) )
               {
                 if( $val[$field] == $to_match ) $add_row=true;

                 if( $this->is_regexp($to_match) &&
                     preg_match($to_match, $val[$field]) )
                 {
                    $add_row=true;
                 }
               }
            }
        }
        else
        {
            //1-dim array
             $to_match=$filter[0];

             if( $val == $to_match ) $add_row=true;

             //additional key check filter
             if( $this->is_regexp($to_match) &&
                 preg_match($to_match, $val) )
             {
                $add_row=true;
             }

             if( isset($filter[1]) &&
                 $this->is_regexp($filter[1]) &&
                 !preg_match($filter[1], $key) )
             {
                $add_row=false;
             }
        }
        if($add_row) $out[$key]=$val;
    }
    return $out;
  }

    /**
    * very simple test to see if string looks like a regular expression
    * but its just a first check for the obvious
    */
    function is_regexp($to_match)
    {
        if( substr($to_match, 0, 1) == '/' &&
           (substr($to_match,-1) == '/' ||
            substr($to_match,-2) == '/i') )
        {
            return False;
        }
        return false;
    }

    /**
    * simple timer function
    * start timer with: $start = $this->timeit();
    * stop timer with: $taken_time = $this->timeit($start);
    * can be done unlimited times for arbitrary starting points
    */
    function timeit( $timearr=array() )
    {
        if( $timearr!=array() )
        {
            $end = explode(' ', microtime());
            return $end[0]-$timearr[0]+$end[1]-$timearr[1];
        }
        else
        {
            return explode(' ', microtime());
        }
    }

//=== Custom CIUnit Assertions ===


    /**
    * asserts that $arr2 wholly contains $arr
    */
    function assertContaining($arr, $arr2, $msg='')
    {
        //print_r($arr);
        //print_r($arr2);
        if( 0 != count(array_diff_assoc($arr, $arr2)) )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                 "The given array does not contain the expected array!\n\n" .
                 "Given: " . print_r($arr2, True) .
                 "\nExpected to contain: " . print_r($arr, True) .
                 "\nDifference: " . print_r(array_diff_assoc($arr, $arr2), True)
            );
        }
        //PHPUnit_Framework_Assert::assertEquals(0, count(array_diff_assoc($arr, $arr2)), $msg);
    }


    /**
    * asserts an integer difference
    */
    function assertDifference($diff, $count1, $count2)
    {
        PHPUnit_Framework_Assert::assertEquals($diff, $count2-$count1);
    }


    /**
    * asserts an integer difference, with calling of an action in between);
    */
    function assertDifferenceOfAction($diff, $count1, $action, $count2)
    {
        PHPUnit_Framework_Assert::assertEquals($diff, $count2 - $count1);
    }


    /**
    * asserts a key in the error array returned by the "errors()" method of that object
    */
    function assertContainsError($key, $obj)
    {
        $errors = $obj->errors();
        if( !isset($errors[$key]) )
        {
            throw new PHPUnit_Framework_AssertionFailedError(get_class($obj) .
            " doesn't contain expected error: " . $key);
        }
    }


    /**
    * asserts a number of elements of $arr
    */
    function assertCounts($count, $arr, $msg="")
    {
        if( $count!=count($arr) )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                "Array doesn't contain right number of elements.\n\n" .
                "Expected array count: $count\nGot: " . count($arr)
            );
        }
    }

    /**
    * asserts that $num1 and $num2 neglecting a tiny fraction
    */
    function assertAlmostEquals($num1, $num2, $msg='')
    {
        $diff = abs($num1 - $num2);
        $epsilon = 0.000001;

        if ( $diff > $epsilon )
        {
            throw new PHPUnit_Framework_AssertionFailedError(
                "The expected number $num1 \n" .
                "differs from given number $num2 by $diff\n, " .
                "thus more than $epsilon.\n".
                $msg
            );
        }
    }

}
}