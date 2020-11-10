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
library(scales)

shinyServer(function(input, output) {

    output$subscribers <- renderPlot({
      corpus_network_info <- readRDS("clean_data/corpus_network_info.RDS")
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
        theme(legend.position = "top", legend.text = element_text(size = 7)) +
        scale_fill_discrete(labels = c("Hub (more links to other channels)", "Source (more links from other channels)", "Unclear")) +
        scale_x_continuous(labels = comma) +
        xlim(input$x_axis_range_subscribers)
    })
    

    output$linksBySubscribers <- renderPlot({
      corpus_network_info <- readRDS("clean_data/corpus_network_info.RDS")
      corpus_network_info %>%
        pivot_longer(cols = c(total_links_from_channel, total_links_to_channel),
                     
                     #From_to_total and from_to_unique are two categories just "from" and "to"
                     #There is a value for each of them for each outlet
                     #This allowed me to make the colors and hence lines vary by the from and to 
                     
                     names_to = "from_to_total",
                     values_to = "total_values") %>%
        pivot_longer(cols = c(unique_links_from_channel, unique_links_to_channel), 
                     names_to = "from_to_unique",
                     values_to = "unique_values") %>%
        ggplot(aes(x = subscribers, 
                   y = case_when(
                     input$which_type_linksBySubscribers == "from_to_total" ~ total_values,
                     TRUE ~ unique_values),
                   color = case_when(
                    input$which_type_linksBySubscribers == "from_to_total" ~ from_to_total,
                    TRUE ~ from_to_unique
                     ))) +
        geom_point(alpha = 0.5) +
        geom_smooth(method = lm,
                    formula = y ~ x,
                    se = FALSE) +
        theme_bw() +
        labs(title = "Relationship between number of subscribers and channel links",
             color = " ",
             y = " ",
             x = "subscribers") +
        theme(legend.position = "bottom") + 
        scale_color_discrete(labels = c("Links and shares from channel", "Links and shares to channel"))
      
    }) 
    
    output$externalLinks <- renderPlot({
      big_outside_network <- readRDS("clean_data/big_outside_network.RDS")
      big_outside_network %>%
        group_by(domain) %>%
        summarize(total = n(), 
                  .groups = "drop") %>%
        filter(domain != "t.me") %>%
        arrange(desc(total)) %>%
        slice(1:30) %>%
        ggplot(aes(x = total, y = fct_reorder(domain, total))) +
        geom_col() +
        labs(title = "Total external links",
             subtitle = "Mostly other social media networks, sites linked to telegram channels, \nand other news sites",
             x = "",
             y = "domain of link") +
        theme_bw()
    })  
    
})
