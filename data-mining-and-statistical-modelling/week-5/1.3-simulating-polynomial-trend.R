# 1.3-simulating-polynomial-trend
library(magrittr)

# set the seed
set.seed(20210113)
# create some white noise
wn <- rnorm(100, sd = 10)
head(wn)
# plot the white noise
wn %>% plot(type = 'l')

# generate time vector
t <- 1:length(wn)

# start with a linear trend
linear <- 2 + 3 * t
linear.wn <- linear + wn
linear.wn %>% plot(type = 'l')
linear %>%  lines(col = 'red')

# Quadratic trend
quadratic <-  25 - t + 0.01 * t^2
quadratic.wn <- quadratic + wn
quadratic.wn %>% plot(type = 'l')
quadratic %>%  lines(col = 'red')

# Cubic trend
cubic <- -7.55755 + 8.78074 * t - 0.22466 * t^2 + 0.00147614 * t^3
cubic.wn <- cubic + wn
cubic.wn %>% plot(type = 'l')
cubic %>%  lines(col = 'red')
