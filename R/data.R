#' worldbankdata
#'
#' 
#'
#' @description This dataset provides details about countries based on information from the World Bank.
#' @docType data
#' @usage data(worldbankdata)
#'
#' @format A data frame with n rows and m variables.
#' \describe{
#' \item{ID}{row id},
#' \item{Country}{Country name},
#' \item{Code}{Country code},
#' \item{Region}{Country region},
#' \item{Year}{Year},
#' \item{Income}{a factor denoting income group (L - Low income, LM - Low middle income, UM - Upper middle income, HI - High income)},
#' \item{Cooking}{Access to clean fuels and technologies for cooking (\% of population)},
#' \item{}{}
#' }
#' @source The World Bank Data Catalog (accessed on 1 Dec 2023)
#' @examples
#' data(worldbankdata)
#' head(worldbankdata)
#' summary(worldbankdata)
"worldbankdata"
