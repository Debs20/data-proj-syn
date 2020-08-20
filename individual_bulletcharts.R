
<<<<<<< HEAD

=======
library(plotly)
library(data.table)
library(tidyverse)

#goal 13 individual code
>>>>>>> feature/bulletgraph

goals_1<- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  value = 27,
  domain = list(x = c(0, 1), y= c(0, 1)),
  title = list(text = "<b>Goal 13 
                    completions</b>"),
  delta = list(reference = 31),
  gauge = list(
    shape = "bullet",
    axis = list(range = list(NULL, 200)),
    threshold = list(
      line = list(color = "red", width = 2),
      thickness = 0.75,
      value = 31),
    steps = list(
      list(range = c(0, 150), color = "lightgray"),
      list(range = c(150, 200), color = "gray"))),
  height = 150, width = 600) 
goals_1 <- goals_1 %>%
  layout(margin = list(l= 150, r= 10))

goals_1


<<<<<<< HEAD
=======
#goal 17 individual code 

>>>>>>> feature/bulletgraph
goals_2<- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  value = 43,
  domain = list(x = c(0, 1), y= c(0, 1)),
  title = list(text = "<b>Goal 17 
                    completions</b>"),
  delta = list(reference = 40),
  gauge = list(
    shape = "bullet",
    axis = list(range = list(NULL, 200)),
    threshold = list(
      line = list(color = "red", width = 2),
      thickness = 0.75,
      value = 40),
    steps = list(
      list(range = c(0, 150), color = "lightgray"),
      list(range = c(150, 200), color = "gray"))),
  height = 150, width = 600) 
goals_2 <- goals_2 %>%
  layout(margin = list(l= 150, r= 10))

<<<<<<< HEAD
goals_2
=======
goals_2
>>>>>>> feature/bulletgraph
