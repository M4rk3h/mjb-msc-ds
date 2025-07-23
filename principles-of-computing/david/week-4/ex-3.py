# Time Module
import time
# for loop
def timeOne():
    start = time.time()
    a = range(100000)
    b = []
    for i in a:
        b.append(i*2)
        #print(i*2)
        #time.sleep(1)
    end = time.time()
    endTime = end - start
    print(endTime)

def timeTwo():
    start = time.time()
    aa = range(100000)
    b = [i*2 for i in aa]
    end = time.time()
     # set time as variable
    endTime = end - start
    print(endTime)

timeOne()
timeTwo()