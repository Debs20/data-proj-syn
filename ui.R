
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Webinar Participation", tabName = "social_location", icon = icon("dashboard")),
    menuItem("User Journey", icon = icon("dashboard"), tabName = "landing_page",
             badgeLabel = "new", badgeColor = "green")
#    ,
#    menuItem("valueBox test", tabName = "valueboxtest", icon = icon("thumbs-up", lib = "glyphicon"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "social_location",
            
            fluidRow(
              column(
              width = 5,
              box(width = 12,
                  title = "DA webinar registrations - July 2020",
                    plotlyOutput("bulletgraph13", height = "120px")
              )
              ),
            
              column(width = 2,
                     br(),
                valueBox(width = 12, goals$goal17Completions[length(goals)] + goals$goal13Completions[length(goals)], "Total signups (July)", icon = icon("list"))
              ),
              
              column(width = 5,
                    box(width = 12, 
                        title = "PSD webinar registrations - July 2020",
                    plotlyOutput("bulletgraph17", height = "120px")
              )
              )
            
            ),
            
            fluidRow(
              width = 12,
                plotOutput("goals")
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
    )
    
#    tabItem(tabName = "valueboxtest",
 #           valueBox(50*2, "valueBox test", icon = icon("list")))
  )
)




ui <- dashboardPage(
  dashboardHeader(title = "Website Engagement"),
  sidebar,
  body
)
