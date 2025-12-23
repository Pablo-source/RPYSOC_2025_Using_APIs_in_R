# 1. Installing API libraries in R

# 1. Installing {httr} and {curl} libraries 
# 1.1 Installed previously on my terminal Installed libcurl4-openssl-dev
# required: sudo apt-get install -y libcurl4-openssl-dev
install.packages('httr', keep_outputs = TRUE, repos='https://ftp.fau.de/cran/')
install.packages('curl', keep_outputs = TRUE, repos='https://ftp.fau.de/cran/')

# 2. installing package xml2
# required: sudo apt-get install -y libxml2-dev
install.packages('xml2')
library(xml2)

# 3.Installing {httr2} library
# https://httr2.r-lib.org/
install.packages('httr2',dependencies = TRUE)
library(httr2)

# 4. Installing {climaemet} library
# https://github.com/rOpenSpain/climaemet
install.packages('climaemet',dependencies = TRUE)
library(httr2)