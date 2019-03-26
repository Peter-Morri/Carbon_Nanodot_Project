# Cluster plotting: ----

# 2D scatter plot the events of the cluster representing the subpopulation
# # save events corresponding to desired cluster in plot_dots
# plot_dots <- list(length(mod_dots))
# # 0 hour mock
# plot_dots[[1]] <- dots_cluster[[1]][dots_cluster[[1]][,1]==8,]
# plot(plot_dots[[1]][,"V405.450.50.A"], plot_dots[[1]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 0 hour treated
# plot_dots[[2]] <- dots_cluster[[2]][dots_cluster[[2]][,1]==9,]
# plot(plot_dots[[2]][,"V405.450.50.A"], plot_dots[[2]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 24 hour mock
# plot_dots[[3]] <- dots_cluster[[3]][dots_cluster[[3]][,1]==1,]
# plot(plot_dots[[3]][,"V405.450.50.A"], plot_dots[[3]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 24 hour treated
# plot_dots[[4]] <- dots_cluster[[4]][dots_cluster[[4]][,1]==9,]
# plot(plot_dots[[4]][,"V405.450.50.A"], plot_dots[[4]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 48 hour mock 
# plot_dots[[5]] <- dots_cluster[[5]][dots_cluster[[5]][,1]==8,]
# plot(plot_dots[[5]][,"V405.450.50.A"], plot_dots[[5]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 48 hour treated
# plot_dots[[6]] <- dots_cluster[[6]][dots_cluster[[6]][,1]==9 | dots_cluster[[6]][,1]==5,]
# plot(plot_dots[[6]][,"V405.450.50.A"], plot_dots[[6]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 72 hour mock 
# plot_dots[[7]] <- dots_cluster[[7]][dots_cluster[[7]][,1]==3,]
# plot(plot_dots[[7]][,"V405.450.50.A"], plot_dots[[7]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")
# # 72 hour treated
# plot_dots[[8]] <- dots_cluster[[8]][dots_cluster[[8]][,1]==7,]
# plot(plot_dots[[8]][,"V405.450.50.A"], plot_dots[[8]][,"V405.540.30.A"], xlab = "V405.450.50.A", ylab = "V405.540.30.A")

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

# # Confirm this is the subpopulation by highlighting in original plot 
# plot(mod_dots[[1]], what = "density", data = dflist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
# points(plot_dots[[1]][,"V405.450.50.A"], plot_dots[[1]][,"V405.540.30.A"], col = "red")

# Plot coloured clusters: ----
# plot(moddr_dots[[1]], what = "scatterplot") # dark green
# plot(moddr_dots[[2]], what = "scatterplot") # dark blue
# plot(moddr_dots[[3]], what = "scatterplot") # blue
# plot(moddr_dots[[4]], what = "scatterplot") # dark blue and marroon
# plot(moddr_dots[[5]], what = "scatterplot") # dark green
# plot(moddr_dots[[6]], what = "scatterplot") # orange and dark blue
# plot(moddr_dots[[7]], what = "scatterplot") # green
# plot(moddr_dots[[8]], what = "scatterplot") # maroon
# # plot(moddr_dots[[9]], what = "scatterplot") #
# # plot(moddr_dots[[10]], what = "scatterplot") #
# # plot(moddr_dots[[11]], what = "scatterplot") #
# # plot(moddr_dots[[12]], what = "scatterplot") #
# # plot(moddr_dots[[13]], what = "scatterplot") #
# # plot(moddr_dots[[14]], what = "scatterplot") #
# # plot(moddr_dots[[15]], what = "scatterplot") #
# # plot(moddr_dots[[16]], what = "scatterplot") #


# Plot clusters in different colours: ----
# plot(moddr_dots2[[1]], what = "scatterplot") # blue and green
# plot(moddr_dots2[[2]], what = "scatterplot") # not orange
# plot(moddr_dots2[[3]], what = "scatterplot") # not red
# plot(moddr_dots2[[4]], what = "scatterplot") # not maroon
# plot(moddr_dots2[[5]], what = "scatterplot") # not light blue or marroon
# plot(moddr_dots2[[6]], what = "scatterplot") # not dark blue and dark green
# plot(moddr_dots2[[7]], what = "scatterplot") # all
# plot(moddr_dots2[[8]], what = "scatterplot") # not blue
# # plot(moddr_dots2[[9]], what = "scatterplot") # 
# # plot(moddr_dots2[[10]], what = "scatterplot") # 
# # plot(moddr_dots2[[11]], what = "scatterplot") #
# # plot(moddr_dots2[[12]], what = "scatterplot") # 
# # plot(moddr_dots2[[13]], what = "scatterplot") # 
# # plot(moddr_dots2[[14]], what = "scatterplot") # 
# # plot(moddr_dots2[[15]], what = "scatterplot") #
# # plot(moddr_dots2[[16]], what = "scatterplot") #

# # Plot the subpopulation ----
# plot(mod_dots[[1]], what = "density", data = dflist_log[[1]][,c("V405.450.50.A","V405.540.30.A")])
# points(plot_dots2[[1]][,"V405.450.50.A"], plot_dots2[[1]][,"V405.540.30.A"], col = "red")
