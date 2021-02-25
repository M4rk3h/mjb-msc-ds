# Python Programming Exercise 3
# Base
def greet_user(username):
    # Display a Simple Greeting
    print('Hello, ' + username.title() + "!")
    print(username.title(), "has",len(username),"Letters in it")

for x in range (1,10):
    print("User" ,x)
    user=input("What is your name? ")
    greet_user(user)