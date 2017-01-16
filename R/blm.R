#' Bayesian linear model.
#'
#' The function fits a blm model, using a model formula, and optional additional data.
#'
#' @param model   A formula describing the model
#' @param prior   A prior distribution
#' @param beta    The precision
#' @param ...     Additional data.
#' @return A fitted model.
#' @import stats
#' @export
blm <- function(model, prior, beta, ...) {
  if(beta < 0) stop("beta must be a positive number")

  posterior <- update(model, prior, beta, ...)
  return(structure(list(Sigma = posterior$Sigma,
                        mean = posterior$m,
                        beta = beta,
                        data = posterior$data,
                        model=model,
                        prior=prior,
                        posterior=posterior,
                        Call = sys.call()),
                   class="blm"))
}





