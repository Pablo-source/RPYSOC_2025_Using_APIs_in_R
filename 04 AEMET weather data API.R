# 04 AEMET weather data API.R

## AIM
# Create a new set of visualizations using ggplot and plotly libraries in R displaying MIN/MAX daily temperatures in Spain for the last 10 years using AEMET OpenDATA API for these cities: Valencia, Sevilla, Barcelona and Madrid, to display effect of extreme weather in Spain.
# Using API provided by AEMET: State Meteorological Agency – AEMET – Spanish Government
# https://opendata.aemet.es/centrodedescargas/inicio

# 1. Using {climaemet} library to produce first API query 
# https://github.com/rOpenSpain/climaemet

library(climaemet)
library(ggplot2)
library(usethis)


# Store securely your API keys
# usethis::edit_r_profile(scope = "project")

# In .Rprofile file intoduce this line: 'options(this_is_my_key = "XXXX")'
# later, in the R script:
#  You can securely call your API keys this way: 'key <- getOption("this_is_my_key")'

# Now that I have securely saved my apikey I can use it on this script

key <- getOption("this_is_my_key")


# 1. Execute a query to the API for the city of Valencia
library(climaemet)

aemet_api_key(key, install = TRUE)

# Then I can obtain Valencia Climate Strips using the API and the same method from above: 

# 1.1 Obtain data for Valencia weather station using API
  
# Valencia (Valencia, viveros AEMET weather station)
# (This is the Station ID for the API ): 8416Y
aemet_last_obs("8416Y") # Valencia vireos AEMET weather station 

# 2. Plot a climate stripes graph for a period of years for a station
library(ggplot2)

temp_data <- climaemet::climaemet_8416Y_temp

ggstripes(temp_data, plot_title = "Valencia viveros") + labs (subtitle = "(1950-2020)")



