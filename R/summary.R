#' Summary.
#'
#' Gives a summary of a blm regression model, using the print.blm function.
#'
#' @param object   A blm object.
#' @param ...      Additional data.
#' @return         A summary of a blm object.
#' @import stats
#' @export
summary.blm <- function(object, ...) {
  writeLines("\nBLM details")
  print(object)
  writeLines("\nResiduals")
  print(residuals(object))
  writeLines("\nDeviance")
  print(deviance(object))
  }