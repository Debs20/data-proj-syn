
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
              column(width = 8,
                plotOutput("goals")
            ),
                   
            valueBox(goals$goal17Completions[length(goals)] + goals$goal13Completions[length(goals)], "Total webinar signups this month", icon = icon("list"))

            
            ),
            
            
            fluidRow(
              column(width = 6,
                     
                       plotlyOutput("bulletgraph13")
                        
                     ),
              column(width = 6,
                     
                       plotlyOutput("bulletgraph17")
                     
                     ),

            
            
            ),
            
            fluidRow(
              column(width = 6,
                    
                plotOutput("social")
                     
            ),
            
            column(width = 6,
                   
                    plotOutput("referrers")
                   
            )
            ),
            
            
    ),
    
    
    
    tabItem(tabName = "landing_page",
            fluidRow(
              box(width = 12,
                plotOutput("landing")
            )
            ),
            
            fluidRow(
              box(width = 6,
                plotOutput("landing_goals13")
            ),
            box(width = 6,
                plotOutput("landing_goals17")
            )
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
