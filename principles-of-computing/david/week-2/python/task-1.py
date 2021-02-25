# Programming Exercises 4
def main():
    fname = input("Enter filename and ext (.txt): ")
    infile = open(fname, 'r')
    # read only 2 characters
    data = infile.read(2)
    print(data)
    data = infile.read(4)
    print(data)
    data = infile.read(6)
    print(data)
    data = infile.read()
    print(data)
    infile.close()
main()