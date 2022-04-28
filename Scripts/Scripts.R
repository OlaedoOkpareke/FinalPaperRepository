
#### Preamble ####
# Purpose: Load and modify the data from the Wellcome Global Monitor 2020
# Author: Olaedo Okpareke
# Data: 26 April 2022
# Contact: olaedo.okpareke@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - Need to have installed the tidyverse, haven and tidyr packages.


#### Workspace setup ####


library(haven)
library(tidyverse)


wgm_full_wave2_public_file_final_1_csv = read_csv(here::here("Inputs/Data/wgm_full_wave2_public_file_final (1)_csv.csv"))
data = wgm_full_wave2_public_file_final_1_csv %>% # removing covid questions
  dplyr::select(-WP21757, -WP21758, -WP21759, -WP21760, -WP21761, -WP21768)

# Filtering all missing observations for the response and the friends variable
data = data %>%
  filter(!is.na(MH8A)) %>%
  filter(!is.na(MH8C))

# renaming variables for easier inrepretability, and changing the observations
# to have only two possible observations
data = data %>%
  mutate(Help = ifelse(MH8A == 1,1,0),friends = ifelse(MH8C == 2 | MH8C ==99,0,1),
         comfort = ifelse(MH5 == 3 | MH5 ==99,0,1),science = ifelse(MH2B == 1 | MH2B ==2,1,0))

# selecting only relevant variables
datamod = data %>%
  dplyr::select(COUNTRYNEW,Help,friends,comfort, science, EMP_2010,Age,Gender,Education,Subjective_Income,wbi) %>%
  filter(!is.na(EMP_2010)) # to make datasets the same size for comparison


# Changing numerical observations to the actual choices

datamod = datamod %>%
  mutate(employment = case_when (
    EMP_2010 == 1 ~ "Fully Employed by employer",
    EMP_2010 == 2 ~ "Self Employed",
    EMP_2010 == 3 ~ "Employed Part Time, Content",
    EMP_2010 == 4 ~ "Unemployed",
    EMP_2010 == 5 ~ "Employed Part Time,not content",
    EMP_2010 == 6 ~ "Out of Workforce",
    TRUE ~ "None"
)) %>%
  mutate(wbi = case_when(
    wbi == 1 ~ "Low Income",
    wbi == 2 ~ "Lower-middle Income",
    wbi == 3 ~ "Upper-middle Income",
    wbi == 4 ~ "High Income",
    TRUE ~ "None"
)) %>%
  mutate(Subjective_Income = case_when (
    Subjective_Income == 1 ~ "Living Comfortably",
    Subjective_Income == 2 ~ "Getting By",
    Subjective_Income == 3 ~ "Difficult to Get By",
    Subjective_Income == 4 ~ "Very Difficult to get By",
    Subjective_Income == 5 ~ "Not Sure",
    Subjective_Income == 6 ~ "No Answer",
    TRUE ~ "None"
)) %>%
  mutate(Education = case_when(
    Education == 1 ~ "Elementary or less",
    Education == 2 ~ "Secondary",
    Education == 3 ~ "Tertiary",
    Education == 4 ~ "No Answer",
    TRUE ~ "None"
  ))

# changing numerical observations to actual choices
datamod = datamod %>%
  mutate(help = ifelse(Help ==1, "Sought Therapy","Did not seek therapy")) %>%
  mutate(friends = ifelse(friends==1, "Sought Friends","Did Not seek Friends"),
         science = ifelse(science==1, "Belief","No Belief"),
         Gender = ifelse(Gender==1,"Male","Female"))

# changing all character variables to factor

datamod[sapply(datamod, is.character)] <- lapply(datamod[sapply(datamod, is.character)],
                                                 as.factor)

# Changed some country observations to match up with country names for map data
datamod = datamod %>%
  mutate(COUNTRYNEW = str_replace_all(COUNTRYNEW,"Congo Brazzaville","Republic of Congo" ))

datamod = datamod%>%
  mutate(COUNTRYNEW = str_replace_all(COUNTRYNEW,"Bosnia Herzegovina","Bosnia and Herzegovina"))

# writing the data

write_csv(datamod, "Inputs/Data/datamod.csv")



