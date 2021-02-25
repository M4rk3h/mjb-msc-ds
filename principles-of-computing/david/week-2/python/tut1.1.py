# Python Programming Exercise 3
# Ex-1
# IS4S761
module=input("Please enter a USW Module Code: ")
modlen=len(module)
modStart=module[:2]
# Start the logic
# Make sure the input code starts with IS
if (modStart != "IS"): 
    print("Module doesn't start with IS, please try again")
    # If modStart doesn't begin with IS, end after printing. 
    # If true check the length of the module code.
elif (modlen == 7):
    print (modStart, "and", module, "appears to be correct. Well done.")
    # If the module starts with IS and has a length of 7, 
    # end after telling user it is correct.
elif (modlen < 7):
    print (module, "is less than 7 digits, please try again.")
    # If the module starts with IS and the length is < 7,
    # end after telling user it is < 7.
elif (modlen >7):
    print (module, "is greater than 7 digits, please try again.")
    # If the module starts with IS and the length is > 7,
    # end after telling user it is > 7.