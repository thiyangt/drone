#' Given a Letter Find Geoms Inside a Package
#'
#'@description 
#' This function extracts the names of all functions inside a specified package 
#' that begin with a given prefix (e.g., `"geom_"`). It is useful for quickly 
#' identifying available `geom_` functions in packages like **ggplot2** or **ggalt**.
#'
#'@importFrom utils lsf.str
#'@param pkg A character string or unquoted package name. The package from which 
#'   to extract functions.
#'@param prefix A character string regex pattern used to filter function names. 
#'   Defaults to `"^geom_"`.
#'@return A character vector containing the names of the functions that match 
#'   the prefix inside the given package.
#'@export
#'@examples 
#'library(ggplot2)
#'extract_geoms(ggplot2, "^geom_s")
extract_geoms <- function(pkg, prefix = "^geom_") {
  # Ensure pkg is a character
  pkg <- as.character(substitute(pkg))
  
  # check if package installed
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(paste("Package", pkg, "is not installed."))
  }
  
  # attach package namespace if not already
  if (!paste0("package:", pkg) %in% search()) {
    library(pkg, character.only = TRUE)
  }
  
  # list all functions in the package
  all_functions <- lsf.str(paste0("package:", pkg))
  
  # extract only the geom functions with the given prefix
  geom_functions <- grep(prefix, all_functions, value = TRUE)
  
  return(geom_functions)
}
