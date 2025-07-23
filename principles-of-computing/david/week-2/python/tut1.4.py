# Python Programming Exercise 3
# Ex-4
# Write a Program to find the largest of 3 inputted numbers 
# (x1, x2, x3) using either the IF, IF-ELSE, or IF-ELIF-ELSE statement.
# There’s a number of ways of doing this, so think about it first.
# Input 3 numbers
x1 = int(input("Please enter a number: "))
x2 = int(input("Please enter a number: "))
x3 = int(input("Please enter a number: "))
maxVal = int(0)
# Start logic test
if (x1 > x2) and (x1 > x3):
    print("x1 is bigger than x2 and x3")
    maxVal = x1
elif (x2 > x1) and (x2 > x3):
    print(" x2 is bigger than x1 and x3")
    maxVal = x2
elif (x3 > x1) and (x3 > x2):
    print(" x3 is bigger than x1 and x2")
    maxVal = x3
# Print the Max
print(maxVal, "is bigger than ", x2, "and ", x3)