

library(shiny)
library(shinythemes)
library(tidyverse)
library(scales)

shinyUI(
    navbarPage(theme = shinytheme("journal"), 
               "Is Someone - Anyone? - Leading Protests in Belarus?",
               tabPanel("Introduction",
                        h1("Who is leading the Belarus protests?"),
                        imageOutput("tut_by"),
                        p("On August 9, 2020, elections were held in Belarus."),
                        p("Alyaksandr Lukashenka, who had held power for over 25 years and is frequently called", a("Europe's Last Dictator", href = "https://www.atlanticcouncil.org/blogs/ukrainealert/europes-last-dictator-the-rise-and-possible-fall-of-alexander-lukashenko/"), "faced a challenge from Svetlana Tsikhanouskaya."),
                        p("Tsikhanouskaya didn’t want to be president. Her husband did, but he is imprisoned. She ran in his place so that she could coordinate free and fair elections should she win."),
                        p("Lukashenka announced he won with 80% of the vote. Tsikahnouskaya’s supporters said the election was rigged, and if the votes were counted honestly, she would have won."),
                        p("On the night of the election and in the months since they have taken to the streets to protest. They demand Lukashenka’s resignation, new elections, freedom for political prisoners and an end to police brutality."),
                        imageOutput("nexta_first_day"),
                        h4("The goal of this project is to understand how protests can erupt in an authoritarian regime in the digital age."),
                        p("Telegram, a social media app similar to Twitter, is very popular in the former Soviet Union and around the world. Belarussians flocked to Telegram to learn about the protests, especially as Lukashenka blocked internet and particular websites during and after the election."),
                        p("Many people have tried to understand the role of social media in protests and revolutions (see Theory and Methodology section). There is no consensus on exactly it works."),
                        p("Belarus is a fascinating case because social media really does seem to be driving the protest movement. Most individual opposition leaders are in jail or exiled abroad. Civil society in Belarus was very weak, and no official organizations seem to have taken charge."),
                        p("The channel NEXTA Live, which is run by a practically anonymous", a("22-year-old Belarussian in Poland,", href = "https://www.nytimes.com/2020/09/04/world/europe/belarus-blogger-poland-svetlov.html"), "is especially popular. NEXTA means “someone.”"),
                        p(strong("Is someone, anyone, leading the protest movement?")),
                        imageOutput("nasha_niva")
                        ),
               
               tabPanel("Theory & Methods",
                        h1("What does leadership look like on social media in protest movements?"),
                        p("Many scholars think that digital social movements suffer from a lack of leadership. The success of a movement depends in part on how it is organized, and the literature has proposed several competing models for how leadership in movements is brokered by social media."),
                        p(strong("Model 1: leaderlessness."), "In this model, social media facilitates fully horizontal communication, in which every actor can participate equally in a social movement."),
                        p(strong("Model 2.1: purely logistical connective leaders."), "According to the theory of connective action, social media users share personalized messages related to an overall frame (memes) and communicate with each other more than with ideological leaders. A connective leader does not shape conversation substantively, but rather creates digital spaces where regular people can engage in connective action."),
                        p(strong("Model 2.2: conversation-shaping connective leaders."), "Connective leaders may shape the substance of conversation as well. For example, the Kullena Khaled Said [we are all Khaled Said] Facebook page during the 2011 Egyptian protests did engage users in conversation typical of individualizable connective action, but the structure of a Facebook page – on which only moderators can post, and others can comment – remained hierarchical."),
                        p(strong("Model 3: impersonal leaders emerging from online social networks."), "Online networks tend to be highly centralized.  While everyone can participate in theory, some participate more frequently or more effectively than others, and social movements center around them."),
                        p(strong("Model 4.1: Behind-the-scenes leadership groups formed in person."), "Many movements frequently described as “leaderless,” such as Occupy Wall Street, are actually led by small groups of core activists who meet on the ground first, become the administration of the “official” social media pages or channels of the movement, and then use those outlets to mobilize a larger group."),
                        p(strong("Model 4.2: Behind-the-scenes civil society organization leadership."), "Traditional civil society organizations – one or several working together – provide ideological and logistical leadership for a movement without branding the movement as its own."),
                        p(strong("Model 5: visible leaders."), "Of course, it is possible that individuals or organizations could lead protests directly and visibly while spreading messages through social media."),
                        h4("Abridged Bibliography"),
                        p(strong("For full academic literature review included with the paper written based on this website, please write katrinakeegan@g.harvard.edu)")),
                        p("Bakardjieva, Maria, Mylynn Felt and Delia Dumitrica. “The mediatization of leadership: grassroots digital facilitators as organic intellectuals, sociometric stars and caretakers.”", em("Information, Communication and Society"), "21, no. 6 (2018): 899-914."),
                        p("Bastos, Marco T., Dan Mercea and Arthur Charpentier. “Tents, Tweets, and Events: The Interplay Between Ongoing Protests and Social Media.”", em("Journal of Communication"), "65 (2015): 320–350."),
                        p("Bennet, Lance W. and Alexandra Segerberg. “The Logic of Connective Action.”", em("Information, Communication and Society"), "15, no. 5 (2012): 739-768."),
                        p("Carothers, Thomas and Richard Young.", em("The Complexities of Global Protest."), "D.C.: Carnegie Endowment for International Peace, 2015."),
                        p("Castells, Manuel.", em("Networks of Outrage and Hope: Social Movements in the Internet Age."), "Cambridge: Polity Press, 2012."),
                        p("Clarke, Killian and Korhan Kocak. “Launching Revolution: Social Media and the Egyptian Uprising’s First Movers.”", em("British Journal of Political Science"), "50 (2020): 1025–1045"),
                        p("Della Ratta, Donatella and Augusto Valeriani. “Remixing the spring! Connective leadership and read-write practices in the 2011 Arab uprisings” in", em("Communication Rights and Social Justice: Historical Accounts of Transnational Mobilizations"), "edited by Claudia Padovani and Andrew Calabrese: 288-304. London: Palgrave Macmillan, 2014."),
                        p("Gerbaudo, Paolo. “Social media teams as digital vanguards: The question of leadership in the management of key Facebook and Twitter accounts of occupy Wall Street, Indignados and UK Uncut.”", em("Information, Communication and Society"), "20, no. 2 (2017): 185-202."),
                        p("Gonzalez-Bailon, Sandra and Ning Wang. “Networked discontent: The anatomy of protest campaigns in social media.”", em("Social Networks"), "44 (January 2016): 95-104."),
                        p("Ligtvoet, Inge and Loes Oudenhuijsen. “A rebel youth? Social media, charismatic leadership, and ‘radicalized’ youth in the 2015 Biafra protests” in", em("Biographies of Radicalization: Hidden Messages of Social Change edited by Mirjam de Bruijn: 134-151."), "Berlin: Walter de Gruyter, 2019."),
                        p("Poell, Thomas, Rasha Abdulla, Bernhard Rieder, Robbert Woltering and Liesbeth Zack. “Protest leadership in the age of social media.”", em("Information, Communication & Society"), "19, no. 7 (2016): 994-1014."),
                        h1("Methodology")
                        ),
               
               tabPanel("Leading Channels",
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
                            p("This graph shows all the channels I scraped and their subscribers as of 10/15/2020."),
                            p("The colors show whether I classified the group as activist (includes calls to protest), opinion (expresses clear opinion about protests but does not typically provide instructions for how to protest, or reporting (simply providing information about protests)"),
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
               
               tabPanel("Networks",
                        h2("Network of Leading Channels"),
                        p("Darker lines mean more connections. Bigger circles mean more subscribers. Color is based on whether there are more incoming or outgoing connections."),
                        p("It may take a moment to load. Please be patient!"),
                        plotOutput("network1"),
                        p("This graph shows that the network is very dense. That is, leading channels reference each other very frequently. Even though the criteria for inclusion in the group of leading channels was was at least 3 connections to other leading channels of at least of 10 times each, the average number of connections for each outlet was 14 (over half), and the average number of links to other channels was 32."),
                        p("This indicates that the overall Telegram sphere for the protests is highly centralized, with just a few channels being very well-connected and important."),
                        h2("Network Beyond Leading Channels"),
                        p("Lighter lines mean more connections. Channels from which data is drawn are labeled in red."),
                        plotOutput("network2"),
                        p("This graph shows that the leading channels do have a lot of links and shares beyond the inner network. There appears to be a rather large secondary circle of channels or links to which at least two leading channels link or share. These are indicated where there are sharp points in the graph. It also appears that the three neighborhood groups (stop_gaiduk, recall_deputy_lenchevskaya, minsk_eastern_district_107_chat) are somewhat separate from the rest, with a good deal of unique links and shares. Looking at the chats themselves reveals these are mostly individuals, since the form of a chat provides the opportunity to connect individuals, which channels lack."),
                        p("Some implications of this is that while there are a lot of Telegram channels with which protest-focused channels interacted in some way, the bulk of interactions was still with other leading channels (see the dense white cluster at the center). The neighborhood groups also potentially serve as connectors between individuals and the leading channels.")
               ),
               
               tabPanel("Topic Models",
                 p("Coming soon...")
               ),
               
               tabPanel( "About Me",
                         p("I'm a Master's student at Harvard in Russian, Eastern European and Central Asian Studies. I've spent over 2 years abroad in Eurasia, including Russia, Ukraine, Azerbaijan and Moldova. I speak Russian, Ukrainian, Turkish and Uzbek, and for this project I discovered I can also read Belarussian! You can check out a", a("longer bio", href = "https://daviscenter.fas.harvard.edu/about-us/people/katrina-marjorie-keegan"), "on the Davis Center website."),
                         p("Feel free to contact me at katrinakeegan@g.harvard.edu."),
                         p("The github repo for this project can be found", a("here.", href = "https://github.com/katrinakeegan/gov50-final")),
                         p("I could not have done this project without the support of the amazing teaching staff of Gov 50, especially Wyatt Hurt and Tyler Simko."),
                         imageOutput("me_on_maidan"),
                         p("This photo is of me in 2019 on Maidan in Kyiv, the site of the 2014 Ukrainain Revolution of Dignity. Hopefully I'll be able to visit the site of a similarly successful revolution in Belarus someday!")
               )
    ))