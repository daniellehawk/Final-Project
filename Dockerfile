FROM rocker/tidyverse:4.5.1 AS base

RUN mkdir /home/rstudio/project 

WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt=FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .
COPY over code/data needed to build your report

ENV WHICH_CONFIG="default"

COPY Makefile Makefile
COPY config.yml config.yml
COPY Final_Dataset.Rmd Final_Dataset.Rmd

RUN mkdir /home/rstudio/project/code
RUN mkdir /home/rstudio/project/output
RUN mkdir /home/rstudio/project/raw_data
RUN mkdir /home/rstudio/project/final_report

CMD Rscript code/00_load_data.R && Rscript code/01_reactivity_table.R && Rscript code/02_comparison_plot.R && Rscript code/render_report.R && mv Final_Project.html report

COPY raw_data/COVID.Rds /home/rstudio/project/raw_data