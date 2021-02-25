# Python Programming Exercise 3
# Ex-8
# Write a Program to allow the user to input ten numbers 
# (one at a time) and calculate and output the average of them 
# (using a WHILE loop).
# set variable
x=0
y=10
avgArr = []
# Declare function
while x<y:
    avgArr.append(input("Insert a number: "))
    x+=1
    #print here to check append worked.
    print(x)

#convert avgArr to int
avgArr = list(map(int, avgArr))
# find out the average
avgArr = (sum(avgArr) / y)
# print the average
print("The average of the ", y, "numbers is ", avgArr)