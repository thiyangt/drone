rm(list=ls())
ls()

library(readr)
library(tidyverse)
library(here)

X2015 <- read_csv("data-raw/happinessdata/2015.csv")
View(X2015)
colnames(X2015)
X2016 <- read_csv("data-raw/happinessdata/2016.csv")
View(X2016)
colnames(X2016)
X2017 <- read_csv("data-raw/happinessdata/2017.csv")
View(X2017)
colnames(X2017)

## 2015
names15 <- c("Country", "Region", "HappinessScore2015", 
             "GDPpercapita2015")

x15 <- X2015 |>
  select(1, 2, 4, 6) |>
  rename_with(~ names15)

## 2016
names16 <- c("Country","HappinessScore2016", 
             "GDPpercapita2016")

x16 <- X2016 |>
  select(1, 4, 6) |>
  rename_with(~ names16)

## 2017
names17 <- c("Country","HappinessScore2017", 
             "GDPpercapita2017")

x17 <- X2017 |>
  select(1, 3,  6) |>
  rename_with(~ names17)

happiness_gdp <- x15 |>
  left_join(x16, by = "Country") |>
  left_join(x17, by = "Country")
View(happiness_gdp)


write_csv(happiness_gdp, file = here("data-raw", "happinessdata", "happiness_gdp.csv"))
# usethis::use_data(happiness_gdp)

## Income Level Categories
library(readxl)
CLASS_hist_2025_10_07 <- read_excel("data-raw/happinessdata/CLASS_hist_2025_10_07.xlsx")
View(CLASS_hist_2025_10_07)
colnames(CLASS_hist_2025_10_07)

data_income <- CLASS_hist_2025_10_07 |>
  select(country_name, year, income) |>
  filter( year %in% c(2015, 2016, 2017) )
head(data_income)

data_income <- data_income |>
  pivot_wider(names_from = year,
              values_from = income)
head(data_income)

names <- c("Country",
           "Income2015",
           "Income2016",
           "Income2017")

data_income <- data_income |>
  rename_with(~ names)
head(data_income)

happiness_gdp_income <- left_join(happiness_gdp,
                                  data_income,
                                  by="Country")
View(happiness_gdp_income)
happiness_gdp_income <- happiness_gdp_income |>
  mutate(Income2015 = as.factor(Income2015),
         Income2016 = as.factor(Income2016),
         Income2017 = as.factor(Income2017))
head(happiness_gdp_income)
write_csv(happiness_gdp_income, file = here("data-raw", "happinessdata", "happiness_gdp_income.csv"))
usethis::use_data(happiness_gdp_income, overwrite = TRUE)
