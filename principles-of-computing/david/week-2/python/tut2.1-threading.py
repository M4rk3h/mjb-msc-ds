# import libraries
from threading import Thread
import os
import time
# set variables
x = 0
y = 1000000
# make a function to count to y
def countTo():
    for x in range(y):
        x += 1
        #print("ARGH", x)

        
threads = []

for i in range(os.cpu_count()):
	#print('registering thread %d' % i)
	threads.append(Thread(target=countTo))


for thread in threads:
	thread.start()

for thread in threads:
	thread.join()

# Start a timer and run function countTo
timerStart = time.time()
countTo()
# print
print("Counting to", y, "took", format(time.time() - timerStart, '.2f'), "seconds ;)")
