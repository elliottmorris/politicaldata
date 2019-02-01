rm(list=ls())
library(jsonlite)
library(magrittr)
library(dplyr)
library(stringr)
library(forcats)
library(scales)
library(ggplot2)

# you can get a list of the datasets and their info from here
fromJSON(url('https://www.comparativeagendas.net/api/datasets/metadata'))

# here is how you would read in, for ex, the yearly most important problem index with PAP codes
mip <- read.csv(url('https://comparativeagendas.s3.amazonaws.com/datasetfiles/US-Public-Gallups_Most_Important_Problem-19.1.csv'))

# get label for topics from saved dataset
mip$label <- cap_major_topics$title[match(mip$majortopic,cap_major_topics$major_topic)]

# rescale percent because it sometimes goes > 100 when taken cumulatively
mip <- mip %>%
  group_by(year) %>%
  mutate(percent = percent/sum(percent))

# NA codes are actually
mip$label <- ifelse(is.na(mip$label),"Valenced/No Policy Contentt",mip$label)

# plot
ggplot(mip,
       aes(x=year,y=percent,fill=as.factor(label))) +
  geom_col(position=position_stack()) +
  theme_minimal() +
  guides(fill=guide_legend(ncol=2,byrow=TRUE,title = 'Topic')) +
  theme(legend.position = 'top')

# plot facets -- it's better
mip$label <- stringr::str_wrap(mip$label,width=20,indent=0)

ggplot(mip,
       aes(x=year,y=percent,col=label,fill=label)) +
  geom_area(alpha=0.8) +
  theme_minimal() +
  facet_wrap(~forcats::fct_reorder(label,-percent,mean,na.rm=T)) +
  theme(legend.position = 'none') +
  scale_y_continuous(labels=scales::percent_format(1),limits=c(0,1))
