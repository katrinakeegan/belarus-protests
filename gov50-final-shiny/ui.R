

library(shiny)
library(shinythemes)
library(shinyWidgets)
library(tidyverse)
library(scales)
library(gt)
library(gtsummary)
library(broom.mixed)
library(rstanarm)

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
                        h1("Methodology"),
                        p("My starting point was the channel NEXTA Live, which is known to be a leading channel in the protest movement. As of October 15, 2020, it had nearly 2 million subscribers, which is over a fifth the entire population of Belarus! (Of course, some subscribers may be from outside the country, but even so, that’s a huge proportion.)"),
                        p("Telegram allows users to download chat history in JSON format. I downloaded the entire text chat history (without photos, videos, or other multi-media content) for the period August 9, 2020 to September 30, 2020. This is approximately the first month and a half of the protest movement. I then used the website", a("json-csv.com", href = "https://json-csv.com"), "to convert from JSON to CSV. I invested in a premium subscription to convert large files. This website was better than free JSON to CSV converters because it did not produce highly nested data."),
                        p("I analyzed NEXTA Live’s connections. I considered a link and a share as an equivalent connection, but these two were in different formats in the raw data, so I manually converted each link to its channel name equivalent, which was used for shares."),
                        p("I then used a methodology similar to snowball sampling. I scraped the data of all the channels to which NEXTA Live linked at least 10 times. I then repeated the process above for all of those channels. I stopped when I found no new channels that were linked to by at least 3 other channels at least 10 times."),
                        p("The result was 25 channels. I chose to eliminate two of them, one because it did not share anything from other channels, and the other because it was not exclusively focused on Belarus. I also chose to add three randomly selected neighborhood groups. I discovered a large number of neighborhood group chats, and while none of them were very significant individually, they might be important to telling the story of protest leadership as a whole."),
                        p("The messages from these 26 channels are the data for my analysis. Further detail on how exactly I processed the data can be found in my", a("github repo.", href = "https://github.com/katrinakeegan/belarus-protests")),
                        p("A major caveat of this methodology was that it is a bit circular: I used a network sampling method to create a network. This means that the method biased NEXTA Live to be near the center of the network, and it is possible that loosely or unrelated networks also exist. This limitation was inherent to the structure of Telegram. Unlike Twitter, from which all messages pertaining to certain search criteria can be downloaded, in Telegram it is impossible to search by topic, only for channels. For a more thorough discussion of this issue, email katrinakeegan@g.harvard.edu for the full paper. My conclusions throughout the website are made with this limitation in mind."),
                        p("Some channels were primarily Russian-language, others were primarily Belarussian. Nearly all channels contained a mixture of Russian and Belarussian because they would sometimes share posts from outlets using the other language. I read Russian fluently, and understood nearly all of the Belarussian thanks to its similarity to Russian and another language I know, Ukrainian.")
                        ),
               
               tabPanel("Leading Channels",
                        h2("An introduction to the leading channels"),
                        p("This graph shows all the channels I scraped and their subscribers as of 10/15/2020."),
                        p("The colors show whether I classified the group as activist (includes calls to protest), opinion (expresses clear opinion about protests but does not explicitly call people to the streets), or reporting (simply providing information about protests)"),
                        sidebarLayout(
                          
                          #In sidebarLayout need both sidebarPanel and mainPanel within the parentheses
                          
                          sidebarPanel(
                            setSliderColor("#93032E", 1),
                            sliderInput("x_axis_range_subscribers", #Name of the thing in server which will be used as a variable
                                        "Zoom in on a particular part of the graph", #What is displayed to user
                                        min = 0,
                                        max = 2000000,
                                        value = c(0, 2000000))
                          ),
                          mainPanel(
                            plotOutput("subscribers")
                        )),
                        h2("The relationship between network connections and subscribers"),
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
                        gt_output("subscriberRegressionTable"),
                        p("As this table shows, subscribers and links either to or from the outlet, no matter the method of counting the links, has no correlation with subscribers."),
                        p("That implies that for channels that are linked relatively frequently about the protests, subscribers do not depend on an outlet being referenced by other outlets more frequently, or an outlet sharing others' content more frequently. In other words, Telegram connections among leading channels implies nothing about their reach to individual subscribers."),
                        h2("Links to outside of Telegram"),
                        p("In addition to considering links and shares to other Telegram channels, I thought it would be interesting an important to understand the external sources to which the leading channels link, in case it was actually other social media networks or websites on which organizational activity was occuring."),
                        plotOutput("externalLinks"),
                        p("Links to outside websites are much less frequent than links to other telegram channels. The links that exist are mainly other social media websites (eg., Instagram), websites associated with Telegram channels (eg., news.tut.by), or other news sites (eg., tass.ru). However, there are a couple observations of particular interest here. First is the domain of Google Forms, bit.ly, which implies an attempt to collect information from readers. Another is docs.google.com, which may imply some collaborative work in Google Docs.")
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