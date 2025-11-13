# Using-APIs-in-R-to-obtain-Indicators for visualizations
Using APIs in R to obtain Indicators for interactive visualizations 

## Presentation slides

- Conference talk presentation available on GitHub website: <https://pablo-source.github.io/RPySOC2025talk.html#/title-slide>

I will showcase how to use Application Programming Interfaces (APIs) in R to gather Health and Social indicators from WHO and OECD organisations.

First I introduce what are APIs, making requests to an API, understanding its response, and transforming it into a JSON file,

Using **{httr2}** and {rsdmx} R packages to make a request to the API, interpret the response building multiple function calls, {httr2} package is the successor to {httr}.

<img width="1130" height="1193" alt="image" src="https://github.com/user-attachments/assets/531160ea-6850-4b65-9157-89d362f20f50" />

Later on data downloaded as **tibble** or **dataframe** from any **API** can be used in {ggplot2} and {plotly} charts, {gt} tables and {leaflet} interactive maps. 

Also, In future weeks I will include materials on how to create an API request for OECD data through a RESTful API based on SDMX standard. Using {rsdmx} package to fetch data programmatically.  Providing access to datasets within the catalogue of databases in SDMX format. The information downloaded from APIs can be used to create Shiny Dashboard. Using data from APIS we can feed information to dashboards displaying geographical information retrieved as an interactive {leaflet } or {ggplot2} map, and related indicators as Time series {plotly} charts and interactive {GT} tables. 

Later I will create an API request string as the URL with parameters specifying the data subset to access. I will provide examples using {httr2} to communicate with any API through R, returning several indicators as a JSON file. 

The talk documentation will be created as Quarto files and hosted alongside all the R script on my personal GitHub repository for people to clone and run them. 

# Managing API keys in a secure way

API keys are used to control how the API is being used. After requesting access to an API, you obtain a unique set of API keys assigned to your user, they authenticate and authorize you as an API user.

Some recommendations to keep your API keys secure: 
- You MUST avoid committing your API Keys to a public GitHub page.
- A recommended **method** is to **store** your **API keys** in a **special file** called **.Rprofile**. Making use of the edit_r_profile from {usethis} package to store and edit your .Rprofile
- Make sure **.Rprofile** is **included** in your **.gitignore file**, otherwise it will be synced with Github

Creating a **.Rprofile** file in the same place as your .Rproj file:
- 'usethis::edit_r_profile(scope = "project")'
- Then you can securely enter your API Key details in the **.Rprofile** file
- In .Rprofile file intoduce this line: 'options(this_is_my_key = "XXXX")'
- later, in the R script: You can securely call your API keys this way: 'key <- getOption("this_is_my_key")'

Important considerations when creating your .Rprofile file:
- Make sure your .Rprofile ends with a blank line
- Make sure .Rprofile is included in your .gitignore file, otherwise it will be synced with Github
- Restart RStudio after modifying .Rprofile in order to load any new keys into memory
- Spelling is important when you set the option in your .Rprofile

This diagram from <https://cran.r-project.org/web/packages/nixtlar/vignettes/setting-up-your-api-key.html> explains a secure way of saving your API keys

<img width="647" height="689" alt="image" src="https://github.com/user-attachments/assets/7ff6f886-3ec3-4447-8a56-7af29f437ade" />

Read mode about it:  
-   API authentication: <https://info5001.infosci.>
-   How to store and use webservice keys and authentication details with R:  <https://www.r-bloggers.com/2015/11/how-to-store-and-use-webservice-keys-and-authentication-details-with-r/>


## Online resources

List of online resources used to create this presentation

- Tidyverse. HTTR2 1.0.0
<https://tidyverse.org/blog/2023/11/httr2-1-0-0/>

- Key API concepts. Geeksforgeeks
<https://www.geeksforgeeks.org/r-language/access-collect-data-with-apis-in-r/>

- National Weather Service API
<https://www.weather.gov/documentation/services-web-api>

- How to Get Data From APIs with R and {httr2}.Author: Albert Rapp
<https://www.youtube.com/watch?v=hmtE4QGIOuk&t=1347s>

- How to GET data from API using R in RStudio. Author: Dean Chereden
<https://www.youtube.com/watch?v=AhZ42vSmDmE&t=366s>
