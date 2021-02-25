# Python Programming Exercise 3
# Ex-3
# Write a Program to input the number of hours worked by an employee, 
# their rate of pay and then calculate and output the total pay.  
# For any additional hours worked over and above 40 hours, 
# pay is calculated at time and a half.
# Declare Variables
hours=int(input('Input hours worked: '))
rate=int(input('Input pay rate: '))
# print pay depending on hours worked.
if int(hours) < 40:
    pay = int(hours) * int(rate)
else:
    pay = 40 * int(rate) + (int(hours) - 40) * int(rate) * 1.5
print(pay)