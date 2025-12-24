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

