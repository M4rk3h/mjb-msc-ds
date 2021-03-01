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
