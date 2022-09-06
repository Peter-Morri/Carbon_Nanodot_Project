This repository contains R scripts to perform model-based clustering analysis on flow cytometry data, for the purpose of isolating a "carbon nanodot-positive" cell subpopulation from leaf and root samples from Arabidopsis thaliana. 

"Dataframes.R" installs necessary software, downloads libraries creates DataFrames from a FlowSet. 

"mclust_roots.R" uses functions from the MClust package to isolate "live root cells" from root samples in the FlowSet. A simple strategy is adopted, defining "live root cells" as those without a greater green autofluorescence. 

"mclust_leaves.R" uses functions from the MClust package to isolate "live leaf cells" from leaf samples in the FlowSet. A simple strategy is adopted, defining "live leaf cells" as those with a greater Chlorophyll a fluorescence. 

"mclust_roots.R" uses functions from the MClust package to isolate "carbon nanodot-positive cells" from root and leaf samples in the FlowSet. A simple strategy is adopted, defining "carbon nanodot-positive cells" as those with a greater blue fluorescence, indicative of containing carbon nanodots. 

"Figure_plotting.R" is the script used to plot figures used in my thesis. These include presenting the isolating strategies for live root, live leaf and carbon nanodot-positive cell population isolation. 

