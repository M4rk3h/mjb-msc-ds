#Examples from Datacamp Pipe R Tutorial
#https://www.datacamp.com/community/tutorials/pipe-r-tutorial

#Example with pipes`
library(dplyr)

#Using pipes in mathematical expressions
cos(sin(pi))
#Can be simplified to:
pi %>% sin %>% cos

#Example without pipes
# Initialize `x`
x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)

# Compute the logarithm of `x`, return suitably lagged and iterated differences, 
# compute the exponential function and round the result
round(exp(diff(log(x))), 1)

# Perform the same computations on `x` as above
x %>% 
  log() %>%
  diff() %>%
  exp() %>%
  round(1)

# Import `babynames` data
install.packages("babynames")
library(babynames)

# Load the data
data(babynames)

# Count how many young boys with the name "Taylor" are born
sum(select(filter(babynames,sex=="M",name=="Taylor"),n))

# Do the same but now with `%>%`
babynames%>%
  filter(sex=="M",name=="Taylor")%>%
  select(n)%>%
  sum

#Traditional code for dplyr function
install.packages("hflights")
library(hflights)

grouped_flights <- group_by(hflights, Year, Month, DayofMonth)
flights_data <- select(grouped_flights, Year:DayofMonth, ArrDelay, DepDelay)
summarized_flights <- summarise(flights_data, 
                                arr = mean(ArrDelay, na.rm = TRUE), 
                                dep = mean(DepDelay, na.rm = TRUE))
final_result <- filter(summarized_flights, arr > 30 | dep > 30)
final_result

#Pipe example
hflights %>% 
  group_by(Year, Month, DayofMonth) %>% 
  select(Year:DayofMonth, ArrDelay, DepDelay) %>% 
  summarise(arr = mean(ArrDelay, na.rm = TRUE), dep = mean(DepDelay, na.rm = TRUE)) %>% 
  filter(arr > 30 | dep > 30)

