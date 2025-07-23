# Python Programming Exercise 3
# Base
module=input("Please enter a USW Module Code: ")
modlen=len(module)
if modlen == 7:
    print (module, "is a 7 digit Code. Possibly Valid, WELL DONE!")
elif modlen <7:
    print (module, "is less than 7 digits, please try again.")
elif modlen >7:
    print (module, "is greater than 7 digits, please try again.")

