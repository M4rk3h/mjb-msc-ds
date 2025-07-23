# Intro to R
height <- 3
weight <- 6
area <- height*weight
area

x <- rnorm(5)
x <- 2+2
y <- 2*x
print(x)
print(y)

class(TRUE)
class(NA)
class(2)
class(2.5)

is.integer(2.5)
is.integer(2)
is.integer(2L)

as.integer(2.5)
as.integer(T)
as.integer(F)

class("Hello World")

# Vectors
drawn_suits <- c("hearts","spades","diamonds","diamonds","spades")
length(drawn_suits)
length(area)
is.vector(area)
remain <- c(11,12,11,13)

suits <- c("spades","hearts","diamonds","clubs")
# Give names to the vector entries
names(remain) <- suits
print(remain)

remainn <- c(spades=11, hearts=12, diamonds=11,clubs=13)
print(remain)