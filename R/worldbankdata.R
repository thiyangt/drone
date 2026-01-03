#' World Bank Country-Level Development Indicators
#'
#' @description
#' This dataset provides country-level development indicators compiled
#' from the World Bank Data Catalogue. It includes information on access
#' to clean cooking fuels, access to electricity, income group
#' classification, and regional grouping across multiple years.
#'
#' @format
#' A data frame with 7,937 rows and 7 variables:
#' \describe{
#'   \item{Country}{Country name.}
#'   \item{Code}{ISO country code.}
#'   \item{Region}{World Bank regional classification.}
#'   \item{Year}{Year of observation.}
#'   \item{Cooking}{Access to clean fuels and technologies for cooking
#'   (percentage of population).}
#'   \item{Electricity}{Access to electricity
#'   (percentage of population).}
#'   \item{Income}{Income group classification:
#'   L = Low income, LM = Lower middle income,
#'   UM = Upper middle income, HI = High income.}
#' }
#'
#' @source
#' World Bank Data Catalogue
#' (accessed on 1 December 2023).
#'
#' @usage data(worldbankdata)
#'
#' @examples
#' data(worldbankdata)
#' head(worldbankdata)
#' summary(worldbankdata)
#'
#' @keywords datasets
"worldbankdata"
