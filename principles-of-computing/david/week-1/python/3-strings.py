# Exercise 1
## Task 2
numbers = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
names = ["David", "Gaylor", "Mark", "Sue", "Nathan", "Eric"]
print(numbers)
print(names)
print(numbers[0:4])
print(names[-2])
print(len(names))
print(names[0].upper())

numbers=numbers+[55]
numbers.append(89)
print(numbers)
names=names+["Eleri"]
names.append("Jim")
print(names)
everything = names + numbers
print(everything)

del everything[18]         # delete by item/index number
everything.remove(89)      # delete a specific value
del everything[0]          # delete David
everything.remove("Jim")   # delete Jim
print(everything)

everything[0]="David"            # Insert David into 1st position
print(everything)                # Overwrites Gaylor!
everything.insert(1, "Gaylor")   # Slots Gaylor into 2nd position

print(names)          # ['David', 'Gaylor', 'Mark', 'Sue', 'Nathan', 'Eric', 'Eleri', 'Jim']
popped = names.pop()
print(popped)         # Jim
print(names)          # ['David', 'Gaylor', 'Mark', 'Sue', 'Nathan', 'Eric', 'Eleri']

popped = names.pop(2)
print(popped)         # Mark
print(names)          # ['David', 'Gaylor', 'Sue', 'Nathan', 'Eric', 'Eleri']

names.append("Jim")
names.append("Mark")
print(names)          #['David', 'Gaylor', 'Sue', 'Nathan', 'Eric', 'Eleri', 'Jim', 'Mark']
print(sorted(names))  #['David', 'Eleri', 'Eric', 'Gaylor', 'Jim', 'Mark', 'Nathan', 'Sue']
print(names)          #['David', 'Gaylor', 'Sue', 'Nathan', 'Eric', 'Eleri', 'Jim', 'Mark']
names.sort()
print(names)          #['David', 'Eleri', 'Eric', 'Gaylor', 'Jim', 'Mark', 'Nathan', 'Sue']
names.sort(reverse=True)
print(names)          #['Sue', 'Nathan', 'Mark', 'Jim', 'Gaylor', 'Eric', 'Eleri', 'David']
names.reverse()
print(names)          #['David', 'Eleri', 'Eric', 'Gaylor', 'Jim', 'Mark', 'Nathan', 'Sue']

myname=list("David Kidner")
print(myname)
months=list("JFMAMJJASOND")
print(months)

fruit = ("banana", "raspberry", "orange", "apple")
print(fruit)
print(len(fruit))
print(fruit.index("raspberry"))
print(fruit[1])
fruit[1] #="cherry"   # What Happens?