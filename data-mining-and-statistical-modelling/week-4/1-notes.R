# ****************************
# generating regular sequences
# ****************************
1:10
# is same as
c(1,2,3,4,5,6,7,8,9,10)
# can also be reversed
10:1
# can also be done as
seq(from = 0, 
    to = 100, 
    by = 0.5)
# get 20 random numbers from 1 - 1000
seq(from = 1, to = 1000, length.out = 20)
# gen numbers from 3 to 9 by 0.5
seq(by = 0.5, to = 9, from = 3)

# repeating values
rep(1, times  =  100)
rep(c(1,3,5), times = 20)
length(rep(c(1,3,5), times = 20))

#repeat 1 
c(rep(1, times = 20),
  rep(3, times = 20),
  rep(5, times = 20))

# is same as
rep(c(1,3,5), each = 20)
rep(1:12, times = 80)
length(rep(1:12, times = 80))

# week days
rep(c('mon','tue','wed','thu','fri','sat','sun'),
    times = 64)

# ****************************
# assignment
# ****************************
a = 9  # bad
a <- 9 # good

rep(1:3, times = 3)  # good
rep(1:3, times <- 3) # bad

8 -> b # meh
# 8 = b  # bad

(c <- 10)
c <- 10
c

# solve a quadratic equation
# x^2 + 5c + 6 = 0
x <- (-5 + c(1, -1) * sqrt(5^2 - 4 * 1 * 6))/2*1

# assignment is equavalent to a command
assign('goku', 9000)
# can also get the content from a variable
get('goku')

# keyboard shortcut for assignment "alt + -"
a <- 'uwu'

# ****************************
# pipes
# ****************************
# install.packages('magrittr')
library(magrittr)

# %>% pipe operator
# keyboard shortcut 
# ctrl + shift + m

log(sqrt(sum(c(1,3,6,8,11,55)))) # difficult to read

c(1,3,6,8,11,55) %>%
  sum() %>%
  sqrt() %>%
  log()

a <- 1:10
a %>% sum()

# ****************************
# functions
# ****************************
s1 <- 1:10
s2 <- 13:27
s3 <- 51:89

sum(s1)/length(s1) # bad
sum(s2)/length(s2) # bad
sum(s3)/length(s3) # bad

# create a function to make things easier.
sample_mean <- function(x){
  sum(x) / length(x)
}

sample_mean(s1)
sample_mean(s2)
sample_mean(s3)

s1 %>% sample_mean()


sample_var <- function(x){
  sum((x-mean(x))^2)/(n)
}

# find difference between vector numbers
s1 - sample_mean(s1)
# now square them all
(s1 - sample_mean(s1))^2
# now take the sum of all of those
sum((s1 - sample_mean(s1))^2)
# divide by the length of s1 - 1
sum((s1 - sample_mean(s1))^2) / (length(s1) - 1)

# create a function for sample variance
sample_var <- function(x){
  sum((x - sample_mean(x))^2) / (length(x) - 1)
}

sample_var(s1)
sample_var(s2)
sample_var(s3)

# create a square function
square <- function(x){
  x^2
}
# calculate sample variance with pipes
((s1 - s1 %>% 
    sample_mean()) %>% 
    square %>% 
    sum()) / (length(s1)-1)
# check it against built in function
var(s1)
