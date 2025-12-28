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
library(httr2)


# Store securely your API keys
# usethis::edit_r_profile(scope = "project")

# In .Rprofile file intoduce this line: 'options(this_is_my_key = "XXXX")'
# later, in the R script:
#  You can securely call your API keys this way: 'key <- getOption("this_is_my_key")'

# Now that I have securely saved my apikey I can use it on this script

key <- getOption("this_is_my_key")


# 1. Execute a query to the API for the city of Valencia
library(climaemet)

library(tibble)
stations <- aemet_stations()
stations
stations2 <- aemet_stations(verbose = TRUE)

# Then I can obtain Valencia Climate Strips using the API and the same method from above: 

# 1.1 Obtain data for Valencia weather station using API
  
# Valencia (Valencia, viveros AEMET weather station)
# (This is the Station ID for the API ): 8416Y
aemet_last_obs("8416Y") # Valencia vireos AEMET weather station 

# 1.2 Plot a climate stripes graph for a period of years for a station
library(ggplot2)

aemet_last_obs("8416Y") # Valencia Viveros 

temp_data <- climaemet::climaemet_8416Y_temp

ggstripes(temp_data, plot_title = "Valencia viveros") +
  labs(subtitle = "(1950-2020)")


# 2. Execute a query to the API for the city of Zaragoza in Spain

# Indicativo: 9434
# indsinop: 08160
# Name: ZARAGOZA, AEROPUERTO
# Altitude: 249
# LONG:-1.004167, LAT: 41.660556

temp_data <- climaemet::climaemet_9434_temp

ggstripes(temp_data, plot_title = "Zaragoza Airport") +
  labs(subtitle = "(1950-2020)")


# 3. Execute a query to (AEMET OpenData) API for the city of Barcelona
# AEMET Stations: Weather stations details for the API
# https://ropenspain.github.io/climaemet/articles/aemet_stations.html
# 0201X
# BARCELONA, DRASSANES

# Indicativo: 0201X
# Indsinop: 

temp_data <- climaemet::climaemet_0106X_temp

ggstripes(temp_data, plot_title = "Barcelona Drassanes") +
  labs(subtitle = "(1950-2020)")

# 4. Execute a query to (AEMET OpenData) API for a weatehr station in the City of Madrid
# AEMET Stations: Weather stations details for the API
# https://ropenspain.github.io/climaemet/articles/aemet_stations.html
# MADRID, RETIRO

# Indicative: 3195
# Indsinop 08222
MADRID, RETIRO
667
-3.678056
40.411667
