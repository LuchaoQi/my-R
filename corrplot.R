# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
library(corrplot)
corrplot(cor(data),
         # addCoef.col = T,
         method = 'color',
         type = 'upper',
         order = 'hclust',
         p.mat = cor.mtest(data, conf.level = .95)$p
)