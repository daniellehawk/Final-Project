library(here)
here::i_am("code/00_load_data.R")

library(haven)

#Reading in dataset

COVID <- read.csv(na.omit("SARS.csv"))

#Save data in an output folder

saveRDS(COVID, 
file = "raw_data/COVID.Rds")
