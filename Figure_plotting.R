# Isolating Root cells ----

# Showing Live Root cells on Root Sample in GFP vs. Autofluorescence 
plot(x = dflist_log[[2]][,"B488.530.30.A"], y = dflist_log[[2]][,"B488.710.50.A"], col = rgb(10,10,10,80,maxColorValue = 100), xlab = "B488.530.30.A GFP", ylab = "B488.710.50.A Autofluorescence")
points(plot_roots[[2]][,"B488.530.30.A"], plot_roots[[2]][,"B488.710.50.A"], col = rgb(100,0,0,80,maxColorValue = 100), pch = 1)
legend(x = "bottomright", legend = c("Root Sample", "Live Root Cells"), col = c(rgb(10,10,10,80,maxColorValue = 100),rgb(100,0,0,80,maxColorValue = 100)), pch = c(1,1), title("Subpopulation Cell Shape"))

# Compare the shape of Root cells with Root sample
plot(x = dflist_log[[2]][,"FSC.A"], y = dflist_log[[2]][,"SSC.A"], col = rgb(10,10,10,80,maxColorValue = 100), xlab = "log FSC", ylab = "log SSC", pch = 1)
points(plot_roots[[2]][,"FSC.A"], plot_roots[[2]][,"SSC.A"], col = rgb(100,100,0,50, maxColorValue = 100), pch = 1)
legend(x = "bottomleft", legend = c("Root Sample", "Live Root Cells"), col = c(rgb(10,10,10,80,maxColorValue = 100), rgb(139,69,19,100, maxColorValue = 255)), pch = c(1,1))

(length(plot_roots[[6]][,"B488.530.30.A"])/length(dflist_log[[6]][,"B488.530.30.A"]))*100


# Isolating Leaf cells ----

# Showing Live Leaf cells on Leaf Sample in Chlorophyll a vs. Autofluorescence
plot(x = dflist_log[[1]][,"V405.670.30.A"], y = dflist_log[[1]][,"V405.540.30.A"], col = rgb(10,10,10,80,maxColorValue = 100), pch = 1, xlab = "V405.670.30.A Chlorophyll a", ylab = "V405.540.30.A Autofluorescence")
points(plot_leaves[[1]][,"V405.670.30.A"], plot_leaves[[1]][,"V405.540.30.A"], col = rgb(100,0,0,80,maxColorValue = 100), pch = 1)
legend(x = "topleft", legend = c("Root Sample A", "Live Leaf cells"), col = c(rgb(10,10,10,80,maxColorValue = 100),rgb(100,0,0,80,maxColorValue = 100)), pch = c(1,1), title("Subpopulation Cell Shape"))

# Compare the shape of Live Leaf Cells with Leaf sample
plot(x = dflist_log[[1]][,"FSC.A"], y = dflist_log[[1]][,"SSC.A"], col = rgb(10,10,10,80,maxColorValue = 100), xlab = "FSC.A Cell Shape", ylab = "SSC.A Granularity", pch = 1)
points(plot_leaves[[1]][,"FSC.A"], plot_leaves[[1]][,"SSC.A"], col = rgb(100,100,0,50, maxColorValue = 100), pch = 1)
legend(x = "bottomleft", legend = c("Root Sample", "Live Leaf Cells"), col = c(rgb(10,10,10,80,maxColorValue = 100), rgb(139,69,19,100, maxColorValue = 255)), pch = c(1,1))

(length(plot_leaves[[8]][,"V405.670.30.A"])/length(dflist_log[[8]][,"V405.670.30.A"]))*100


# Compare Root Cells with Leaf Cells ----

# Showing Live Leaf Cells on the Live Root Cells in GFP vs. Autofluorescence 
plot(x = dflist_log[[3]][,"B488.530.30.A"], y = dflist_log[[3]][,"B488.710.50.A"], col = rgb(10,10,10,80,maxColorValue = 100), xlab = "B488.530.30.A GFP", ylab = "B488.710.50.A Autofluorescence")
points(plot_roots[[3]][,"B488.530.30.A"], plot_roots[[3]][,"B488.710.50.A"], col = rgb(139,69,19,200, maxColorValue = 255), pch = 1)
points(plot_leaves[[3]][,"B488.530.30.A"], plot_leaves[[3]][,"B488.710.50.A"], col = rgb(0,100,0,80,maxColorValue = 100), pch = 1)
legend(x = "bottomright", legend = c("Root Sample F", "Live Root Cells", "Live Leaf Cells"), col = c(rgb(10,10,10,80,maxColorValue = 100), rgb(139,69,19,200, maxColorValue = 255), rgb(0,100,0,80,maxColorValue = 100)), pch = c(1,1,1))

# calculate percentage of leaf cells in sample
(length(plot_leaves[[3]][,"B488.530.30.A"])/length(dflist_log[[3]][,"B488.530.30.A"]))*100
# calculate percentage of root cells in sample 
(length(plot_roots[[3]][,"B488.530.30.A"])/length(dflist_log[[3]][,"B488.530.30.A"]))*100


# Histogram for the shift observed upon treatment of carbon nanodots -----

plot(density(dflist_log[[6]]$V405.450.50.A), main = NA, ylim = c(0,0.5), col = "red", lty = 1, xlab = "log Nanodot")
lines(density(dflist_log[[5]]$V405.450.50.A), col = "black", lty = 1)
legend(x = "topright", legend = c("Treated Root Cells", "Mock Treated Root Cells"), lty = c(1,1), col = c("red","black"))


## Explore negative fluorescence emission events ----

# subset the events with negative 400-500 nm emission
margin_405_450_50 <- list(length(fs))
for (i in 1:length(fs)) {
  margin_405_450_50[[i]] <- dflist[[1]][dflist[[i]][,"V405.450.50.A"]<0,]
}
plot(x = log(dflist[[1]][,"FSC.A"]), y = log(dflist[[1]][,"SSC.A"]), xlab = "FSC.A", ylab = "SSC.A", pch = 1)
points(x = log(margin_405_450_50[[1]][,"FSC.A"]), y = log(margin_405_450_50[[1]][,"SSC.A"]), col = "red", pch = 1)
legend(x = "bottomright", legend = c("Root Sample", "V405.450.50.A Margin Events"), col = c(rgb(10,10,10,80,maxColorValue = 100),rgb(100,0,0,80,maxColorValue = 100)), pch = c(1,1))

# subset the events with negative 510-570 nm emission
margin_405_540_30 <- list(length(fs))
for (i in 1:length(fs)) {
  margin_405_540_30[[i]] <- dflist[[i]][dflist[[i]][,"V405.540.30.A"]<0,]
}
plot(x = log(dflist[[6]][,"FSC.A"]), y = log(dflist[[6]][,"SSC.A"]), xlab = "FSC.A", ylab = "SSC.A", pch = 1)
points(x = log(margin_405_540_30[[6]][,"FSC.A"]), y = log(margin_405_540_30[[6]][,"SSC.A"]), col = "red", pch = 1)
legend(x = "bottomright", legend = c("Root Sample", "V405.540.30.A Margin Events"), col = c(rgb(10,10,10,80,maxColorValue = 100),rgb(100,0,0,80,maxColorValue = 100)), pch = c(1,1))


## QQ plots to test for normal distribution -----

# Test for normal distribution
qqnorm(dflist_log[[1]]$V405.450.50.A)
qqline(dflist_log[[1]]$V405.450.50.A) # light tailed

qqnorm(dflist_log[[1]]$V405.540.30.A)
qqline(dflist_log[[1]]$V405.540.30.A) # light tailed

qqplot(dflist_log[[1]]$V405.450.50.A,dflist_log[[1]]$V405.540.30.A, xlab = "log 405-450/50 nm", ylab = "log 405-540/30 nm") # normal distribution 


# Isolating Dots ----

# Showing Dots in each sample Dots vs. Autofluorescence
plot(x = dflist_log[[6]][,"V405.450.50.A"], y = dflist_log[[6]][,"V405.540.30.A"], col = rgb(10,10,10,80,maxColorValue = 100), pch = 1, xlab = "log Nanodot", ylab = "log Autofluorescence")
points(plot_dots2[[6]][,"V405.450.50.A"], plot_dots2[[6]][,"V405.540.30.A"], col = rgb(100,0,0,80,maxColorValue = 100), pch = 1)
legend(x = "bottomright", legend = c("Treated Root Sample", "Root Dots"), col = c(rgb(10,10,10,80,maxColorValue = 100),rgb(100,0,0,80,maxColorValue = 100)), pch = c(1,1))

(length(plot_dots2[[5]][,"V405.450.50.A"])/length(dflist_log[[5]][,"V405.450.50.A"]))*100


# Plotting Dots ----

# Compare the shape of Dots with Root cells
plot(plot_roots[[3]][,"FSC.A"], plot_roots[[3]][,"SSC.A"], col = rgb(139,69,19,200, maxColorValue = 255), pch = 1, xlab = "FSC.A Cell Size", ylab = "SSC.A Granularity")
points(plot_dots2[[3]][,"FSC.A"], plot_dots2[[3]][,"SSC.A"], col = rgb(100,0,0, maxColorValue = 100), pch = 19)
legend(x = "bottomleft", legend = c("Live Root Cells", "Root Dots"), col = c(rgb(139,69,19,200, maxColorValue = 255), rgb(100,0,0, maxColorValue = 100)), pch = c(1,19))
