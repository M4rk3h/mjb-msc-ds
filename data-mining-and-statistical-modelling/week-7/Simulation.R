library(tseries)
library(magrittr)
n <- 1000
# White noise ----
set.seed(99)
wn <- rnorm(n)

plot(wn,
     main = '(Gaussian) White Noise',
     type = 'l')


acf(wn)
pacf(wn)

adf.test(wn)

# Random walk (non stationary)
rw <- wn[1]
for (i in 2:n) rw[i] <- rw[i-1] + wn[i]

plot(rw,
     main = 'Random Walk',
     type = 'l')

acf(rw)
pacf(rw)

adf.test(rw)

# MA(1)

ma1 <- wn[1]
for (i in 2:n) ma1[i] <- wn[i] + wn[i-1]

plot(ma1,
     main = 'MA(1) process',
     type = 'l')

acf(ma1)
pacf(ma1)
ARMAacf(ma = 1, pacf = FALSE, lag.max = 10)
ARMAacf(ma = 1, pacf = TRUE, lag.max = 10)

adf.test(ma1)

# MA(2)

ma2 <- wn[1:2]
for (i in 3:n) ma2[i] <- wn[i] - wn[i-1] + 2 * wn[i-2]

plot(ma2,
     main = 'MA(2) process',
     type = 'l')

acf(ma2)
pacf(ma2)
ARMAacf(ma = c(-1, 2), pacf = FALSE, lag.max = 10)
ARMAacf(ma = c(-1, 2), pacf = TRUE, lag.max = 10)

adf.test(ma2)

# AR1 (Stationary)
ar1 <- wn[1]
for (i in 2:n) ar1[i] <- 0.5 * ar1[i-1] + wn[i]

plot(ar1,
     main = 'AR(1) process',
     type = 'l')

acf(ar1)
pacf(ar1)
ARMAacf(ar = 0.5, pacf = FALSE, lag.max = 10)
ARMAacf(ar = 0.5, pacf = TRUE, lag.max = 10)

adf.test(ar1)

# AR1 (Non Stationary)
ar1.n <- wn[1]
for (i in 2:n) ar1.n[i] <- 1.0007 * ar1.n[i-1] + wn[i]

plot(ar1.n,
     main = 'AR(1) process non stationary',
     type = 'l')

acf(ar1.n)
pacf(ar1.n)
ARMAacf(ar = 1.0007, pacf = FALSE, lag.max = 10)
ARMAacf(ar = 1.0007, pacf = TRUE, lag.max = 10)

adf.test(ar1.n) # note adf sometimes is not sharp

# AR2 (Stationary)
ar2 <- wn[1:2]
for (i in 3:n) ar2[i] <- 0.7 * ar2[i-2] + wn[i]

plot(ar2,
     main = 'AR(2) process',
     type = 'l')

acf(ar2)
pacf(ar2)
ARMAacf(ar = c(0,0.7), pacf = FALSE, lag.max = 10)
ARMAacf(ar = c(0,0.7), pacf = TRUE, lag.max = 10)

adf.test(ar2)

# AR2 (Non Stationary)
ar2.n <- wn[1:2]
for (i in 3:n) ar2.n[i] <- 0.8 * ar2.n[i-1] + 0.2 * ar2.n[i-2] + wn[i]

plot(ar2.n,
     main = 'AR(2) process',
     type = 'l')

acf(ar2.n)
pacf(ar2.n)
ARMAacf(ar = c(0.8, 0.2), pacf = FALSE, lag.max = 10)
ARMAacf(ar = c(0.8, 0.2), pacf = TRUE, lag.max = 10)

adf.test(ar2.n)


# AR2 (again)
ar2.s <- wn[1:2]
for (i in 3:n) ar2.s[i] <- 1.8 * ar2.s[i-1] - 0.9 * ar2.s[i-2] + wn[i]

plot(ar2.s,
     main = 'AR(2) process',
     type = 'l')

acf(ar2.s)
pacf(ar2.s)
ARMAacf(ar = c(1.8, -0.9), pacf = FALSE, lag.max = 10)
ARMAacf(ar = c(1.8, -0.9), pacf = TRUE, lag.max = 10)

adf.test(ar2.s)



# ARMA22 (again)
arma22 <- wn[1:2]
for (i in 3:n) arma22[i] <- 0.88 * arma22[i-1] - 0.49 * arma22[i-2] + wn[i] - 0.23 * wn[i-1] + 0.25  * wn[i-2]

plot(arma22,
     main = 'ARMA(2,2) process',
     type = 'l')

acf(arma22)
pacf(arma22)
ARMAacf(ma = c(-0.23, 0.25), ar = c(0.88, -0.49), pacf = FALSE, lag.max = 10)
ARMAacf(ma = c(-0.23, 0.25), ar = c(0.88, -0.49), pacf = TRUE, lag.max = 10)

adf.test(arma22)

pacf()