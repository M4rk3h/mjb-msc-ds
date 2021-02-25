# Simple Plotting Examples
import matplotlib.pyplot as plt
# Create plot1
def plot1():
    xvals = [1,2,3,4,5]
    squares =[1,4,9,16,25]
    plt.plot(xvals, squares, linewidth=5)
    # Set Chart Title and Label Axes
    plt.title("Square Numbers", fontsize=24)
    plt.xlabel("Value", fontsize=14)
    plt.ylabel("Square of Value", fontsize=14)
    plt.tick_params(axis="both", labelsize=14)
    # plt.savefig("plots/squareNo-plot1.png")
# Call Plot1
plot1()