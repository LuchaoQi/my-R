library(randomForest)
lapply(colnames(data), function(i){
  # fml = paste0(i,"~.-",i) %>% as.formula()
  fml = paste0(i,"~.") %>% as.formula()
  data.rf = randomForest(fml, data, importance = TRUE)
  varImpPlot(data.rf,
             main = i)
})