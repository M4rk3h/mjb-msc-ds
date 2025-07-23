# Python Programming Exercise 3
# Ex-9
def fullName(first,last):
    # Return a full name, neastly formatted
    fullname = first + " " + last
    return fullname.title()

person = fullName("mArK", "bAbEr")
print(person)