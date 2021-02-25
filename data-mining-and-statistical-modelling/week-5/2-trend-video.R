library(magrittr)
# generate white noise
set.seed(20210113)
(wn <- rnorm(100, sd = 10))
wn %>% plot(type = 'l')

# generate time vector
t <- 1:length(wn)

# linear trend
linear <- 2 + 3*t
linear.wn <- linear + wn
linear.wn %>% plot(type = 'l')
linear %>% lines(col = "red")

# quadratic trend
quadratic <- 25 - t + 0.01 * t^2
quadratic.wn <- quadratic + wn
quadratic.wn %>% plot(type = 'l')
quadratic %>% lines(col = "red")

# cubic trend
cubic <- - 7.55755 + 8.78074 * t - 0.224666 * t^2 + 0.00147614 * t^3
cubic.wn <- cubic + wn
cubic.wn %>% plot(type = 'l')
cubic %>% lines(col = "red")


# ------------------------------
# Average Atlanta Temperature
# ------------------------------
data <- read.table("data/AvTempAtlanta.txt", header = TRUE)

data %>% head()

data[,2:13] %>% head()

data[,-c(1,14)] %>% head()

temp <- as.vector(t(data[,-c(1,14)]))

data[,-c(1,14)] %>%
   t() %>% 
   as.vector() -> temp

# plot the time series
temp %>% plot(type = 'l', ylab = "Average Atlanta Temperature")

temp[1:12] %>% plot(type = 'l', ylab = "Average Atlanta Temperature")

temp <- (temp - 32) * 5/9

temp %>% plot(type = 'l', ylab = "Average Atlanta Temperature")

# let's create a time series objoect
temp <- ts(temp, start = 1879, frequency = 12)

temp %>% ts(start = 1879, frequency = 12) -> temp

temp %>% plot()

# mean
(avg <- mean(temp))


# time vector
time <- 1:length(temp)

# estimate linear trend
linear.fit <- lm(temp ~ time)
summary(linear.fit)

# time vector rescaled (0 first obs, 1 is the last)
time <- 1:length(temp)
time <- (time - min(time))/(max(time) - 1)

linear.fit <- lm(temp ~ time)
summary(linear.fit)

# time vector rescaled (0 first obs, 1 is the last)
time <- 1:length(temp)
time <- time/12

linear.fit <- lm(temp ~ time)
summary(linear.fit)

ts.plot(temp, ylab = "Temperature")
linear.fit %>% fitted() %>% ts(start = 1879, frequency = 12) -> linear.fitted
lines(linear.fitted, col = "green", lwd = 2)
abline(mean(temp), 0, col = "blue", lwd = 2)

# let's see this for the last ten years
ts.plot(temp[1536:1656], ylab = "Temperature")
lines(linear.fitted[1536:1656], col = "green", lwd = 2)
abline(mean(temp[1536:1656]), 0, col = "blue", lwd = 2)

# quadratic trend
time <- 1:length(temp)
time2 <- time^2

quadratic.fit <- lm(temp ~ time + time2)
summary(quadratic.fit)

ts.plot(temp, ylab = "Temperature")
quadratic.fit %>% fitted() %>% ts(start = 1879, frequency = 12) -> quadratic.fitted
lines(quadratic.fitted, col = "purple", lwd = 2)
abline(mean(temp), 0, col = "blue", lwd = 2)

# cubic trend
time <- 1:length(temp)
time2 <- time^2
time3 <- time^3

cubic.fit <- lm(temp ~ time + time2 + time3)
summary(cubic.fit)

ts.plot(temp, ylab = "Temperature")
cubic.fit %>% fitted() %>% ts(start = 1879, frequency = 12) -> cubic.fitted
lines(cubic.fitted, col = "red", lwd = 2)
abline(mean(temp), 0, col = "blue", lwd = 2)

# compare on the same graph the 3 estimated trends
plot(NULL,
     xlim = c(1878, 2016),
     ylim = c(15.5, 18))
lines(linear.fitted, col = "green", lwd = 2)
lines(quadratic.fitted, col = "purple", lwd = 2)
lines(cubic.fitted, col = "red", lwd = 2)

# fitting a polynomial has a simpler sintax
# use the function poly() in the lm()
# with the option raw = TRUE
time <- 1:length(temp)
time2 <- time^2
time3 <- time^3

# linear case
linear.fit <- lm(temp ~ time)
linear.fit.p <- lm(temp ~ poly(time, 1, raw = TRUE))
summary(linear.fit)
summary(linear.fit.p)

# quadratic case
quadratic.fit <- lm(temp ~ time + time2)
quadratic.fit.p <- lm(temp ~ poly(time, 2, raw = TRUE))
summary(quadratic.fit)
summary(quadratic.fit.p)

# cubic case
cubic.fit <- lm(temp ~ time + time2 + time3)
cubic.fit.p <- lm(temp ~ poly(time, 3, raw = TRUE))
summary(cubic.fit)
summary(cubic.fit.p)


# coefficients
coefficients(linear.fit)
coefficients(linear.fit.p)
coefficients(quadratic.fit)
coefficients(quadratic.fit.p)
coefficients(cubic.fit)
coefficients(cubic.fit.p)


# cubic.fit.p <- lm(temp ~ poly(time, 3, raw = TRUE)) is equivalent to
c("temp", "poly(time, 3, raw = TRUE)") %>% 
   paste(collapse = " ~ ") %>% 
   as.formula() %>% 
   lm() -> model
