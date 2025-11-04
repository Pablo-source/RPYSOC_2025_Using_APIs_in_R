# Using-APIs-in-R-to-obtain-Health-Indicators
Using APIs in R to obtain Indicators for interactive visualizations 

I will showcase how to use Application Programming Interfaces (APIs) in R to gather Health and Social indicators from WHO and OECD organisations.

First I introduce what are APIs, making requests to an API, understanding its response, and transforming it into a JSON file, to be used in {ggplot2} and {plotly} charts, {gt} tables and {leaflet} interactive maps. Using {httr2} and {rsdmx} R packages to make a request to the API, interpret the response building multiple function calls, {httr2} package is the successor to {httr}.

Also, I will demo how to create an API request for OECD data through a RESTful API based on SDMX standard. Using {rsdmx} package to fetch data programmatically.  Providing access to datasets within the catalogue of databases in SDMX format.

Later I will create an API request string as the URL with parameters specifying the data subset to access. I will provide examples using {httr2} to communicate with any API through R, returning several indicators as a JSON file. 

Finally, I will display the response from the query executed through an API in R into a Shiny Dashboard. 

This dashboard will display geographical information retrieved as an interactive {leaflet } or {ggplot2} map, and related indicators as Time series {plotly} charts and interactive {GT} tables. 

The talk documentation will be created as Quarto files and hosted alongside all the R script on my personal GitHub repository for people to clone and run them. 
