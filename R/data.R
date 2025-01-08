#' worldbankdata
#'
#' 
#'
#' @description This dataset provides details about countries based on information from the World Bank.
#' @docType data
#' @usage data(worldbankdata)
#'
#' @format A data frame with 7937 rows and 7 variables.
#' \describe{
#' \item{Country}{Country name},
#' \item{Code}{Country code},
#' \item{Region}{Country region},
#' \item{Year}{Year},
#' \item{Cooking}{Access to clean fuels and technologies for cooking (\% of population)},
#' \item{Electricity}{}
#' \item{Income}{a factor denoting income group (L - Low income, LM - Low middle income, UM - Upper middle income, HI - High income)}}
#' }
#' @source The World Bank Data Catalogue (accessed on 1 Dec 2023)
#' @examples
#' data(worldbankdata)
#' head(worldbankdata)
#' summary(worldbankdata)
"worldbankdata"
