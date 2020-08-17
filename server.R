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
           title = "\nHow people get onto the CodeClan Website") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold"),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20),
            legend.position = "none")
     
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
           title = "\nTop social media networks that provide visitors to the CodeClan Website") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold"),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20),
            legend.position = "none")
  
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
           title = "\nWhat are the most popular landing pages") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 30, face = "bold"),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20),
            legend.position = "none")
    
  })
  
  
  
  
  output$table <- DT::renderDataTable({
    
  
      
  })
  
  output$about <- renderText({
    
  })
    

 
} 

  
  
