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



highest_temp <- function(sublist){
  # what position is the max value in the nested list
  sublist %>% 
    unlist() %>% 
    as.vector() %>% 
    which.max() -> position
  # what position does this correspond to in the sublist
  sub_position <- round((position/16440)*10)
  # find the value, year, month then region
  # VAL
  max_val <- 
    sublist[[sub_position]][which.max(sublist[[sub_position]])]
  # YEAR
  max_year <- 
    floor(time(sublist[[sub_position]]))[which.max(sublist[[sub_position]])]
  # MONTH
  month <- 
    month.abb[(time(sublist[[sub_position]])[which.max(sublist[[sub_position]])] %>% 1)*12+1]
  # REGION
  region <- names(sublist[sub_position])
  # PRINT
  paste('max temp is', max_val, 'during', month, max_year, 'in', region, sep = " ") %>% print()
}

highest_temp(Data)
