# In this program, scope analysis
# of the Perl language is performed.

# For a variable to be printed and found, it must be defined before print.
$other_name = "name before print"; # prints name before print
print "$other_name\n"; 
print "$name\n"; # prints new line (\n)

{
    $name = "name after print";
}

# declaration of global variable
$msg = "This is global msg.";
$count = 1;

# printing global variables
print $count." ".$msg."\n"; # prints 1 This is global msg.

# increment count to 2
$count++;

# block starting
{
	# Where the word my is used, a static variable is created and within its scope it does static scoping instead of a global variable.
	# The variable is defined as local when the keyword my is used.
	my $new_msg = "This is local msg.";
	
	# global variables can be accessed from different scopes.
	print $count." ".$msg."\n"; # prints 2 This is global msg.
	
	# increment count to 3
	$count++;
	
	print $count." ".$new_msg."\n"; # prints 3 This is local msg.
	
	# increment count to 4
	$count++;
}

# new_msg defined with "my" as local cannot be used outside of the block.
print "This is local message outside of block:".$new_msg."\n"; # not prints message

# declaring static scoping function
sub func {
	# Where the word my is used, a static variable is created and within its scope it does static scoping instead of a global variable.
	# If "my" keyword is used with the same variable name, 
	# it replaces the global variable where it is defined.
	my $msg = "This is local func msg with global variable name";
	print $count." ".$msg."\n"; # prints 4 This is local func msg with global variable name
	$count++;
}

# calling the function
func();
print $count." ".$msg."\n"; # prints This is global msg.

# The package is defined using the package keyword
package OurPack;
    # It remains in the package scope defined in the package
    # unless the keyword our is used.
    our $our_msg; # Dynamic scoping is started with the use of our keyword and our_msg variable is used unless otherwise stated.
    $our_msg = "This is our msg";
       
    # It remains in the package scope defined in the package 
    $packMsg;    
    $packMsg = "Package's variable";
   
# The package is defined using the package keyword
package Pack;
    print "Value of our msg from OurPack: ".$our_msg."\n"; # prints This is our msg
    print "Value of main msg: ".$main::msg."\n"; # prints This is global msg.
    print "Value of pack msg from OurPack: ".$packMsg."\n"; # prints new line