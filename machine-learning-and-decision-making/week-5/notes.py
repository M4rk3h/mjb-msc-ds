#import numpy as np

def myFunOne():
    # number of iterations
    num_epochs = 10
    # size of the step
    step_size = 0.1
    # starting point
    start = 13
    # definition of the function to minimize
    def fun(x):
        return x**2
    # derivative
    def der(x):
        return 2*x
    # let's know apply the algorithm
    print(fun(start))
    for i in range(num_epochs):
        if (i == 0):
            x = start
        x = x - step_size * der(x)
        print(x, fun(x))

def myFunTwo():
    # condition when stop
    tolerance = 0.1
    # size of the step
    step_size = 0.1
    # starting point
    x = 13
    # definition of the function to minimize
    def fun(x):
        return x**2
    # derivative
    def der(x):
        return 2*x
    # function to carry out the step
    def step(x, grad, step_size):
        return x - step_size * grad
    # let's know apply the algorithm
    # counter for the number of steps
    i = 0
    while True:
        i += 1
        print(x, fun(x))
        grad = der(x)
        next_x = step(x, grad, step_size)
        if (np.abs(x - next_x) < tolerance):
            break
        x = next_x
    print(i)

def myFunThree():
    # condition when stop
    tolerance = 0.01
    # size of the step
    step_size = 0.01
    # starting point
    x = 15
    y = 4
    # definition of the function
    def fun(x,y):
        return x**2 + y**2
    # first partial derivative
    def der1(x):
        return 2*x
    # second partial derivative
    def der2(y):
        return 2*y
    # function to carry out the step
    def step(z, grad, step_size):
        return (z - step_size * grad)
    # counter for number of steps
    i = 0
    while True:
        i += 1
        print(x, y, fun(x,y))
        
        grad_x = der1(x)
        grad_y = der2(y)
        
        next_x = step(x, grad_x, step_size)
        next_y = step(y, grad_y, step_size)
        
        if (np.sqrt((x - next_x)**2 + (y - next_y)**2)  < tolerance):
            break
            
        x, y = next_x, next_y
    print(i)

def myFunFour():
    #𝑓(𝑥,𝑦)=𝑥2+𝑒𝑦2
    # condition when stop
    tolerance = 0.01
    # size of the step
    step_size = 0.01
    # starting point
    x = 15
    y = 4
    # definition of the function
    def fun(x, y):
        return x**2 + y**2 # return square root of x & y
    # first partial derivative
    def der1(x):
        return 2*x
    # second partial derivative
    def der2(y):
        return 2*y
    
def myFunFun():
    def fun(x):
        return x**2+x+20

myFunFun()