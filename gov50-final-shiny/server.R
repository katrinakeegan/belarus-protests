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
#The following section is dedicated to creating the NETWORK
  
  #Below is a function that will clean the data so that I have the relevant network data
  clean_to_network_cols <- function(data) {
    data %>%
      select(messages__text__href, messages__forwarded_from) %>%
      rename(link = messages__text__href, forwarded = messages__forwarded_from) %>%
      filter(!is.na(link) | !is.na(forwarded)) 
  }
  
  #Here is a function that combines information from the links and shares by changing link names to group names
  #Change telegram links into forwarded format
  
  change_link_to_name <- function(data) {
    data %>%
      mutate(network =
               case_when(!is.na(forwarded) ~ forwarded,
                         grepl("BlackBookBelarus", link) ~"Черная книга Беларуси",
                         grepl("joinchat/FOFVqhyzx5Gd3B", link) ~"Neighborhood group",
                         grepl("luxta_tv", link) ~"LUXTA",
                         grepl("minsk_eastern_district_107_chat", link) ~"Neighborhood group",
                         grepl("nexta_live", link) ~"NEXTA Live",
                         grepl("nexta_tv", link) ~"NEXTA",
                         grepl("bel_girls", link) ~"GIRL POWER BELARUS",
                         grepl("BelarusTelegram", link) ~"Беларуский Телеграм",
                         grepl("Belatp", link) ~"Типичная Беларусь",
                         grepl("bysol", link) ~"Фонд солидарности BYSOL",
                         grepl("cpartisans", link) ~"Кибер-Партизаны",
                         grepl("euroradio", link) ~"Euroradio",
                         grepl("grankovski", link) ~"Neighborhood group",
                         grepl("honestpeople_by", link) ~"Честные люди",
                         grepl("joinchat/AAAAAEjffyoi9hgp9kVhTA", link) ~"МАЯ КРАІНА БЕЛАРУСЬ",
                         grepl("joinchat/AAAAAEklfX7sPNSO8QXhJw", link) ~"Усы Лукашенко",
                         grepl("joinchat/AAAAAFPezXkJRKSNTyAm7w", link) ~"Типичная Беларусь",
                         grepl("joinchat/H6JljhkJIaEk321KqY6YNA", link) ~"Neighborhood group",
                         grepl("kraina97", link) ~"97%",
                         grepl("kupalovskiy95", link) ~"Neighborhood group",
                         grepl("lifeyt", link) ~"ЖЮ",
                         grepl("MKBelbot", link) ~"МАЯ КРАІНА БЕЛАРУСЬ",
                         grepl("motolkohelp", link) ~"#МотолькоПомоги этому городишко от 3% избавиться",
                         grepl("nashaniva", link) ~"Наша Нiва",
                         grepl("okrug99minsk", link) ~"Neighborhood group",
                         grepl("otzyv_lagunova", link) ~"Neighborhood group",
                         grepl("pulpervoi", link) ~"Светлана Тихановская",
                         grepl("recall_deputy_lenchevskaya", link) ~"Neighborhood group",
                         grepl("recall_deputy_starovoitova", link) ~"Neighborhood group",
                         grepl("rh_by", link) ~"Рэгіянальная газета",
                         grepl("rian_ru", link) ~"РИА Новости",
                         grepl("stachkom", link) ~"Стачком ОАО Беларуськалий",
                         grepl("stop_dick", link) ~"Stop Dick",
                         grepl("stop_dumbadze", link) ~"Neighborhood group",
                         grepl("thisminsk", link) ~"Это Минск, детка!",
                         grepl("tutby_official", link) ~"TUT.BY новости",
                         grepl("zhodino2020", link) ~"Координация помощи в Жодино",
                         grepl("ATN_BTRC", link) ~"ATN_NEWS",
                         grepl("bajby", link) ~"БАЖ / BAJ",
                         grepl("dimsmirnov175", link) ~"Пул N3",
                         grepl("minzdravbelarus", link) ~"Официальный Минздрав",
                         grepl("nvonlineby", link) ~"Народная Воля (газета-сайт)",
                         grepl("radiosvaboda", link) ~"Радыё Свабода — Беларусь",
                         grepl("rbc_news", link) ~"РБК",
                         grepl("robabayan", link) ~"Роман Бабаян",
                         grepl("studenty2020", link) ~"Студэнцкая ініцыятыўная група",
                         grepl("tass_agency", link) ~"ТАСС",
                         grepl("viktarbabarykaofficial", link) ~"Виктор Бабарико — официальный канал",
                         grepl("vladimirlegoyda", link) ~"Владимир Легойда",
                         grepl("stop_gaiduk", link) ~"Neighborhood group",
                         grepl("lukanomika", link) ~"ЭКАНОМІКА",
                         grepl("belsat", link) ~"Белсат",
                         grepl("bazabazon", link) ~"Baza",
                         grepl("belarus_blacklist_bot", link) ~"Черная книга Беларуси",
                         grepl("durov", link) ~"Durov's Channel",
                         grepl("tsikhanouskaya", link) ~"Светлана Тихановская",
                         grepl("jivaiagazeta", link) ~"Пенсионеры 97%. Инфо",
                         grepl("narod97", link) ~"Чат 97%",
                         grepl("pul_1", link) ~"Пул Первого",
                         grepl("belamova", link) ~"Беларусь головного мозга",
                         grepl("bnkbel", link) ~"Баста!",
                         grepl("gomeltoday", link) ~"Сильные Новости - gomel.today",
                         grepl("UsyLukashenko", link) ~"Усы Лукашенко",
                         grepl("RealnaiaBelarus", link) ~"Реальная Беларусь",
                         grepl("joinchat/AAAAAEFpAvewJ_3iThy5lA", link) ~"Горячие Новости",
                         grepl("sadmika", link) ~"Грустный Коленька",
                         grepl("MikolaDziadok", link) ~"MIKOLA",
                         grepl("worldprotest", link) ~"Протесты в мире",
                         grepl("vybary", link) ~"Выборы. Беларусь",
                         grepl("belarus_economy", link) ~"Экономика Беларуси",
                         grepl("belarusian_history", link) ~"Belarus history",
                         grepl("belarus_lite", link) ~"Пятая колонка",
                         grepl("tginfo", link) ~"Telegram Info",
                         grepl("mkbelarus", link) ~"МАЯ КРАІНА БЕЛАРУСЬ",
                         grepl("listovki_97", link) ~"Листовки 97%",
                         grepl("palchys", link) ~"PALCHYS",
                         grepl("latushka", link) ~"Павел Латушко | Pavel Latushka",
                         grepl("iSANS_Belarus", link) ~"iSANS Беларусь",
                         grepl("BlackBookBrest", link) ~"Черная книга local",
                         grepl("BlackBookVitebsk", link) ~"Черная книга local",
                         grepl("BlackBookGomel", link) ~"Черная книга local",
                         grepl("BlackBookGrodno", link) ~"Черная книга local",
                         grepl("BlackBookMogilev", link) ~"Черная книга local",
                         grepl("CyberPartisan", link) ~"Кибер Партизаны",
                         grepl("bychangenews", link) ~"ByChange",
                         grepl("onlinerby", link) ~"Onliner",
                         grepl("naukaforpeople", link) ~"Забавная Наука",
                         grepl("prirodaforpeople", link) ~"Жэсточайшая Природа",
                         grepl("twarforpeople", link) ~"Жэсточайшие Твари",
                         grepl("cyberpartisan", link) ~"Кибер Партизаны",
                         grepl("pramenby", link) ~"Прамень",
                         grepl("elehtarat", link) ~"Элехтарат",
                         grepl("joinchat/Iv257x0g4SFPQBYeW-pdow", link) ~"Neighborhood group",
                         grepl("joinchat/AAAAAEklfX5GcSBexFNnKA", link) ~"Усы Лукашенко",
                         grepl("joinchat/AAAAAEklfX5GcSBexFNnKA", link) ~"Усы Лукашенко",
                         grepl("viasna96", link) ~"Вясна / Правы чалавека ў Беларусі",
                         grepl("studentyBY", link) ~"отчислено",
                         grepl("s_bdtu", link) ~"Салідарны БДТУ",
                         grepl("rada_vision", link) ~"Координационный совет",
                         grepl("pressmvd", link) ~"Пресс-секретарь МВД Беларуси",
                         grepl("pressballby", link) ~"Спорт Беларуси — Прессбол",
                         grepl("poezdBY", link) ~"Молодежный поезд",
                         grepl("peaceful_bsuir", link) ~"Мирный БГУИР",
                         grepl("minskoemetro", link) ~"Минский метрополитен",
                         grepl("kyky_org", link) ~"Кулуары KYKY",
                         grepl("krumkachy", link) ~"Krumkachy",
                         grepl("klaskouski", link) ~"Klaskouski",
                         grepl("intexpress", link) ~"Интекс-Пресс Барановичи",
                         grepl("golosby_bot", link) ~"Голос",
                         grepl("eu_by", link) ~"Европейская Беларусь",
                         grepl("cvboard", link) ~"CV board: Honest people/HR Breakfast",
                         grepl("binklbinkl", link) ~"БИНОКЛЬ",
                         grepl("belxalat", link) ~"БЕЛЫЕ ХАЛАТЫ",
                         grepl("belteanews", link) ~"Чай з малинавым варэннем",
                         grepl("belarusseichas", link) ~"Беларусь Сейчас",
                         grepl("belarusin", link) ~"ЧП Беларусь",
                         grepl("mbkhmedia", link) ~"МБХ медиа",
                         grepl("khliabets", link) ~"Khliabets",
                         grepl("MSTBELARUS", link) ~"Пресс-служба Министерства спорта и туризма",
                         grepl("LptSM1dPAC3ro5_GRi8E1Q", link) ~"Каментатарская",
                         grepl("hrydzinphoto", link) ~"Hrydzin Phototography",
                         grepl("novaya_pishet", link) ~"Новая газета",
                         grepl("aavst55", link) ~"aavst",
                         grepl("UnileverRussiaNews", link) ~"Unilever в России: о бизнесе, брендах и людях",
                         grepl("menskdoldrums", link) ~"Менская хандра",
                         grepl("tabakerka_by", link) ~"Беларусь бастует!",
                         grepl("polotsk_novopolotsk", link) ~"Полоцк - Новополоцк Беларусь",
                         grepl("rt_russian", link) ~"RT на русском",
                         grepl("terroristybelarusi", link) ~"Каратели Беларуси - имена, адреса, родственники",
                         grepl("praludzej", link) ~"Пра людзей. Беларусь",
                         grepl("progomel", link) ~"Neighborhood group",
                         grepl("mediazona_by", link) ~"Медиазона. Беларусь",
                         grepl("molovTG", link) ~"Молодечно HOME",
                         grepl("the_village_me", link) ~"The Village Беларусь",
                         grepl("vybory_smotri", link) ~"Выборы видишь? | TUT.BY Политика",
                         grepl("spadczyna", link) ~"Спадчына",
                         grepl("skgovby", link) ~"Следственный комитет Беларуси",
                         grepl("horadnia", link) ~"Haradzenski",
                         grepl("hrodnalife", link) ~"Hrodna.life",
                         grepl("vitebsk97pro", link) ~"Витебск 97%",
                         grepl("polotsk_i_novopolotsk", link) ~"Полоцк и Новополоцк",
                         grepl("ntvnews", link) ~"НТВ",
                         grepl("lebiadok", link) ~"Lebiadok",
                         grepl("diarius_corporatum", link) ~"Дыярыуш карпаранцкі",
                         grepl("breakingmash", link) ~"Mash",
                         grepl("minsk_new", link) ~"Минск: какой народец - такой и городишко",
                         grepl("iznanka_news", link) ~"Изнанка 18+ | Украина",
                         grepl("spiski_okrestina", link) ~"Списки Задержанных",
                         grepl("real_kyiv", link) ~"Real Kyiv",
                         grepl("meduzalive", link) ~"Медуза — LIVE",
                         grepl("codaru", link) ~"CodaRU",
                         grepl("belarus_mythology", link) ~"Мифология Беларуси",
                         grepl("protest_by", link) ~"Честные новости",
                         grepl("koko_by", link) ~"Мерзкий Кокобай", 
                         grepl("brestgazetatelegram", link) ~"Брестская газета: новости - 2020",
                         grepl("BelGram", link) ~ "Беларусь Телеграм Чат",
                         grepl("suh97pro", link) ~"Neighborhood group",
                         grepl("MayakMinsk", link) ~"Neighborhood group", 
                         grepl("sovbelorussia", link) ~"Советская Белоруссия",
                         grepl("naviny_by", link) ~"Naviny.by",
                         grepl("joinchat/BRXqnBthP4Ow7jxmEQK8Dw", link) ~ "Neighborhood group",
                         grepl("joinchat/FVRJK1JydYL_NcAjzr1eXQ", link) ~ "Neighborhood group",
                         grepl("Len95okrug", link) ~ "Neighborhood group",
                         grepl("brestcomment", link) ~"Брест - обсуждаем новости города", 
                         grepl("grodno015by", link) ~ "Сайт Гродно 015.BY", 
                         grepl("gazetaby", link) ~"Салідарнасць – главные новости Беларуси",
                         grepl("tribuna_by", link) ~"Tribuna.com Беларусь", 
                         grepl("Bell_tech", link) ~"The Bell Tech",
                         grepl("gpkgovby", link) ~"Пограничный комитет Беларуси",
                         grepl("TheCitizenBelarus", link) ~"Гражданин",
                         grepl("telegrambelarus", link) ~"Telegram Беларусь",
                         grepl("harbatsevich", link) ~"HARBACEVIČ",
                         grepl("zaslavl_new", link) ~"Заславский чат активистов",
                         grepl("vottaktv", link) ~"Vot Tak TV",
                         grepl("CatalogTelegram", link) ~"Каталог Telegram", 
                         grepl("bnr100by", link) ~"Каманда БНР100",
                         grepl("symbalby", link) ~"SYMBAL.BY",
                         grepl("joinchat/AAAAAEwwDXiIvnT0OwM8xQ", link) ~"Будни Беларуси",
                         grepl("krasnyj_bor", link) ~"Neighborhood group"
               )
      )
  }
  
  #The following function will count the total number of connections (both links and shares)
  count_connections <- function(data) {
    data %>%
      group_by(network) %>%
      summarize(count = n(), .groups = "drop") %>%
      arrange(desc(count))
  }
  
  #This function combines the above functions to read my data and clean it
  create_connections <- function(data, name) {
    read_csv(data, col_types = cols(
      .default = col_character(),
      id = col_double(),
      messages__id = col_double(),
      messages__date = col_datetime(format = ""),
      messages__edited = col_datetime(format = ""),
      messages__from_id = col_double(),
      messages__duration_seconds = col_double(),
      messages__width = col_double(),
      messages__height = col_double(),
      messages__reply_to_message_id = col_double()
    )) %>%
      clean_to_network_cols() %>%
      change_link_to_name() %>%
      count_connections() %>%
      mutate(source = name) %>%
      filter(source != network) %>%
      filter(!is.na(network))
  }
  
  #Now I actually enter all my data and clean it
  nexta_live_connections <- create_connections("raw_data_csv/nexta_live.csv", "NEXTA Live")
  tutby_connections <- create_connections("raw_data_csv/tutby_official_raw.csv", "TUT.BY новости")
  nexta_tv_connections <- create_connections("raw_data_csv/raw_nexta_tv.csv", "NEXTA")
  belamova_connections <- create_connections("raw_data_csv/belamova.csv", "Беларусь головного мозга")
  mkbelarus_connections <- create_connections("raw_data_csv/mkbelarus.csv", "МАЯ КРАІНА БЕЛАРУСЬ")
  nashaniva_connections <- create_connections("raw_data_csv/nashaniva.csv", "Наша Нiва")
  onliner_connections <- create_connections("raw_data_csv/onliner.csv", "Onliner")
  euroradio_connections <- create_connections("raw_data_csv/euroradio.csv", "Euroradio")
  motolkohelp_connections <- create_connections("raw_data_csv/motolkohelp.csv", "#МотолькоПомоги этому городишко от 3% избавиться")
  kyky_connections <- create_connections("raw_data_csv/kyky.csv", "Кулуары KYKY")
  belsat_connections <- create_connections("raw_data_csv/belsat.csv", "Белсат")
  radiosvaboda_connections <- create_connections("raw_data_csv/radiosvaboda.csv", "Радыё Свабода — Беларусь")
  usylukashenko_connections <- create_connections("raw_data_csv/usylukashenko.csv", "Усы Лукашенко")
  tsikhanouskaya_connections <- create_connections("raw_data_csv/tsikhanouskaya.csv", "Светлана Тихановская")
  blackbookbelarus_connections <- create_connections("raw_data_csv/blackbookbelarus.csv", "Черная книга Беларуси")
  belteanews_connections <- create_connections("raw_data_csv/belteanews.csv", "Чай з малинавым варэннем")
  tribuna_by_connections <- create_connections("raw_data_csv/tribuna_by.csv", "Tribuna.com Беларусь")
  studenty_by_connections <- create_connections("raw_data_csv/studenty_by.csv", "отчислено")
  pressmvd_connections <- create_connections("raw_data_csv/pressmvd.csv", "Пресс-секретарь МВД Беларуси")
  mc_maxim_connections <- create_connections("raw_data_csv/mc_maxim.csv", "Работаем с Пушкиным!")
  viasna96_connections <- create_connections("raw_data_csv/viasna96.csv", "Вясна / Правы чалавека ў Беларусі")
  bajby_connections <- create_connections("raw_data_csv/bajby.csv", "БАЖ / BAJ")
  minsk_eastern_district_107_chat_connections <- create_connections("raw_data_csv/minsk_eastern_district_107_chat.csv", "Neighborhood Example 1")
  recall_deputy_lenchevskaya_connections <- create_connections("raw_data_csv/recall_deputy_lenchevskaya.csv", "Neighborhood Example 2")
  stop_gaiduk_connections <- create_connections("raw_data_csv/stop_gaiduk.csv", "Neighborhood Example 3")
  
  #Now I combine all of those into the whole network
  big_network <- bind_rows(nexta_live_connections, 
                           tutby_connections,
                           nexta_tv_connections,
                           belamova_connections,
                           mkbelarus_connections,
                           nashaniva_connections,
                           onliner_connections,
                           euroradio_connections,
                           motolkohelp_connections,
                           kyky_connections,
                           belsat_connections,
                           radiosvaboda_connections,
                           usylukashenko_connections,
                           tsikhanouskaya_connections,
                           blackbookbelarus_connections,
                           belteanews_connections,
                           tribuna_by_connections,
                           studenty_by_connections,
                           pressmvd_connections,
                           mc_maxim_connections,
                           viasna96_connections,
                           bajby_connections,
                           minsk_eastern_district_107_chat_connections,
                           recall_deputy_lenchevskaya_connections,
                           stop_gaiduk_connections)
  

    output$mostConnected <- renderPlot({
      most_connected <- big_network %>%
        group_by(network) %>%
        summarize(total_links = sum(count), .groups = "drop") %>%
        arrange(desc(total_links)) %>%
        slice(1:21) %>%
        filter(!is.na(network))
      
      most_connected %>%
        ggplot(aes(x = total_links, y = fct_reorder(network, total_links))) +
        geom_col() +
        labs(title = "Telegram channels linked or shared by other channels",
             x = "times linked or shared",
             y = "Name of channel")
       
    })

})
