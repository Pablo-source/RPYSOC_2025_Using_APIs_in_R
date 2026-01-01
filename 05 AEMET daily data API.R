# Script: "05 AEMET daily data API.R"

## AIM
# Create charts using ggplot in R displaying MIN/MAX DAILY temperatures over last 10 years using AEMET OpenDATA API for these cities: Valencia, Sevilla, Barcelona and Madrid, to display effect of extreme weather in Spain.
# Using API provided by AEMET: State Meteorological Agency – AEMET – Spanish Government

# Obtain daily temperatures for these Spanish cities: Valencia, Sevilla, Barcelona, Madrid, for the 
# last 20 years if available.

library(climaemet)
library(ggplot2)
library(usethis)
library(httr2)

# 1. Get My APY key 
usethis::edit_r_profile(scope = "project")

key <- getOption("this_is_my_key")


# 1. Execute a query to the API for the city of Valencia
library(climaemet)

library(tibble)
stations <- aemet_stations()
stations
stations2 <- aemet_stations(verbose = TRUE)