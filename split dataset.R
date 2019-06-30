trainIdx = sample(c(TRUE, FALSE), length(y), replace = TRUE, prob = c(.7, .3))
ytrain = y[trainIdx]
xtrain = x[trainIdx, ] %>% scale()
mns = attr(xtrain, "scaled:center")
sds = attr(xtrain, "scaled:scale")
xtest = x[!trainIdx, ] %>% scale(center = mns, scale = sds)
ytest = y[!trainIdx]
