def main():
    # set empty variables
    Date = []
    Reported = []
    Crimes = []
    uniqueCrimes = []
    with open("../police-data.csv", 'r') as infile:
        line1 = infile.readline()
        for line in infile:
            values = line.split(",")
            Date.append(values[0])
            Reported.append(values[1])
            Crimes.append(values[8])
        # End loop
        infile.close()
        
        # Unique Crimes
        for crimes in Crimes:
            if crimes not in uniqueCrimes:
                uniqueCrimes.append(crimes)
        #print(uniqueCrimes)
        
        # Get Unique Crime & Count
        CrimeSet = set(Crimes)
        sum = 0
        for Crime in CrimeSet:
            count = Crimes.count(Crime)
            count.append(count)
            sum = sum + count
            print(Crime,count)
            #Time to print
        print(Date[0], Reported[0])
        #print("The Total Number of Crimes is",sum, crimePercent)

        pies = []
        for Crime in CrimeSet:
            count = CrimeType.count(Crime)
            pieval=float(count)*100.0/sum
            pies.append(pieval)
            print(Crime, count, pieval)
main()