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
    
    output$sectorPlot <- renderPlot({
        
        tunisia %>% 
            select(year, agriculture, industry, services) %>% 
            pivot_longer(-year, names_to = "sector", values_to = "gdp_share") %>% 
            filter(sector %in% input$sectors) %>% 
            ggplot(aes(year, gdp_share, fill = sector)) +
            geom_col() +
            labs(title = "Share of economic sectors in GDP",
                 x = "" ,
                 y = "Share in GPD (%)")
        
    })
    
})