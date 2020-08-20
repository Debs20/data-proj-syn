library(plotly)

goal_4 <- plot_ly() 
goal_4 <- goal_4 %>%
  add_trace(
    type = "indicator",
    mode = "number+gauge+delta",
    value = 43,
    delta = list(reference = 40),
    domain = list(x = c(0.25, 1), y = c(0.4, 0.6)),
    title = list(text = "Goal 17 Completion"),
    gauge = list(
      shape = "bullet",
      axis = list(range = list(NULL, 200)),
      threshold = list(
        line = list(color = "red", width= 2),
        thickness = 0.75,
        value = 43),
      steps = list(
        list(range = c(0, 150), color = "lightgray"),
        list(range = c(150, 200), color = "gray")),
      bar = list(color = "green"))) 
goal_4<- goal_4 %>%
  add_trace(
    type =  "indicator",
    mode = "number+gauge+delta",
    value = 27,
    delta = list(reference = 31),
    domain = list(x = c(0.25, 1), y = c(0.7, 0.9)),
    title = list(text = "Goal 13 Completion"),
    gauge = list(
      shape = "bullet",
      axis = list(range = list(NULL, 200)),
      threshold = list(
        line = list(color = "red", width = 2),
        thickness = 0.75,
        value = 27),
      steps = list(
        list(range = c(0, 150), color = "lightgray"),
        list(range = c(150, 200), color = "gray")),
      bar = list(color = "green")))

goal_4