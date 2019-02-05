library(tidyverse)
pres <- read_tsv("~/Downloads/1976-2016-president.tab.tsv")

pres <- pres %>%
  select(-c(state,state_fips,state_cen,state_ic,office,candidate,version,notes))

pres <- pres %>%
  dplyr::filter(writein==FALSE) %>%
  dplyr::select(-c(writein))

pres <- pres %>%
  mutate(party = case_when(party %in% c("democrat","democratic-farmer-labor")~"dem",
                           party=="republican"~"rep",
                           TRUE ~ "other"))

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
