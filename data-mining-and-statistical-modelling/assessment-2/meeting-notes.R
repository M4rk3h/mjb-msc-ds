# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1 - Task 1
library(magrittr)
library(tseries)
# set seed 
set.seed(17076749)
# set address
address <- "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/"
# set features
features <- c("Tmax", "Tmean", "Tmin")
# create a list of districts
districts <- c("Northern_Ireland",
                  "Scotland_N",
                  "Scotland_E",
                  "Scotland_W",
                  "England_E_and_NE",
                  "England_NW_and_N_Wales",
                  "Midlands",
                  "East_Anglia",
                  "England_SW_and_S_Wales",
                  "England_SE_and_Central_S")
# how many rows
nrow <- 2020-1884+1
# Time Series function
create.ts <- function(feature, district){ # pass 2 parameters 
  c(address, feature, "/date/", district, ".txt") %>%  # set the url with several features adding 2 text fields
    paste(collapse = "") %>%  # collapse the set urls above with no space
    read.table(skip = 5, header = TRUE, nrows = nrow) %>%  # read the table, skip 5 rows, add first col as headers and nrows is 2020-1884+1
    subset(select = 2:13) %>%  # only select Jan - Dec
    t() %>% # transpose matrix
    as.vector() %>% # save it as a vector 
    ts(start = c(1884, 1),frequency = 12) # create a time-series object
}
# test the function
create.ts("Tmax", "Northern_Ireland")
# function to get all districts & features 
readFeatures <- function(feature){
  lapply(districts, create.ts, feature = feature) %>% 
    set_names(districts)
}
# get them all together.
Data <- lapply(features, readFeatures) %>% set_names(features)

# select the Tmax from Northern_Ireland
Data$Tmax$Northern_Ireland

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2 - Task 2
# find max temp

# find the max value's index
maxIndex <- Data$Tmax %>% 
  unlist() %>% 
  as.vector() %>% 
  which.max() 

# find sub position
subIndex <- round((maxIndex/16440)*10) # 8 - This could be district

# find max value
# maxVal <- DTmUn %>% which.max()

# find year
# maxYear <- floor(time(DTmUn))[which.max(DTmUn)]

# month
# maxMonth <- month.abb[(time(Data$Tmax)[which.max(Data$Tmax)] %>% 1)*12+1]

# calculate regions
# maxRegions <- names(Data$Tmax)

dTmax <- Data$Tmax %>%
  unlist() %>% 
  as.vector() %>% 
  which.max()

# GETS MONTH
unlistedTMAX <- Data$Tmax %>% unlist()
myMm <- month.abb[(time(unlistedTMAX)[which.min(unlistedTMAX)] %% 1)*12+1]
# plot(Data$Tmax$Northern_Ireland, type = 'l')

# get max temp of Tmax
sapply(Data$Tmax, which.max)

# data_min_value_time <- time(Data)[which.min(Data)]

# unlist tMAX
tmax_unl <- Data$Tmax %>% 
  unlist() %>% 
  as.vector()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3 - Task 3
# EDA

# find max value
colMax <- function(data) sapply(data, max, na.rm = TRUE)
colMax(Data$Tmax) %>% which.max()
# East_Anglia has the highest temp within the Tmax series.
colMax(Data$Tmean) %>% which.max()
# East_Anglia has the highest temp within the Tmean series.
colMax(Data$Tmin) %>% which.max()
# England_SE_and_Central_S has the highest temp within Tmin.

# find lowest value
colMin <- function(data) sapply(data, min, na.rm = TRUE)
colMin(Data$Tmax) %>% which.min()
# Midlands has the lowest temp within the Tmax series.
colMin(Data$Tmean) %>% which.min()
# Scotland_E has the lowest temp within the Tmean series.
colMin(Data$Tmin) %>% which.min()
# Scotland_E has the lowest temp within the Tmin series

colRange <- function(data) sapply(data, range, na.rm = TRUE)
colRange(Data$Tmax)
# East_Anglia    has the lowest temp within the Tmax series.
colRange(Data$Tmean)
# East_Anglia has the lowest temp within the Tmean series.
colRange(Data$Tmin)
# Scotland_E has the lowest temp within the Tmin series

# The above can also be done on the full dataset.
maxTemps <- sapply(Data, colMax)
minTemps <- sapply(Data, colMin)
totRange <- sapply(Data, colRange)

totRange %>% which.max()
# plot monthly / quarterly to see the temps

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4 - Task 4
time.set <- 1:length(Data$Tmax$England_SW_and_S_Wales)
# double check it.
length(time.set)
# create a linear fit of the dataset with the time.
linear.fit <- lm(Data$Tmax$England_SW_and_S_Wales ~ time.set)
summary(linear.fit) # 

print(6.391e-04 * 12)
# over past 137 years, the avg max temp has increased by 0.007

# rescale the time vector
time <- 1:length(Data$Tmax$England_SW_and_S_Wales)
time <- (time - min(time)) / (max(time) -1)
# try again with rescaled
linear.fit <- lm(Data$Tmax$England_SW_and_S_Wales ~ time)
summary(linear.fit) # 
print(1.0500 * 12)
# the plot has some seasonality - but difficult to notice a trend for total dataset.

ts.plot(Data$Tmax$England_SW_and_S_Wales, ylab = "Temperature")
linear.fit %>% fitted() %>% ts(start = 1884, frequency = 12) -> linear.fitted
lines(linear.fitted, col = "green", lwd = 2)
abline(mean(Data$Tmax$England_SW_and_S_Wales), 0, col = "blue", lwd = 2)
# the linear trend is ever so slightly increasing which was discovered above
# with the summary of linear.fit.

# lets look at the last 10 years
ts.plot(Data$Tmax$England_SW_and_S_Wales[1524:1644], 
        ylab = "Temperature")
lines(linear.fitted[1524:1644], 
      col = "green", 
      lwd = 2)
abline(mean(Data$Tmax$England_SW_and_S_Wales[1524:1644]), 
       0, 
       col = "blue", 
       lwd = 2)

tempMaxOneSlice <- Data$Tmax$England_SW_and_S_Wales[1:120] %>% 
  plot(type = 'l',
       ylab = 'Max Temps - SW England / S Wales')
mean(Data$Tmax$England_SW_and_S_Wales[1:120]) # 12.46
# last 10 years recorded
tempMaxOneSlice2 <- Data$Tmax$England_SW_and_S_Wales[1524:1644] %>% 
  plot(type = 'l',
       ylab = 'Max Temps - SW England / S Wales')
mean(Data$Tmax$England_SW_and_S_Wales[1524:1644]) # 13.82

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5 - Task 5

# functions for all the models
# get the AIC reading for each one to see which is best.

# do for one, test it if works, create a function

# apply apply apply
# glimse at the graphs but only keep the ones which we use in report
# create a selection of each models.

# for tmax x was better
# x = linear, cubic, quadratic was better

# might have to nest 3 lapplies for each things?!

# problem could be seasionalities with p values (<0.01)

# num to month
numyear2monthyear <- function(x){   
  c(trunc(x),                   # entire part = year
    round((x-floor(x))*12 + 1)) # decimal part * 12 + 1 (Jan=0) = Month
}

# try test function on Data$Tmax
numyear2monthyear(Data$Tmax$Northern_Ireland)
numyear2monthyear(tmax_unl)

# try it with lapply
lapply(Data$Tmax, numyear2monthyear)

# yeet
extrema_dates <- function(ts){
  ts_min_date <- numyear2monthyear(time(ts)[which.min(ts)])
  ts_max_date <- numyear2monthyear(time(ts)[which.max(ts)])
  list(min=min(ts),
       min_year=ts_min_date[1],
       min_month=ts_min_date[2],
       max=max(ts),
       max_year=ts_max_date[1],
       max_month=ts_max_date[2])
}

extrema_dates(Data$Tmax$Northern_Ireland)
extrema_dates(tmax_unl)
# try to use the 2 above functions
sapply(Data$Tmax, extrema_dates)


#which.max(Data$Tmax)

numyear2monthyear(time(data)[which.max(data)])

numyear2monthyear(time(data)[which.min(data)])
