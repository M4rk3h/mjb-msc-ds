import time
# Read poem
poem = open("poem.txt")
lines = poem.readlines()

for lines in lines:
    print(lines, end="")
    time.sleep(.50)

poem.close()