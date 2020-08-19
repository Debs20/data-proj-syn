
ui <- fluidPage(theme = shinytheme("spacelab"),
                
  titlePanel(tags$h1("CodeClan Website Navigation")),
    
    mainPanel(
      
      tabsetPanel(
        
        tabPanel("How do visitors find CodeClan",
                
                plotOutput("referrers"),
                
                plotOutput("social")
                          
        ),
        
        tabPanel("Landing Pages",
                 
                plotOutput("landing"),
                
                textOutput("landing_text")
                
                 
        ),
        
        tabPanel("Goal Completion",
                 
                 plotOutput("goals"),
                 
                 plotOutput("landing_goals17"),
                 
                 plotOutput("landing_goals13")
                 
        )
        
      )
      
    )
 
  )
  
