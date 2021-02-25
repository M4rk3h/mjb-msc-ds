library(magrittr)

# choose the data
data <- read.table(file.choose(), header = TRUE) # avgTempAtlanta (week-5)
# remove first and last col
data[, -c(1, 14)] %>% t() %>% as.vector() -> data
# convert temperatures
data <- (data - 32) * 5/9
# as a time series
data <- ts(data, start=1879, frequency = 12)

data %>% head()


urlMAX = paste("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/",districts[], sep = "")


# List of lists
data <- list(
  max = list(
    max1 = "max1"),
  mean = list(
    mean1= "mean1"),
  min = list(
    min1 = "min1")
  )
# selecting from my list of lists.
testDF <- data[[1]][[1]]


# create vector of means
means <- c(12,6,25,74,56,8)
names <- c('list-1','list-2','list-3','list-4','list-5','list-6')
# create a function to calculate means
generate <- function(mean){
  rnorm(mean = mean, n=10, sd=2)
}
# use lapply to make a list of means which has been 
# calculated by the generation function
lapply(means, generate) %>% set_names(names)



## NOTES FROM HERE
districts <- list("Northern_Ireland.txt", "Scotland_N.txt",
                  "Scotland_E.txt", "Scotland_W.txt",
                  "England_E_and_NE.txt", "England_NW_and_N_Wales.txt",
                  "Midlands.txt", "East_Anglia.txt",
                  "England_SW_and_S_Wales.txt", "England_SE_and_Central_S.txt")

# create 3 different URLS (max, mean, min) for the districts
urlMAX = paste("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/",districts[], sep = "")
urlMEAN = paste("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/",districts[], sep = "")
urlMIN = paste("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/",districts[], sep = "")

# make a function to pass through url x
getMAX <- function(x) {
  #print(search_url[x])
  fread(urlMAX[x], fill = TRUE)
}

getMEAN <- function(x) {
  #print(search_url[x])
  fread(urlMEAN[x], fill = TRUE)
}

getMIN <- function(x) {
  #print(search_url[x])
  fread(urlMIN[x], fill = TRUE)
}

## CLEAN
myData <- getMAX(1)
# only take cols 2-13
myData <- myData[,2:13]
head(myData)
# remove rows 1-5
myData <- myData[6:143]
head(myData)

##
# get the months from dataset
months <- myData[1,1:12]
# check to make sure we got them
head(months)
# change to char
months <- as.character(months)
is.character(months)

# Now we have the months, lets delete them from the dataset
myData <- myData[-1,1:12]
# make sure it worked
head(myData)
# now to set the names
colnames(myData) <- months
# make sure it worked again
head(myData)

# create a function that accepts as arguments a time series dataset
# and the kind of model that we want to create (linear, quadratic, cubic,...)
# and gives as output the model with given parameters
create.model <- function(timeseries, degree) {
  # degree vector
  degree.vect = c(1,2,3)
  # create a switch case
  degree.value <- switch(degree,
                         linear    = degree.vect[1],
                         quadratic = degree.vect[2],
                         cubic     = degree.vect[3])
  # 
  c(timeseries,
    c("poly(time,",
      as.character(degree.value),
      ", raw = TRUE)") %>% paste(collapse = "")) %>%
    paste(collapse = " ~ ") %>%
    as.formula() %>%
    lm() -> model
  # return 
  return(model %>% fitted())
}

plot(globaltemps, type = 'l')
lines(create.model("globaltemps", "linear"),    col = 'green',  lwd = 3)
lines(create.model("globaltemps", "quadratic"), col = 'purple', lwd = 3)
lines(create.model("globaltemps", "cubic"),     col = 'red',    lwd = 3)
