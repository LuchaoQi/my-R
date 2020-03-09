# convert list of vector to dataframe
# > age_res
# $data22data26
# CerebralCortex_L CerebralNucli_L WhiteMatter_L CerebralCortex_R CerebralNucli_R
# 1            5e-04          0.0565             0                0           0.006
# WhiteMatter_R
# 1             0
# 
# $data22data31
# CerebralCortex_L CerebralNucli_L WhiteMatter_L CerebralCortex_R CerebralNucli_R
# 1                0           0.465             0                0           0.072
# WhiteMatter_R
# 1             0
do.call(rbind.data.frame, age_res)





####################################################################################
group_by()
####################################################################################

# lapply apply function over columns
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