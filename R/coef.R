#' Find coefficients for blm
#'
#' This function returns the fitted parameters of the model.
#'
#' @param object A blm model
#' @param ... Some data
#' @return A list of coefficients
#’
#' @export

coef.blm = function(object, ...) {
  return(list(Sigma = object$Sigma, mean = object$mean))
}
