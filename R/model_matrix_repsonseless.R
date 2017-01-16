#' Make a responseless matrix
#'
#' This function removes the response variable from a matrix and returns a responseless matrix.
#'
#' @param model A model function, fx. y ~ x + z
#' @param data_frame Some dataframe
#' @return a model matrix without a response variable

model_matrix_responseless <- function(model, data_frame) {
  if(is.null(model) || is.null(data_frame)) stop("Must provide input")
  responseless.formula <- delete.response(terms(model))
  frame <- model.frame(responseless.formula, data_frame)
  model.matrix(responseless.formula, frame)
}