# Program to read weather csv data
# Create a function
def getWeather():
    with open("../weather.csv", 'r') as infile:
        for line in infile:
            values = line.split(",")
            print(values)
        infile.close()

getWeather()