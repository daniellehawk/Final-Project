library(gtsummary)

here::i_am("code/01_reactivity_table.R")

#Determining number of positive and negative tests
COVID <- readRDS(
  here::here("raw_data/COVID.rds")
)
table(COVID$PCR.confirmed)

#Creating a gtsummary table to illustrate the distribution of the reactivity of these tests in comparison to the gold standard PCR

table(COVID$PCR.confirmed)


reactivity_table <- tbl_summary(
  COVID,
  by = PCR.confirmed,
  include = c(Sample.., PCR.confirmed, Abbott.Reactivity, Ortho.Reactivity, In.House.CDC.ELISA.Reactivity),
  label = list(Sample.. ~ "Sample number",
               Abbott.Reactivity ~ "Reactivity of the Abbott Tests",
               Ortho.Reactivity ~ "Reactivity of the Ortho Tests",
               In.House.CDC.ELISA.Reactivity ~ "Reactivity of the CDC ELISA Test"),
  missing = "no")

reactivity_table <- reactivity_table|>
  modify_caption("Table 1: The distribution of the reactivity of the Abbott and Ortho CDC ELISA Tests in comparison to the standard ELISA")

reactivity_table

saveRDS(reactivity_table,
        file = ("output/reactivity_table.Rds")
)
