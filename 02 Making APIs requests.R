# 02 Making APIs requests

library(httr)
library(jsonlite)

# 1. Using GET function from HTTR package to retrieve .JSON data from the API URL

# Standard query to ask for data to an API. Using GET() function from {httr}
# Documentation: https://httr.r-lib.org/reference/GET.html
res = GET("https://api.open-notify.org/astros.json")
res

res2 =GET("https://givefood.org.uk/api/2/foodbanks/")
str(res2)

# Data.gov Utility Rates API
sample2 <- GET("http://api.data.gov/nrel/utility_rates/v3.json?api_key=sample_key&address=1600+Amphitheatre+Parkway,+Mountain+View,+CA")
content(sample2)
# Output: 
> content(sample2)
{html_document}
<html class="no-js datagov" dir="ltr" lang="en">
  [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<t ...
[2] <body class="archive category">\n<div class="page-landing-page layout-demo">\n< ...