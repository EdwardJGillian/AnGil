library(shiny)
library(dplyr)
library(tidyr)
library(DT)

server <- function(input, output, sessions) {
  # This output function displays the dataset in table format
  output$data_table <- DT::renderDataTable({
    # load table for display
    load("~/AnGil/data/data.rda")
    # calculate and aggregate data
    df1 <- AnGil::calculate(data)
    DT::datatable(df1,
                  colnames = c("Column A",
                               "Column B",
                               "Column C",
                               "Column D",
                               "Column E",
                               "Aggregation"),
                  filter = 'top',
                  options = list(
                    lengthMenu = list(c(5, 15, -1), c('5', '15', 'All')),
                    pageLength = 5),
                  rownames = FALSE) %>%
      formatRound(columns = c('a', 'b', 'c', 'd', 'e', 'res'), digits = 3)
  })
}
