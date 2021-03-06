

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
                        p("For the text analysis, I cleaned the data with a stemmer from the snowball package so that words would be counted as the same regardless of ending (eg, cat and cats would both become cat). I then used the topicmodels package in R, which is powered by the most common topic modelling algorithm, LDA."),
                        p("Some channels were primarily Russian-language, others were primarily Belarussian. Nearly all channels contained a mixture of Russian and Belarussian because they would sometimes share posts from outlets using the other language. For the purpose of qualitative analyis, this did not pose a problem. I read Russian fluently, and understood nearly all of the Belarussian thanks to its similarity to Russian and another language I know, Ukrainian. However, for the topic modelling I had to use only the primarily Russian-language channels because the model could not handle two languages simultaneously. I chose Russian because a) there were far more Russian-language channels and b) the tools to manipulate Russian in R are far more developed than Belarussian.")
                        ),
               
               tabPanel("Leading Channels",
                        h2("An introduction to the leading channels"),
                        p("This graph shows all the channels I scraped and their subscribers as of 10/15/2020."),
                        p("The colors show whether I classified the group based on qualitative analysis of the first week of content as activist (includes calls to protest), opinion (expresses clear opinion about protests but does not explicitly call people to the streets), or reporting (simply providing information about protests)"),
                        p("It may take some time to load. Please be patient!"),
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
                        h2("Three Topics"),
                        p("The topics below were generated using the LDA formula. After several attempts with different numbers of topics, I settled on three topics as the ones that were most distinct and made the most sense."),
                        p("Unfortunately, I had to generate these models using only the primarily Russian-language channels, since topic modelling cannot manipulate two languages simultaneously."),
                        p("Below are the three topics generated by the model and the 20 most prominent words in each topic. Common and/or unhelpful words like which and also were removed. I also translated the words into English."),
                        plotOutput("topicmodel"),
                        p("The topic model does not specify a name for each topic. Of course, there is a lot of overlap. However, looking at the words I see the general theme of each topic as follows:"),
                        p("1: Organizing. Words like question, answer and chat imply a conversation about specifics. Words like deputy and district imply a degree of local specificity as well. Words like meet, do and subscribe imply calls for speific actions readers can take."),
                        p("2: Inspiring. Words like Belarus, Belarussian, the people, country and solidarity imply appeals to the people of Belarus. Words like street and square indicate specifics about protest location, and the word go out (vykhodit) is especially telling, since it is an explicit call to protest action. Words like OMON (the security forces responsible for protest repression), Lukashenko and power (vlast) may be reminding people why they should protest. The word very may also indicate impassioned, rather than neutral, content."),
                        p("3: Reporting. Many of the specifics about protest location (protest, street, square, action, near, side) are similar to topic 2, but more extensive. Words like arrest, arrested and security services indicate a high volume of informational content about arrests specifically. Words like report, speak and employee may indicate sources of information characteristic of reporting rather than calls to protest."),
                        h2("Percent of Each Channel Comprised of Each Topic"),
                        p("Below is the percent of each channel's content estimated to belong to each topic. They always add up to 100% because according to this model, all content fits in one of the topics."),
                        p("Remeber, unfortunately only Russian-language channels are included here. I could not run the topic model on the Belarussian channels and Russian ones simultaneously."),
                        plotOutput("topicPercent"),
                        p("The topics here overlap significantly with my qualitative characterization of outlets as activist (loosely, topic 2) and reporting (loosely, topic 3).")
               ),
               
               tabPanel("Conclusion",
                        p("Based on my analysis, I conclude that Model 3 (impersonal leaders emerging from online social networks) or Model 4.1 (behind-the-scenes leadership groups formed in person) are the most likely models for protest leadership."),
                        p(strong("Organizing is taking place primarily on Telegram."), "Several pieces of evidence combine for this conclusion. First, the subscribers data show an enormous number of people follow the channels. Nearly one fifth the entire population of Belarus subscribes to NEXTA Live alone. So, protesters are clearly using Telegram in great numbers. However, the use of Telegram does not just reflect external organizational structure. If the protests were organized by traditional civil society organizations, we would expect to see a strong connection between network structure and number of subscribers, because on-the-ground civil society would replicate itself in the online space. Instead, online structure appears to have no relation to subscribers, i.e., people on the ground. Additionally, if there were strong connections to civil society organizations or other forms of on-the-ground organizing, we would expect to see that in the outside links shared on Telegram, but the only traditional civil society organization linked frequently is Viasna. Viasna may have played an important role, but qualitative analysis showed that it did not organize protests, but rather provided assistance to arrested protesters. (Viasna's Telegram channel was not included in topic modelling because it is in Belarussian.) Most external links are to news sites and/or sites affiliated with Telegram channels. This conclusion elimintes Model 4.2 (behind-the-scenes civil society leadership)."),
                        p(strong("There are, in fact, leaders of the protests."), "The network structure is highly centralized, showing that the movement is not horizontally organized: certain channels are much more important than others. This eliminates Model 1 (leaderlessness)."),
                        p(strong("Individual opposition leaders are not playing the most important role."), "Only three of the leading channels belonged to individual opposition figures: tsikhanouskaya, mc_maxim, and motolkohelp. Qualitatively, none of these were activist channels. Topic modelling showed that they may have played mixed inspiring/organizing roles, but not as strongly as the activist channels for the former or the neighborhood groups for the later. Additionally, all of them ranked below the top activist channels of NEXTA Live, NEXTA TV, mkbelarus, and belamova in subscribers. The top activist channels have impersonal leadership in the sense that they do not draw attention to any particular individual; outside research would be necessary to determine who is writing the posts. This eliminates Model 5 (visible leaders)."),
                        p(strong("Neighborhood groups might play a key role."), "The network structure shows that the neighborhood groups may serve as bridges between the leading channels and individuals. Furthermore, topic modelling shows that they may play an organizing role with local specificity. It is impossible to know whether the people in the neighborhood groups knew each other before organizing online. If they didn't, then this provides support for Model 3 (impersonal leaders emerging from online networks), and if they did know each other in person, Model 4.1 (behind-the-scenes leadership groups formed in person.)"),
                        p(strong("Independent media played a key role."), "Both qualitative analysis and topic modelling support the conclusion that independent media, especially TUT.by but others as well, provided detailed information about the protests. The prominence of these outlets in the network suggests that they were a key source of information for activist channels, and their high numbers of subscribers show that they succeeded in providing information to indivudals as well."),
                        p(strong("Certain Telegram channels, including NEXTA, are leading the protests."), "Not only do subscriber numbers and centrality in the network support the idea that NEXTA and some other leading channels are very important, but qualitative analysis and topic modelling show that they are both ideological and logistical leaders as well. Specific plans and calls to protest were accompanied by inspirational content appealing to the Belarussian people, as shown by the fact that these activist channels fell under the inspiration category in topic modelling. This eliminates Models 2.1 and 2.2, which both allow for connective leaders that do not directly organize the protests, and supports Model 3 or Model 4.1, depending on whether the leaders of these channels know each other personally or formed their network online only.")
                        ),
               
               tabPanel("About Me",
                         p("I'm a Master's student at Harvard in Russian, Eastern European and Central Asian Studies. I've spent over 2 years abroad in Eurasia, including Russia, Ukraine, Azerbaijan and Moldova. I speak Russian, Ukrainian, Turkish and Uzbek, and for this project I discovered I can also read Belarussian! You can check out a", a("longer bio", href = "https://daviscenter.fas.harvard.edu/about-us/people/katrina-marjorie-keegan"), "on the Davis Center website."),
                         p("Feel free to contact me at katrinakeegan@g.harvard.edu."),
                         p("The github repo for this project can be found", a("here.", href = "https://github.com/katrinakeegan/gov50-final")),
                         p("I could not have done this project without the support of the amazing teaching staff of Gov 50, especially Wyatt Hurt and Tyler Simko."),
                         imageOutput("me_on_maidan"),
                         p("This photo is of me in 2019 on Maidan in Kyiv, the site of the 2014 Ukrainain Revolution of Dignity. Hopefully I'll be able to visit the site of a similarly successful revolution in Belarus someday!")
               )
    ))