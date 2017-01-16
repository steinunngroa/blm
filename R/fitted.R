#' Make a fitted model
#'
#' This function produces fitted response variables.
#'
#' @param object A blm model
#' @param ... Some extra data
#' @return Fitted results
#' @import stats
#' @export

fitted.blm <- function(object, ...) {
  phi <- model_matrix_responseless(object$model, object$data)
  m <- object$mean
  S <- object$Sigma

  newdistribution <- as.data.frame(matrix(nrow=nrow(phi), ncol=0))

  for (i in 1:nrow(newdistribution)){
    newdistribution[i,"Prediction"] = t(m)%*%phi[i,]
    newdistribution[i, "Variance"] = 1/object$beta + (t(phi[i,]) %*% S %*% phi[i,])
  }
  return(newdistribution)
}

