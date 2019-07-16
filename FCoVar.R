FCoVar <- function (logExprs){
  
  # Anonymous function: pull data for n-th experiment:
  dataFetch <- function (n) return (logExprs[[n]])
  
  # Get data from first FCS:
  this_data <- dataFetch(1)
  
  
  # Create covariance matrix:
  FCov = cov(this_data)
  FCor = cov2cor(Fcov)
  heatmap(FCor)
  
}