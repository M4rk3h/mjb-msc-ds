# Python Programming Exercise 3
# Ex-6
# A number raised to the third power is called a cube. 
# For example, the cube of 2 is written as 2**3 in Python. 
# Make a list of the first 10 cubes 
# (that is, the cube of each integer from 1 through 10), 
# and use a for loop to print out the value of each cube.
# import time module
import time
# set variable
x = 0
y = 11
def noCubed():
    for x in range(y):
        print(x ** 3)
        x =+ 1

timerStart = time.time()
noCubed()
# print
print("Time it took to cube numbers", x, "to", y,":", format(time.time() - timerStart, '.2f'), "seconds")