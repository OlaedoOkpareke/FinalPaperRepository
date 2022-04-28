

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
  Help = sample(c("Did Not seek Therapy","Sought therapy"), size = number, replace = TRUE, prob = c(0.7,0.3)),
  friends = sample(c("Did Not seek Friends","Sought Friends"), size = number, replace = TRUE, prob = c(0.2,0.8)),
  comfort = sample(c(0,1), size = number, replace = TRUE, prob = c(0.8,0.2)),
  science = sample(c("No Belief","Belief"), size = number, replace = TRUE, prob = c(0.5,0.5)),
  EMP_2010 = sample(c(1:6), size = number, replace = TRUE),
  employment = sample(c("Fully Employed by employer", "Self Employed","Employed Part Time, Content",
                        "Unemployed","Employed Part Time,not content","Out of Workforce"),
                      size = number, replace = TRUE),
  Age = sample(c(15:100), size = number, replace = TRUE),
  Gender = sample(c("Male","Female"), size = number, replace = TRUE, prob = c(0.5,0.5)),
  Education = sample(c("Secondary","Tertiary","Elementary or less","No Answer"), size = number, replace = TRUE),
  Income = sample(c("Living Comfortably", "Getting By", "Difficult to Get By", "Very Difficult to get By",
                    "Not Sure","No Answer"), size = number, replace = TRUE),
  wbi = rep(c("Low Income","Lower-middle Income","Upper-middle Income","High Income"), each= number/4, replace = TRUE)

)

# This simulation attempts to create an artificial dataset similar to the main
# dataset used for the report. We use random sampling with observations that we think are
# similar to the ones for each variable in the report. We decided to use
# probability sampling as we don't know the true distribution of these variables.

# weakness: this simulation doesn't account for correlation within the covariates, e.g people
# in the US have higher wealth than other nations

