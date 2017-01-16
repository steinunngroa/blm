#' Make a prediction
#'
#' This function makes a prediction based on the fitted model.
#'
#' @param object A blm model
#' @param newdata Data do be used
#' @param ... Some extra inputs
#' @return a prediction
#' @import stats
#' @export

predict.blm <- function(object, newdata, ...) {
  if (is.null(object)) stop("Must provide a BLM")
  blm2 <- blm(object$model, object$posterior, object$beta, newdata)
  return(fitted(blm2))
}
