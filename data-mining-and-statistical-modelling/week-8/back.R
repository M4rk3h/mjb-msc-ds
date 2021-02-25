library(magrittr)
library(TSA)
data(milk)

# Y_t = m_t + s_t + X_t (Additive)
# Y_t = m_t * s_t * X_t (Multiplicative)
# log(Y_t) = log(m_t * s_t * X_t) = log(m_t) + log(s_t) + log(X_t)

# TREND -----------------------------------------------------------------------
TIME <- seq(from = 1994, by = 1/12, length = length(milk))

plot(TIME,
     milk,
     type = 'l')

linear <- lm(milk ~ .,
             data = data.frame(TIME = poly(TIME, degree = 1, raw = TRUE)))


plot(TIME,
     milk,
     type = 'l')
lines(TIME,
      linear %>% fitted(),
      col = 'red',
      lwd = 3)

# SEASONALITY -----------------------------------------------------------------
milk.notrend <- milk - linear %>% fitted()

plot(TIME,
     milk.notrend,
     type = 'l')

SIN <- COS <- matrix(nrow = length(TIME), ncol = 6)

for(i in 1:6){
  SIN[,i] <- sin(2 * pi * i * TIME)
  COS[,i] <- cos(2 * pi * i * TIME)
}

har6 <- lm(milk.notrend ~ . - 1,
           data = data.frame(SIN = SIN[,1:5],
           cos = COS[,1:6]))

summary(har6)

plot(TIME,
     milk.notrend,
     type = 'l')
lines(TIME,
      har6 %>% fitted(),
      col = 'red',
      lwd = 2)

# COMBINED MODEL FOR TREND AND SEASONALITY ------------------------------------
combined <- lm(milk ~ .,
               data = data.frame(TIME = poly(TIME, degree = 1, raw = TRUE),
                                 SIN = SIN[,1:5],
                                 COS = COS[,1:6]))

plot(TIME,
     milk,
     type = 'l')
lines(TIME,
      combined %>% fitted(),
      col = 'red',
      lwd = 2)

milk.residuals <- milk - combined %>% fitted()

# order selection for residuals model
# find p and q in the arma(p,q) model
n <- length(TIME)
norder <- 4
p <- 1:norder - 1
q <- 1:norder - 1 # p <-  q <- 0:3

aic <- matrix(0, nrow = norder, ncol = norder)

# loop through
for (i in 1:norder){
  for (j in 1:norder){
    # train the model
    ARMAmod <- arima(milk.residuals,
                     order = c(p[i], 0, q[j]),
                     include.mean = FALSE,
                     method = 'ML')
    # store the aic
    aic[i,j] <- (ARMAmod %>% AIC()) - 2*(p[i]+q[j]+1)+2*(p[i]+q[j]+1)*n/(n-p[i]-q[j]-2)
   }
}

#look for the lowest coefficients
# the which function is going to go useful for max and minimum for CW
index <- which(aic == min(aic), arr.ind = TRUE)

p.choice <- index[1,1] - 1
q.choice <- index[1,2] - 1

residuals.model <- arima(milk.residuals,
                         order = c(p.choice, 0, q.choice),
                         include.mean = FALSE,
                         method = 'ML')

# Predictions.
ahead <- 12

TIME.NEW <- seq(from = 2006, by = 1/12, length = ahead)
SIN.NEW <- COS.NEW <- matrix(nrow = length(TIME.NEW), ncol = 6)

for(i in 1:6){
  SIN.NEW[, i] <- sin(2 * pi * i * TIME.NEW)
  COS.NEW[, i] <- cos(2 * pi * i * TIME.NEW)
}

pred.comb <- combined %>%
  predict(newdata = data.frame(TIME = poly(TIME.NEW, degree = 1, raw = TRUE),
                               SIN = SIN.NEW[, 1:5],
                               COS = COS.NEW[, 1:6]))

pred.res <- predict(residuals.model, n.ahead = ahead)$pred

plot(TIME,
     milk,
     type = 'l',
     xlim = c(1994,2007))
lines(TIME.NEW,
      pred.comb + pred.res,
      col = 'red',
      lwd = 2)
