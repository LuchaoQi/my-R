
# histogram over each feature

ggplot(gather(data), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')

############################################


temp = pca_model$rotation %>% data.frame()

gs = lapply(1:8, function(i) {
  ggplot(temp) + 
    aes(x = 1:nrow(temp)/60,y = unlist(temp[,i])) + 
    geom_line() +
    labs(x = "Time of Day", y = paste0("Loadings on PC",i)) +
    theme(axis.title.y = element_text(size = rel(0.9)))
})
library(gridExtra)
do.call(grid.arrange,c(gs,nrow = 3))

############################################


