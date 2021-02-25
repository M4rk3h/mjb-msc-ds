# Declare Variables
hours=input('Input hours worked: ')
rate=input('Input pay rate: ')
# print pay depending on hours worked.
if int(hours) < 40:
    pay = int(hours) * int(rate)
else:
    pay = 40 * int(rate) + (int(hours) - 40) * int(rate) * 1.5
print(pay)