MIN_name = grep('MIN',colnames(accel_good_D),value = T)
xname = paste0("s(", MIN_name,")")
fmla = as.formula(paste("log(BMI) ~ ", paste(xname, collapse= "+")))
gamdata = MINdata %>% left_join(Covariate_D[,c('SEQN','BMI')], by = 'SEQN')
hist(gamdata$BMI)
gam_model = gam(fmla,method = 'REML',data = gamdata)