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


# 3.1 Making a request through an API

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

# The API will return a JSON file (Javascript Object Notation). It is an structured data we can explore.


# 3.2 Obtain the API response as a list 

#  We can `display` the contents of the JSON file in a more `readable` way:
# Then you have to identify from the API output query, which bits to use for your analysis.
# For that we will use the `glimpse()` function from {dplyr} package

library(httr2)

NWS_base_url <- 'https://api.weather.gov' # Base URL 

NWS_response <- request(NWS_base_url) %>%  # Append now further parts of the URL. Makes a GET() request to the API
  req_url_path_append(
    'points',
    '38.8894,-77.0352'
  )  %>%  # Append further parts to the initial URL
  req_perform() # Perform a Request to get a response 
NWS_response

NWS_response %>% resp_body_json() # Display JSON file contents


# 3.3 Display API query reply using glimpse() 

# We can display the contents of the JASON file in a more readable way:
# Then you have to identify from the API output query, which bits to use for your analysis.
# glimpse() function from {DPLYR} makes possible to see every column in a data frame.

library(httr2)
library(dplyr)
NWS_base_url <- 'https://api.weather.gov' # Base URL 

NWS_response <- request(NWS_base_url) %>%  # Append now further parts of the URL. Makes a GET() request to the API
  req_url_path_append('points','38.8894,-77.0352')  %>%  # Append further parts to the initial URL
  req_perform() # Perform a Request to get a response 
NWS_response_JSON <- NWS_response %>% resp_body_json() %>% 
  glimpse() # Display JSON file contents using glipmse()
NWS_response_JSON


