# Jimmy
cov_plot <- function(x,y){
  plot(x,y,xlab="NCR2",ylab="Gene")
  model<-lm(y~x)
  summary(model)
  intercept <- format(model$coefficients[1], digits = 4)
  slop <- format(model$coefficients[2], digits = 4)
  abline(intercept,slop, lty=1, lwd=2, col="red")
  label <- paste0("y=",as.numeric(slop),"x+",as.numeric(intercept))
  text(0.95*max(x), 0.95*max(y), label, col = "red")
  r= format(cor(x,y),digits = 4)
  p= format(cor.test(x,y)$p.value,digits = 4)
  title(main = paste0('p value=',p), 
        sub  = paste0('correlation=',r))
}

# cov_plot(NCR2_exp$NCR2,geneticDatacellcycle$ANAPC1)