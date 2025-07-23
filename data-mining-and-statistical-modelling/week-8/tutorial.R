library(magrittr)
library(TSA)
data(milk)

# Y_t = m_t + s_t + X_t (Additive)
# Y_t = m_t * s_t * X_t (Multiplicative)
# log(Y_t) = log(m_t * s_t * X_t) = log(m_t) + log(s_t) + log(X_t)

# TREND -----------------------------------------------------------------------
TIME <- seq(from = 1994, by = 1/12, length = length(milk))

plot(TIME,
     milk,
     type = 'l')

linear <- lm(milk ~ .,
             data = data.frame(TIME = poly(TIME, degree = 1, raw = TRUE)))


plot(TIME,
     milk,
     type = 'l')

lines(TIME,
     linear %>% fitted(),
     col = 'red',
     lwd = 3)


# SEASONALITY -----------------------------------------------------------------
milk.notrend <- milk - linear %>% fitted()


plot(TIME,
     
     milk.notrend,
     
     type = 'l')


SIN <- COS <- matrix(nrow = length(TIME), ncol = 6)


for(i in 1:6){
  
  SIN[,i] <- sin(2 * pi * i * TIME)
  
  COS[,i] <- cos(2 * pi * i * TIME)
  
}


har6 <- lm(milk.notrend ~ . - 1,
           
           
           data = data.frame(SIN = SIN[,1:5],
                             
                             cos = COS[,1:6]))


summary(har6)


plot(TIME,
     
     milk.notrend,
     
     type = 'l')

lines(TIME,
      
      har6 %>% fitted(),
      
      col = 'red',
      
      lwd = 2)


# COMBINED MODEL FOR TREND AND SEASONALITY ------------------------------------


combined <- lm(milk ~ .,
               
               
               data = data.frame(TIME = poly(TIME, degree = 1, raw = TRUE),
                                 
                                 SIN = SIN[,1:5],
                                 
                                 cos = COS[,1:6]))


plot(TIME,
     
     milk,
     
     type = 'l')

lines(TIME,
      
      combined %>% fitted(),
      
      col = 'red',
      
      lwd = 2)


milk.residuals <- milk - combined %>% fitted()