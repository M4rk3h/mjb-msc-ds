library(magrittr)
# LOAD DATA ---- 
#data <- read.table(file.choose(), header = TRUE)
data <- read.table("AvTempAtlanta.txt", header = TRUE)
# remove cols 1 and 14
data[, -c(1, 14)] %>% t() %>% as.vector() -> data
# convert temps 
data <- (data - 32) * 5/9
# set as a time series.
data <- ts(data, start = 1879, frequency = 12)

# TREND MODEL
# create the time
TIME <- seq(from = 1879, by = 1/12, length = length(data))
# create the trend
trend <- lm(data ~ ., data.frame(TIME = poly(TIME, degree = 1, raw = TRUE)))
# plot with line
plot(TIME, data, type = 'l')
# avg line
lines(TIME, trend %>% fitted(), col = 'red', lwd = 2)

# Do it with no trend
data.notrend <- data - trend %>% fitted()
# plot with line
plot(TIME,
     data.notrend,
     type = 'l')
# avg line
lines(TIME,
      trend %>% fitted(),
      col = 'red',
      lwd = 2)
# check the mean
mean(data.notrend)

SIN <- COS <- matrix(nrow = length(TIME), ncol = 6)

for(i in 1:6){
  # calculate i for the sine
  SIN[,i] <- sin(2 * pi * i * TIME)
  # calculate i for the cos
  COS[,i] <- cos(2 * pi * i * TIME)
}
# calculate seasonality with all data, without intercept
mySeason <-   lm(data.notrend ~ . - 1, data.frame( SIN = SIN[, c(1,2,4)],
                                               COS = COS[, c(1,2,3)])) #1:3
# should train mySeason1 to check if they're good.
mySeason1 <-   lm(data.notrend ~ . - 1, data.frame( SIN = SIN[, 1],
                                                   COS = COS[, 1])) #1:3
# estimate the components
# AIC(mySeason)
# AIC(mySeason1)

# create a joint component
best <- lm(data ~ ., data.frame(TIME = poly(TIME, degree = 1, raw = TRUE),
                                SIN = SIN[, c(1,2,4)],
                                cos = COS[, c(1,2,3)]))

# here I am estimating linear (quad, and cubic) 
# which can be used for seasonality
best %>% head()

# remove trend and seasonallity
residuals <-  data - best %>% fitted()

plot(TIME,
     residuals,
     type = 'l')

# Zt within the equation is white noise (random)
# ensure the data is stationary before running ARMA.

# ARE RESIDUALS STATIONARY!?
library(tseries)

adf.test(residuals)
# reject the null hypothesis, 
# accept alternative hypothesis: stationary