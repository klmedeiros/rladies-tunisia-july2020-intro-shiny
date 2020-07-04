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

# Define server logic 
shinyServer(function(input, output) {
  
  tunisia <- read_csv("tunisia.csv")
  
  output$gdpPlot <- renderPlot({
    
    tunisia %>% 
      filter(year != 2008,
             year >= input$years[1],
             year <= input$years[2]) %>% 
      ggplot(aes(year, growth_rate_of_the_real_gross_domestic_product_gdp, group = 1)) +
      geom_line() +
      labs(title = "Growth Rate of the GDP, Tunisia",
           x = "",
           y = "Growth Rate (%)")
    
  })
  
})

shinyApp(ui = ui, server = server)