

library(shiny)
library(shinythemes)
library(tidyverse)
library(scales)

shinyUI(
    navbarPage(theme = shinytheme("journal"), 
               "Telegram leadership during 2020 Belarus Protests",
               tabPanel("About the project",
                        h1("Who is leading the Belarus protests?"),
                        p("The goal of this project is to map the network of telegram channels that are leading mass protests in Belarus.")
                        #a("Here's a link.", href = "http://www.google.com")), p("Here's some more text")
                        
                        #All the stuff
                        ),
               
               
               tabPanel("Most important channels",
                        sidebarLayout(
                          
                          #In sidebarLayout need both sidebarPanel and mainPanel within the parentheses
                          
                          sidebarPanel(
                            sliderInput("x_axis_range_subscribers", #Name of the thing in server which will be used as a variable
                                        "Zoom in on a particular part of the graph", #What is displayed to user
                                        min = 0,
                                        max = 2000000,
                                        value = c(0, 2000000))
                          ),
                          mainPanel(
                            plotOutput("subscribers")
                        )),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("which_type_linksBySubscribers",
                                        "Method of counting links:",
                                        c("Total links from and to other outlets" = "from_to_total",
                                          "Number of unique outlets linked to and from" = "from_to_unique")
                                        )
                          ),
                          mainPanel(
                            plotOutput("linksBySubscribers")
                          )
                        ),
                        sidebarLayout(
                          sidebarPanel(
                            
                          ),
                          mainPanel(
                            plotOutput("externalLinks")
                          )
                        )
                        ),
               
               tabPanel( "About me",
                         p("I'm a Master's student at Harvard in Russian, Eastern European and Central Asian Studies."),
                         p("The github repo for this project can be found", a("here", href = "https://github.com/katrinakeegan/gov50-final"))
                         
                         
               )
    ))