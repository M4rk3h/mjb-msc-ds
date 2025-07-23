# Import matplotlib globally
import matplotlib.pyplot as plt

def weatherPlot():
    import csv
    with open("../weather.csv",'r') as infile:
        reader = csv.reader(infile)
        header_row = next(reader)
        for index, column_header in enumerate(header_row):
            print(index, column_header)
        Temp = []
        for row in reader:
            Temp.append(float(row[4]))
        #print(Temp)
    infile.close()
    # Plot the weather data
    #fig = plt.figure(dpi=128, figsize(10,6))
    plt.plot(Temp)
    plt.plot(Temp, c="red")
    # Format Plot
    plt.title("Daily Temperature 22/10/2020 to 05/11/2020", fontsize=20)
    plt.xlabel("Hours", fontsize=16)
    plt.ylabel("Temperature (Celsius)", fontsize=16)
    plt.tick_params(axis="both", which="major", labelsize=12)
    #plt.show()
    plt.savefig("plots/weather-plot.png")
    
# Call Weather Plot
weatherPlot()