
mclustDots <- function (datalist_log){
  
  # Anonymous function gets data for the current experiment:
  dataFetch <- function (x) return (datalist_log[[x]])

  # Initialise input variables: ----
  this_data <- dataFetch(1)
  events <- dim(this_data)[1] # number of events in the current FCS
  channels <- dim(this_data)[2]
  experiments <- length(datalist_log) # number of FCS's input
  lambD <- 1 # Cluster tuning parameter (range ]0,1])
  
  # # plot nanodot fluorescence vs. green autofluorescence
  # plot(x = datalist_log[[8]][,"V405.450.50.A"], y = datalist_log[[8]][,"V405.540.30.A"], xlab = "log 405-450/50 nm", ylab = "log 405-540/30 nm")
  # # dot-positive cell subpopulation lies in high V405.450.50.A cluster
  
  # Density Estimation:  ----
  # Produces a density estimate for each data point using a Gaussian finite mixture model from Mclust
  densE<- vector("list", experiments)
  for (i in 1:experiments){
    densE[[i]] <- densityMclust(this_data[,c("V405.450.50.A","V405.540.30.A")])
  }

  # ... ----
  # plot(densE[[1]], what = "density", type = "persp", data = datalist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
  # plot(densE[[1]], what = "density", data = datalist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
  
  # Dimension reduction: ----
  dimR <- vector("list",experiments)
  for (i in 1:experiments){
    dimR[[i]] <- MclustDR(as.Mclust(densE[[i]]), lambda = lambD) 
  }
  

  
  # Annotate with cluster number: ----
  clustID <- list(experiments)
  for (i in 1:experiments){
    clustID[[i]] <- c(dimR[[i]]$class) 
  }
  # Column bind cluster_id to the datalist:
  dots_cluster <- list(experiments)
  for (i in 1:experiments){
    dots_cluster[[i]] <- cbind(clustID[[i]], datalist_log[[i]])
  }
  
  # Point density estimation via Mclust: ---
  mod_dots2 <- list(events)
  for (i in 1:events){
    mod_dots2[[i]] <- densityMclust(plot_dots[[i]][,c("V405.450.50.A","V405.540.30.A")])
  }
  
  
  # Validation plots: ----
  # 3D perspective density plot
  # plot(mod_dots2[[1]], what = "density", type = "persp", data = plot_dots[,c("V405.450.50.A","V405.540.30.A")])
  # 2D scatter plot
  # plot(mod_dots2[[1]], what = "density", data = plot_dots[,c("V405.450.50.A","V405.540.30.A")])
  
  
  # Dimension reduction with MclustDR: ----
  moddr_dots2 <- list(events)
  for (i in 1:events){
    moddr_dots2[[i]] <- MclustDR(mod_dots2[[i]], lambda = lambD)
  }
  
  
  # Store the cluster IDs ----
  cluster_id_dots2 <- list(length(mod_dots2))
  for (i in 1:length(mod_dots2)){
    cluster_id_dots2[[i]] <- c(moddr_dots2[[i]]$class) 
  }
  # Column bind cluster_id_dots2 to the datalist to isolate cluster(s)
  dots_cluster2 <- list(experiments)
  for (i in 1:experiments){
    dots_cluster2[[i]] <- cbind(cluster_id_dots2[[i]], plot_dots[[i]][,2:17])
  }
  
  return (c(dots_cluster, dots_cluster2))
  
  # # data re-shape: ----
  # plot_dots2 <- list(length(mod_dots2))
  # # 0 hour mock
  # plot_dots2[[1]] <- dots_cluster2[[1]][dots_cluster2[[1]][,1]==1 | dots_cluster2[[1]][,1]==3,]
  # plot(plot_dots2[[1]][,"V405.450.50.A"], plot_dots2[[1]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 0 hour treated
  # plot_dots2[[2]] <- dots_cluster2[[2]][dots_cluster2[[2]][,1]!=5,]
  # plot(plot_dots2[[2]][,"V405.450.50.A"], plot_dots2[[2]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 24 hour mock
  # plot_dots2[[3]] <- dots_cluster2[[3]][dots_cluster2[[3]][,1]!=2,]
  # plot(plot_dots2[[3]][,"V405.450.50.A"], plot_dots2[[3]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 24 hour treated
  # plot_dots2[[4]] <- dots_cluster2[[4]][dots_cluster2[[4]][,1]!=7,]
  # plot(plot_dots2[[4]][,"V405.450.50.A"], plot_dots2[[4]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 48 hour mock 
  # plot_dots2[[5]] <- dots_cluster2[[5]][dots_cluster2[[5]][,1]!=6 & dots_cluster2[[5]][,1]!=7,]
  # plot(plot_dots2[[5]][,"V405.450.50.A"], plot_dots2[[5]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 48 hour treated
  # plot_dots2[[6]] <- dots_cluster2[[6]][dots_cluster2[[6]][,1]!=9 & dots_cluster2[[6]][,1]!=8,]
  # plot(plot_dots2[[6]][,"V405.450.50.A"], plot_dots2[[6]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 72 hour mock 
  # plot_dots2[[7]] <- dots_cluster2[[7]]
  # plot(plot_dots[[7]][,"V405.450.50.A"], plot_dots2[[7]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 72 hour treated
  # plot_dots2[[8]] <- dots_cluster2[[8]][dots_cluster2[[8]][,1]!=1,]
  # plot(plot_dots2[[8]][,"V405.450.50.A"], plot_dots2[[8]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # 
  # # 0 hour mock
  # plot_dots2[[9]] <- dots_cluster2[[9]][dots_cluster2[[9]][,1]==1 | dots_cluster2[[9]][,1]==3,]
  # plot(plot_dots2[[9]][,"V405.450.50.A"], plot_dots2[[9]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 0 hour treated
  # plot_dots2[[10]] <- dots_cluster2[[10]][dots_cluster2[[10]][,1]!=5,]
  # plot(plot_dots2[[10]][,"V405.450.50.A"], plot_dots2[[10]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 24 hour mock
  # plot_dots2[[11]] <- dots_cluster2[[11]][dots_cluster2[[11]][,1]!=2,]
  # plot(plot_dots2[[11]][,"V405.450.50.A"], plot_dots2[[11]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 24 hour treated
  # plot_dots2[[12]] <- dots_cluster2[[12]][dots_cluster2[[12]][,1]!=7,]
  # plot(plot_dots2[[12]][,"V405.450.50.A"], plot_dots2[[12]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 48 hour mock 
  # plot_dots2[[13]] <- dots_cluster2[[13]][dots_cluster2[[13]][,1]!=6 & dots_cluster2[[13]][,1]!=7,]
  # plot(plot_dots2[[13]][,"V405.450.50.A"], plot_dots2[[13]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 48 hour treated
  # plot_dots2[[14]] <- dots_cluster2[[14]][dots_cluster2[[14]][,1]!=9 & dots_cluster2[[14]][,1]!=8,]
  # plot(plot_dots2[[14]][,"V405.450.50.A"], plot_dots2[[14]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 72 hour mock 
  # plot_dots2[[15]] <- dots_cluster2[[15]]
  # plot(plot_dots[[15]][,"V405.450.50.A"], plot_dots2[[15]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
  # # 72 hour treated
  # plot_dots2[[16]] <- dots_cluster2[[16]][dots_cluster2[[16]][,1]!=1,]
  # plot(plot_dots2[[16]][,"V405.450.50.A"], plot_dots2[[16]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
}
