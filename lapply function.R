lapply(data, function(i){
  head(i)
}) %>% do.call(what = 'cbind')