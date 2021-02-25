# install.packages("TSA")
library(magrittr)
library(TSA)

# Example 1
globaltemps <- "data/globaltemps.txt" %>%
  read.table() #%>% ts(start = 1856)

globaltemps <- as.vector(t(globaltemps))

# %>% ctlr + shift + M

globaltemps %>% head()

plot(NULL,
     main = "Gloabal temperature deviations",
     ylab = "Deviations",
     xlab = "Year",
     type = "l",
     xlim = c(1,142), #c(1856,1998),
     ylim = c(-0.55,0.55)
)

globaltemps %>% lines()

# plot an horizontal line
# b_t = beta_0 + beta_1 * t
# beta_0 = mean temp
# beta_1 = 0 (horizontal)
abline(mean(globaltemps), # intercept
       0,                # slope
       col = 'red',      # colour
       lwd = 3)          # line width

# estimate linear trend
# m_t = beta_0 + beta_1 * t
# our tast is to estimate beta_0 and beta_1
time <- 1:length(globaltemps)

c("globaltemps","poly(time, 1, raw = T)") %>%
  paste(collapse = " ~ ") %>%
  as.formula() %>% 
  lm() -> linear.model
linear.model %>% coefficients()
# beta_0 = -0.4560863
# beta_1 = 0.0041677

linear.coeffs <- linear.model %>% coefficients()

abline(linear.coeffs[1], # intercept
       linear.coeffs[2], # slope
       col = 'green',    # colour
       lwd = 3)          # line width

# forecast of the linear trend for the next 10 years
linear.coeffs[1] + linear.coeffs[2] * (143:152)

# estimate quadratic trend
# m_t = beta_0 + beta_1 * t + beta_2 * t^2
c("globaltemps","poly(time, 2, raw = T)") %>%
  paste(collapse = " ~ ") %>%
  as.formula() %>% 
  lm() -> quadratic.model

# calculate quadratic coeff
(quadratic.coeffs <- quadratic.model %>% coefficients())
#-3.426686e-01
#-5.580789e-04
# 3.304713e-05 

# plot as a blue line
fitted(quadratic.model) %>% 
  lines(col = "blue", lwd=3)

# forecast of the linear trend for the next 10 years
quadratic.coeffs[1] + 
  quadratic.coeffs[2] * (143:152) +
  quadratic.coeffs[3] * (143:152)^2

# estimate the cubic trend
c("globaltemps","poly(time, 3, raw = T)") %>%
  paste(collapse = " ~ ") %>%
  as.formula() %>% 
  lm() -> cubic.model

# calculate quadratic coeff
(cubic.coeffs <- cubic.model %>% coefficients())

# plot as a blue line
fitted(cubic.model) %>% 
  lines(col = "purple", lwd=3)

# forecast of the linear trend for the next 10 years
cubic.coeffs[1] + 
  cubic.coeffs[2] * (143:152) +
  cubic.coeffs[3] * (143:152)^2 +
  cubic.coeffs[4] * (143:152)^3

# since the quadratic and cubic trend assume similar (very close)
# values on the time interval considered, this suggests that a 
# quadratic trend is the upper limit polynomial trend for 
# modelling this data.

# Example 2 (loading dataset milk)
data(milk)
# transform as matrix then vector.
milk <- as.vector(t(milk))
# plot the milk
plot(milk,
     ylab="Amount of milk produced",
     xlab="Year",
     type="l")
# mean line
abline(mean(milk), # intercept
       0,                # slope
       col = 'red',      # colour
       lwd = 3)          # line width

malk <- 1:length(milk)

c("milk","poly(malk, 1, raw = T)") %>%
  paste(collapse = " ~ ") %>%
  as.formula() %>% 
  lm() -> linear.model.milk
linear.model.milk %>% coefficients()
# beta_0 = 1351.885490
# beta_1 = 2.103016 
linear.coeffs.milk <- linear.model.milk %>% coefficients()

abline(linear.coeffs.milk[1], # intercept
       linear.coeffs.milk[2], # slope
       col = 'green',    # colour
       lwd = 3)          # line width

# forecast of the linear trend for the next 10 years
linear.coeffs.milk[1] + linear.coeffs.milk[2] * (143:152)
# estimate quadratic trend
# m_t = beta_0 + beta_1 * t + beta_2 * t^2
c("milk","poly(malk, 2, raw = T)") %>%
  paste(collapse = " ~ ") %>%
  as.formula() %>% 
  lm() -> quadratic.model.milk

# calculate quadratic coeff
(quadratic.model.milk <- quadratic.model.milk %>% coefficients())
# 1.343644e+03
# 2.441724e+00
# -2.335916e-03

# plot as a blue line
fitted(quadratic.model.milk) %>% 
  lines(col = "blue", lwd=3)

# forecast of the linear trend for the next 10 years
quadratic.model.milk[1] + 
  quadratic.model.milk[2] * (143:152) +
  quadratic.model.milk[3] * (143:152)^2

# estimate the cubic trend
c("milk","poly(malk, 3, raw = T)") %>%
  paste(collapse = " ~ ") %>%
  as.formula() %>% 
  lm() -> cubic.model.milk

# calculate quadratic coeff
(cubic.coeffs.milk <- cubic.model.milk %>% coefficients())

# plot as a blue line
fitted(cubic.model.milk) %>% 
  lines(col = "purple", lwd=3)

# forecast of the linear trend for the next 10 years
cubic.model.milk[1] + 
  cubic.model.milk[2] * (143:152) +
  cubic.model.milk[3] * (143:152)^2 +
  cubic.model.milk[4] * (143:152)^3

# since the quadratic and cubic trend assume similar (very close)
# values on the time interval considered, this suggests that a 
# quadratic trend is the upper limit polynomial trend for 
# modelling this data.

# Example 2 (loading dataset milk)





# a trick for programming in R
name <- "italian"
switch(name, 
       italian = "filippo",
       english = "Philip",
       spanish = "Filipe"
       )

# create a function that accepts as arguments ts.data
# and the kind of model that we want to create
# linear, quadratic, cubic and displayed the model
# with given parameters
create.model <- function(timeseries, degree) {
  degree.vect = c(1,2,3)
  
  degree.value <- switch(degree,
                         linear    = degree.vect[1],
                         quadratic = degree.vect[2],
                         cubic     = degree.vect[3])
  
  c(timeseries,
    c("poly(time,",
      as.character(degree.value),
      ", raw = TRUE)") %>% paste(collapse = "")) %>%
    paste(collapse = " ~ ") %>%
    as.formula() %>%
    lm() -> model
  
  return(model %>% fitted())
}

plot(globaltemps, type = 'l')
lines(create.model("globaltemps", "linear"),    col = 'green',  lwd = 3)
lines(create.model("globaltemps", "quadratic"), col = 'purple', lwd = 3)
lines(create.model("globaltemps", "cubic"),     col = 'red',    lwd = 3)