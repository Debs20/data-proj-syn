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
            box(width = 6,
                plotOutput("referrers")
            )
            
            
            ,
            
            box(width = 6,
                plotOutput("social")
            )
            
            
            ,
            
            
            valueBox(50*2, "valueBox test", icon = icon("list"))
            
            
            
            
            
    ),
    
    
    
    tabItem(tabName = "landing_page",
            box(width = 12,
                plotOutput("landing")
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
