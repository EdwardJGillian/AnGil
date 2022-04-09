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
  if (!all(sapply(c("a", "b", "c", "d", "e"), function(column) rlang::has_name(data, column)))) stop("Missing columns in data parameter")
  if (!all(sapply(colnames(data), function(column) is.numeric(data[[column]])))) stop("Not all columns in data are numeric")
  Sys.sleep(nrow(data) / 3)
  data$res <- data$a + data$b^2 + data$c^3 + data$d^4 + data$e^5
  data
}

#' Basic variant calculate
#'
#' This function calculates the percentage of the original value
#'
#' @param data - dataframe used in the calculation
#' @param pcnt - the percentage parameter
#'
#' @return data - dataframe with the basic_variant calc
#' @export
#'
basic_variant_calc <- function (data, pcnt) {
  if (is.null(data)) stop("data parameter missing")
  if (is.null(pcnt)) stop("percentage parameter missing")
  if (!"data.frame" %in% class(data)) stop("data parameter is not data.frame")

  # perform basic variant calculation
  data <-
    data %>% dplyr::mutate(dplyr::across(a:e, ~ .x * pcnt/100))

  # re-calculate result column
  data <-
    data %>%
    dplyr::mutate(res = data$a + data$b^2 + data$c^3 + data$d^4 + data$e^5)
  return(data)
}
