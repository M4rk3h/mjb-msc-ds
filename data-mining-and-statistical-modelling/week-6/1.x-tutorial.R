# load packages ----
library(magrittr)
library(TSA)

# load data ----
data(milk)

# plot the data ----
plot(milk)

# classical additive model Y_t = m_t + s_t + X_t
# m_t = trend component
# s_t seasonal component
# X_t stationary ('Random') component
time <- milk %>% time() %>% as.vector()
time %>% head()

# create the models ----
linear <- lm(milk ~ poly(time, degree = 1, raw = T))
quadratic <- lm(milk ~ poly(time, degree = 2, raw = T))
# cubic <- lm(milk ~ poly(time, degree = 3, raw = T))

# plot everything ----
plot(milk,
     main = 'Milk Production',
     xlab = 'Year',
     ylab = 'Amount produced',
     type = 'l')

# add them as lines for the plot ----
# linear
lines(time, 
      fitted(linear),
      lwd = 2,
      type = 'l',
      col = 'blue')
# quadratic
lines(time, 
      fitted(quadratic),
      lwd = 2,
      type = 'l',
      col = 'green')
# cubic
#lines(time, 
#      fitted(cubic),
#      lwd = 2,
#      type = 'l',
#      col = 'red')

# check the difference between quad and cubic ----
# print((fitted(quadratic) - fitted(cubic)) %>% abs() %>% max())
# summary(quadratic)
# summary(cubic) # couldn't figure out the 3rd degree.

# Check the AIC for both models ----
# checks the error of both models,
# lower is better.
AIC(linear)
AIC(quadratic)

# residuals ----
milk.notrend <- milk - fitted(linear)
# seasonal means ----

tapply(milk.notrend, cycle(milk.notrend), mean)

# create months variable as factor
months <- milk.notrend %>% cycle() %>% as.factor()
# seasonal means
milk.seas <- lm(milk.notrend ~ months - 1)
# check summary for seasonal means coefficients
summary(milk.seas)

#can check without the intercept ----
# sets jan as the intercept.
#milk.joseph <- lm(milk.notrend ~ months)
#summary(milk.joseph)

# evaluate harmonic seasonality ----
# create an empty matrix
SIN <- COS <-  matrix(nrow = length(time), ncol = 6)# 6 = freq/2

for(i in 1:6){
  SIN[,i] <- sin(2*pi*i*time)
  COS[,i] <- cos(2*pi*i*time)
}

# model all season harmonic
# model notrend against all values with -1
milk.har1 <- lm(milk.notrend ~ . -1 ,
                data.frame(SIN = SIN[,1], COS = COS[,1]))

milk.har2 <- lm(milk.notrend ~ . -1 ,
                data.frame(SIN = SIN[,1:2], COS = COS[,1]))

milk.final <- lm(milk ~ .,
                 data.frame(TIME = poly(time, degree = 1, raw = T),
                            SIN = SIN[,1:2], 
                            COS = COS[,1]))

summary(milk.final)

plot(milk,
     main = 'Milk Production',
     xlab = 'Year',
     ylab = 'Amount produced',
     type = 'l')
lines(time, 
      fitted(milk.final),
      lwd = 2,
      type = 'l',
      col = 'blue')
