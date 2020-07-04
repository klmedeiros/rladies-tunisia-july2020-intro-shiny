library(shiny)
library(tidyverse)

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
            labs(title = "Growht Rate of the GDP, Tunisia",
                 x = "",
                 y = "Growth Rate (%)")

    })

})
