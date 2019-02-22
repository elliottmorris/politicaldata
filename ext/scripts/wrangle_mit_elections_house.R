library(tidyverse)

house_results <- read_csv("~/Downloads/1976-2016-house.csv")

# create "seat" variable "[state]-[seat no.]"
house_results <- house_results %>%
  mutate(seat = paste0(state_po,"-",
                       case_when(district == 0 ~ "AL",
                                 district <10 ~ paste0("0",district),
                                 TRUE ~ as.character(district))))

# get rid of write in candidates + indepedendents and only keep non-special general elections. keep 2004 and on
house_results <- house_results %>%
  filter(!writein, stage=="gen",!special,candidate!="")

# relabel DFL as D
house_results <- house_results %>%
  mutate(party = case_when(party == "democrat" | party == "democratic-farmer-labor" ~ "dem",
                           party == "republican" ~ "rep",
                           TRUE ~ "other"))

# select only the stuff we want
house_results <- house_results %>%
  dplyr::select(year,seat,state_poparty,candidatevotes,totalvotes)


# combine D/R
house_results  <- house_results %>%
  group_by(year,seat,state_po,party) %>%
  summarise(candidatevotes = sum(candidatevotes,na.rm=TRUE),
            totalvotes = unique(totalvotes)) %>%
  as.data.frame()


# "spread" the columns so D/R are their own variables
house_results <- house_results %>%
  spread(key=party,value=candidatevotes)

house_results <- house_results %>%
  mutate(dem=dem/totalvotes,
         rep=rep/totalvotes,
         other=other/totalvotes) %>%
  select(year,state_abb=state_po,district=seat,total_votes=totalvotes,dem,other,rep)

house_results <- as.data.frame(house_results)

# add 2018 results ----------
# read in
house_2018 <- read.csv("ext/raw_data/house_results_2018.csv")

# create "seat" variable "[state]-[seat no.]"
house_2018 <- house_2018 %>%
  mutate(district = paste0(state_abb,"-",
                       case_when(district == 0 ~ "AL",
                                 district <10 ~ paste0("0",district),
                                 TRUE ~ as.character(district))))


# change 0 to NA
house_2018[,4:7][house_2018[,4:7] == 0] <- NA

# combine
house_results <- house_results %>%
  bind_rows(house_2018)


# export for R ------------------------------------------------------------
save(house_results,file='data/house_results.RData')




