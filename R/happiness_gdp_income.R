#' Happiness Score, GDP Per Capita, and Income Level of Countries From 2015 To 2017
#'
#' @description
#' This dataset provided happiness score and GDP per capita taken from Karina Chotchaeva.(2017). World Happiness Report. Zenodo. https://doi.org/10.5281/zenodo.1470906. Furthermore, the dataset provides income level categorization compiled
#' from the World Bank Data Catalogue. 
#'
#' @format
#' A data frame with 158 rows and 11 variables:
#' \describe{
#'   \item{Country}{Country name.}
#'   \item{Region}{World Bank regional classification.}
#'   \item{HappinessScore2015}{Happiness Score 2015}
#'   \item{GDPpercapita2015}{GDP per Capita 2015.}
#'   \item{HappinessScore2016}{Happiness Score 2016.}
#'   \item{GDPpercapita2016}{GDP per Capita 2016.}
#'   \item{HappinessScore2017}{Happiness Score 2017.}
#'   \item{GDPpercapita2017}{GDP per Capita 2017.}
#'   \item{Income2015}{ Income level categorization in 2015.}
#'   \item{Income2016}{ Income level categorization in 2016.}
#'   \item{Income2017}{ Income level categorization in 2017.}
#' }
#'
#' @source
#' Happiness score and GDP per Capita are accessed from Karina Chotchaeva (2017).
#' World Happiness Report, Zenodo. https://doi.org/10.5281/zenodo.1470906.
#' Accessed from <https://zenodo.org/records/1470906> on 11 Feb 2026.
#'
#' Income level data are accessed from the World Bank Data Catalogue.
#' Accessed from <https://datacatalog.worldbank.org/search/dataset/0037712/world-development-indicators>
#' on 11 February 2026.

#'
#' @usage data(worldbankdata)
#'
#' @examples
#' data(happiness_gdp_income)
#' head(happiness_gdp_income)
#' summary(happiness_gdp_income)
#'
#' @keywords datasets
"happiness_gdp_income"
