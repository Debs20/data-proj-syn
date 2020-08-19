
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
            fluidRow(
              box(width = 8,
                plotOutput("goals")
            ),
            
            valueBox(goals$goal17Completions[length(goals)] + goals$goal13Completions[length(goals)], "Total webinar signups this month", icon = icon("list"))
            
            
            ),
            
            fluidRow(
              box(width = 6,
                plotOutput("social")
            ),
            
            box(width = 6,
                plotOutput("referrers")
            )
            ),
            
            
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
