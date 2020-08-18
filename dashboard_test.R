
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
              plotOutput("referrers"),
              
              plotOutput("social")
            ))
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




dashboardPage(
  dashboardHeader(title = "Website Navigation Results"),
  sidebar,
  body
)


