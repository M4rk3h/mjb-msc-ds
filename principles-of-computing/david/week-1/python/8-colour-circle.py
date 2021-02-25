# CircleSpiral1
import turtle
t = turtle.Pen()
turtle.bgcolor("black")
sides=4
colour=["green", "purple", "orange", "blue"]
# loop
for x in range(360):
    t.pencolor(colour[x%sides])
    t.forward(x*3/sides + x)
    t.left(360/sides + 1)
    t.width(x*sides/200)
