# Using-APIs-in-R-to-obtain-Indicators for visualizations
Using APIs in R to obtain Indicators for interactive visualizations 

## Cloning and restoring this project locally using {renv} library

To run this project locally, please follow these three steps below to restore project environment using {renv} library:

1-2. Clone RPYSOC_2025_Using_APIs_in_R repo using git on your IDE or terminal using local **clone HTTPS** option: <https://github.com/Pablo-source/RPYSOC_2025_Using_APIs_in_R.git>

- git clone https://github.com/Pablo-source/RPYSOC_2025_Using_APIs_in_R.git

Navigate to the cloned repo, then open Rproject by clicking on the Basic-Shiny-app.Rproj file. This will display the Shiny app files on your "Files" tab in RStudio.

2-2. Run **renv::restore()** in a new Rscript. The first time the app finshed running, I captured its **final state using renv::snapshot()** To ensure all required packages are loaded, **we reinstall exact packages declared in the project lockfile renv.lock** Then we run renv::restore(), **this ensures we have all required packages loaded** and ready in our **local R environment**.
renv::restore()
If prompted, after running restore() function, choose "1: Activate the project and use the project library." from menu displayed in the R Console.

<img width="827" height="354" alt="image" src="https://github.com/user-attachments/assets/03f5ab0f-d6e0-4bf2-9cfd-ae0100cdfaa3" />


## Presentation slides

- Conference talk slides on GitHub: <https://pablo-source.github.io/RPySOC2025talk.html#/title-slide>

I will showcase how to use Application Programming Interfaces (APIs) in R to gather Health, Social and Weather data.

First I introduce what are APIs, making requests to an API, understanding its response, and transforming it into a JSON file,

## New section: Spain State Meteorological Agency - AEMET - OpenDATA API

Ceate a new set of visualizations using ggplot and plotly libraries in R displaying MIN/MAX daily temperatures in Spain for the last 10 years using *AEMET OpenDATA* **API** for these cities: Valencia, Sevilla, Barcelona and Madrid,  to display effect of extreme weather in Spain.

Using API provided by AEMET: State Meteorological Agency – AEMET – Spanish Government

<https://opendata.aemet.es/centrodedescargas/inicio>

<img width="1747" height="818" alt="image" src="https://github.com/user-attachments/assets/8f935696-5f01-41ad-bd2a-a2131a1e1ba2" />

We will start by requesting our API key providing and email address, they will send us the API key to that email:
Selecting the **Obtaining API Key** from the menu below: 
<https://opendata.aemet.es/centrodedescargas/altaUsuario?>

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

- See script **O4 AEMET weather data API.R** for details on how to **use an API key**  and create this **climate stripes** charts for **Valencia** city.

- GitHub {climaemet} package for reference and documentation:
 <https://github.com/rOpenSpain/climaemet>
- The goal of climaemet is to serve as an interface to download the climatic data of the Spanish Meteorological Agency (AEMET) directly from R using their API and create scientific graphs.
<img width="1175" height="657" alt="image" src="https://github.com/user-attachments/assets/180b5376-d8b5-420f-848e-8e14959c54c8" />

- Then I can use the API Key I obtained previously from AEMET ApenData API, to extract temperature dat for specific locations with this package
<img width="897" height="294" alt="image" src="https://github.com/user-attachments/assets/efdaa54e-71fd-469f-9678-bd02530fe113" />


- This is an example on how to use the API to obtain a Climate Stripes graph for the city of Valencia
- First we need to obtain the AEMET weather station ID for the city of Valencia from this website: <https://ropenspain.github.io/climaemet/articles/aemet_stations.html>

<img width="1202" height="1099" alt="image" src="https://github.com/user-attachments/assets/56a695e4-d8e3-4c47-bee3-c9eae6c4f668" />

- Then we need to setup our API using our API Key to query AEMET OpenData API to obtain specific temperature values for this particular Valencia weather station:

- 1.2 Set your API key using this first method **aemet_api_key()** function:

<img width="662" height="342" alt="image" src="https://github.com/user-attachments/assets/e8f29461-aff9-4f43-af08-1ed9d196b123" />

- In the next two days I will provide an example on how to use an **environment variable** to store our API key as described in section below in this project

- 2.2 Set you API key with {**usethis**} package to include securely my API key in the **.Rprofile** file

- In .Rprofile file intoduce this line: **'options(this_is_my_key = "XXXX")'**

<img width="709" height="261" alt="image" src="https://github.com/user-attachments/assets/ceb41aeb-66c4-42b4-8c7d-a743287b9aa9" />

- Remember to **Restart** your R session for the .Pprofile changes to take effect

- Now I can check with {httr2} that I am able to connect to **AEMET Open Data API** using {hhtr2} library.
<img width="914" height="779" alt="image" src="https://github.com/user-attachments/assets/f754a5bc-01c9-4329-8c46-e09c4c96e631" />

- As it returns **status 200** meaning the connection has been successfully. Now I can start **querying data** using **httr2 package*** with my **API KEY**

<img width="851" height="311" alt="image" src="https://github.com/user-attachments/assets/075534a4-6a39-42eb-b4ef-96e9e548e0f6" />

<img width="464" height="267" alt="image" src="https://github.com/user-attachments/assets/2bb4b00f-1322-4803-bc8c-09a8bbd6370c" />

- Now I proceed to obtain weather data for Valencia using the API
 
- Make sure .Rprofile is included in your .gitignore file, to avoid uploading it to Github 

<img width="913" height="467" alt="image" src="https://github.com/user-attachments/assets/90c0f1c6-44ac-43e3-be16-f947b31fa850" />

- See script "**04 AEMET weather data API.R**" for details of the ggstrips charts below:
  
- Submit a query to the API using previous API key to obtain a Climate Strips chart for Valencia

<img width="1687" height="752" alt="image" src="https://github.com/user-attachments/assets/104761fe-0276-4bc8-ad65-f71868c9b9a3" />
 
- Finally this is the Climate Strtips chart for Valencia and Zaragoza as final output, the data used in this Climaet Strip plot, has been obtained performing an **API query** to AEMETOpenData API:<https://opendata.aemet.es/centrodedescargas/productosAEMET?>

<img width="657" height="651" alt="Valencia viveros climate stripes graph" src="https://github.com/user-attachments/assets/02d43d72-cdfe-40ce-889b-e5cff246190e" />

- See R Script: **04 AEMET weather data API.R** for details on how I created the above Climate strips chart for Valencia city.

## httr2 package and reference manual

Using **{httr2}** and {rsdmx} R packages to make a request to the API, interpret the response building multiple function calls, {httr2} package is the successor to {httr}.

- httr2 Main website: <https://httr2.r-lib.org/>

- httr2 Reference website: <https://httr2.r-lib.org/reference/index.html>

<img width="1130" height="1193" alt="image" src="https://github.com/user-attachments/assets/531160ea-6850-4b65-9157-89d362f20f50" />

Later on data downloaded as **tibble** or **dataframe** from any **API** can be used in {ggplot2} and {plotly} charts, {gt} tables and {leaflet} interactive maps. 

Also, In future weeks I will include materials on how to create an API request for OECD data through a RESTful API based on SDMX standard. Using {rsdmx} package to fetch data programmatically.  Providing access to datasets within the catalogue of databases in SDMX format. The information downloaded from APIs can be used to create Shiny Dashboard. Using data from APIS we can feed information to dashboards displaying geographical information retrieved as an interactive {leaflet } or {ggplot2} map, and related indicators as Time series {plotly} charts and interactive {GT} tables. 

Later I will create an API request string as the URL with parameters specifying the data subset to access. I will provide examples using {httr2} to communicate with any API through R, returning several indicators as a JSON file. 

The talk documentation will be created as Quarto files and hosted alongside all the R script on my personal GitHub repository for people to clone and run them. 

## Managing API keys in a secure way

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

- Storing security you API keys on your .Rprofile
<img width="1003" height="420" alt="image" src="https://github.com/user-attachments/assets/36500264-de15-44ed-a457-f051856006f7" />

Read mode about it:  
-   API authentication: <https://info5001.infosci.cornell.edu/tutorials/store-api-keys.html>
<img width="1487" height="851" alt="image" src="https://github.com/user-attachments/assets/92fbf09d-543d-45ef-83df-ae1e3f4cd55e" />


-   How to store and use webservice keys and authentication details with R:  <https://www.r-bloggers.com/2015/11/how-to-store-and-use-webservice-keys-and-authentication-details-with-r/>

### Using {usethis} package to store API keys on your .Rprofile file

We can use {usethis} package to open and save your API keys on the .Rprofile file

- install.packages("usethis")
- usethis::edit_r_environ()
- Then you only have to paste this onto your .Rprofile file:
- MY_APIKEY <- "here_goes_your_API_key"

This is a secure way of storing your API keys and making them available when working on your project
- **Remeber to include** this **.Rprofile file** on your **.gitignore** file.

## Online resources

List of online resources used to create this presentation

- Tidyverse. httr2 1.0.0
<https://tidyverse.org/blog/2023/11/httr2-1-0-0/>

- Key API concepts. Geeksforgeeks
<https://www.geeksforgeeks.org/r-language/access-collect-data-with-apis-in-r/>

- National Weather Service API
<https://www.weather.gov/documentation/services-web-api>

- How to Get Data From APIs with R and {httr2}.Author: Albert Rapp
<https://www.youtube.com/watch?v=hmtE4QGIOuk&t=1347s>

- How to GET data from API using R in RStudio. Author: Dean Chereden
<https://www.youtube.com/watch?v=AhZ42vSmDmE&t=366s>
