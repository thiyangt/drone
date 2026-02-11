## code to prepare `DATASET` dataset goes here

#usethis::use_data(DATASET, overwrite = TRUE)

rm(list=ls())

## Packages
library(tidyverse)
library(readr)
library(here)
library(readxl)

## Restrictions to use
# https://datacatalog.worldbank.org/getting-started

## data sources
# data 1: CLASS.xlsx
# https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators
# Current classification by income (Last Updated:Aug 21, 2023)
# Accessed on 1 Dec 2023
CLASS <- read_excel("data-raw/CLASS.xlsx")
class.2023.aug <- CLASS
colnames(class.2023.aug) <- c("Country", colnames(class.2023.aug)[-1])
#View(class.2023.aug)
class.2023.aug <- class.2023.aug[1:218, 1:3]


# data 2: OGHIST.xlsx
# https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators
# Historical classification by income (Last Updated:Jun 30, 2023)
# Accessed on 1 Dec 2023
OGHIST <- read_excel("data-raw/OGHIST.xlsx", 
                     sheet = "Country Analytical History")
#View(OGHIST)
dim(OGHIST)
historical.class <- OGHIST[11:228,]
#View(historical.class)
colnames(historical.class) <- c("Code", "Country", 1987:2022)
#View(historical.class)
historical.class <- historical.class %>%
  mutate_all(~na_if(., ".."))
#View(historical.class)
historical.class <- historical.class |>
  pivot_longer(
    cols = "1987":"2022",
    names_to = "Year",
    values_to = "Income"
  )
#View(historical.class)
# data 3: fuel.csv
# https://datacatalog.worldbank.org/indicator/5077c233-bdce-eb11-bacc-000d3a596ff0/Access-to-clean-fuels-and-technologies-for-cooking----of-population-
# Access to clean fuels and technologies for cooking (% of population)
# Access to clean fuels and technologies for cooking is the proportion of total population primarily using clean cooking fuels and technologies for cooking. Under WHO guidelines, kerosene is excluded from clean cooking fuels.
# app to download
# https://databank.worldbank.org/reports.aspx?dsid=2&series=EG.CFT.ACCS.ZS#
fuel <- read_csv("data-raw/fuel.csv")
#View(fuel)
fuel <- fuel |>
  mutate_all(~na_if(., ".."))
#View(fuel)
fuel <- fuel[1:217, -c(1, 2, 16)]
#View(fuel)
colnames(fuel) <- c("Country",
                           "Code",
                           1990,
                           2000,
                           2013,
                           2014,
                           2015,
                           2016,
                           2017,
                           2018,
                           2019,
                           2020,
                           2021)
#View(fuel)
fuel <- fuel |>
  pivot_longer(
    cols = "1990":"2021",
    names_to = "Year",
    values_to = "Cooking"
  )
#View(fuel)

# data 4: electricity
# https://databank.worldbank.org/reports.aspx?dsid=2&series=EG.ELC.ACCS.ZS
# Access To Electricity Is The Percentage Of Population With Access To Electricity. Electrification Data Are Collected From Industry, National Surveys And International Sources.
electricity <- read_csv("data-raw/electricity.csv")
electricity <- electricity |>
  mutate_all(~na_if(., ".."))
#View(electricity)
electricity <- electricity[1:217, -c(1, 2, 16)]
#View(electricity)
colnames(electricity) <- c("Country",
                           "Code",
                           1990,
                           2000,
                           2013,
                           2014,
                           2015,
                           2016,
                           2017,
                           2018,
                           2019,
                           2020,
                           2021)
#View(electricity)
electricity <- electricity |>
  mutate(across(where(is.numeric), ~round(., 2)))
#View(electricity)
electricity <- electricity |>
  pivot_longer(
    cols = "1990":"2021",
    names_to = "Year",
    values_to = "Electricity"
  )
#View(electricity)

## combine
fuel.electricity <- full_join(fuel, 
                              electricity, 
                              by =c("Country",
                                    "Code",
                                    "Year"))
#View(fuel.electricity)
fuel.electricity.income <- full_join(fuel.electricity, historical.class,
                                     by =c("Country",
                                           "Code",
                                           "Year"))
#View(fuel.electricity.income)
class.fuel.electricity.income <- full_join(class.2023.aug, 
                                           fuel.electricity.income,
                                           by =c("Country",
                                                 "Code"))
#View(class.fuel.electricity.income)
worldbankdata <- class.fuel.electricity.income
worldbankdata <- as_tibble(class.fuel.electricity.income)
worldbankdata$Income[worldbankdata$Income == "LM*"] <- "LM"
worldbankdata$Income <- factor(worldbankdata$Income,
                               levels = c("L",
                                          "LM",
                                          "UM",
                                          "H"))
worldbankdata$Country <- factor(worldbankdata$Country)
worldbankdata$Code <- factor(worldbankdata$Code)
worldbankdata$Region <- factor(worldbankdata$Region)
worldbankdata$Electricity <- as.numeric(worldbankdata$Electricity)
worldbankdata$Cooking <- as.numeric(worldbankdata$Cooking)
worldbankdata$Year <- as.integer(worldbankdata$Year)
#View(worldbankdata)
summary(worldbankdata)
worldbankdata
worldbankdata <- worldbankdata |>
  mutate(across(where(is.numeric), ~round(., 2)))
#View(worldbankdata)
save(worldbankdata, file = "data/worldbankdata.RData")

## 2026 Jan 3
library(readr)
happiest_countries_in_the_world_2025 <- read_csv("data-raw/happiest-countries-in-the-world-2025.csv")
View(happiest_countries_in_the_world_2025)
WorldHappinessScore <- happiest_countries_in_the_world_2025
usethis::use_data(WorldHappinessScore)
