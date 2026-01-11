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

aemet_api_key(key)

library(climaemet)
aemet_last_obs("9434")

# Zaragoza City Latest observations
Zaragoza_city_Latest_obs <-  aemet_last_obs("9434")

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

# 4. PERFORM A Query to the API for specific CITY station

# Using Key from my R profile (it includes my API KEY)  stored in a secure way. 
key

library(climaemet)
library(ggplot2)
library(dplyr)


aemet_api_key(key)

# Obtain different weather sations ID codes (Indicativo) from website below:
https://ropenspain.github.io/climaemet/articles/aemet_stations.html

aemet_api_key()
aemet_stations(verbose = TRUE, return_sf = FALSE)

# 4.1 Obtain yearly data for Zaragoza city

# Indicativo: 9434
# indsinop: 08160
# Name: ZARAGOZA, AEROPUERTO
# URL: ZARAGOZA Weather Station: https://ropenspain.github.io/climaemet/reference/climaemet_9434_temp.html

Zaragoza_city_Latest_obs <-  aemet_last_obs("9434")

temp_data_Zaragoza <- climaemet::climaemet_9434_temp

ggstripes(temp_data_zaragoza, plot_title = "Zaragoza Airport") +
  labs(subtitle = "(1950-2020)")


# 4.2 Obtain Daily forecast for VALENCIA city from API

# Indicativo Valencia city 
# Valencia (Valencia, viveros AEMET weather station)
# (This is the Station ID for the API ): 8416Y
Valencia_city_Latest_obs <-  aemet_last_obs(" 8416Y")

# Display all cities from AEMET API
# Replicating the steps below from this website for the city of Valencia
# https://ropenspain.github.io/climaemet/reference/aemet_forecast.html

data(aemet_munic)
aemet_munic

library(dplyr)

munis <- aemet_munic |>
  filter(municipio %in% c("46250")) |>
  pull(municipio)

daily_VALENCIA <- aemet_forecast_daily(munis)

# Valencia DAILY FORECASTED TEMPERATURES NEXT 7 days
# SAVE DAILY VALENCIA TEMPERATURES. Daily Min and Max temperatures for Valencia
daily_VALENCIA |>
  select(municipio, fecha, nombre, temperatura)

Valencia_7D_TEMPERATURE_forecast <- daily_VALENCIA |>
  select(municipio, fecha, nombre, temperatura)

# Save them in the New folder "API_queries_output_data" as a .csv file.
# 4 Finally we write out combined file as a new .csv file

write.csv(Valencia_7D_TEMPERATURE_forecast,"./API_queries_output_data/Valencia_7D_Forecast_Temperatures_from_11JAN2026.csv", row.names = FALSE)




# WIP section
# 5. Obtain daily termperatures on specific Time interval
# Source: {climaemet} reference manual
# Example from: https://cran.r-project.org/web/packages/climaemet/climaemet.pdf. Page 16

# Select a city
data("aemet_munic")

library(dplyr)
munis <- aemet_munic %>%
  filter(municipio_nombre %in% c("Santiago de Compostela", "Lugo")) %>%
  pull(municipio)
daily <- aemet_forecast_daily(munis)
# Metadata
meta <- aemet_forecast_daily(munis, extract_metadata = TRUE)
glimpse(meta$campos)
# Vars available
aemet_forecast_vars_available(daily)
# This is nested
daily %>%
  select(municipio, fecha, nombre, temperatura)
# Select and unnest
daily_temp <- aemet_forecast_tidy(daily, "temperatura")
# This is not
daily_temp
# Wrangle and plot
daily_temp_end <- daily_temp %>%
  select(
    elaborado, fecha, municipio, nombre, temperatura_minima,
    temperatura_maxima
  ) %>%
  tidyr::pivot_longer(cols = contains("temperatura"))
# Plot
library(ggplot2)
ggplot(daily_temp_end) +
  geom_line(aes(fecha, value, color = name)) +
  facet_wrap(~nombre, ncol = 1
  ) +
    scale_color_manual(
    values = c("red", "blue"),
    labels = c("max", "min")
  ) +
  scale_x_date(
    labels = scales::label_date_short(),
    breaks = "day"
  ) +
  scale_y_continuous(
    labels = scales::label_comma(suffix = "º")
  ) +
  theme_minimal() +
  labs(
    x = "", y = "",
    color = "",
    title = "Forecast: 7-day temperature",
    subtitle = paste(
      "Forecast produced on",
      format(daily_temp_end$elaborado[1], usetz = TRUE)
    )
  )
  
  

