library(shiny)
library(shinythemes)
library(fontawesome)
library(shinycssloaders)

ui <- fluidPage(title = "Analytics - Aggregation",
                theme = shinytheme("spacelab"),
                # check if tags are working
                tags$head(tags$style(
                  HTML('
                       body, label, input, button, select {
                       font-family: "Arial";
                       }

                       .btn-file {
                        background-color: 5B81AE;
                        border-color: 5B81AE;
                        background: 5B81AE;
                       }

                      .shiny-output-error-validation {
                       color: red;
                       font-size: 18px;
                       font-weight; bold;
                      }

                      .bttn-bordered.bttn-sm {
                          width: 200px;
                          text-align: left;
                          margin-bottom : 0px;
                          margin-top : 20px;
                       }
                       '
                  )
                )),
                tabsetPanel(type = "pills",
                            tabPanel("Original Numeric Data", icon = icon("table"),
                                     shinycssloaders::withSpinner(
                                      DT::dataTableOutput("data_table"))
                            ),
                            tabPanel("Basic Variant", icon = icon("object-group"),
                                     numericInput("pcnt","Percentage", value = 1, min = 1),
                                     actionButton('b_var_calc' ,'Basic Variant Calculate', icon("paper-plane"),
                                                  style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                                     br(),
                                                      DT::dataTableOutput("basic_var_table"))
                            )

                #
                # )
)
