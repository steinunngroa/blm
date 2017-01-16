#' Print.
#'
#' Gives a printed summary of the parameters of a blm model.
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
  writeLines("\nPrior:")
  print(x$prior)
  print("Blm calculations:")
  writeLines("\nMean:")
  print(x$mean)
  writeLines("\nSigma:")
  print(x$Sigma)
}