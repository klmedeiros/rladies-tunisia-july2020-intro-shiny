library(shiny)
library(tidyverse)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Tunisia Economic Facts"),

    # Sidebar with a slider input year range
    sidebarLayout(
        sidebarPanel(
            sliderInput("years",
                        "Years to include:",
                        min = 2009,
                        max = 2018,
                        value = c(2010, 2012))
        ),

        # Show a plot of the growth rate
        mainPanel(
            plotOutput("gdpPlot")
        )
    )
))
