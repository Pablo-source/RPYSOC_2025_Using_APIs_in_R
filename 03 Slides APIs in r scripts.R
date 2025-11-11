# 03 Slides R scripts
# File: 03 Slides APIs in R scripts.R

# https://github.com/Pablo-source/RPYSOC_2025_Using_APIs_in_R/blob/main/Slides/RPySOC_25_APIs_in_R.qmd

# R script sections: 
# Install and load required packages {httr, httr2} and {jsonlite}
# 3. PRACTICAL EXAMPLE
# 3.1 Make a request through an API
# 3.2 Obtain the API response as a list 
# 3.3 Display API query reply using glimpse() 
# 3.4 Extract  Forecasting data from API response
# 3.5 Collect specific Forecast data variables (single temperature values for a give time period)
# 3.6 Display forecasted data as a tibble


# Install and load required libraries {httr, httr2} and {jsonlite}
install.packages(c("httr","httr2","jsonlite"),dependencies = TRUE)

library(httr)
library(httr2)
library(jsonlite)
library(dplyr)
library(purrr)

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


# 3.1 Make a request through an API

# First we need to pass to the request() function the URL of the API provided 
# by the US National Weather Service:
# To obtain the grid forecast for a point location, use the /points endpoint to
# retrieve the current grid forecast endpoint by coordinates:

# Using website API query example: https://api.weather.gov/points/39.7456,-97.0892

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

NWS_base_url <- 'https://api.weather.gov' # Base URL 

NWS_response <- request(NWS_base_url) %>%  # Append now further parts of the URL. Makes a GET() request to the API
  req_url_path_append('points','38.8894,-77.0352')  %>%  # Append further parts to the initial URL
  req_perform() # Perform a Request to get a response 
NWS_response_JSON <- NWS_response %>% resp_body_json() %>% 
  glimpse() # Display JSON file contents using glipmse()
NWS_response_JSON


# 3.4 Extract Forecasting data from API response

# In this section we analyse the API response locating the header containing forecasting data
# We explore the API request output using glimpse() function
# Identifying a section containing 'forecastHourly' and 'forecastGridData' metrics
# Section: \$ properties:List of 17 : `forecastHourly` : chr "https://api.weather.gov/gridpoints/LWX/97,71/forecast/hourly"',
# \$ 'forecastGridData : chr "https://api.weather.gov/gridpoints/LWX/97,71"')
# we now proceed to extract just that bit of information

# 1. Identify Forecast information from API response
Forecast_url <- NWS_response %>% 
  resp_body_json() %>% 
  pluck('properties','forecastHourly')
# 2. Display forecast data
forecast_response <- request(Forecast_url) %>% req_perform()
# 3. Finally evaluate response output
forecast_response_glipmse <- forecast_response  %>% resp_body_json() %>%  glimpse() # We display forecast for one hour at a time.
forecast_response_glipmse


# 3.5 Collect specific Forecast data variables (single temperature values for a give time period)

# From `API request() output` information under the `properties` section
# We extract , single temperature values.
# Obtaining the details for one of the list of 16 values displayed previously

# 1. Collect specific forecasted temperature data from the API response
Forecast_url <- NWS_response %>% 
  resp_body_json() %>% 
  pluck('properties','forecastHourly')
# 2. Display forecast data
forecast_response <- request(Forecast_url) %>% req_perform()
# 3. Evaluate response output
detailed_forecast <- forecast_response %>% resp_body_json() %>% 
  pluck('properties','periods') %>% 
  map_dfr( 
    \(x){
      tibble(
        time = x %>% pluck('startTime'),
        temp_F = x %>%  pluck('temperature')
      )
    }
    
  )
detailed_forecast


# 3.6 Display forecasted data as a tibble

# We simplify the code presenting just the required daily temperature to be used in a plots or dashboards
# Making use of `map_df()` function we can select `time` and `temperature` to be used in **dashboards** or
# **Quarto reports**

library(dplyr)
library(purrr)
# 1. Isolate periods information from API response
library(httr2)

detailed_forecast <- forecast_response %>% resp_body_json() %>% 
  pluck('properties','periods') %>% 
  map_dfr( 
    \(x){
      tibble(
        time = x %>% pluck('startTime'),
        temp_F = x %>%  pluck('temperature')
      )
    }
    
  )
detailed_forecast


# Further steps > This data is now available to be stored as a Data frame or Tibble and can be directly manipulated
# to be added to further API queries and build a data set with ten or twenty or a hundred metrics. 
# The final output will constitute a good database to feed any report or dashboard. 