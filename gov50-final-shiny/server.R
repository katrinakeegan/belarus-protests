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
library(ggraph)
library(igraph)
library(plotly)

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
        scale_fill_manual(values = c("#93032E", "#034C3C", "#C69F89")) +
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
                   label = url,
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
             x = "Subscribers (log scale)") +
        theme(legend.position = "bottom") + 
        scale_color_discrete(labels = c("Links and shares from channel", "Links and shares to channel")) +
        scale_color_manual(values = c("#93032E", "#84894A"))
    }) 
    
    
    output$subscriberRegressionTable <- render_gt({
      corpus_network_info <- readRDS("clean_data/corpus_network_info.RDS")
      model1 <- stan_glm(data = corpus_network_info,
                         formula = subscribers ~ total_links_from_channel + total_links_to_channel + unique_links_from_channel + unique_links_to_channel,
                         refresh = 0
      )
      
      tbl_regression(model1, intercept = TRUE) %>%
        as_gt() %>%
        tab_header(title = "Regression of links on subscribers") 
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
        geom_col(color = "#A6A15E", fill = "#034C3C") +
        labs(x = "Total External Links",
             y = "Domain of Link") +
        theme_bw()
    })  
    
    output$network1 <- renderPlot({
      small_nodes <- readRDS("clean_data/small_nodes.RDS")
      small_edges <- readRDS("clean_data/small_edges.RDS")
      small_network_graph <- graph_from_data_frame(d = small_edges, 
                                                   directed = T, 
                                                   vertices = small_nodes)
      ggraph(small_network_graph, layout = "stress") +
        geom_edge_fan(aes(alpha = sqrt(weight)),
                      show.legend = FALSE) +
        geom_node_point(aes(color = V(small_network_graph)$source_hub),
                        #put size outside aes() for absolute rather than relative size
                        size = sqrt(V(small_network_graph)$subscribers/2000)) +
        scale_color_manual(values = c("#C69F89", "#034C3C", "#84894A")) +
        theme_void() +
        geom_node_text(aes(label = V(small_network_graph)$url),
                       size = 4,
                       color = "#93032E") +
        theme(legend.position = "top") +
        labs(color = " ")
    })
    
    output$network2 <- renderPlot({
      big_nodes <- readRDS("clean_data/big_nodes.RDS")
      big_edges <- readRDS("clean_data/big_edges.RDS")
      big_network_graph <- graph_from_data_frame(d = big_edges, 
                                                   directed = F, 
                                                   vertices = big_nodes)
      ggraph(big_network_graph, layout = "stress") +
        geom_edge_fan(aes(alpha = sqrt(weight)),
                      color = "white",
                      show.legend = FALSE) +
        theme_void() +
        theme(plot.background = element_rect(fill = "#A6A15E")) +
        geom_node_text(aes(label = ifelse(
          V(big_network_graph)$in_corpus == TRUE,
          V(big_network_graph)$url,
          "")),
          color = "#93032E",
          size = 3)
    })
    
    output$nexta_first_day <- renderImage({
      list(src = "nexta_first_day.jpg",
           width = 300,
           height = 400,
           alt = "Large number of protesters on the night of the election. Photo by NEXTA.")
    }, deleteFile = FALSE)
    
    output$tut_by <- renderImage({
      list(src = "tut_by.jpg",
           width = 400,
           height = 300,
           alt = "Protesters link arms at the front of the group.")
    }, deleteFile = FALSE)
    
    output$nasha_niva <- renderImage({
      list(src = "nasha_niva.jpg",
           width = 400,
           height = 300,
           alt = "Woman holding alternative Belarussian flag in a group of cars blocking traffic during protests.")
    }, deleteFile = FALSE)
    
    output$me_on_maidan <- renderImage({
      list(src = "me_on_maidan.jpg",
           width = 300,
           height = 400,
           alt = "A picture of me on Maidan Square in Kyiv")
    }, deleteFile = FALSE)
    
})
