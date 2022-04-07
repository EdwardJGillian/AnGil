#' Calculate results
#'
#' Calculate results using given data on a row basis
#'
#' @param data Data frame used for calculation. Needs to contain 5 columns named a-e (see \code{\link{data}} data set for more info)
#'
#' @export
#'
#' @importFrom rlang has_name
#'
#' @return Input data frame with additional column \code{res} that contains calculation results for rows
#'
calculate <- function (data) {
  if (is.null(data)) stop("data parameter missing")
  if (!"data.frame" %in% class(data)) stop("data parameter is not data.frame")
  if (!all(sapply(c("a", "b", "c", "d", "e"), function(column) has_name(data, column)))) stop("Missing columns in data parameter")
  if (!all(sapply(colnames(data), function(column) is.numeric(data[[column]])))) stop("Not all columns in data are numeric")
  Sys.sleep(nrow(data) / 3)
  data$res <- data$a + data$b^2 + data$c^3 + data$d^4 + data$e^5
  data
}
