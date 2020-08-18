library(dplyr)
library(ggplot2)
library(shiny)
library(shinythemes)
library(readr)

# whatever functions we want....

referrers <- read_csv("data/referrer.csv")
social_network <- read_csv("data/social_network.csv")
landing_page <- read_csv("data/landing_page.csv")
goal_13 <- read_csv("data/goal_13.csv")
goal_17 <- read_csv("data/goal_17.csv")
sessions <- read_csv("data/sessions.csv")
