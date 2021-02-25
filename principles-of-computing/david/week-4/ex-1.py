# OS Module
import os
# create variable home with cwd
home = os.getcwd()
# print the cwd
print("Current working directory is", home)
# List the entire directory
print("Can list the entire directory", os.listdir())
# Create a new directory
# os.mkdir("test")
# rename directory
# os.rename("test", "old")
# delete directory
os.rmdir("old")
# open chrome in python
# os.system('start chrome "https://www.southwales.ac.uk')
