# Python Programming Exercise 3
# Ex-10

names = ["David", "Gaylor", "Mark", "Sue", "Nathan", "Eric", "Eleri", "Jim"]

def greetName(names):
    tutName = "Hello" 
    return tutName.title()

def tutorNames():
    for x in range(len(names)): 
        print(names[x], "has", len(names[x]), "letters in their name.")
    
person = greetName(tutorNames())
print(person)