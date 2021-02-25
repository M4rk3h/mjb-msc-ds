# libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt; plt.rcdefaults()
import matplotlib.pyplot as plt
# path
filePath = open("2020-09.csv", 'r') # r is read
# variable holding data
df = pd.read_csv(filePath)
# print(df) # check the df

# Put the crimeTypes and numbers
crimeType = ['Violence', 'Anti-social','Public order','Arson','Vehicle crime','Other theft','Shoplifting','Drugs','Burglary','Other crime','Bicycle theft','Theft','Weapons','Robbery']
crimeCount = [3581,3310,1324,1018,688,596,548,422,419,180,174,69,58,42]

# 1 A List of all the different crime types (e.g. Burglary etc.) 
# that were recorded in September 2020;
def Num1():
    crimeTypes = (df.iloc[:, 9])
    # print(crimeTypes)
    uniqueCrimes = crimeTypes.unique()
    i = 0
    for crimes in uniqueCrimes:
        i += 1
        print(i, "-", crimes)

# 2 The total number of crimes that occurred in South Wales in September 2020;
x = 0
def Num2():
    crimeCount = df['Crime type'].count()
    totalCrime = crimeCount
    print('There were a total of', totalCrime, 'number of crimes in September 2020.')

# 3 The total number of crimes of each different crime type that occurred in September 2020;
def Num3():
    print(df['Crime type'].value_counts() )
# 4 A breakdown of all different crime types as a percentage of all crime in September 2020.

def Num4():
    # Get each crime type
    i = 0
    if i < uniqueCrimes.len():
        print(uniqueCrimes[i])
        i += 1
    # get count for each crime type    
    # divide by the totalCrime
# 5 ADVANCED EXERCISE: How did the level of crime in September 2020 compare with August 2020 or September 2019?
# 6 ADVANCED EXERCISE: Can you visualise your results (from 3, 4, or 5), e.g. as a bar or pie chart?
def Num6():
    # set y as crimeTypes length
    y_pos = np.arange(len(crimeType))
    plt.bar(y_pos, crimeCount, align='center', alpha=0.5)
    plt.xticks(y_pos, crimeType)
    plt.ylabel('No Of Crimes')
    plt.title('Crime Types')
    plt.show()

# Extra
run = True
while run == True:
    Mode = 0
    # mode select
    while Mode == 0 or Mode == 6:
        if Mode == 0:
            print('Please input a number between 1 - 6 ')
        elif Mode == 6:
            print('Please enter a number between 1 - 6 ')
        Mode = int(input())
        if Mode == 1:
            print('You have chosen 1 ')
        elif Mode == 2:
            print('You have chosen 2')
        elif Mode == 3:
            print('You have chosen 3')
        elif Mode == 4:
            print('You have chosen 4')
        elif Mode == 5:
            print('You have chosen 5')
        elif Mode == 6:
            print('You have chosen 6')
            print('Loading Num6')
            Num6()
        else:
            print('So, you have chosen death... goodbye.')
            run = False

    if Mode == 1:
        Num1()
    if Mode == 2:
        Num2()
    if Mode == 3:
        Num3()
    if Mode == 4:
        Num4()
    if Mode == 5:
        print('Num5()')
    if Mode == 6:
        break