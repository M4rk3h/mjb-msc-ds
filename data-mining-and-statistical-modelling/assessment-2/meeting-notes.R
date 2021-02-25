# Notes with Filippo Meeting
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(magrittr)
# set address
address <- "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/"
# set features
features <- c("Tmax", "Tmean", "Tmin")
# create a list of districts
districts <- list("Northern_Ireland",
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
create.ts <- function(feature, district){
  c(address, feature, "/date/", district, ".txt") %>% 
    paste(collapse = "") %>% 
    read.table(skip = 5, header = TRUE, nrows = nrow) %>% 
    subset(select = 2:13) %>% 
    t() %>% 
    as.vector() %>% 
    ts(start = c(1884, 1),frequency = 12)
}
# test the function
create.ts("Tmax", "Northern_Ireland")
# try to do this with lapply to get 10 Tmax
Tmax.data <- 
  lapply(districts, create.ts, feature = "Tmax") %>% 
  set_names(districts)


# lists can be for nesting lists in lists etc.

# can nest lapply for a nested loop
# lapply should be nested with the lists for districts.

# data <- 3 lists
# tmax, tmean, tmin
# all lists will have 10 districts.

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