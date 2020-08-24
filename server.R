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
      labs(x = "\nOriginating Platform\n",
           y = "\nNumber of sessions",
           title = "\nHow do people find the website",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 25, face = "bold", hjust = 0.5),
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
           title = "\nTop social media networks proving traffic",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 25, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
  })
  
  output$landing <- renderPlot({
    
    landing_page %>%
      mutate(landingPagePath = recode(landingPagePath, "/blog/best-podcast-coders-programmers/" = "blogs", 
                                      "/blog/7-celebrities-didnt-know-code/" = "blogs", "/blog/hire-developers-online-tests/" = "blogs",
                                      "/blog/meet-the-graduates-who-quit-their-jobs-to-learn-how-to-code/" = "blogs",
                                      "/blog/meet-five-codeclan-career-changers/" = "blogs", "/blog/first-developer-job-advice/" = "blogs",
                                      "/blog/best-podcasts-coders-programmers/" = "blogs", "/blog/learn-to-code-working/" = "blogs",
                                      "/blog/meet-the-team-aileen-mcdonald/" = "blogs",
                                      "/blog/meet-emma-from-primary-teacher-to-front-end-developer/" = "blogs", "/" = "Homepage", "/blog/9-common-misconceptions-coding/" = "blogs",
                                      "/blog/9-websites-start-coding-journey/" = "blogs")) %>%
      arrange(desc(sessions)) %>%
      group_by(landingPagePath) %>%
      summarise(sessions = sum(sessions)) %>%
      top_n(8) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(sessions)), y = sessions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of sessions",
           title = "\nHow do users typically enter the website",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 25, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
#What are the most popular landing pages    
  })
  
  output$landing_goals17 <- renderPlot({
    
    landing_goals %>%
      mutate(landingPagePath = recode(landingPagePath, "/courses/professional-software-development/" = "/courses/PSD/",
                                      "/courses/managing-growth-with-agile/?ct=t(short+courses+uk)&mc_cid=9e22d3be4a&mc_eid=[UNIQID]" =
                                        "/courses/managaing-growth/", "/courses/thank-you-for-your-application/" = "/courses/thank-you/")) %>%
      arrange(desc(goal17Completions)) %>%
      head(9) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(goal17Completions)), y = goal17Completions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of completions",
           title = "\nLanding page before completing goal 17 (PSD)",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 23, face = "bold", hjust = 0.5),
            plot.subtitle = element_text(size = 18, face = "italic", hjust = 0.5),
            axis.title.x = element_text(size = 20),
            axis.text = element_text(size = 15),
            axis.title.y = element_text(size = 20))
    
    
  })
  
  
  output$landing_goals13 <- renderPlot({
    
    landing_goals %>%
      filter(landingPagePath != "/webinars/?fbclid=IwAR2h2oGSxo4ew1QYxMdZVttw6_-wO-pFBSYDUNrZPIJ8vlTJNHpz8m_dtrE") %>%
      mutate(landingPagePath = recode(landingPagePath, "/courses/managing-data-business-insights/?ct=t(short+courses+uk_COPY_01)&mc_cid=40897d9e96&mc_eid=[UNIQID]"
                                      = "/managing-data-business-inights", "/courses/professional-software-development/" = "/courses/PSD/",
                                      "/funding/?fbclid=IwAR1VbUBdzStdwzxDMzxJcrAmSxt4056YbybfsxduNaJuDftsN-hWP4skxX0" = "/funding/",
                                      "/courses/thank-you-data-analysis-application/" = "/courses/thank-you/")) %>%
      arrange(desc(goal13Completions)) %>%
      head(9) %>%
      ggplot() +
      aes(x = reorder(landingPagePath, - desc(goal13Completions)), y = goal13Completions) +
      geom_col(fill = "dark blue", col = "black") +
      labs(x = "Landing webpage\n",
           y = "\nNumber of completions",
           title = "\nLanding page before completing goal 13 (DA)",
           subtitle = "(period from 2020-03-01 to 2020-07-31)\n\n") +
      coord_flip() +
      theme_bw() +
      theme(plot.title = element_text(size = 23, face = "bold", hjust = 0.5),
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
           title = "\nNumber of Completions of DA and PSD signups",
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
  
  
  output$bulletgraph13 <- renderPlotly({
    
      plot_ly(
      type = "indicator",
      mode = "number+gauge+delta",
      value = 27,
      domain = list(x = c(0, 1), y= c(0, 1)),
      title = list(text = "<b>DA clicks"),
      delta = list(reference = 31),
      gauge = list(
        shape = "bullet",
        axis = list(range = list(NULL, 100)),
        threshold = list(
          line = list(color = "red", width = 2),
          thickness = 0.75,
          value = 31),
        steps = list(
          list(range = c(0, 75), color = "lightgray"),
          list(range = c(75, 100), color = "gray"))),
      height = 120, width = 500) %>%
            layout(margin = list(l= 150, r= 10))
 

  })
  

  
  output$bulletgraph17 <- renderPlotly({

    plot_ly(
      type = "indicator",
      mode = "number+gauge+delta",
      value = 43,
      domain = list(x = c(0, 1), y= c(0, 1)),
      title = list(text = "<b>PSD clicks</b>"),
      delta = list(reference = 40),
      gauge = list(
        shape = "bullet",
        axis = list(range = list(NULL, 100)),
        threshold = list(
          line = list(color = "red", width = 2),
          thickness = 0.75,
          value = 40),
        steps = list(
          list(range = c(0, 75), color = "lightgray"),
          list(range = c(75, 100), color = "gray"))),
      height = 120, width = 500) %>%
      layout(margin = list(l= 150, r= 10))


})

    
  
} 