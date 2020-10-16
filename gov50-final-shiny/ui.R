

library(shiny)
library(shinythemes)

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
                        plotOutput("mostConnected")
                        
                        ),
               
               tabPanel( "About me",
                         p("I'm a Master's student at Harvard in Russian, Eastern European and Central Asian Studies."),
                         p("The github repo for this project can be found", a("here", href = "https://github.com/katrinakeegan/gov50-final"))
                         
                         
               )
    ))