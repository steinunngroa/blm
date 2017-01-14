#' Find confidence intervals
#'
#' This function finds the confidence intervals for the fitted parameters.
#'
#' @param object A blm model
#' @param parm Number of parameters
#' @param level The confidence level
#' @param ... Optional extra data
#' @return Confidence intervals
#' @import stats
#' @export

confint.blm <- function(object, parm, level=0.95, ...){
  if(level > 1 || level < 0) stop("Error: Level must be between 0 and 1.")
  coefs <- as.data.frame(object$mean)
  colnames(coefs) <- "Coefs"
  l <- (1-level)/2 # Lower confidence level
  u <- level+(1-level)/2 # Upper confidence level
  coefs[,as.character(l)] = 0
  coefs[,as.character(u)] = 0
  for (i in 1:nrow(coefs)){
    coefs[i, c(as.character(l), as.character(u))] = qnorm(c(l, u), mean = coefs[i,1], sd = object$Sigma[i,i])
  }
  return(coefs[parm,])
}

