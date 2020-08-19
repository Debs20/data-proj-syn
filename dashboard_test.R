# ---- global ----

library(dplyr)
library(ggplot2)
library(shiny)
library(shinythemes)
library(readr)
library(shinydashboard)

# whatever functions we want....

referrers <- read_csv("data/referrer.csv")
social_network <- read_csv("data/social_network.csv")
landing_page <- read_csv("data/landing_page.csv")
goals <- read_csv("data/goals.csv")
sessions <- read_csv("data/sessions.csv")


#---- ui ----

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
            box(width = 12,
                plotOutput("goals")
            )
            
            
            ,
            
            box(width = 12,
                plotOutput("social")
            ),
            
            box(width = 8,
                plotOutput("referrers")
            ),
            
            box(width = 4,
                valueBox(goals$goal17Completions[length(goals)] + goals$goal13Completions[length(goals)], "Total webinar signups this month", icon = icon("list"))
            )
            
    ),
    
    
    
    tabItem(tabName = "landing_page",
            box(width = 12,
                plotOutput("landing")
            ),
            box(width = 12,
                plotOutput("landing_goals13")
            ),
            box(width = 12,
                plotOutput("landing_goals17")
            )
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


# ---- server ----

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
      top_n(5) %>%
      ggplot() +
      aes(x = reorder(fullReferrer, - desc(sessions)), y = sessions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "\nOriginating Website\n",
           y = "\nNumber of sessions",
           title = "\nHow do people get onto the CodeClan Website",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
  })
  
  
  output$social <- renderPlot({
    
    social_network %>%
      filter(socialNetwork != "(not set)") %>%
      arrange(desc(sessions)) %>%
      head(7) %>%
      ggplot() +
      aes(x = reorder(socialNetwork, - desc(sessions)), y = sessions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "\nSocial Network\n",
           y = "\nNumber of sessions",
           title = "\nTop social media networks that provide visitors to the CodeClan Website",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
  })
  
  output$landing <- renderPlot({
    
    landing_page %>%
      arrange(desc(sessions)) %>%
      head(10) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(sessions)), y = sessions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of sessions",
           title = "\nWhat are the most popular landing pages",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
  })
  
  output$landing_goals17 <- renderPlot({
    
    landing_goals %>%
      arrange(desc(goal17Completions)) %>%
      head(9) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(goal17Completions)), y = goal17Completions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of completions",
           title = "\nWhat page did people land on before completing goal 17 (PSD)",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
    
  })
  
  
  output$landing_goals13 <- renderPlot({
    
    landing_goals %>%
      mutate(landingPagePath = recode(landingPagePath, "/courses/managing-data-business-insights/?ct=t(short+courses+uk_COPY_01)&mc_cid=40897d9e96&mc_eid=[UNIQID]"
                                      = "/courses/managing-data-business-inights")) %>%
      arrange(desc(goal13Completions)) %>%
      head(9) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(goal13Completions)), y = goal13Completions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of completions",
           title = "\nWhat page did people land on before completing goal 13 (DA)",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
    
  })
  
  output$goals <- renderPlot({
    
    colours <- c("Goal 17 (PSD)" = "blue", "Goal 13 (DA)" = "red")
    
    goals %>%
      ggplot(aes(x = month)) +
      geom_line(aes(y = goal17Completions, colour = "Goal 17 (PSD)"), group = 1) +
      geom_point(aes(y = goal17Completions, colour = "Goal 17 (PSD)")) +
      geom_line(aes(y = goal13Completions, colour = "Goal 13 (DA)"), group = 1) +
      geom_point(aes(y = goal13Completions, colour = "Goal 13 (DA)")) +
      scale_colour_manual(values = colours) +
      labs(x = "Month\n",
           y = "\nNumber of Completions",
           title = "\nNumber of Completions of Goals 13 and 17",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20),
            legend.title = element_text(size = 20),
            legend.text = element_text(size = 15))
    
    
  })
  
  
} 

# ---- App Generation ----

shinyApp(ui, server)
