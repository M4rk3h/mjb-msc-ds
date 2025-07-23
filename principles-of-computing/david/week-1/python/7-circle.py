# CircleSpiral1
import turtle
t = turtle.Pen()
turtle.bgcolor("black")
colour=["green", "purple", "orange", "blue"]
turtle.speed(2)
# loop
for x in range(100):
    t.pencolor(colour[x%4])
    t.circle(x)
    t.left(91)
