library(shiny)
library(dplyr)
library(tidyr)
library(DT)

server <- function(input, output, sessions) {

  original_data <- reactive({
    # load table for calculation
    load("~/AnGil/data/data.rda")
    # calculate and aggregate data
    df1 <- AnGil::calculate(data)
    return(df1)
  })

  # This output function displays the dataset in table format
  output$data_table <- DT::renderDataTable({
    original_data_display <- original_data()
    DT::datatable(original_data_display,
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

  output$basic_var_table <- DT::renderDataTable({
    # load table for display
    df3 <- original_data()
    # calculate and aggregate data
    pcnt <- 125
    df3 <- AnGil::basic_variant_calc(df3, pcnt)
    DT::datatable(df3,
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
