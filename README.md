# Using-APIs-in-R-to-obtain-Indicators for visualizations
Using APIs in R to obtain Indicators for interactive visualizations 

## New section: Spain State Meteorological Agency - AEMET - OpenDATA API

Ceate a new set of visualizations using ggplot and plotly libraries in R displaying MIN/MAX daily temperatures in Spain for the last 10 years using *AEMET OpenDATA* **API** for these cities: Valencia, Sevilla, Barcelona and Madrid,  to display effect of extreme weather in Spain.

Using API provided by AEMET: State Meteorological Agency – AEMET – Spanish Government

<https://opendata.aemet.es/centrodedescargas/inicio>

In progress !!

<img width="1747" height="818" alt="image" src="https://github.com/user-attachments/assets/8f935696-5f01-41ad-bd2a-a2131a1e1ba2" />

We will start by requesting our API key providing and email address, they will send us the API key to that email:
Selecting the **Obtaining API Key** from the menu below: 
<https://opendata.aemet.es/centrodedescargas/altaUsuario?>

<img width="1459" height="821" alt="image" src="https://github.com/user-attachments/assets/57f6a1e7-647a-4449-8783-4ffd99209a72" />

We need to fill in the form below: 
<img width="1437" height="731" alt="image" src="https://github.com/user-attachments/assets/c32e8166-cf90-462b-97ec-75a7d4a6d71d" />

Then we will receive our API Key for AEMET OpenData API in our Inbox


## Validating my newly received API key

From the AEMET main website, I can  validate the  API_Key they previously emailed to me to obtain daily temperatures data for specific Spanish cities: 

<img width="907" height="410" alt="image" src="https://github.com/user-attachments/assets/deae2a8c-6321-498b-bd6a-c95eb31835c1" />

Also I can test it on a new browser tab using this URL (providing my newly emailed API key): 
<https://opendata.aemet.es/opendata/api/observacion/convencional/todas?api_key= MY_NEW_API_KEY>

And I obtain a successful reply from AEMET API:

<img width="542" height="147" alt="image" src="https://github.com/user-attachments/assets/e293708c-edee-4a06-8c62-604695878280" />


- After requesting and obtaining my API Key (it's sent via email), I can start querying specific Weather information using the AEMET OpenData API, such as daily temperatures for specific cities in Spain: 

<https://opendata.aemet.es/dist/index.html?#/predicciones-especificas/Predicci%C3%B3n%20por%20municipios%20diaria.%20Tiempo%20actual>
<img width="924" height="548" alt="image" src="https://github.com/user-attachments/assets/bba8dfbe-1bfd-4974-8ba4-b885012d6ba4" />

## Creating a climate stripes graph for Valencia city using climaemet library

- GitHub {climaemet} package for reference and documentation:
 <https://github.com/rOpenSpain/climaemet>
- The goal of climaemet is to serve as an interface to download the climatic data of the Spanish Meteorological Agency (AEMET) directly from R using their API and create scientific graphs.
<img width="1175" height="657" alt="image" src="https://github.com/user-attachments/assets/180b5376-d8b5-420f-848e-8e14959c54c8" />

- 1.1 Then I can use the API Key I obtained previously from AEMET ApenData API, to extract temperature dat for specific locations with this package
<img width="897" height="294" alt="image" src="https://github.com/user-attachments/assets/efdaa54e-71fd-469f-9678-bd02530fe113" />


- This is an example on how to use the API to obtain a Climate Stripes graph for the city of Valencia
- First we need to obtain the AEMET weather station ID for the city of Valencia from this website: <https://ropenspain.github.io/climaemet/articles/aemet_stations.html>

<img width="1202" height="1099" alt="image" src="https://github.com/user-attachments/assets/56a695e4-d8e3-4c47-bee3-c9eae6c4f668" />

- Then we need to setup our API using our API Key to query AEMET OpenData API to obtain specific temperature values for this particular Valencia weather station:

- 1.2 Set your API key using this first method **aemet_api_key()** function:

<img width="662" height="342" alt="image" src="https://github.com/user-attachments/assets/e8f29461-aff9-4f43-af08-1ed9d196b123" />

- In the next two days I will provide an example on how to use an **environment variable** to store our API key as described in section below in this project

- 2.2 Submit a query to the API using previous API key to obtain a Climate Strips chart for Valencia

<img width="1687" height="752" alt="image" src="https://github.com/user-attachments/assets/104761fe-0276-4bc8-ad65-f71868c9b9a3" />
 
- Finally this is the Climate Strtips chart for Valencia as final output, the data used in this Climaet Strip plot, has been obtained performing an **API query** to AEMETOpenData API:<https://opendata.aemet.es/centrodedescargas/productosAEMET?>

<img width="657" height="651" alt="Valencia viveros climate stripes graph" src="https://github.com/user-attachments/assets/02d43d72-cdfe-40ce-889b-e5cff246190e" />


## Presentation slides

- Conference talk slides on GitHub: <https://pablo-source.github.io/RPySOC2025talk.html#/title-slide>

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
