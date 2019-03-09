library(tidyverse)
pres <- read_csv("ext/raw_data/1976-2016-president.csv")

pres <- pres %>%
  select(-c(state,state_fips,state_cen,state_ic,office,version,notes))

pres <- pres %>%
  dplyr::filter(writein==FALSE) %>%
  dplyr::select(-c(writein))

# get the name of the Dem/Rep for each year -- we use DC as the determinant
dems <- pres %>%
  filter(party=='democrat',state_po=='DC') %>%
  group_by(year) %>%
  summarise(candidate = first(candidate)) %>% pull(candidate)

reps <- pres %>%
  filter(party=='republican',state_po=='DC') %>%
  group_by(year) %>%
  summarise(candidate = first(candidate)) %>% pull(candidate)


# assign new parties
pres <- pres %>%
  mutate(party = case_when(candidate %in% dems~"dem",
                           candidate %in% reps~"rep",
                           TRUE ~ "other")) %>%
  select(-candidate)

# get votes by party
pres <- pres %>%
  group_by(year,state_po,party) %>%
  summarise(candidatevotes=sum(candidatevotes),
            totalvotes=unique(totalvotes)) %>%
  as.data.frame()

pres <- pres %>%
  group_by(year,state_po) %>%
  spread(party,candidatevotes)

pres <- pres %>%
  mutate(dem=dem/totalvotes,
         rep=rep/totalvotes,
         other=other/totalvotes) %>%
  select(year,state=state_po,total_votes=totalvotes,dem,rep,other)

pres_results <- as.data.frame(pres)

save(pres_results,file='data/pres_results.RData')
