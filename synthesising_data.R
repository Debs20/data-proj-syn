library(synthpop)
library(tidyverse)


referrers <- read_csv("data/referrer.csv")
social_network <- read_csv("data/social_network.csv")
landing_page <- read_csv("data/landing_page.csv")
goals <- read_csv("data/goals.csv")
sessions <- read_csv("data/sessions.csv")
landing_goals <- read_csv("data/landing_goals.csv")


syn_landing_goals <- syn(landing_goals)
syn_referrers <- syn(referrers)
syn_social_network <- syn(social_network)
syn_goals <- syn(goals)
syn_sessions <- syn(sessions)
syn_landing_page <- syn(landing_page)

syn_landing_goals_data <- syn_landing_goals$syn
syn_referrers_data <- syn_referrers$syn
syn_social_network_data <- syn_social_network$syn
syn_goals_data <- syn_goals$syn
syn_sessions_data <- syn_sessions$syn
syn_landing_page_data <- syn_landing_page$syn

write_csv(syn_goals_data, "data/syn_goals.csv")
write_csv(syn_referrers_data, "data/syn_referrers.csv")
write_csv(syn_social_network_data, "data/syn_social_network.csv")
write_csv(syn_landing_goals_data, "data/syn_landing_goals.csv")
write_csv(syn_sessions_data, "data/syn_sessions.csv")
write_csv(syn_landing_page_data, "data/syn_landing_page.csv")
