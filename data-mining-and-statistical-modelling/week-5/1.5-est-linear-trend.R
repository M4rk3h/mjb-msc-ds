# 1.5-est-linear-trend.R
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

# ---------------------
# Estimating Linear Trend
# ---------------------

# make sure to run 1.x in order.
time <- 1:length(tempD)

# estimate linear trend
linear.fit <- lm(tempD ~ time)
summary(linear.fit)
6.439e-04 * 12 # over past 138 years, avg temp increases by 0.008

# time vector rescaled (0 first obs, 1 is the last)
time <- 1:length(tempD)
time <- (time - min(time)) / (max(time) -1)

linear.fit <- lm(tempD ~ time)
summary(linear.fit)

# time vector rescaled by 12
time <- 1:length(tempD)
time <- time/12

linear.fit <- lm(tempD ~ time)
summary(linear.fit)

ts.plot(tempD, ylab = 'Temperature')
linear.fit %>% fitted() %>% ts(start = 1879, frequency = 12) -> linear.fitted

lines(linear.fitted, col="green", lwd=2)
# get the mean line
abline(mean(tempD), 0, col="blue", lwd=2)
# see it for last 10 years
ts.plot(tempD[1536:1656], ylab = 'Temperature')
lines(linear.fitted[1536:1656], col="green", lwd=2)
abline(mean(tempD[1536:1656]), 0, col="blue", lwd=2)
