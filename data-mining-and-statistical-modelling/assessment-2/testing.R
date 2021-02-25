# list of pets
pets = list("cats", "dogs")

# comment link
search_url = paste("https://duckduckgo.com/?q=", pets, sep = "")

# function for x in pets
getSearch <- function(x) {
  search_url[[x]]
}

getSearch(1)
#> [1] "https://duckduckgo.com/?q=cats"
getSearch(2)
#> [1] "https://duckduckgo.com/?q=dogs"
