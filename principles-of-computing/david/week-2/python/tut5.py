def convert(c):
    f=((c/5.0)*9.0)+32.0
    return f

def main():
    import numpy
    for c in numpy.arrange(0,51,2.5):
        print(c, convert(c))
main()