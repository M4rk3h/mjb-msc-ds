require(data.table)

system.time(DT <- fread("https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Scotland_N.txt"))