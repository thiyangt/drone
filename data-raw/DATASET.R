## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

## Packages
library(tidyverse)
library(readr)
library(here)
library(readxl)

## data sources
# data 1: CLASS.xlsx
# https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators
# Current classification by income (Last Updated:Aug 21, 2023)
# Accessed on 1 Dec 2023
CLASS <- read_excel("data-raw/CLASS.xlsx")
class.2023.aug <- CLASS
colnames(class.2023.aug) <- c("Country", colnames(class.2023.aug)[-1])
View(class.2023.aug)
#save(class.2023.aug, file = here("data", "class.2023.aug.rda"))


# data 2: OGHIST.xlsx
# https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators
# Historical classification by income (Last Updated:Jun 30, 2023)
# Accessed on 1 Dec 2023
OGHIST <- read_excel("data-raw/OGHIST.xlsx", 
                     sheet = "Country Analytical History")
View(OGHIST)
dim(OGHIST)
historical.class <- OGHIST[11:239,]
View(historical.class)
colnames(historical.class) <- c("Code", "Country", 1987:2022)
View(historical.class)
subset.class.2023.aug <- class.2023.aug |>
  select(c(1, 3, 5))
View(subset.class.2023.aug)
dim(historical.class) #229 38
historical.class <- historical.class[1:218, ]
dim(historical.class)
dim(subset.class.2023.aug) #267 3
historical.class <- full_join(historical.class, subset.class.2023.aug, by="Country")
View(historical.class)
historical.class <- historical.class %>%
  mutate_all(~na_if(., ".."))
View(historical.class)
#save(historical.class, file = here("data", "historical.class.rda"))

# data 3: fuel.csv
# https://datacatalog.worldbank.org/indicator/5077c233-bdce-eb11-bacc-000d3a596ff0/Access-to-clean-fuels-and-technologies-for-cooking----of-population-
# Access to clean fuels and technologies for cooking (% of population)
# Access to clean fuels and technologies for cooking is the proportion of total population primarily using clean cooking fuels and technologies for cooking. Under WHO guidelines, kerosene is excluded from clean cooking fuels.
# app to download
# https://databank.worldbank.org/reports.aspx?dsid=2&series=EG.CFT.ACCS.ZS#
fuel <- read_csv("data-raw/fuel.csv")
View(fuel)

# data 4: electricity
# https://databank.worldbank.org/reports.aspx?dsid=2&series=EG.ELC.ACCS.ZS
# Access To Electricity Is The Percentage Of Population With Access To Electricity. Electrification Data Are Collected From Industry, National Surveys And International Sources.
electricity <- read_csv("data-raw/electricity.csv")
View(electricity)