

# simulation

library("tidyverse")

# for country variable
install.packages("countrycode")
countries <- countrycode::codelist$country.name.en


set.seed(438)
number = 23904

datasim =  tibble(
  COUNTRYNEW = rep(c(countries), each = 83, replace= FALSE),
  help = sample(c(0,1), size = number, replace = TRUE, prob = c(0.7,0.3)),
  friend = sample(c(0,1), size = number, replace = TRUE, prob = c(0.2,0.8)),
  science = sample(c(0,1), size = number, replace = TRUE, prob = c(0.5,0.5)),
  EMP_2010 = sample(c(1:6), size = number, replace = TRUE),
  Age = sample(c(10:100), size = number, replace = TRUE),
  Gender = sample(c(1,2), size = number, replace = TRUE, prob = c(0.5,0.5)),
  Education = sample(c(1:3), size = number, replace = TRUE),
  Income = sample(c(1:4), size = number, replace = TRUE),
  wbi = rep(c(1:4), each= number/4, replace = TRUE)

)

# This simulation attempts to create an artificial dataset similar to the main
# dataset used for the report. We use random sampling with observations that we think are
# similar to the ones for each variable in the report. We decided to use
# probability sampling as we don't know the true distribution of these variables.

# weakness: this simulation doesn't account for correlation within the covariates, e.g people
# in the US have higher wealth than other nations

