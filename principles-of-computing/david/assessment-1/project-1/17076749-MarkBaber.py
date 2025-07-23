# import modules
import glob
import pandas as pd
import matplotlib.pyplot as plt
# set path for data
path = r"crimes"
# Start main function for 2017
def oneSeventeen():
    # start by getting all 2017 csv files using glob
    yearOneSeven = glob.glob(path + "/2017*.csv")
    # add all these file names to a list.
    liOneSeven = []
    # loop to import all files from the names saved within yearOneSeven
    for filename in yearOneSeven:
        dfOneSeven = pd.read_csv(filename, index_col=None, header=0)
        liOneSeven.append(dfOneSeven)
        #print(liOneSeven)
    # only take month, lat, long, crime type
    dfOneSeven = dfOneSeven.iloc[:,[1,4,5,9]]
    # get total crime count 
    oneSevenCcount = dfOneSeven['Crime type'].count()
    # print total crime count
    # print('There were a total of', oneSevenCcount,'crimes in 2017')
    # Label for crime count
    labelOneSevenCcount = Label(root, text='Number of crimes in 2017:').grid(row=3, column=1)
    # set var to equal a string variable
    var2017 = StringVar()
    # create a label which states the text Variable
    labelOsCc=Label(root, textvariable=var2017)
    # set the string variable to be the total crime count
    var2017.set(oneSevenCcount)
    labelOsCc.grid(row=3, column=2)
    # get total crime type count (Dict must be used to be plotted)
    global oneSevenType1
    oneSevenType1 = dict(dfOneSeven["Crime type"].value_counts())
    # do the same as above, (without Dict, can be used to print in new Window)
    global oneSevenType2
    oneSevenType2 = dfOneSeven["Crime type"].value_counts(normalize=True).mul(100).round(1).astype(str) + '%'
# Make a Bar Chart
def graph2017():
    try:
        # Try to plot a chart
        x = list(oneSevenType1.keys())
        y = list(oneSevenType1.values())
        plt.figure(figsize = (8, 6))
        plt.barh(x,y)
        plt.title(label = 'Crimes Reported by South Wales Police in 2017')
        plt.ylabel('Crime')
        plt.xlabel('Frequency')
        plt.show()
    except:
        # if try fails, print the function errorPop
        errorPop()
# New window to display crime type and count
def newWindow2017():
    try:
        # create a new Window from the original window
        newWindow17 = Toplevel(root)
        # create the window title
        newWindow17.title("2017 Crime Analysis")
        # Label for crime type count
        crimeCount17 = Label(newWindow17, font=h1Font, text='2017 - Crime Type & Percent:', padx=2, pady=2).pack()
        # set var to equal a string variable
        var = StringVar()
        # create a label which states the text Variable
        labelOsCc=Label(newWindow17, textvariable=var, padx=2, pady=2)
        # set the string variable to be the total crime count
        var.set(oneSevenType2)
        # pack just to play the label anywhere.
        labelOsCc.pack()
        # destroy button
        btnDestroy17 = Button(newWindow17, text="Close", bg="red", command=newWindow17.destroy).pack()
    except:
        print("Error creating new window")
# Do the same for 2018
def oneEighteen():
    yearOneEight = glob.glob(path + "/2018*.csv")
    liOneEight = []
    # loop to import files within OneEight (2018)
    for filename in yearOneEight:
        dfOneEight = pd.read_csv(filename, index_col=None, header=0)
        liOneEight.append(dfOneEight)
        #print(liOneEight)
    # only take month, lat, long, crime type
    dfOneEight = dfOneEight.iloc[:,[1,4,5,9]]
    # get total crime count 
    oneEightCcount = dfOneEight['Crime type'].count()
    # Label for crime count
    LabelOneEightCount = Label(root, text='Number of crimes in 2018:').grid(row=4, column=1)
    # set var to equal a string variable
    var2018 = StringVar()
    # create a label which states the text Variable
    labelOsCc=Label(root, textvariable=var2018)
    # set the string variable to be the total crime count
    var2018.set(oneEightCcount)
    labelOsCc.grid(row=4, column=2)
    # print total crime count
    #print('There were a total of', oneEightCcount,'crimes in 2018 \n')
    # get total crime type count
    global oneEightType1
    oneEightType1 = dict(dfOneEight["Crime type"].value_counts())
    global oneEightType2
    oneEightType2 = dfOneEight["Crime type"].value_counts(normalize=True).mul(100).round(1).astype(str) + '%'
# Make a Bar Chart
def graph2018():
    try:
        x = list(oneEightType1.keys())
        y = list(oneEightType1.values())
        plt.figure(figsize = (8, 6))
        plt.barh(x,y)
        plt.title(label = 'Crimes Reported by South Wales Police in 2018')
        plt.ylabel('Crime')
        plt.xlabel('Frequency')
        plt.show()
    except:
        errorPop()
# new window for crime type and count
def newWindow2018():
    try:
        newWindow18 = Toplevel(root)
        newWindow18.title("2018 Crime Analysis")
        # Label for crime type count
        crimeCount18 = Label(newWindow18, font=h1Font, text='2018 - Crime Type & Percent', padx=2, pady=2).pack()
        # set var to equal a string variable
        var = StringVar()
        # create a label which states the text Variable
        labelOsCc=Label(newWindow18, textvariable=var, padx=2, pady=2)
        # set the string variable to be the total crime count
        var.set(oneEightType2)
        # pack will slap it anywhere.
        labelOsCc.pack()
        # destroy button
        btnDestroy18 = Button(newWindow18, text="Close", bg="red", command=newWindow18.destroy).pack()
    except:
        print("Error creating new window")
def oneNineeen():
    yearOneNine = glob.glob(path + "/2019*.csv")
    liOneNine = []
    # loop to import files within OneNine (2019)
    for filename in yearOneNine:
        dfOneNine = pd.read_csv(filename, index_col=None, header=0)
        liOneNine.append(dfOneNine)
        #print(liOneNine)
    # only take month, lat, long, crime type
    dfOneNine = dfOneNine.iloc[:,[1,4,5,9]]
    # get total crime count 
    oneNineCcount = dfOneNine['Crime type'].count()

    # Label for crime count
    LabelOneNineCount = Label(root, text='Number of crimes in 2019:').grid(row=5, column=1)
    # set var to equal a string variable
    var2019 = StringVar()
    # create a label which states the text Variable
    labelOsCc=Label(root, textvariable=var2019)
    # set the string variable to be the total crime count
    var2019.set(oneNineCcount)
    labelOsCc.grid(row=5, column=2)
    # print total crime count
    #print('There were a total of', oneNineCcount,'crimes in 2019 \n')
    # get total crime type count
    global oneNineType1
    oneNineType1 = dict(dfOneNine["Crime type"].value_counts())
    global oneNineType2
    oneNineType2 = dfOneNine["Crime type"].value_counts(normalize=True).mul(100).round(1).astype(str) + '%'
    # Make a Bar Chart
def graph2019():
    try:
        x = list(oneNineType1.keys())
        y = list(oneNineType1.values())
        plt.figure(figsize = (8, 6))
        plt.barh(x,y)
        plt.title(label = 'Crimes Reported by South Wales Police in 2019')
        plt.ylabel('Crime')
        plt.xlabel('Frequency')
        plt.show()
    except:
        errorPop()
# new window for crime type and count
def newWindow2019():
    try:
        newWindow19 = Toplevel(root)
        newWindow19.title("2019 Crime Analysis")
        # Label for crime type count
        crimeCount19 = Label(newWindow19, font=h1Font, text='2019 - Crime Type & Percent:', padx=2, pady=2).pack()
        # set var to equal a string variable
        var = StringVar()
        # create a label which states the text Variable
        labelOsCc=Label(newWindow19, textvariable=var, padx=2, pady=2)
        # set the string variable to be the total crime count
        var.set(oneNineType2)
        # pack will slap it anywhere.
        labelOsCc.pack()
        # destroy button
        btnDestroy19 = Button(newWindow19, text="Close", bg="red", command=newWindow19.destroy).pack()
    except:
        print("Error creating new window")
# Do it for 2020
def twentyTwenty():
    # start by getting all 2020 csv files using glob
    yearTwentyTwenty = glob.glob(path + "/2020*.csv")
    # add all these file names to a list.
    liTwentyTwenty = []
    # loop to import all files from the names saved within yearTwentyTwenty
    for filename in yearTwentyTwenty:
        dfTwentyTwenty = pd.read_csv(filename, index_col=None, header=0)
        liTwentyTwenty.append(dfTwentyTwenty)
        #print(liTwentyTwenty)
    # only take month, lat, long, crime type
    dfTwentyTwenty = dfTwentyTwenty.iloc[:,[1,4,5,9]]
    # get total crime count 
    TwentyTwentyCcount = dfTwentyTwenty['Crime type'].count()
    # print total crime count
    # print('There were a total of', TwentyTwentyCcount,'crimes in 2020')
    # Label for crime count
    labelTwentyTwentyCcount = Label(root, text='Number of crimes in 2020:').grid(row=6, column=1)
    # set var to equal a string variable
    var2020 = StringVar()
    # create a label which states the text Variable
    labelOsCc=Label(root, textvariable=var2020)
    # set the string variable to be the total crime count
    var2020.set(TwentyTwentyCcount)
    labelOsCc.grid(row=6, column=2)
    # get total crime type count (Dict must be used to be plotted)
    global TwentyTwentyType1
    TwentyTwentyType1 = dict(dfTwentyTwenty["Crime type"].value_counts())
    # do the same as above, (without Dict, can be used to print in new Window)
    global TwentyTwentyType2
    TwentyTwentyType2 = dfTwentyTwenty["Crime type"].value_counts(normalize=True).mul(100).round(1).astype(str) + '%'
# Make a Bar Chart
def graph2020():
    try:
        # Try to pieChart
        x = list(TwentyTwentyType1.keys())
        y = list(TwentyTwentyType1.values())        
        fig1, ax1 = plt.subplots()
        ax1.pie(y, autopct='%1.1f%%', startangle=0)
        ax1.axis('equal')
        ax1.legend(x)
        plt.show()
        # Try to plot a chart
        """
        x = list(TwentyTwentyType1.keys())
        y = list(TwentyTwentyType1.values())
        plt.figure(figsize = (8, 6))
        plt.barh(x,y)
        plt.title(label = 'Crimes Reported by South Wales Police in 2020')
        plt.ylabel('Crime')
        plt.xlabel('Frequency')
        plt.show()
        """
    except:
        # if try fails, print the function errorPop
        errorPop()
# New window to display crime type and count
def newWindow2020():
    try:
        # create a new Window from the original window
        newWindow20 = Toplevel(root)
        # create the window title
        newWindow20.title("2020 Crime Analysis")
        # Label for crime type count
        crimeCount20 = Label(newWindow20, font=h1Font, text='2020 - Crime Type & Percent:', padx=2, pady=2).pack()
        # set var to equal a string variable
        var = StringVar()
        # create a label which states the text Variable
        labelOsCc=Label(newWindow20, textvariable=var, padx=2, pady=2)
        # set the string variable to be the total crime count
        var.set(TwentyTwentyType2)
        # pack just to play the label anywhere.
        labelOsCc.pack()
        # destroy button
        btnDestroy20 = Button(newWindow20, text="Close", bg="red", command=newWindow20.destroy).pack()
    except:
        print("Error creating new window")

## GUI CODE STARTS HERE
# import the tkinter module
from tkinter import *
import tkinter.font as tkFont
from tkinter import messagebox
# create a root tk instance
root = Tk()
# titles
root.title('Crime Analysis')
# declare font 
h1Font = tkFont.Font(family="Gothic", size=16)
# create a label widget
labelPolice = Label(root, font=h1Font, text="Police Reporting", width=30, borderwidth=2).grid(row=0, column=1, columnspan=3)
labelInfo = Label(root, text="This program will be used to analyse south police police data. \n Please pick from the buttons below").grid(row=1, column=1, columnspan=3)
labelMaker = Label(root, text="By Mark Baber - 17076749", width=30, borderwidth=2).grid(row=10, column=1, columnspan=3)
# Step Labels (1 - 3)
stepOne = Label(root, text="Step 1", width=30, borderwidth=2).grid(row=2, column=0)
stepTwo = Label(root, text="Step 2", width=30, borderwidth=2).grid(row=2, column=3)
stepThree = Label(root, text="Step 3", width=30, borderwidth=2).grid(row=2, column=4)
# buttons to call functions
btn2017 = Button(root, text="Count crimes in 2017", command=oneSeventeen, fg="black").grid(row=3, column=0)
btn2018 = Button(root, text="Count crimes in 2018", command=oneEighteen, fg="black").grid(row=4, column=0)
btn2019 = Button(root, text="Count crimes in 2019", command=oneNineeen, fg="black").grid(row=5, column=0)
btn2020 = Button(root, text="Count crimes in 2020", command=twentyTwenty, fg="black").grid(row=6, column=0)
# plot buttons
btnPlot2017 = Button(root, text="2017 crime plot", command=graph2017, fg="black").grid(row=3, column=3)
btnPlot2018 = Button(root, text="2018 crime plot", command=graph2018, fg="black").grid(row=4, column=3)
btnPlot2019 = Button(root, text="2019 crime plot", command=graph2019, fg="black").grid(row=5, column=3)
btnPlot2020 = Button(root, text="2020 crime plot", command=graph2020, fg="black").grid(row=6, column=3)
# new window buttons
btnNew2017 = Button(root, text="2017 crime type & percent", command=newWindow2017).grid(row=3, column=4)
btnNew2018 = Button(root, text="2018 crime type & percent", command=newWindow2018).grid(row=4, column=4)
btnNew2019 = Button(root, text="2019 crime type & percent", command=newWindow2019).grid(row=5, column=4)
btnNew2020 = Button(root, text="2020 crime type & percent", command=newWindow2020).grid(row=6, column=4)
# quit button
btnQuit = Button(root, text="Exit Program", bg="red", command=quit).grid(row=9, column=1, columnspan=3)
# message boxes
def errorPop():
    messagebox.showinfo("Error loading plot!", "Failed to load plot,\n make sure one(Year)Type is a dictionary")
# start the program
root.mainloop()
