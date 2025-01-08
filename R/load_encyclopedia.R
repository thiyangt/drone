#'@description This function loads Data Visualisation Geometries Encyclopedia Book
#'@return  Opens Data Visualisation Geometries Encyclopedia Book on your browser
#'@export
#'@example
#' load_encyclopedia()
load_encyclopedia <- function() {
  url <- "https://thiyangt.github.io/geom.encyclopedia/"
  
  # Open the URL in the default web browser
  browseURL(url)
}