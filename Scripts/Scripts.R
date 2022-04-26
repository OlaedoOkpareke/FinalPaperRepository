
library(haven)
library(tidyverse)


# filter mh6,mh7c and mh8c = 1
wgm_full_wave2_public_file_final_1_csv = read_csv(here::here("Inputs/Data/wgm_full_wave2_public_file_final (1)_csv.csv"))
data = wgm_full_wave2_public_file_final_1_csv %>%
  select(-WP21757, -WP21758, -WP21759, -WP21760, -WP21761, -WP21768)

data = data %>%
  filter(!is.na(MH8A)) %>%
  filter(!is.na(MH8C))

data = data %>%
  mutate(Help = ifelse(MH8A == 1,1,0),friends = ifelse(MH8C == 2 | MH8C ==99,0,1),
         comfort = ifelse(MH5 == 3 | MH5 ==99,0,1),science = ifelse(MH2B == 1 | MH2B ==2,1,0))

datamod = data %>%
  select(COUNTRYNEW,Help,friends,comfort, science, EMP_2010,Age,Gender,Education,Subjective_Income,wbi) %>%
  filter(!is.na(EMP_2010)) # to make datasets the same size for comparison

datamod = datamod %>%
  mutate(help = ifelse(Help ==1, "Sought Therapy","Did not seek therapy")) %>%
  mutate(friends = ifelse(friends==1, "Sought Friends","Did Not seek Friends"),
         science = ifelse(science==1, "Belief","No Belief"),
         Gender = ifelse(Gender==1,"Male","Female"))

# Changed to match up with country names for map data
datamod = datamod %>%
  mutate(COUNTRYNEW = str_replace_all(COUNTRYNEW,"Congo Brazzaville","Republic of Congo" ))

datamod = datamod%>%
  mutate(COUNTRYNEW = str_replace_all(COUNTRYNEW,"Bosnia Herzegovina","Bosnia and Herzegovina"))

write_csv(datamod, "Inputs/Data/datamod.csv")



