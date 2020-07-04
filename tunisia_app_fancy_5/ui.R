library(shiny)
library(tidyverse)
        
# Define UI for application
shinyUI(fluidPage(
    
    # shinythemes::themeSelector(),
    theme = shinythemes::shinytheme("yeti"),
    
    # Application title
    titlePanel("Tunisia Economic Facts"),
    
    # Sidebar with inputs
    sidebarLayout(
        sidebarPanel(
            tags$h4("GDP Plot options"),
            sliderInput("years",
                        "Years to include:",
                        min = 2009,
                        max = 2018,
                        value = c(2010, 2012)),
            tags$h4("Economic Sectors Options"),
            checkboxGroupInput("sectors",
                               "Sectors:",
                               c("Agriculture" = "agriculture",
                                 "Industry" = "industry",
                                 "Services" = "services"),
                               selected = c("agriculture", "industry", "services"))
        ), 
        
        # Add tab layout
        mainPanel(
            tabsetPanel(
                tabPanel("GDP Plot", plotly::plotlyOutput("gdpPlot")),
                tabPanel("Economic Sectors Share GDP", plotly::plotlyOutput("sectorPlot")),
                tabPanel("Percents", DT::DTOutput("econIndicatorPercents"))
            )
        )
    )
))
