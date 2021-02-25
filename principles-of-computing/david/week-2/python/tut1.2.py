# Python Programming Exercise 3
# Ex-2
# Write a program to input a person’s age and correctly calculate the Ticket Fare from Treforest to Cardiff,
# (where children under 2 travel free; 
# children under 5 pay £1; 
# children under 16 pay £2; 
# OAPs aged 60 and over pay £3;
# and everyone else pays £5).
userAge=int(input("Please enter your age: "))
if (userAge <= 2): 
    print("You're ticket fare is free, due to your age being ", userAge)
    # check age is less than 2
elif (userAge >2) and (userAge <5):
    print("You're ticket fare is £1, due to your age being ", userAge)
    # check age is less than 5
elif (userAge >5) and (userAge <16):
    print("You're ticket fare is £2, due to your age being ", userAge)
    # check age is less than 16
elif (userAge >= 60):
    print("You're ticket fare is £3, due to your age being ", userAge)
    # check age is over 60
else:
    print("You're ticket fare is £5, due to your age being ", userAge)