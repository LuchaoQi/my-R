library(ggplot2)


ggplot(gather(data), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')

data = apply(data, MARGIN = 2, FUN = function(i){ scale(i) }) %>% as.data.frame()
# or
data = apply(data, MARGIN = 2, FUN = function(i){ log(i)+1 }) %>% as.data.frame()

ggplot(gather(data), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')