#' Print.
#'
#' Gives a printed summary of a blm model.
#'
#' @param x      A blm model.
#' @param ...    Additional data.
#' @return       A printed summary of the blm object.
#' @import stats
#' @export
print.blm <- function(x, ...) {
  print("Function usage:")
  print(x$Call)
  writeLines("\nModel:")
  print(x$model)
  writeLines("\nMean:")
  print(x$mean)
  writeLines("\nSigma:")
  print(x$Sigma)
}