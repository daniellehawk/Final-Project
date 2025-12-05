output/Final_Report.pdf: code/render_report.R Final_Dataset.Rmd \
code/00_load_data.R code/01_reactivity_table.R code/02_comparison_plot.R
	Rscript code/render_report.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

