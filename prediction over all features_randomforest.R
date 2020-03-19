# glm

# idk why lapply doesnt work here so I use for loop
# regression_res = list()
# lapply(colnames(data), function(i){
#   fml = paste0(i,"~.") %>% as.formula()
#   model = glm(fml, family = gaussian, data = data)
#   regression_res[[i]] = as.list(summary(model))
# })

regression_res = list()

for (i in colnames(data)) {
  fml = paste0(i,"~.") %>% as.formula()
  model = glm(fml, family = gaussian, data = data)
  regression_res[[i]] = model
}

lapply(regression_res,summary)

# randomforest

library(randomForest)
lapply(colnames(data), function(i){
  # fml = paste0(i,"~.-",i) %>% as.formula()
  fml = paste0(i,"~.") %>% as.formula()
  data.rf = randomForest(fml, data, importance = TRUE)
  varImpPlot(data.rf,
             main = i)
})