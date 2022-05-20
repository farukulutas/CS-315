val0 = "val0";
count = 0;
otherCount = 0;
# PRETEST
print("Pretest with while loop\n",end = "");
# Values before the test
print("Before the test, value of val0: ", val0, "\n",end="");
print("Before the test, value of count: ", count, "\n",end="");
# In pretest, before the instructions within the loop are performed,
# the condition required to continue looping is verified
while (count < 3) :
    print("val0: ", val0, " count: ", count, "\n",end="");
    count += 1;

# Values after the test
print("After the test, value of val0: ", val0, "\n",end="");
print("After the test, value of count: ", count, "\n",end="");
# Pretest completed.
# The second while loop did not work.
# Because the value is checked before execution.
while (count < 3) :
    print("val0: " + val0 + " count: ", count, "\n",end="");
    count += 1;

if (count <= 3) :
    print("Pretest completed. The second while loop did not work.", "\n",end="");
    print("Since the value is checked before execution. \n\n",end="");

# POST-TEST
print("Post-test with do-while loop \n",end = "");
# values are refreshed
val0 = "val0";
count = 0;
# Values before the test
print("Before the test, value of val0: ", val0, "\n",end="");
print("Before the test, value of count: ", count, "\n",end="");
# The condition is placed at the conclusion of the loop,
# and if the condition is true, the loop is terminated with the keyword EXIT.
while(True) :
    print("val0: ", val0, " count: ", count, "\n",end="");
    count += 1;
    if((count < 3) == False) : break;

# Values after the test
print("After the test, value of val0: ", val0, "\n",end="");
print("After the test, value of count: ", count, "\n",end="");
# The condition is placed at the conclusion of the loop,
# and if the condition is true, the loop is terminated with the keyword EXIT.
while(True) :
    print("val0: ", val0, " count: ", count, "\n",end="");
    count += 1;
    if((count < 3) == False) : break;

print("After the second test, value of val0: ", val0, "\n",end="");
print("After the second test, value of count: ", count, "\n",end="");
# Post-test completed. The second while loop ran once. Since the value is checked after execution.
if (count > 3) :
    print("Post-test completed. The second while loop ran once. \n",end = "");
    print("Since the value is checked after execution. \n\n",end = "");

# Unlabeled Loop Test
print("Unlabeled test while loop \n",end = "");
# values are refreshed
val0 = "val0";
count = 0;
# Values before the test
print("Before the test, value of val0: ", val0, "\n",end="");
print("Before the test, value of count: ", count, "\n",end="");
# The break statement ends the loop with exit.
# Since this is unlabeled, it worked only in the closest loop.
while (otherCount < 2) :
    print("Outer while loop otherCount: " + str(otherCount) + " \n",end = "");
    count = 0;
    while (count < 3) :
        print("val0: " + str(val0) + " count: " + str(count) + " \n",end = "");
        count += 1;
        if (count == 2) :
            print("Break found, exited loop at 2 \n",end = "");
            break;
        
    
    otherCount += 1;

# Values after the test
print("After the test, value of val0: ", val0, "\n",end="");
print("After the test, value of count: ", count, "\n",end="");
# values are refreshed
val0 = "val0";
count = 0;
otherCount = 0;
# Values before the test
print("Before the test, value of val0: ", val0, "\n",end="");
print("Before the test, value of count: ", count, "\n",end="");
# Break test completed
print("Unlabeled Break test completed. \n\n",end = "");
# The continue statement skips the iteration.
# Since this is unlabeled, it worked only in the closest loop.
while (otherCount < 2) :
    print("Outer while loop otherCount: " + str(otherCount) + " \n",end = "");
    count = 0;
    while (count < 3) :
        count += 1;
        if (count == 2) :
            print("Continue found, skipped loop at 2 \n",end = "");
            continue;
        
        print("val0: " + str(val0) + " count: " + str(count) + " \n",end = "");
    
    otherCount += 1;

# Values after the test
print("After the test, value of val0: ", val0, "\n",end="");
print("After the test, value of count: ", count, "\n",end="");
# Continue test completed
print("Unlabeled continue test completed. \n\n",end = "");