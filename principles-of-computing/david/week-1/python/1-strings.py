# Python Exercise 2
# Strings

name="mark"
surname="baber"
code="is4s761"
module="principles of computing"
print(name, surname, code, module)
print(name + surname + code + module)

student=name + " " + surname + " " + code + " " + module
print("student")

student=student.upper()
print(student)

print(len(student))
print(student[1])
print(student[0])
print(student[0:1])         # [0:1] get items from 0-1
print(student[1:4])
print(student[:30])
print(student[10:100])
print(student[0:len(student)])  # get student length
print(student[10:])
print(student[-1])
print(student[-9:-1])
print(student[-9:])
print(student[-9:len(student)])
print(student[-0])

print(student.replace("IS","CS"))
print(student.count("I"))
print(student.count("IS4"))

print(student.index("IS4")) # Finds index of instance of IS4
pos=student.index("IS4")    # Saves index as a variable pos
print(student[pos:pos+7])   # Prints Module Code
code=student[pos-1:pos+8]   # Assigns code to Module Code?
print(code)
code=="IS4S761"             # Is code IS4S761? True or False?

code==" IS4S761 "
code.lstrip()=="IS4S761 "   # Strip out left most space
code.rstrip()==" IS4S761"   # Strip out right most space
code.strip()=="IS4S761"     # Strip out all spaces