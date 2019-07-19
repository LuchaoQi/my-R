
# grouped data frame to list
WEEKdata = split(MINdata[,MINnames],MINdata$SEQN) %>% lapply(FUN = function(i){
  a = rowSums(i)
  data.frame(WeekLengths = length(rownames(i)),Mean = mean(a), Sd = sd(a), Max = max(a), Min = min(a))
}) %>% 
  do.call(what = "rbind")



###############################
dtClass <- dtTitanic[, list(n=sum(Freq)), by=c('Survived',
                                               'Class')]
dtClass[, percentage := n / sum(n), by='Class']
dtClass[, textPercentage := paste(round(percentage * 100), '%',
                                  sep='')]