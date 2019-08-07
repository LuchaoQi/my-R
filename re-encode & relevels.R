#######################################################################################################
# https://www.theanalysisfactor.com/r-tutorial-recoding-values/

ifelse(gender == "MALE", 1, ifelse(gender == "FEMALE", 2, 3))

#######################################################################################################




#######################################################################################################
# encode character
# convert factor variables to numeric factors

unclass
y <- as.data.frame(lapply(y, function (x) if (is.factor(x)) unclass(x) %>% as.factor() else x))



#######################################################################################################





# relevel - drop unused levels in traindata
traindata$permth <- factor(traindata$permth) %>% droplevels()