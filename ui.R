
ui <- fluidPage(theme = shinytheme("spacelab"),
                
  titlePanel(tags$h1("Project-1")),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("",
                  "",
                  choices = 
      ),
      
      radioButtons("",
                  "",
                  choices = 
      ),
      
      actionButton("action", 
                   label = ""
      )
      
    ),
    
    mainPanel(
      
      tabsetPanel(
        
        tabPanel("",
                
                plotOutput("")
                          
        ),
        
        tabPanel("",
                 
                plotOutput("")
                 
        ),
        
        tabPanel("",
                 
                 DT::dataTableOutput("")     
         
        ),
        
        tabPanel("About",
                 
                 textOutput("....")
                 
                 
        )
        
      )
      
    )
 
  )
  
)
