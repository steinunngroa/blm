#' Bayesian linear model.
#'
#' Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   A formula describing the model.
#' @param prior   A prior distribution
#' @param beta    aaaaaaaaa
#' @param ...     Additional data.
#' @return A fitted model.
#' @import stats
#' @export
blm <- function(model, prior, beta, ...) {
  if(beta < 0) stop("beta must be a positive number")

  posterior <- update(model, prior, beta, ...)
  structure(list(Sigma = posterior$Sigma, mean = posterior$m, beta = beta, data = posterior$data, model=model, prior=prior, posterior=posterior, Call = sys.call()), class="blm")
}





