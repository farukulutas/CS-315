<!DOCTYPE html>
<html>
<body>
<?php
// In this program, the scope of the php language is examined.
/* global scope */ 
$und_msg = "und msg\n";
$glb_msg = "glb\n";

/*
No global and non-static variables can be accessed from different scopes.
function outer()
{
    $outer_msg = "outer_msg";
    function inner()
    {
        $inner_msg = "inner msg";
        echo "In inner func; outer_msg: $outer_msg, inner_msg: $inner_msg\n"; // PHP Warning:  Undefined variable $outer_msg
    }
    
    echo "In outer func; outer_msg: $outer_msg, inner_msg: $inner_msg\n"; // PHP Warning:  Undefined variable $inner_msg
    inner();
}
*/

// Before using the global keyword, the glb variable was printed by dynamic scoping 
// while it was statically searched and undefined variable was given an error.
function global_scope_test()
{ 
    // This gives "PHP Warning: Undefined variable $und_msg"
    // echo $und_msg; /* reference to local scope variable */ 
    
    global $glb_msg;
    echo $glb_msg; // prints glb since it is defined in func scope as global
    echo $GLOBALS['und_msg']; // prints und msg
}

// Since it is looked at statically here, it is first checked to see 
// if there are counters in its scope and that variable is printed.
function static_test()
{
    static $counter = 0;
    echo "Static Test Counter: $counter\n"; // prints counter i.e. 0 then 1
    count_static();
}

// Since it is looked at statically here, it is first checked to see 
// if there are counters in its scope and that variable is printed.
function count_static()
{
    $counter = 5;
    echo "Static Test Counter: $counter\n"; // prints counter i.e. 0 then 1
}

// It does dynamic scoping because the global keyword is used.
$non_static_counter = 3;
function non_static_test()
{
    global $non_static_counter;
    //$non_static_counter = 0; // Since the variable is defined, it does lexical scoping.
    echo "Non Static Test Counter: $non_static_counter\n"; // prints 0
    $non_static_counter++;
}

/*
function static_variables(){
    static $int = 0; // OK.
    // Static variables run in compile-time so
    static $int = sqrt(121); // PHP Fatal error: Cannot redeclare sqrt()

    echo $int;
}
*/

global_scope_test();
static_test();
static_test();
non_static_test();
non_static_test();
// echo $counter, $non_static_counter\n" // Variables defined inside the function cannot be accessed externally
// outer(); // No global and non-static variables can be accessed from different scopes.
?>
</body>
</html>