library(shiny)

# Define UI for application
shinyUI(fluidPage(
    
    # shinythemes::themeSelector(),
    theme = shinythemes::shinytheme("sandstone"),
    
    # Application title
    titlePanel("Tunisia Economic Facts (2008-2018)"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            tags$h4("GDP Plot inputs"),
            sliderInput("years", "Select years:",
                        min = 2009,
                        max = 2018,
                        value = c(2010, 2012)),
            tags$h4("GDP Sector Shares inputs"),
            checkboxGroupInput("sectors", "Select sectors:",
                               choices = c("Agriculture" = "agriculture",
                                           "Industry" = "industry",
                                           "Services" = "services"),
                               selected = c("agriculture", "industry", "services"))
        ),

        # Show a plot
        mainPanel(
            tabsetPanel(
                tabPanel("GDP Plot", plotly::plotlyOutput("gdpPlot")),
                tabPanel("GDP Sector Shares", plotly::plotlyOutput("sharesPlot")),
                tabPanel("Economic Indicators (%)", DT::dataTableOutput("percentTable"))
            )
        )
    )
))
