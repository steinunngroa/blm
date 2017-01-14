#' Calculate the deviance
#'
#' This function finds the deviance for a blm.
#'
#' @param object A blm model
#' @param ... extra data (not used)
#' @return the deviance
#' @import stats
#' @export

deviance.blm = function(object, ...){
  return(sum((residuals(object))^2))
}

