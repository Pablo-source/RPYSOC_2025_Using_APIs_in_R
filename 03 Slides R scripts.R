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

# 3. PRACTICAL EXAMPLE
# Getting data from US National Weather Service using an API

# First we need to pass to the request() function the URL of the API provided 
# by the US National Weather Service:
# To obtain the grid forecast for a point location, use the /points endpoint to
# retrieve the current grid forecast endpoint by coordinates:

# Using website API query example: https://api.weather.gov/points/39.7456,-97.0892

library(httr2)

NWS_base_url <- 'https://api.weather.gov' # Base URL 

National_weather <- request(NWS_base_url) %>%  # Append now further parts of the URL. Makes a GET() request to the API
  req_url_path_append(
    'points',
    '38.8894,-77.0352'
  )  %>%  # Append further parts to the initial URL
  req_perform() # Perform a Request to get a response 
National_weather

