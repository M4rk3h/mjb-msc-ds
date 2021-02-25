## Task 3
# Volume of a Death Star 
# Written by Mark Baber on 09/10/2020
# Diameter (d) of a Death Star is 160 Kms
# Radius (r) of a Death Star is half od the diameter
# Volume of a Sphere is 4/3 * Pi * r^3
# The Math Library is imported for a more accurate value of Pi

import math
d=160
r=d/2
pi=math.pi
volume=4/3*pi*r**3
print("The volume of a complete Death Star is ", volume, "Cubic Kilometres.")
# The Death Star has a small hollow equivalent to one third
# of a sphere of 40 kilometres diameter
dhollow=40
rhollow=dhollow/2
vhollow=(1/3)*4/3/pi*dhollow**3
print("The Hollow Volume is ", vhollow, "Cubic Kilometres.")
# Actual Volume = volume - vhollow
print("Death Star volume is ", volume-vhollow, "Cubic Kilometres.")