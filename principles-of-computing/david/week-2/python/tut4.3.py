# Python Programming Exercise 3
# Ex-9
def fullName(a,b,c=""):
    # Return a full name neatly formatted
    if c: # middle name
        fullName = a + " " + b + " " + c
    else:
        fullName = a + " " + b
    return fullName.title()

person = fullName ("mArK","jAmEs","BaBeR")
print(person)
person = fullName ("mArK","BaBeR")
print(person)