# Final-Project-Organisation
This repository contains the code needed to produce a summary table showing the number of positive vs. negative tests and a boxplot displaying the reactivity of the tests
Within the code folder you woill find r scripts that load the data, build the reactivity table and comparison plot, then render the report
Within the raw_data folder, you will find the inital .rds dataset. The dataset utilised contains information on the reactivity of different covid tests in comparison the CDC ELISA Test and is from the Centers for Disease Control and Prevention
The makefile contaisn the rules for putting the report together. Once everything is ran, you should have a pdf of the Final_Report generated

# Rendering from Docker Container
Before you render teh report, run make install in the terminal. This will restore the package library.

In order for the report to render type make in the terminal.

To clean the directory of output, you can type make clean in the terminal.

# Rendering from the local machine

# Image Building
To build the Docker image from your machine, type make project_image in the terminal. 
