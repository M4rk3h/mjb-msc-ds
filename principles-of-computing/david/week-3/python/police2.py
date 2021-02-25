# Program to Read Weather CSV Data
def main():
    import csv
    with open("../police-data.csv",'r') as infile:
        reader = csv.reader(infile)
        header_row = next(reader)
        for index, column_header in enumerate(header_row):
            print(index, column_header)
        Date = []
        Reported = []
        Crimes = []
        uniqueCrimes = []
        for row in reader:
            Date.append(row[0])
            Reported.append(row[1])
            Crimes.append(row[8])
        #print(Date[0], Reported[0])
        # Get unique crimes 
        for crimes in Crimes:
            if crimes not in uniqueCrimes:
                uniqueCrimes.append(crimes)
        # print(uniqueCrimes)
        # Count crimes by the crim type.
        CrimeSet = set(Crimes)
        sum = 0
        for Crime in CrimeSet:
            count = Crimes.count(Crime)
            sum = sum + count
            print(Crime,count)
            #Time to print
        print(Date[0], Reported[0])
        print("The Total Number of Crimes is",sum)
    infile.close()

main()