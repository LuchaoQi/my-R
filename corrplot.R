# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
library(corrplot)
corrplot(cor(data),
         # addCoef.col = T,
         method = 'color',
         type = 'upper',
         order = 'hclust',
         p.mat = cor.mtest(data, conf.level = .95)$p
)


library(ggcorrplot)
vec = list('data22','data26','data31','data36')
lapply(vec, function(i){
  data = get(i) %>% select(-rawid,-Age,-Gender)
  ggcorrplot(cor(data, method = 'spearman'), 
             # hc.order = TRUE,
             type = "lower",
             p.mat = cor_pmat(data),
             title = i)
})