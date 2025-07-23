# Program to Read Weather CSV Data
# function to get all entries in a csv
# Set Up Set Empty Lists
Year = []
Month = []
Day = []
Hour = []
Temp = []
Humidity = []
Pressure = []
Rain = []
Cloud = []
Sun = []
WindS = []
WindD = []
with open("../weather.csv", 'r') as infile:
      infile.readline()
      for line in infile:
            values = line.split(",")
            Year.append(int(values[0]))
            Month.append(int(values[1]))
            Day.append(int(values[2]))
            Hour.append(int(values[3]))
            Temp.append(float(values[4]))
            Humidity.append(float(values[5]))
            Pressure.append(float(values[6]))
            Rain.append(float(values[7]))
            Cloud.append(float(values[8]))
            Sun.append(float(values[9]))
            WindS.append(float(values[10]))
            WindD.append(float(values[11]))
            #print(int(values[0]),int(values[1]),int(values[2]),int(values[3]),float(values[4]),
                  #float(values[5]),float(values[6]),float(values[7]),float(values[8]),
                  #float(values[9]),float(values[10]),float(values[11]))

maxtemp = max(Temp)
mintemp = min(Temp)
index1 = Temp.index(maxtemp)
index2 = Temp.index(mintemp)
# Close the infile
infile.close()
#print("The Maximum Temperature of",maxtemp,"Degrees Celsius was on",Day[index1],"/",Month[index1],
#      "/",Year[index1],"at",Hour[index1],"to",Hour[index1]+1,":00 Hours")
#print("The Minimum Temperature of",mintemp,"Degrees Celsius was on",Day[index2],"/",Month[index2],
#      "/",Year[index2],"at",Hour[index2],"to",Hour[index2]+1,":00 Hours")
# A-The Total Rainfall over the period.
def Num1():
      totRain = sum(Rain)
      # A - Print total rain fall
      print("The total rainfall was:", round(totRain,2), "mm")
# B-The Largest Amount of Rainfall in any 1-Hour Period (in mm and the Date and Time)
# Get the maximum rain count
def Num2():
      maxRain = max(Rain)
      indexRain = Rain.index(maxRain)
      # B - Print maxRain which is indexed by the day n month
      print("The highest rainfall was:",maxRain,"on", Day[indexRain],"of the", Month[indexRain],"in the year",Year[indexRain],"from",Hour[indexRain],"to",Hour[indexRain]+1,"oclock")
# C-The Total Amount of Sunshine in minutes over the period.
def Num3():
      totSun = sum(Sun)
      # C-The Total Amount of Sunshine in minutes over the period.
      print("The total sunshine was:", round(totSun,2))
#indexSun = Sun.index(totSun)
# D-The Average Temperature over the period.
def Num4():
      tempAvg = sum(Temp)/len(Temp)
      # D-The Average Temperature over the period.
      print("The average sunshine was:", round(tempAvg,2))
# E-The Largest Amount of Rainfall in any 1-Day (24 Hour Period) (Quantity and Date).
def Num5():
      maxrain=0.0
      dayrain=0
      for i in range(1,16):
            i1=(i-1)*24
            i2=i*24
            DRain=Rain[i1:i2]
            SumRain=sum(DRain)
            if SumRain > maxrain:
                  maxrain=SumRain
                  dayrain=i
                  print("Day ",i," Hour ", i1, i2, DRain, SumRain, "NEW MAX")
            else:
                  print("Day ",i," Hour ", i1, i2, DRain, SumRain)
      d=(dayrain-1)*24
      # E-The Largest Amount of Rainfall in any 1-Day (24 Hour Period) (Quantity and Date).
      print("Maximum Rainfall of", round(maxrain,2), "mm on Day", dayrain, "of", Day[d],"/", Month[d], "/", Year[d])
# F-The Largest Amount of Sunshine in any 1-Day (Quantity and Date). (Not a trick question).     
def Num6():
      maxSun=0.0
      daySun=0
      for i in range(1,16):
            i1=(i-1)*24
            i2=i*24
            DSun=Sun[i1:i2]
            SumSun=sum(DSun)
            if SumSun > maxSun:
                  maxSun=SumSun
                  daySun=i
                  print("Day ",i," Hour ", i1, i2, DSun, SumSun, "NEW MAX")
            else:
                  print("Day ",i," Hour ", i1, i2, DSun, SumSun)
      d=(daySun-1)*24
      # F-The Largest Amount of Sunshine in any 1-Day (Quantity and Date). (Not a trick question).     
      print("Maximum Sunshine of", round(maxSun,2), "mm on Day", daySun, "of", Day[d],"/", Month[d], "/", Year[d])

# Extra
run = True
while run == True:
      Mode = 0
      # mode select
      while Mode == 0 or Mode == 7:
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
            Num5()
      if Mode == 6:
            Num6()