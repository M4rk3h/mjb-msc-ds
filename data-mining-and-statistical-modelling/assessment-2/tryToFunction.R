library(magrittr)
library(data.table)

# Coursework 2
districts <- list("Northern_Ireland.txt", "Scotland_N.txt",
                  "Scotland_E.txt", "Scotland_W.txt",
                  "England_E_and_NE.txt", "England_NW_and_N_Wales.txt",
                  "Midlands.txt", "East_Anglia.txt",
                  "England_SW_and_S_Wales.txt", "England_SE_and_Central_S.txt" )

# set up a base url for the districts
search_url = paste("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/",districts[], sep = "")


# make a function to pass through url x
getSearch <- function(x) {
  #print(search_url[x])
  fread(search_url[x], fill = TRUE)
}

# Call the function new.function supplying 1 as an argument.
maxDF <- getSearch(1)


# generate a function to create 6 lists of random means etc.
means <- c(12,6,25,74,56,8)
# create names
names <- c('a1','a2','a3','a4','a5','a6')
#apply the names
generate <- function(mean) rnorm(mean = mean, n=10, sd=2)
lapply(means, generate) %>% set_names(names)