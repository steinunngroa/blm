#' Update function.
#'
#' This function updates a prior distribution, to get the posterior distribution.
#'
#' @param model A model function, fx. y ~ x + z
#' @param prior A prior distribution including a Sigma
#' @param beta The precision
#' @param ... Additional data
#' @return A list with Sigma, mean and data for a posterior distribution
#' @import stats

update <- function(model, prior, beta, ...) {
  if(beta < 0) stop("beta must be a positive number")
  dataset <- model.frame(model, as.data.frame(list(...)))
  phiX <- model_matrix_responseless(model, ...)
  Sinv <- prior$Sigma + beta * t(phiX) %*% phiX
  S <- solve(Sinv)
  responsename <- as.character(formula(model)[[2]])
  m <- beta * S %*% t(phiX) %*% dataset[, responsename]
  return(list(Sigma = S, mean=m, data=dataset))
}

