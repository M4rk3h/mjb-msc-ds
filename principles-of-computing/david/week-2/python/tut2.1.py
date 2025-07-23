# Python Programming Exercise 3
# Ex-5
# Write a program to calculate the SUM of all numbers 
# between 1 and 1 million.  There’s no need to print 
# out the sum as you go along, just the total at the end.  
# How long did it take to run?

# import libraries
import time
# set variables
x = 0
y = 1000001
# make a function to count to y
def countTo():
    for x in range(y):
        x += 1
        #print("ARGH", x)

# Start a timer and run function countTo
timerStart = time.time()
countTo()
# print
print("Counting to", y, "took", format(time.time() - timerStart, '.2f'), "seconds ;)")
