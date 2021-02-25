# Try to create a function of this**

# create a vector for the district names
districts <- c("Northern_Ireland","Scotland_N",
               "Scotland_E","Scotland_W",
               "England_E_and_NE","England_NW_and_N_Wales",
               "Midlands", "East_Anglia",
               "England_SW_and_S_Wales", "England_SE_and_Central_S")
# set up a base url for the districts
urlMax = paste("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/",districts[],".txt", sep = '') 
# create an empty data frame
df <- data.frame()

# loop through the urls, and use fread to read the data for each link
for (x in 1:10){
  #print(url[x])
  df <- fread(urlMax[x]) # %>% rbind(df)
  Sys.sleep(1)
}

for (x in 1:10){
  df <- data.frame()
}

my_dfs <- lapply(districts, data.frame)
names(my_dfs) <- districts


