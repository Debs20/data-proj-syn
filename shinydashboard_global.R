library(dplyr)
library(ggplot2)
library(shiny)
library(shinythemes)
library(readr)
library(shinydashboard)

# whatever functions we want....

referrers <- read_csv("data/referrer.csv")
social_network <- read_csv("data/social_network.csv")
landing_page <- read_csv("data/landing_page.csv")
