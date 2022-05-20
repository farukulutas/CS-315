void main() {
  String val0 = "val0";
  int count = 0;
  int otherCount = 0;
  
  // PRETEST
  print("Pretest with while loop");
  
  // Values before the test
  print("Before the test, value of val0: $val0");
  print("Before the test, value of count: $count");
  
  // In pretest, before the instructions within the loop are performed, 
  // the condition required to continue looping is verified
  while (count < 3) {
    print("val0: $val0, count: $count");
    count += 1;
    val0 = "val$count";
  }
  
  // Values after the test
  print("After the test, value of val0: $val0");
  print("After the test, value of count: $count");
  
  // Pretest completed. 
  // The second while loop did not work. 
  // Because the value is checked before execution.
  while (count < 3) {
    print("val0: $val0, count: $count");
    count += 1;
    val0 = "val$count";
  }
   
  if ( count <= 3 ) {
    print("Pretest completed. The second while loop did not work. Since the value is checked before execution. \n");
  }
  
  // POST-TEST
  print("Post-test with do-while loop");
  
  // values are refreshed
  val0 = "val0";
  count = 0;
  
  // Values before the test
  print("Before the test, value of val0: $val0");
  print("Before the test, value of count: $count");
  
  // The condition is placed at the conclusion of the loop, 
  // and if the condition is true, the loop is terminated with the keyword EXIT.
  do {
    print("val0: $val0, count: $count");
    count += 1;
    val0 = "val$count";
  } while (count < 3);
  
  // Values after the test
  print("After the test, value of val0: $val0");
  print("After the test, value of count: $count");
  
  // The condition is placed at the conclusion of the loop, 
  // and if the condition is true, the loop is terminated with the keyword EXIT.
  do {
    print("val0: $val0, count: $count");
    count += 1;
    val0 = "val$count";
  } while (count < 3);
  
  print("After the second test, value of val0: $val0");
  print("After the second test, value of count: $count");
  
  // Post-test completed. The second while loop ran once. Since the value is checked after execution.
  if ( count > 3 ) {
    print("Post-test completed. The second while loop ran once. Since the value is checked after execution. \n");
  }
  
  // Unlabeled Loop Test
  print("Unlabeled test while loop");
    
  // values are refreshed
  val0 = "val0";
  count = 0;
  
  // Values before the test
  print("Before the test, value of val0: $val0");
  print("Before the test, value of count: $count");
  
  // The break statement ends the loop with exit.
  // Since this is unlabeled, it worked only in the closest loop.
  while (otherCount < 2) {
    print("Outer while loop otherCount:$otherCount");
    count = 0;
    while (count < 3) {
      print("val0: $val0, count: $count");
      count += 1;
      val0 = "val$count";
      if ( count == 2 ) {
        print("Break found, exited loop at 2");
        break;
      }
    }
    otherCount += 1;
  }
  
  // Values after the test
  print("After the test, value of val0: $val0");
  print("After the test, value of count: $count");
  
  // values are refreshed
  val0 = "val0";
  count = 0;
  otherCount = 0;
  
  // Values before the test
  print("Before the test, value of val0: $val0");
  print("Before the test, value of count: $count");
  
  // Break test completed
  print("Unlabeled Break test completed. \n");
  
  // The continue statement skips the iteration.
  // Since this is unlabeled, it worked only in the closest loop.
  while (otherCount < 2) {
    print("Outer while loop otherCount:$otherCount");
    count = 0;
    while (count < 3) {
      count += 1;
      val0 = "val$count";
      if ( count == 2 ) {
        print("Continue found, skipped loop at 2");
        continue;
      }
      print("val0: $val0, count: $count");
    }
    otherCount += 1;
  }
  
  // Values after the test
  print("After the test, value of val0: $val0");
  print("After the test, value of count: $count");
  
  // Continue test completed
  print("Unlabeled continue test completed. \n");
  
  // Labeled Loop Test
  print("Labeled test while loop");
    
  // values are refreshed
  val0 = "val0";
  count = 0;
  otherCount = 0;
  
  // Values before the test
  print("Before the test, value of val0: $val0");
  print("Before the test, value of count: $count");
  
  // The break statement ends the loop with exit.
  // Since this is labeled, it worked in the specified label's loop.
  outerBreak:
  while (otherCount <= 2) {
    print("Outer while loop otherCount:$otherCount");
    count = 0;
    otherCount += 1;
    while (count < 3) {
      print("val0: $val0, count: $count");
      count += 1;
      val0 = "val$count";
      if ( count == 2 ) {
        print("Break found, exited loop at 2");
        break outerBreak;
      }
    }
  }
  
  // Values after the test
  print("After the test, value of val0: $val0");
  print("After the test, value of count: $count");
  
  // values are refreshed
  val0 = "val0";
  count = 0;
  otherCount = 0;
  
  // Values before the test
  print("Before the test, value of val0: $val0");
  print("Before the test, value of count: $count");
  
  // Break test completed
  print("Labeled Break test completed. \n");
  
  // The continue statement skips the iteration.
  // Since this is labeled, it worked in the specified label's loop.
  outerContinue:
  while (otherCount <= 2) {
    print("Outer while loop otherCount:$otherCount");
    count = 0;
    otherCount += 1;
    while (count < 3) {
      count += 1;
      val0 = "val$count";
      if ( count == 2 ) {
        print("Continue found, skipped loop at 2");
        continue outerContinue;
      }
      print("val0: $val0, count: $count");
    }
  }
  
  // Values after the test
  print("After the test, value of val0: $val0");
  print("After the test, value of count: $count");
  
  // Continue test completed
  print("Labeled continue test completed. \n");
}