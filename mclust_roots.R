# plot green autofluorescence vs. red autofluorescence 
plot(x = dflist_log[[1]][,"B488.530.30.A"], y = dflist_log[[1]][,"B488.710.50.A"], xlab = "log 488-530/30 nm", ylab = "log 488-710/50 nm")
# live root cell population lies in inverted comet shape

# Density Estimation via Model-Based Clustering on 2 dimensions ----
# Produces a density estimate for each data point using a Gaussian finite mixture model from Mclust
mod_roots <- list(length(fs_log))
for (i in 1:length(fs_log)){
  mod_roots[[i]] <- densityMclust(dflist_log[[i]][,c("B488.530.30.A","B488.710.50.A")])
}

# 3D perspective density plot
plot(mod_roots[[1]], what = "density", type = "persp", data = dflist_log[[1]][,c("B488.530.30.A","B488.710.50.A")])
# 2D scatter plot
plot(mod_roots[[1]], what = "density", data = dflist_log[[1]][,c("B488.530.30.A","B488.710.50.A")])

# Dimension reduction for model-based clustering and classification from a finite mixture of Gaussian densities ----
moddr_roots <- list(length(fs_log))
for (i in 1:length(fs_log)){
  moddr_roots[[i]] <- MclustDR(mod_roots[[i]], lambda = 0.5) # lambda (tuning parameter) set to 0.5 (range [0,1])
}

# 2D scatter plot of coloured clusters - choose which cluster(s) to isolate
plot(moddr_roots[[1]], what = "scatterplot") # not blue or dark blue
plot(moddr_roots[[2]], what = "scatterplot") # not dark blue
plot(moddr_roots[[3]], what = "scatterplot") # not light blue
plot(moddr_roots[[4]], what = "scatterplot") # not orange
plot(moddr_roots[[5]], what = "scatterplot") # not marroon
plot(moddr_roots[[6]], what = "scatterplot") # not orange
plot(moddr_roots[[7]], what = "scatterplot") # not blue
plot(moddr_roots[[8]], what = "scatterplot") # not purple

# Store the values with associated cluster number (1-9)
cluster_id_roots <- list(length(mod_roots))
for (i in 1:length(mod_roots)){
  cluster_id_roots[[i]] <- c(moddr_roots[[i]]$class) 
}
# 1 = blue, 2 = red, 3 = light green, 4 = purple, 5 = orange, 
# 6 = light blue, 7 = marroon, 8 = dark green, 9 = dark blue
# Column bind cluster_id to the dflist to isolate cluster(s)
roots_cluster <- list(length(mod_roots))
for (i in 1:length(mod_roots)){
  roots_cluster[[i]] <- cbind(cluster_id_roots[[i]], dflist_log[[i]])
}

# 2D scatter plot the events of the cluster representing the subpopulation ----
# save events corresponding to desired cluster in plot_roots
plot_roots <- list(length(fs_log))
# 0 hour mock
plot_roots[[1]] <- roots_cluster[[1]][roots_cluster[[1]][,1]!=1 & roots_cluster[[1]][,1]!=9,]
plot(plot_roots[[1]][,"B488.530.30.A"], plot_roots[[1]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 0 hour treated
plot_roots[[2]] <- roots_cluster[[2]][roots_cluster[[2]][,1]!=9,]
plot(plot_roots[[2]][,"B488.530.30.A"], plot_roots[[2]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 24 hour mock
plot_roots[[3]] <- roots_cluster[[3]][roots_cluster[[3]][,1]!=6,]
plot(plot_roots[[3]][,"B488.530.30.A"], plot_roots[[3]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 24 hour treated
plot_roots[[4]] <- roots_cluster[[4]][roots_cluster[[4]][,1]!=5,]
plot(plot_roots[[4]][,"B488.530.30.A"], plot_roots[[4]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 48 hour mock
plot_roots[[5]] <- roots_cluster[[5]][roots_cluster[[5]][,1]!=7,]
plot(plot_roots[[5]][,"B488.530.30.A"], plot_roots[[5]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 48 hour treated
plot_roots[[6]] <- roots_cluster[[6]][roots_cluster[[6]][,1]!=5,]
plot(plot_roots[[6]][,"B488.530.30.A"], plot_roots[[6]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 72 hour mock
plot_roots[[7]] <- roots_cluster[[7]][roots_cluster[[7]][,1]!=1,]
plot(plot_roots[[7]][,"B488.530.30.A"], plot_roots[[7]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")
# 72 hour treated
plot_roots[[8]] <- roots_cluster[[8]][roots_cluster[[8]][,1]!=4,]
plot(plot_roots[[8]][,"B488.530.30.A"], plot_roots[[8]][,"B488.710.50.A"], xlab = "B488.530.30.A", ylab = "B488.710.50.A")

# Confirm this is the subpopulation by highlighting in original plot ----
plot(mod_roots[[6]], what = "density", data = dflist_log[[6]][,c("B488.530.30.A","B488.710.50.A")], xlab = "log Green Autofluorescence", ylab = "log Autofluorescence")
points(plot_roots[[6]][,"B488.530.30.A"], plot_roots[[6]][,"B488.710.50.A"], col = "red")

