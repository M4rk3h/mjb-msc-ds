# set empty variables
Date = []
Reported = []
Crimes = []
uniqueCrimes = []
with open("../police-data.csv", 'r') as infile:
    line1 = infile.readline()
    values = line1.split(",")
    fields = len(values)
    #print(fields, values)
    for line in infile:
        values = line.split(",")
        Date.append(values[0])
        Reported.append(values[1])
        Crimes.append(values[8])
        uniqueCrimes.append(values[8])
    # End loop
    # Get Unique Crime & Count
    CrimeSet = set(uniqueCrimes)
    #print(CrimeSet)
    sum = 0
    ccount = []
    for Crime in CrimeSet:
        count = uniqueCrimes.count(Crime)
        ccount.append(int(count))
        sum = sum + count
        #print("- Crime:",Crime, "- Count:", count)
    infile.close()
    print("-", Reported[0],"-", Date[0])
    # Get Crimes as a Percent
    pies = []
    for Crime in CrimeSet:
        count = uniqueCrimes.count(Crime)
        pieval=float(count)*100.0/sum
        pies.append(pieval)
        print("- Crime:",Crime,"- Count:", count, "- Percent:", round(pieval,2),"%")
    # Plot it on a Pie Chart
    """
    import matplotlib.pyplot as plt
    fig1, ax1 = plt.subplots()
    plt.title("Crime in September 2020: South Wales Police", fontsize=18)
    ax1.pie(pies, labels=CrimeSet, autopct='%1.1f%%', shadow=True, startangle=90)
    ax1.axis('equal')
    plt.show()
    #plt.savefig("plots/ex-police.png")
    """