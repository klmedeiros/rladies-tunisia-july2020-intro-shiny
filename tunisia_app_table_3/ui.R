library(shiny)
library(tidyverse)

# Define UI for application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Tunisia Economic Facts"),
    
    # Sidebar with inputs
    sidebarLayout(
        sidebarPanel(
            sliderInput("years",
                        "Years to include:",
                        min = 2009,
                        max = 2018,
                        value = c(2010, 2012)),
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
                tabPanel("GDP Plot", plotOutput("gdpPlot")),
                tabPanel("Economic Sectors Share GDP", plotOutput("sectorPlot")),
                tabPanel("Percents", tableOutput("econIndicatorPercents"))
            )
        )
    )
))
