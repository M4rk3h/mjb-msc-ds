# Functions
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

x = sp.Symbol('x')
print(sp.diff(3*x**2 + 1,x))

from scipy.misc import derivative

def f(x):
    return 3*x**2 + 1

print(derivative(f, 2.0))

%matplotlib inline

y = np.linspace(-3,3)

plt.plot(y,f(y))

plt.plot(y,d(y))
## Exercise

# 1
# f(x) = x^4
# f(x) = 4x^3

# 2
# g(x) = 1/x^2
# g(x) = x^-2

# 3
# h(x) = 3 sqrt x^2
# h(x) = 