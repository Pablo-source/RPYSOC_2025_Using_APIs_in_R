# Script: "05 AEMET daily data API.R"

## AIM
# Create charts using ggplot in R displaying MIN/MAX DAILY temperatures over last 10 years using AEMET OpenDATA API for these cities: Valencia, Sevilla, Barcelona and Madrid, to display effect of extreme weather in Spain.
# Using API provided by AEMET: State Meteorological Agency – AEMET – Spanish Government

# Obtain daily temperatures for these Spanish cities: Valencia, Sevilla, Barcelona, Madrid, for the 
# last 20 years if available.

## Prelude

# Remember to run this line below to have all your required libraries restores in your {renv} 
renv::restore()


# So you can just load them straight away in this step below
library(climaemet)
library(ggplot2)
library(usethis)
library(dplyr)


# 1. Get My APY key 
usethis::edit_r_profile(scope = "project")

key <- getOption("this_is_my_key")

# 2. Execute a query to the API for the city of Valencia
library(climaemet)

library(tibble)
stations <- aemet_stations()
stations
stations2 <- aemet_stations(verbose = TRUE)

# 3. Check API Connection with "opendata.aemet.es" is working fine

# I should obtain a "Status: 200 " indicating the API key has worked and I have established the connection with opendata.aemet.es API

# 3.1 Using GET method using httr2 library
library(httr2)


# 3.1 Get data from AEMET using API 

AEMET_conn <-'opendata.aemet.es'

AEMET_National_weather <- request(AEMET_conn) %>%  # Append now further parts of the URL. Makes a GET() request to the API
  req_perform() # Perform a Request to get a response 
AEMET_National_weather

# Response
<httr2_response>
  GET https://opendata.aemet.es/
  Status: 200 OK
Content-Type: text/html
Body: In memory (825 bytes)

# We can see that this time Data is returned as HTML as described by the "content-Type: text/html

# 3.2 Display contents of the response returned by the API query using glimpse() function
# glimpse() function from {dplyr} package

AEMET_html_weather_data <- request(AEMET_conn) %>%  # Append now further parts of the URL. Makes a GET() request to the API
  req_perform() %>%  # Perform a Request to get a response 
  glimpse() 

AEMET_html_weather_data


# The object created "AEMET_html_weather_data" contains now all the required info from the API query.





