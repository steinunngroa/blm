#' Making a prior.
#'
#' This function produces a prior distribution, using alpha and the model.
#'
#' @param model A model formula, fx. y ~ x + z.
#' @param alpha The prior precision.
#' @param givenmean The selected mean for the distribution.
#' @return The covariance matrix, number of variables and the mean of the prior distribution.
#' @import stats

make_prior <- function(model, alpha, givenmean = c(0,0)) {
  if (alpha < 0) stop("Alpha cannot be negative. ")
  return(list(Sigma = diag(1/alpha, nrow = length(all.vars(model))), mean = givenmean))
}

