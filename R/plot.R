#' Plot a blm
#'
#' This function produces a plot for a given blm.
#'
#' @param x A blm model
#' @param ... Some extra data (not used)
#' @return a plot of the blm
#'
#' @export

plot.blm <- function(x, ...){
  dataframe <- data.frame(fitted = fitted(x)$Prediction, res = residuals(x), Number = 1:nrow(residuals(x)))
  newdataframe <- dataframe[order(dataframe$fitted),]
  plot(newdataframe$fitted, newdataframe$res, type="l", col="blue",
       main="Residuals vs. Fitted",
       xlab="Fitted",
       ylab="Residuals")
}
