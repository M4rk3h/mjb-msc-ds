# 1.4-avg-atlanta-temp
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
# Average Atlanta Temps
# ---------------------
# load in the data
data <- read.table("data/AvTempAtlanta.txt", header = TRUE)
# check the data
data %>% head()
# subset the data - only take months and avg temps
# only take 2-13
data[,2:13] %>% head()
# remove col 1 and 14
data[,-c(1,14)] %>% head()
# 
tempD <- as.vector(data[,-c(1,14)])
head(tempD)
tempD[1]
# we want to change the data from a column into entries.
# this can be done by transposing as a vector
tempD <- as.vector(t(data[,-c(1,14)] ))
tempD[1]

# do it with pipes
data[,-c(1,14)] %>% 
  t() %>% 
  as.vector() -> tempD

# plot the time series
tempD %>%  plot(type = 'l',
                ylab = 'Average atlanta temps')

# first 10 years
tempD[1:120] %>%  plot(type = 'l',
                ylab = 'Average atlanta temps')

# first 10 months
tempD[1:12] %>%  plot(type = 'l',
                      ylab = 'Average atlanta temps')

# C goes from 00 - 100 degrees
# F goes from 32 - 212 degrees

tempD <- (tempD - 32) * 5/9
tempD %>%  plot(type = 'l', ylab = 'Average atlanta temps')

# lets create a time series obj
tempD <- ts(tempD, start = 1879, frequency = 12)

tempD %>% ts(start = 1879, frequency = 12) -> tempD
tempD %>% ts.plot()

# mean = 16.55
(avg <- mean(tempD))
