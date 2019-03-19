dataFrames <- function(dataPath){
  
## Import and pre-process data: ##
# Load FlowFrames from path into FlowSet:
fs <- read.flowSet(path = dataPath, pattern = ".fcs", alter.names = TRUE, phenoData = list(name = "SAMPLE ID", Filename = "$FIL"))

##  Create Raw DataFrames
# create empty list to hold each DataFrame 
dflist <- list(length(fs))

print("Importing files...")
for (i in 1:(length(fs))) {
  dflist[[i]] <- data.frame(as.data.frame(na.omit(exprs(fs[[i]])))) #"na.omit()" handles NaN's
  for (j in 1:length(fs@colnames)) {dflist[[i]] <- dflist[[i]][dflist[[i]][,j] !="-Inf",]} # remove any "-Inf" values
}

print("Creating Log-transforms...")
# log-transform all channels (except time i.e. column 1)
fs_log <- transform(fs, transformList(fs@colnames[2:16], log)) 

# create list to hold each DataFrame, and name list items:
dflist_log <- list(length(fs_log))

print("Populating DataFrames...")
for (i in 1:(length(fs_log))) {
  dflist_log[[i]] <- data.frame(as.data.frame(na.omit(exprs(fs_log[[i]])))) # delete inf/NaN values inline
 for (j in 1:length(fs_log@colnames)) {
   dflist_log[[i]] <- dflist_log[[i]][dflist_log[[i]][,j] > 0,] # only keeping expression values greater than 0
 }
} 

return(dflist_log)
}

