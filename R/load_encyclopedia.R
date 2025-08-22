#'Load Encyclopedia
#'
#'@description This function loads Data Visualisation Geometries Encyclopedia Book
#'
#'@importFrom utils browseURL
#'@return  Opens Data Visualisation Geometries Encyclopedia Book on your browser
#'@export
#'@examples
#'load_encyclopedia()
load_encyclopedia <- function() {
  url <- "https://thiyangt.github.io/geom.encyclopedia/"
  
  # Open the URL in the default web browser
  utils::browseURL(url)
}