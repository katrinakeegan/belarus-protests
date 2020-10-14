

library(shiny)
library(shinythemes)

shinyUI(
    navbarPage(theme = shinytheme("journal"), 
               "Social Media during Belarus Protests",
               tabPanel("Page1",
                        h1("Here's a big header"),
                        p("Here's some words.", a("Here's a link.", href = "http://www.google.com")), p("Here's some more text
                        and still more text")
                        
                        #All the stuff
                        ),
               
               tabPanel(
                   "Page2"
               )
    ))