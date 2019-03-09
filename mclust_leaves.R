# Plot chlorophyll a fluorescence vs. green autofluorescence 
plot(x = dflist_log_dots[[9]][,"V405.670.30.A"], y = dflist_log_dots[[9]][,"V405.540.30.A"], xlab = "log 405-670/30 nm", ylab = "log 405-540/30 nm")
# live leaf cell population lies in high V405.670.30.A cluster

# Density Estimation via Model-Based Clustering on 2 dimensions ----
# Produces a density estimate for each data point using a Gaussian finite mixture model from Mclust
mod_leaves <- list(length(fs_log))
for (i in 1:length(fs_log)){
  mod_leaves[[i]] <- densityMclust(dflist_log[[i]][,c("V405.670.30.A","V405.540.30.A")])
}

# 3D perspective density plot
plot(mod_leaves[[9]], what = "density", type = "persp", data = dflist_log[[9]][,c("V405.670.30.A","V405.540.30.A")])
# 2D scatter plot
plot(mod_leaves[[9]], what = "density", data = dflist_log[[9]][,c("V405.670.30.A","V405.540.30.A")])

# Dimension reduction for model-based clustering and classification from a finite mixture of Gaussian densities ----
moddr_leaves <- list(length(fs_log))
for (i in 1:length(fs_log)){
  moddr_leaves[[i]] <- MclustDR(mod_leaves[[i]], lambda = 0.5) # lambda (tuning parameter) set to 0.5 (range [0,1])
}

# 2D scatter plot of coloured clusters 
plot(moddr_leaves[[1]], what = "scatterplot") # marroon, light green and dark green
plot(moddr_leaves[[2]], what = "scatterplot") # dark green
plot(moddr_leaves[[3]], what = "scatterplot") # dark blue
plot(moddr_leaves[[4]], what = "scatterplot") # marroon
plot(moddr_leaves[[5]], what = "scatterplot") # dark green
plot(moddr_leaves[[6]], what = "scatterplot") # blue and marroon 
plot(moddr_leaves[[7]], what = "scatterplot") # green
plot(moddr_leaves[[8]], what = "scatterplot") # light blue

# Store the values with associated cluster number (1-9) as clusters
cluster_id_leaves <- list(length(mod_leaves))
for (i in 1:length(mod_leaves)){
  cluster_id_leaves[[i]] <- c(moddr_leaves[[i]]$class) 
}
# 1 = blue, 2 = red, 3 = light green, 4 = purple, 5 = orange, 
# 6 = light blue, 7 = marroon, 8 = dark green, 9 = dark blue
# Column bind cluster_id to the dflist
leaves_cluster <- list(length(mod_leaves))
for (i in 1:length(mod_leaves)){
  leaves_cluster[[i]] <- cbind(cluster_id_leaves[[i]], dflist_log[[i]])
}

# 2D scatter plot the events of the cluster representing the subpopulation
# save events corresponding to desired cluster in plot_leaves
plot_leaves <- list(length(mod_leaves))
# 0 hour mock
plot_leaves[[1]] <- leaves_cluster[[1]][leaves_cluster[[1]][,1]==7 | leaves_cluster[[1]][,1]==3 | leaves_cluster[[1]][,1]==8,]
plot(plot_leaves[[1]][,"V405.670.30.A"], plot_leaves[[1]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 0 hour treated
plot_leaves[[2]] <- leaves_cluster[[2]][leaves_cluster[[2]][,1]==8,]
plot(plot_leaves[[2]][,"V405.670.30.A"], plot_leaves[[2]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 24 hour mock
plot_leaves[[3]] <- leaves_cluster[[3]][leaves_cluster[[3]][,1]==9,]
plot(plot_leaves[[3]][,"V405.670.30.A"], plot_leaves[[3]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 24 hour treated
plot_leaves[[4]] <- leaves_cluster[[4]][leaves_cluster[[4]][,1]==7,]
plot(plot_leaves[[4]][,"V405.670.30.A"], plot_leaves[[4]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 48 hour mock 
plot_leaves[[5]] <- leaves_cluster[[5]][leaves_cluster[[5]][,1]==8,]
plot(plot_leaves[[5]][,"V405.670.30.A"], plot_leaves[[5]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 48 hour treated
plot_leaves[[6]] <- leaves_cluster[[6]][leaves_cluster[[6]][,1]==1,]
plot(plot_leaves[[6]][,"V405.670.30.A"], plot_leaves[[6]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 72 hour mock 
plot_leaves[[7]] <- leaves_cluster[[7]][leaves_cluster[[7]][,1]==3 | leaves_cluster[[7]][,1]==7,]
plot(plot_leaves[[7]][,"V405.670.30.A"], plot_leaves[[7]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")
# 72 hour treated
plot_leaves[[8]] <- leaves_cluster[[8]][leaves_cluster[[8]][,1]==6,]
plot(plot_leaves[[8]][,"V405.670.30.A"], plot_leaves[[8]][,"V405.540.30.A"], xlab = "V405.670.30.A", ylab = "V405.540.30.A")

# Confirm this is the subpopulation by highlighting in original plot
plot(mod_leaves[[1]], what = "density", data = dflist_log[[1]][,c("V405.670.30.A","V405.540.30.A")])
points(plot_leaves[[1]][,"V405.670.30.A"], plot_leaves[[1]][,"V405.540.30.A"], col = "red")
