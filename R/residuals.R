#' Find the residuals
#'
#' This function returns the residuals of a blm.
#'
#' @param object A blm model
#' @param ... some data (not used)
#' @return The residuals
#' @import stats
#' @export

residuals.blm = function(object, ...) {
  response = as.character(formula(object$model)[[2]])
  observed = object$data[, response]
  predicted = fitted(object)$Prediction
  return(predicted-observed)
}

#residuals(test1)
