library(glasso)
library(qgraph)
gs = lapply(seq(0,0.1,0.02), function(i){
  qgraph(glasso(cov(data),rho = i),
         labels = colnames(cov(data)),
         # filetype = 'pdf',
         # filename = paste0('rho=',i),
         # layout = matrix(1:12,nrow = 4),
         # DoNotPlot = TRUE,
         details = TRUE,
         directed = TRUE)
})