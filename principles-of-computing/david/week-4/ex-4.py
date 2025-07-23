import glob
import pandas as pd
import matplotlib.pyplot as plt; plt.rcdefaults()
import matplotlib.pyplot as plt
# set path for data
path = r"C:/Users/markb/OneDrive/documents/uni/principles-of-computing/david/week-4/crimes"
all_files = glob.glob(path + "/*.csv")

# create a list to list all csv files
li = []
# loop to inport all of the files into li as a dataframe
for filename in all_files:
    df = pd.read_csv(filename, index_col=None, header=0)
    li.append(df)

# create one dataframe for all csv files
df= pd.concat(li, axis=0, ignore_index=True)

# remove Crime ID
df= df.drop(['Crime ID'], axis=1)

# Get all crime types
crimeTypes = (df.iloc[:, 8])
uniqueCrimes = crimeTypes.unique()
i = 0
for crimes in uniqueCrimes:
    i += 1
    print(i, "-", crimes)

# Get total crimes per year
crimeCount = df['Crime type'].count()
totalCrime = crimeCount
print('/n','This dataframe holds a total of', totalCrime, 'number of crimes.')

# The total number of crimes of each different crime type that occurred.
print(df['Crime type'].value_counts())

# crime as a ppercentage
pies = []
sum = 0
for crimes in uniqueCrimes:
    count = uniqueCrimes.count(crimes)
    pieval=float(count)*100.0/sum
    pies.append(pieval)
    print("- Crime:", crimes, "- Count:", count, "- Percent:", round(pieval,2),"%")

# Plot it on a Pie Chart
import matplotlib.pyplot as plt
fig1, ax1 = plt.subplots()
plt.title("Crime in September 2020: South Wales Police", fontsize=18)
ax1.pie(pies, labels=uniqueCrimes, autopct='%1.1f%%', shadow=True, startangle=90)
ax1.axis('equal')
plt.show()
#plt.savefig("plots/ex-police.png"))