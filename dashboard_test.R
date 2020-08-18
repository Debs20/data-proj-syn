
library(dplyr)
library(ggplot2)
library(shiny)
library(shinythemes)
library(readr)

# whatever functions we want....

referrers <- read_csv("data/referrer.csv")
social_network <- read_csv("data/social_network.csv")
landing_page <- read_csv("data/landing_page.csv")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("How do visitors find CodeClan?", tabName = "social_location", icon = icon("dashboard")),
    menuItem("Landing Page", icon = icon("dashboard"), tabName = "landing_page",
             badgeLabel = "new", badgeColor = "green"),
    menuItem("valueBox test", tabName = "valueboxtest", icon = icon("thumbs-up", lib = "glyphicon"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "social_location",
            box(fluidRow(
              plotOutput("referrers")),
              fluidRow(
                plotOutput("social"))
              

            )
    ),
    
    tabItem(tabName = "landing_page",
            box(fluidRow(
              plotOutput("landing")
            ))
    ),
    
    tabItem(tabName = "valueboxtest",
            valueBox(50*2, "valueBox test", icon = icon("list")))
  )
)




ui <- dashboardPage(
  dashboardHeader(title = "Website Navigation Results"),
  sidebar,
  body
)

server <- function(input, output) {
  
  output$referrers <- renderPlot({
    
    # filtered_data <- eventReactive(input$action,{
    
    referrers %>%
      mutate(fullReferrer = recode(fullReferrer, "forms.zohopublic.eu/codeclan/form/ProfessionalSoftwareDevelopmentcourse/formperma/YQR5YuzRB8ROJrjctYuwRCX9yzeUQF7uZtNJb4rrwDo"
                                   = "forms.zohopublic.eu", "gstatic.com/atari/embeds/913211048dfa67f4be7864f4505a4b63/intermediate-frame-minified.html"
                                   = "gstatic.com", "m.facebook.com/" = "social media", "linkedin.com/" = "social media",
                                   "linkedin.com/feed/" = "social media", "facebook.com/" = "social media", "lm.facebook.com/l.php" = "social media",
                                   "lm.facebook.com" = "social media", "lnkd.in" = "social media", "I.instrgram.com" = "social media",
                                   "instagram.com/" = "social media", "linkedin.com/school/codeclan" = "social media",
                                   "l.facebook.com/" = "social media", "lm.facebook.com/" = "social media", "lnkd.in/" = "social media",
                                   "l.instagram.com/" = "social media")) %>%
      arrange(desc(sessions)) %>%
      group_by(fullReferrer) %>%
      summarise(sessions = sum(sessions)) %>%
      top_n(10) %>%
      ggplot() +
      aes(x = reorder(fullReferrer, - desc(sessions)), y = sessions, fill = fullReferrer) +
      geom_col(col = "black") +
      labs(x = "\nOriginating Website\n",
           y = "\nNumber of sessions",
           title = "\nHow people get onto the CodeClan Website",
           subtitle = "(period from 2020/01/01 to 2020/08/01)\n\n") +
      coord_flip() +
      theme_bw() 
  })
  
  
  output$social <- renderPlot({
    
    social_network %>%
      filter(socialNetwork != "(not set)") %>%
      arrange(desc(sessions)) %>%
      head(7) %>%
      ggplot() +
      aes(x = reorder(socialNetwork, - desc(sessions)), y = sessions, fill = socialNetwork) +
      geom_col(col = "black") +
      labs(x = "\nSocial Network\n",
           y = "\nNumber of sessions",
           title = "\nTop social media networks that provide visitors to the CodeClan Website",
           subtitle = "(period from 2020/01/01 to 2020/08/01)\n\n") +
      coord_flip() +
      theme_bw() 
    
  })
  
  output$landing <- renderPlot({
    
    landing_page %>%
      arrange(desc(sessions)) %>%
      head(10) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(sessions)), y = sessions, fill = landingPagePath) +
      geom_col(col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of sessions",
           title = "\nWhat are the most popular landing pages",
           subtitle = "(period from 2020/01/01 to 2020/08/01)\n\n") +
      coord_flip() +
      theme_bw() 
  })
}


shinyApp(ui, server)
