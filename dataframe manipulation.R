dtClass <- dtTitanic[, list(n=sum(Freq)), by=c('Survived',
                                               'Class')]
dtClass[, percentage := n / sum(n), by='Class']
dtClass[, textPercentage := paste(round(percentage * 100), '%',
                                  sep='')]
