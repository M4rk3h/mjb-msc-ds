path = "D:\GitHub\msc-datascience\principles-of-computing\david\week-2\python"
t = open(path+"/names.txt","w")
import datetime
today = datetime.date.today()
t.write("hey man. \n")
t.write("This hecking dog goes bork bork.\n")
t.write(str(today))

t.close()