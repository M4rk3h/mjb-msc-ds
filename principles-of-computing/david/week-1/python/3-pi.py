forename="Mark "
middlename="James "
surname="Baber"
fullname=forename +middlename +surname
job="masters student"
age=28
# printing time
print(fullname)
print(fullname.title())
print(fullname.upper())
print(fullname.lower())
print(fullname.title() + ": " + job.title())
print(fullname, "is", age, "years old.")
print(fullname + " is " + str(age) + " years old.")

user=input("I am Python, what is your name?: ")
age=input("How old are you?: " )