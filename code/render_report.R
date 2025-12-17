here::i_am("code/render_report.R")

library(rmarkdown)

render("Final_Dataset.Rmd",
       output_file = "Final_Project.html"
)     
