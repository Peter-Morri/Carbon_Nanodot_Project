# plot nanodot fluorescence vs. green autofluorescence 
plot(x = dflist_log[[8]][,"V405.450.50.A"], y = dflist_log[[8]][,"V405.540.30.A"], xlab = "log 405-450/50 nm", ylab = "log 405-540/30 nm")
# dot-positive cell subpopulation lies in high V405.450.50.A cluster

# Density Estimation via Model-Based Clustering on 2 dimensions ----
# Produces a density estimate for each data point using a Gaussian finite mixture model from Mclust
mod_dots<- list(length(fs_log))
for (i in 1:length(fs_log)){
  mod_dots[[i]] <- densityMclust(dflist_log[[i]][,c("V405.450.50.A","V405.540.30.A")])
}

# 3D perspective density plot
plot(mod_dots[[1]], what = "density", type = "persp", data = dflist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
# 2D scatter plot
plot(mod_dots[[1]], what = "density", data = dflist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])

# Dimension reduction for model-based clustering and classification from a finite mixture of Gaussian densities ----
moddr_dots <- list(length(fs_log))
for (i in 1:length(fs_log)){
  moddr_dots[[i]] <- MclustDR(mod_dots[[i]], lambda = 1) # lambda (tuning parameter) set to 1 (range [0,1])
}

# 2D scatter plot of coloured clusters - choose which cluster(s) to isolate
plot(moddr_dots[[1]], what = "scatterplot") # dark green
plot(moddr_dots[[2]], what = "scatterplot") # dark blue
plot(moddr_dots[[3]], what = "scatterplot") # blue
plot(moddr_dots[[4]], what = "scatterplot") # dark blue and marroon
plot(moddr_dots[[5]], what = "scatterplot") # dark green
plot(moddr_dots[[6]], what = "scatterplot") # orange and dark blue
plot(moddr_dots[[7]], what = "scatterplot") # green
plot(moddr_dots[[8]], what = "scatterplot") # marroon
# plot(moddr_dots[[9]], what = "scatterplot") #
# plot(moddr_dots[[10]], what = "scatterplot") #
# plot(moddr_dots[[11]], what = "scatterplot") #
# plot(moddr_dots[[12]], what = "scatterplot") #
# plot(moddr_dots[[13]], what = "scatterplot") #
# plot(moddr_dots[[14]], what = "scatterplot") #
# plot(moddr_dots[[15]], what = "scatterplot") #
# plot(moddr_dots[[16]], what = "scatterplot") #

# Store the values with associated cluster number (1-9) as clusters
cluster_id_dots <- list(length(mod_dots))
for (i in 1:length(mod_dots)){
  cluster_id_dots[[i]] <- c(moddr_dots[[i]]$class) 
}
# 1 = blue, 2 = red, 3 = light green, 4 = purple, 5 = orange, 
# 6 = light blue, 7 = marroon, 8 = dark green, 9 = dark blue
# Column bind cluster_id to the dflist to isolate cluster(s)
dots_cluster <- list(length(mod_dots))
for (i in 1:length(mod_dots)){
  dots_cluster[[i]] <- cbind(cluster_id_dots[[i]], dflist_log[[i]])
}

# 2D scatter plot the events of the cluster representing the subpopulation ----
# save events corresponding to desired cluster in plot_dots
plot_dots <- list(length(mod_dots))
# 0 hour mock
plot_dots[[1]] <- dots_cluster[[1]][dots_cluster[[1]][,1]==8,]
plot(plot_dots[[1]][,"V405.450.50.A"], plot_dots[[1]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 0 hour treated
plot_dots[[2]] <- dots_cluster[[2]][dots_cluster[[2]][,1]==9,]
plot(plot_dots[[2]][,"V405.450.50.A"], plot_dots[[2]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 24 hour mock
plot_dots[[3]] <- dots_cluster[[3]][dots_cluster[[3]][,1]==1,]
plot(plot_dots[[3]][,"V405.450.50.A"], plot_dots[[3]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 24 hour treated
plot_dots[[4]] <- dots_cluster[[4]][dots_cluster[[4]][,1]==9,]
plot(plot_dots[[4]][,"V405.450.50.A"], plot_dots[[4]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 48 hour mock 
plot_dots[[5]] <- dots_cluster[[5]][dots_cluster[[5]][,1]==8,]
plot(plot_dots[[5]][,"V405.450.50.A"], plot_dots[[5]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 48 hour treated
plot_dots[[6]] <- dots_cluster[[6]][dots_cluster[[6]][,1]==9 | dots_cluster[[6]][,1]==5,]
plot(plot_dots[[6]][,"V405.450.50.A"], plot_dots[[6]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 72 hour mock 
plot_dots[[7]] <- dots_cluster[[7]][dots_cluster[[7]][,1]==3,]
plot(plot_dots[[7]][,"V405.450.50.A"], plot_dots[[7]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 72 hour treated
plot_dots[[8]] <- dots_cluster[[8]][dots_cluster[[8]][,1]==7,]
plot(plot_dots[[8]][,"V405.450.50.A"], plot_dots[[8]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")

# # Leaves
# # 0 hour mock
# plot_dots[[9]] <- dots_cluster[[9]][dots_cluster[[9]][,1]==8,]
# plot(plot_dots[[9]][,"V405.450.50.A"], plot_dots[[9]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 0 hour treated
# plot_dots[[10]] <- dots_cluster[[10]][dots_cluster[[10]][,1]==9,]
# plot(plot_dots[[10]][,"V405.450.50.A"], plot_dots[[10]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 24 hour mock
# plot_dots[[11]] <- dots_cluster[[11]][dots_cluster[[11]][,1]==1,]
# plot(plot_dots[[11]][,"V405.450.50.A"], plot_dots[[11]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 24 hour treated
# plot_dots[[12]] <- dots_cluster[[12]][dots_cluster[[12]][,1]==9,]
# plot(plot_dots[[12]][,"V405.450.50.A"], plot_dots[[12]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 48 hour mock 
# plot_dots[[13]] <- dots_cluster[[13]][dots_cluster[[13]][,1]==8,]
# plot(plot_dots[[13]][,"V405.450.50.A"], plot_dots[[13]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 48 hour treated
# plot_dots[[14]] <- dots_cluster[[14]][dots_cluster[[14]][,1]==9 | dots_cluster[[14]][,1]==5,]
# plot(plot_dots[[14]][,"V405.450.50.A"], plot_dots[[14]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 72 hour mock 
# plot_dots[[15]] <- dots_cluster[[15]][dots_cluster[[15]][,1]==3,]
# plot(plot_dots[[15]][,"V405.450.50.A"], plot_dots[[15]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 72 hour treated
# plot_dots[[16]] <- dots_cluster[[16]][dots_cluster[[16]][,1]==7,]
# plot(plot_dots[[16]][,"V405.450.50.A"], plot_dots[[16]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")

# Confirm this is the subpopulation by highlighting in original plot ----
plot(mod_dots[[1]], what = "density", data = dflist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
points(plot_dots[[1]][,"V405.450.50.A"], plot_dots[[1]][,"V405.540.30.A"], col = "red")

# Clustering analysis on the roots in the high V405.450.50.A channel ----
# Clustering analysis on the initial cluster (needed because the dot-pos subpopulation is so small)

# Density Estimation via Model-Based Clustering on 2 dimensions
mod_dots2 <- list(length(fs_log))
for (i in 1:length(fs_log)){
  mod_dots2[[i]] <- densityMclust(plot_dots[[i]][,c("V405.450.50.A","V405.540.30.A")])
}

# 3D perspective density plot
plot(mod_dots2[[1]], what = "density", type = "persp", data = plot_dots[,c("V405.450.50.A","V405.540.30.A")])
# 2D scatter plot
plot(mod_dots2[[1]], what = "density", data = plot_dots[,c("V405.450.50.A","V405.540.30.A")])

# Dimension reduction for model-based clustering and classification from a finite mixture of Gaussian densities ----
moddr_dots2 <- list(length(fs_log))
for (i in 1:length(fs_log)){
  moddr_dots2[[i]] <- MclustDR(mod_dots2[[i]], lambda = 1)
}

# 2D scatter plot of coloured clusters 
plot(moddr_dots2[[1]], what = "scatterplot") # blue and green
plot(moddr_dots2[[2]], what = "scatterplot") # not orange
plot(moddr_dots2[[3]], what = "scatterplot") # not red
plot(moddr_dots2[[4]], what = "scatterplot") # not marroon
plot(moddr_dots2[[5]], what = "scatterplot") # not light blue or marroon
plot(moddr_dots2[[6]], what = "scatterplot") # not dark blue and dark green
plot(moddr_dots2[[7]], what = "scatterplot") # all
plot(moddr_dots2[[8]], what = "scatterplot") # not blue
# plot(moddr_dots2[[9]], what = "scatterplot") # 
# plot(moddr_dots2[[10]], what = "scatterplot") # 
# plot(moddr_dots2[[11]], what = "scatterplot") #
# plot(moddr_dots2[[12]], what = "scatterplot") # 
# plot(moddr_dots2[[13]], what = "scatterplot") # 
# plot(moddr_dots2[[14]], what = "scatterplot") # 
# plot(moddr_dots2[[15]], what = "scatterplot") #
# plot(moddr_dots2[[16]], what = "scatterplot") #

# Store the values with associated cluster number (1-9) as clusters
cluster_id_dots2 <- list(length(mod_dots2))
for (i in 1:length(mod_dots2)){
  cluster_id_dots2[[i]] <- c(moddr_dots2[[i]]$class) 
}
# 1 = blue, 2 = red, 3 = light green, 4 = purple, 5 = orange, 
# 6 = light blue, 7 = marroon, 8 = dark green, 9 = blue
# Column bind cluster_id_dots2 to the dflist to isolate cluster(s)
dots_cluster2 <- list(length(mod_dots))
for (i in 1:length(mod_dots)){
  dots_cluster2[[i]] <- cbind(cluster_id_dots2[[i]], plot_dots[[i]][,2:17])
}

# 2D scatter plot the events of the cluster representing the subpopulation
# save events corresponding to desired cluster in plot_roots
plot_dots2 <- list(length(mod_dots2))
# 0 hour mock
plot_dots2[[1]] <- dots_cluster2[[1]][dots_cluster2[[1]][,1]==1 | dots_cluster2[[1]][,1]==3,]
plot(plot_dots2[[1]][,"V405.450.50.A"], plot_dots2[[1]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 0 hour treated
plot_dots2[[2]] <- dots_cluster2[[2]][dots_cluster2[[2]][,1]!=5,]
plot(plot_dots2[[2]][,"V405.450.50.A"], plot_dots2[[2]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 24 hour mock
plot_dots2[[3]] <- dots_cluster2[[3]][dots_cluster2[[3]][,1]!=2,]
plot(plot_dots2[[3]][,"V405.450.50.A"], plot_dots2[[3]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 24 hour treated
plot_dots2[[4]] <- dots_cluster2[[4]][dots_cluster2[[4]][,1]!=7,]
plot(plot_dots2[[4]][,"V405.450.50.A"], plot_dots2[[4]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 48 hour mock 
plot_dots2[[5]] <- dots_cluster2[[5]][dots_cluster2[[5]][,1]!=6 & dots_cluster2[[5]][,1]!=7,]
plot(plot_dots2[[5]][,"V405.450.50.A"], plot_dots2[[5]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 48 hour treated
plot_dots2[[6]] <- dots_cluster2[[6]][dots_cluster2[[6]][,1]!=9 & dots_cluster2[[6]][,1]!=8,]
plot(plot_dots2[[6]][,"V405.450.50.A"], plot_dots2[[6]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 72 hour mock 
plot_dots2[[7]] <- dots_cluster2[[7]]
plot(plot_dots[[7]][,"V405.450.50.A"], plot_dots2[[7]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# 72 hour treated
plot_dots2[[8]] <- dots_cluster2[[8]][dots_cluster2[[8]][,1]!=1,]
plot(plot_dots2[[8]][,"V405.450.50.A"], plot_dots2[[8]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")

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

# Confirm this is the subpopulation by highlighting in original plot
plot(mod_dots[[1]], what = "density", data = dflist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
points(plot_dots2[[1]][,"V405.450.50.A"], plot_dots2[[1]][,"V405.540.30.A"], col = "red")
