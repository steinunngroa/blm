#' Making a prior.
#'
#' This function produces a prior distribution.
#'
#' @param model A model function, fx. y ~ x + z
#' @param alpha A
#' @param givenmean ....
#' @return a prior distribution
#' @import stats
#' @export

make_prior <- function(model, alpha, givenmean = c(0,0)) {
  if (alpha < 0) stop("Alpha cannot be negative. ")
  return(list(Sigma = diag(1/alpha, nrow = length(all.vars(model))), mean = givenmean))
}

