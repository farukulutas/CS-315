<?php
$val0 = "val0";
$count = 0;
$otherCount = 0;
  
// PRETEST
print("Pretest with while loop\n");
  
// Values before the test
echo "Before the test, value of val0: " , $val0, "\n";
echo "Before the test, value of count: " , $count, "\n";
  
// In pretest, before the instructions within the loop are performed, 
// the condition required to continue looping is verified
while ($count < 3) {
    echo "val0: " , $val0 , " count: " , $count, "\n";
    $count += 1;
}
  
// Values after the test
echo "After the test, value of val0: " , $val0, "\n";
echo "After the test, value of count: " , $count, "\n";
  
// Pretest completed. 
// The second while loop did not work. 
// Because the value is checked before execution.
while ($count < 3) {
    echo "val0: " + $val0 + " count: " , $count, "\n";
    $count += 1;
}
   
if ( $count <= 3 ) {
    echo "Pretest completed. The second while loop did not work.", "\n";
    echo "Since the value is checked before execution. \n\n";
}
  
// POST-TEST
print("Post-test with do-while loop \n");
  
// values are refreshed
$val0 = "val0";
$count = 0;
  
// Values before the test
echo "Before the test, value of val0: " , $val0, "\n";
echo "Before the test, value of count: " , $count, "\n";
  
// The condition is placed at the conclusion of the loop, 
// and if the condition is true, the loop is terminated with the keyword EXIT.
do {
    echo "val0: " , $val0 , " count: " , $count, "\n";
    $count += 1;
} while ($count < 3);
  
// Values after the test
echo "After the test, value of val0: " , $val0, "\n";
echo "After the test, value of count: " , $count, "\n";
  
// The condition is placed at the conclusion of the loop, 
// and if the condition is true, the loop is terminated with the keyword EXIT.
do {
    echo "val0: " , $val0 , " count: " , $count, "\n";
    $count += 1;
} while ($count < 3);
  
echo "After the second test, value of val0: " , $val0, "\n";
echo "After the second test, value of count: " , $count, "\n";
  
// Post-test completed. The second while loop ran once. Since the value is checked after execution.
if ( $count > 3 ) {
    print("Post-test completed. The second while loop ran once. \n");
    print("Since the value is checked after execution. \n\n");
}
  
// Unlabeled Loop Test
print("Unlabeled test while loop \n");
    
// values are refreshed
$val0 = "val0";
$count = 0;
  
// Values before the test
echo "Before the test, value of val0: " , $val0, "\n";
echo "Before the test, value of count: " , $count, "\n";
  
// The break statement ends the loop with exit.
// Since this is unlabeled, it worked only in the closest loop.
while ($otherCount < 2) {
    print("Outer while loop otherCount: $otherCount \n");
    $count = 0;
    while ($count < 3) {
      print("val0: $val0 count: $count \n");
      $count += 1;
      if ( $count == 2 ) {
        print("Break found, exited loop at 2 \n");
        break;
      }
    }
    $otherCount += 1;
}
  
// Values after the test
echo "After the test, value of val0: " , $val0, "\n";
echo "After the test, value of count: " , $count, "\n";
  
// values are refreshed
$val0 = "val0";
$count = 0;
$otherCount = 0;
  
// Values before the test
echo "Before the test, value of val0: " , $val0, "\n";
echo "Before the test, value of count: " , $count, "\n";
  
// Break test completed
print("Unlabeled Break test completed. \n\n");
  
// The continue statement skips the iteration.
// Since this is unlabeled, it worked only in the closest loop.
while ($otherCount < 2) {
    print("Outer while loop otherCount: $otherCount \n");
    $count = 0;
    while ($count < 3) {
      $count += 1;
      if ( $count == 2 ) {
        print("Continue found, skipped loop at 2 \n");
        continue;
      }
      print("val0: $val0 count: $count \n");
    }
    $otherCount += 1;
}
  
// Values after the test
echo "After the test, value of val0: " , $val0, "\n";
echo "After the test, value of count: " , $count, "\n";
  
// Continue test completed
print("Unlabeled continue test completed. \n\n");
  
// Labeled Loop Test
print("Labeled test while loop \n");
    
// values are refreshed
$val0 = "val0";
$count = 0;
$otherCount = 0;
  
// Values before the test
echo "Before the test, value of val0: " , $val0, "\n";
echo "Before the test, value of count: " , $count, "\n";
  
// The goto used to send flow of the program to a certain location in the code.
outerBreak:
while ($otherCount <= 2) {
    print("Outer while loop otherCount: $otherCount \n");
    $count = 0;
    $otherCount += 1;
    while ($count < 3) {
      print("val0: $val0 count: $count \n");
      $count += 1;
      if ( $count == 2 ) {
        print("Break found, exited loop at 2 \n");
        goto outerBreak;
      }
    }
}
  
// Values after the test
echo "After the test, value of val0: " , $val0, "\n";
echo "After the test, value of count: " , $count, "\n";
  
// Break test completed
print("Labeled goto test completed. \n");

/*
This statements create an error. Since into loop or switch is disallowed in PHP.
goto loop;
for($i=0,$j=50; $i<100; $i++) {
  while($j--) {
    loop:
  }
}
*/

?>