# Install Software:
# source("http://bioconductor.org/biocLite.R")
# biocLite("flowCore")


### Initialise R: ###


## Load Libraries:
library(flowCore)
library(tidyverse) # for ggplot
library(mclust)
library(IDPmisc) # for "inf.omit()"
## Set the working directory:
# setwd("~/Documents/Data/Scripts/Intelligate")
## Include Intelligate core functions:
source("DataFrames.R")

#source("mclust_roots.R")
#source("mclust_leaves.R")
#source("Figure_plotting.R")

### Start workflow: ###

## Query path to FCS data:
liPrompt <- readline( prompt = "Enter name of folder containing data for analysis: Data/")
fcPath = paste("Data/",liPrompt, sep = "")
print("OK! Working: ")
logExprs <- dataFrames(fcPath)
print("Complete.")

liPrompt <- userQuery("Begin mclust? ", default = "n")

if(liPrompt == "y"){
  print("OK, clustering:")
  source("mclust_dots.R")
}

