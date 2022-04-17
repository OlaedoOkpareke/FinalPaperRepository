

# simulation
set.seed(438)
number = 112*1000

datasim =  tibble(
  help = sample(c(0,1), size = number, replace = TRUE, prob = c(0.7,0.3)),
  friend = sample(c(0,1), size = number, replace = TRUE, prob = c(0.2,0.8)),
  science = sample(c(0,1), size = number, replace = TRUE, prob = c(0.5,0.5)),
  EMP_2010 = sample(c(1:6), size = number, replace = TRUE),
  Age = sample(c(10:100), size = number, replace = TRUE),
  Gender = sample(c(1,2), size = number, replace = TRUE, prob = c(0.5,0.5)),
  Education = sample(c(1:3), size = number, replace = TRUE),
  Income = sample(c(1:4), size = number, replace = TRUE),
  wbi = sample(c(1:4), size = number, replace = TRUE, prob = c(0.4,0.2,0.2,0.2)),


)

# This simulation attempts to create an artificial dataset similar to the main
# dataset used for the report. We use random sampling with observations that are
# similar to the ones for each variable in the report. We decided to use
# probability sampling as we don't know the true distribution of these variables.
