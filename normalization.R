library(ggplot2)


ggplot(gather(data), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')

tmp = lapply(data, function(i){
  scale(i)
}) %>% do.call(what = 'cbind') %>% as.data.frame()
colnames(tmp) = colnames(data)


ggplot(gather(tmp), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')