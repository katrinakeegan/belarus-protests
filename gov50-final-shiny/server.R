#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

shinyServer(function(input, output) {

    output$subscribers <- renderPlot({
      corpus_network_info <- readRDS("corpus_network_info.RDS")
      corpus_network_info %>%
        ggplot(aes(x = subscribers, 
                   y = fct_reorder(url, subscribers),
                   fill = source_hub)) +
        geom_col() +
        labs(title = "Subscribers by channel",
             x = "Number of subscribers",
             y = "Channel URL",
             fill = " ") +
        theme_bw() +
        xlim(input$x_axis_range_subscribers)
        theme(legend.position = "top", legend.text = element_text(size = 7)) +
        scale_fill_discrete(labels = c("Hub (more links to other channels)", "Source (more links from other channels)", "Unclear"))
    })

})
