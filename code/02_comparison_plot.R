here::i_am("code/03_comparison_plot.R")

reactivity_plot <- boxplot(
  list(
    Abbott = COVID$Abbott.S.C.Values,
    Ortho = COVID$Ortho.Index.Values,
    CDC_ELISA = COVID$In.House.CDC.ELISA.S.T.Values),
  main = "Boxplot Showing Reactivity of COVID Diagnostic Tests",
  xlab = "Types of Diagnostic Tests",
  ylab = "Reactivity",
  col = c("green", "violet", "brown")
)
