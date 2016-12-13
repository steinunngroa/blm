
#' Bayesian linear model.
#'
#' Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   A formula describing the model.
#' @param ...     Additional data, for example a data frame. Feel free to add other options.
#'
#' @return A fitted model.
#' @export
#'
#' ## Bayesian linear regresssion
blm <- function(model, alpha, beta, data, ...) {
  phi <- model.matrix(model, data)
  S <- solve(diag(alpha, nrow = ncol(phi)) + beta*t(phi) %*% phi)
  mxy <- beta * S %*% t(phi) %*% model.response(model.frame(model, data))
  structure(list(sigma = S, mean = mxy, data = data, model=model), class="blm")
}

#test= blm(y ~ x+I(x^2), 1, 1, data.frame(x=x, y=x))


predict.blm <- function(blmModel) {
  phi = model.matrix(blmModel$model, blmModel$data)
  m = blmModel$mean
  S = blmModel$sigma

  apply(phi, 1, function(row) t(m)%*%row)
}

#predict(test)


#
#
# ```r
# library(covr)
# package_coverage()
# ```
#
# or get a window with the report using
#
# ```r
# library(covr)
# shine(package_coverage())
# ```
#
