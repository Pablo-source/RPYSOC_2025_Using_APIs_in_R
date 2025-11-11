# 03 Slides R scripts

# https://github.com/Pablo-source/RPYSOC_2025_Using_APIs_in_R/blob/main/Slides/RPySOC_25_APIs_in_R.qmd


# Install and load required packages {httr} and {jsonlite}
install.packages(c("httr","httr2","jsonlite"),dependencies = TRUE)

library(httr)
library(httr2)
library(jsonlite)


# 1. Example of the need to use an API key to authenticate API requests: 
add1 <- "1600 Amphitheatre Parkway, Mountain View, CA"
sample1 <- GET("https://maps.googleapis.com/maps/api/geocode/json", query = list(address = add1))
result1 <- content(sample1)
result1

# 2. Example of  HTTR2 package in R to enable security features when querying APIs
library(httr2)
req <- request("http://example.com") |>
  req_auth_basic("username", "password")
req

