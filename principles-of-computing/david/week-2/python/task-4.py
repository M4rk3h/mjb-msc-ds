# Amend your code from EXERCISE 2 
# to read a text file (people.txt) 
# of 10 names and output a new text file 
# (usernames.txt) of unique usernames.  
# Produce some screen output to inform the 
# user whether a username is NOT unique.

def gen_user(user):
    username = user.replace(" ","")+"@southwales.ac.uk"
    return username.lower()

def main():
    path="D:/GitHub/msc-datascience/principles-of-computing/david/week-2/python"
    infile = open(path+"/names.txt", 'r')
    outfile = open(path+"/usernames.txt",'w')
    names =[]
    for i in range(10):
        line = infile.readline()
        username = gen_user(line[:-1])
        print("Username is",username)
        if username in names:
            print(username,"Username already exists")
        else:
            names.append(username)
            outfile.write(username + "\n")
    print("Unique usernames:",names)

main()