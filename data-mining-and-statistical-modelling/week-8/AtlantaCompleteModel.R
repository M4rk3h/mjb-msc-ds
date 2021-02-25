library(magrittr)
# LOAD DATA ---- 
#data <- read.table(file.choose(), header = TRUE)
data <- read.table("AvTempAtlanta.txt", header = TRUE)
data[, -c(1, 14)] %>% t() %>% as.vector() -> data
data <- (data - 32) * 5/9
data <- ts(data, start = 1879, frequency = 12)

# TREND MODEL
TIME <- seq(from = 1879, by = 1/12, length = length(data))
trend <- lm(data ~ ., data.frame(TIME = poly(TIME, degree = 1, raw = TRUE)))

plot(TIME,
     data,
     type = 'l')
lines(TIME,
      trend %>% fitted(),
      col = 'red',
      lwd = 2)

data.notrend <- data - trend %>% fitted()

plot(TIME,
     data.notrend,
     type = 'l')

SIN <- COS <- matrix(nrow = length(TIME), ncol = 6)

for(i in 1:6){
  SIN[,i] <- sin(2 * pi * i * TIME)
  COS[,i] <- cos(2 * pi * i * TIME)
}

seasonality <- lm(data.notrend ~ . - 1, data.frame(SIN = SIN[, c(1,2,4)],
                                                   COS = COS[, c(1,2,3)]))


combined <- lm(data ~ ., data.frame(TIME = poly(TIME, degree = 1, raw = TRUE),
                                    SIN = SIN[, c(1,2,4)],
                                    COS = COS[, c(1,2,3)]))


plot(TIME[1417:1656],
     data[1417:1656],
     type = 'l')
lines(TIME,
      combined %>% fitted(),
      col = 'red',
      lwd = 2)

residuals <- data - best %>% fitted()

plot(TIME,
     residuals,
     type = 'l')


# are residuals stationary?
library(tseries)
adf.test(residuals)
acf(residuals)
pacf(residuals)

## Order selection -- AIC 
n <- length(residuals)
norder <- 4
p <- c(1:norder)-1
q <- c(1:norder)-1
aic <- matrix(0, norder, norder)

for(i in 1:norder){
  for(j in 1:norder){
    modij <- arima(residuals, order = c(p[i],0,q[j]), method='ML')
    aic[i,j] <- modij$aic-2*(p[i]+q[j]+1)+2*(p[i]+q[j]+1)*n/(n-p[i]-q[j]-2)
  }  
}

aicv <- as.vector(aic)

plot(aicv, ylab="AIC values")

indexaic <- which(aic == min(aic), arr.ind = TRUE)

porder <- indexaic[1,1] - 1
qorder <- indexaic[1,2] - 1

# Final residuals model
residuals.model <- arima(residuals, order = c(porder, 0, qorder), method = "ML")
ahead <- 12
pred.res <- predict(residuals.model, n.ahead = ahead)$pred
TIME.NEW <- seq(from = 2017, by = 1/12, length = ahead)
SIN.NEW <- COS.NEW <- matrix(nrow = length(TIME.NEW), ncol = 6)

for(i in 1:6){
  SIN.NEW[,i] <- sin(2 * pi * i * TIME.NEW)
  COS.NEW[,i] <- cos(2 * pi * i * TIME.NEW)
}

pred <- predict(combined, newdata = data.frame(TIME = poly(TIME.NEW, degree = 1, raw = TRUE),
                                       SIN = SIN.NEW[, c(1,2,4)],
                                       COS = COS.NEW[, c(1,2,3)]))

plot(TIME,
     data,
     type = 'l',
     xlim = c(2000, 2018))
lines(TIME.NEW,
      pred + pred.res,
      col = 'red',
      lwd = 2)