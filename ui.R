
ui <- fluidPage(theme = shinytheme("spacelab"),
                
  titlePanel(tags$h1("CodeClan Website Navigation")),
  
  # sidebarLayout(
  #   sidebarPanel(
  #     
  #     selectInput("",
  #                 "",
  #                 choices = c("a", "b")
  #     ),
  #     
  #     radioButtons("",
  #                 "",
  #                 choices = c("a", "b")
  #     ),
  #     
  #     actionButton("action", 
  #                  label = "update"
  #     )
  #     
  #   ),
    
    mainPanel(
      
      tabsetPanel(
        
        tabPanel("How do visitors find CodeClan",
                
                plotOutput("referrers"),
                
                plotOutput("social")
                          
        ),
        
        tabPanel("Landing Pages",
                 
                plotOutput("landing")
                 
        ),
        
        tabPanel("Goal Completion",
                 
                 plotOutput("goals")
                 
        ),
        
        
        tabPanel("",
                 
                 DT::dataTableOutput("")     
         
        ),
        
        tabPanel("",
                 
                 textOutput("")
                 
                 
        )
        
      )
      
    )
 
  )
  

