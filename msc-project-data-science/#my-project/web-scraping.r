library(rvest)

# set url
url <- 'https://statswales.gov.wales/Catalogue/Health-and-Social-Care/General-Medical-Services/number-of-gps-employed-in-general-practices'
# get all the data and check
allData <- read_html(url)
allData

# '#' = ID
# '.' = CLASS

tableName <- read_html(url) %>% 
  # select table name using the ID
  html_nodes('#pivotGrid_osmnsortedpgHeader4T') %>%      
  html_text() %>% 
  # Trim additional white space
  str_trim()

colGP <- read_html(url) %>% 
  html_nodes('#pivotGrid_C0') %>% 
  html_text() %>% 
  # Trim additional white space
  str_trim()

local_health_boards <- read_html(url) %>% 
  html_nodes('.dxpgRowFieldValue') %>% 
  html_text() %>% 
  # Trim additional white space
  str_trim() %>% 
  unlist()

gp_practitioner <- read_html(url) %>% 
  html_nodes('#pivotGrid_C0') %>% 
  html_text() %>% 
  # Trim additional white space
  str_trim() %>% 
  unlist()
  
wales <- read_html(url) %>% 
  html_nodes('#pivotGrid_R0') %>%
  html_text() %>% 
  # Trim additional white space
  str_trim() %>% 
  unlist()
wales

url %>% 
  html_element("#tbody") %>% 
  html_table()
