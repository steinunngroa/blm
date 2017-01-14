#' Make a prediction
#'
#' This function makes a prediction for a blm, given some data.
#'
#' @param object A blm model
#' @param ... Some dataset
#' @return a prediction
#' @import stats
#' @export

predict.blm <- function(object, newdata, ...) {
  if (is.null(object)) stop("Must provide a BLM")
  blm2 <- blm(object$model, object$posterior, object$beta, newdata)
  return(fitted(blm2))
}
