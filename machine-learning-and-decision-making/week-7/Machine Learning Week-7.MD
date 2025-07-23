# Machine Learning Week-7

Looking at Neurons and how they process data

(x, y) given.
x (input) - y (output)

1 - x (input) -> Processing (neuron) -> y^ (output)

2 - Compare y^ (predicted value from neuron) and y (actual value) <- (What is a convenient way to compare?)

3 - Update the processing to make the prediction y^ closer to the actual value. <- (Minimise the Error.)


3 - How do we compare y and y^? (second miracle)

L - "Loss"
L(y^, y) = -[y log y^ + (1-y) log(1-y^)]

y^ = 0.2 
y = 0

L(0.2, 0) = -[ 0 log 0.2 + ( 1 - 0 ) log ( 1 - 0.2 ) ] 
    = -log(0.8)


For log with calculator, log = Ln.
In R use Log