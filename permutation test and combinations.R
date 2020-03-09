data22 = data %>% filter(Age == '22-25')
data26 = data %>% filter(Age == '26-30')
data31 = data %>% filter(Age == '31-35')
data36 = data %>% filter(Age == '36+')

library(gtools)
# choose 2 from 4
vec = combinations(4,2,c('data22','data26','data31','data36'))
age_res = list()

# shuffle and get diff
test = function(x,y){
  l1 = length(x)
  l2 = length(y)
  data = sample(c(x,y),replace = T)
  mean(data[1:l1]) - mean(data[l1:(l1+l2)])
}

# 在vec不同的组合中, 对每一个组合用permutation test来检测2:7的feature均值
# get function
for(j in 1:dim(vec)[1]){
  data1 = get(vec[j,1])
  data2 = get(vec[j,2])
  # change the index 2:7 to the col index you want to test
  # 比如这里面第二列到第七列是我想要检验的
  perm_res = lapply(2:7, function(i){
    tr_diff = mean(data1[i] %>% unlist ) - mean(data2[i] %>% unlist)
    re_diff = replicate(2000, test(data1[i] %>% unlist, data2[i] %>% unlist))
    p_value = mean(abs(re_diff)>=abs(tr_diff))
  }) %>% do.call(what='cbind') %>% as.data.frame()
  colnames(perm_res) = colnames(data)[2:7]
  age_res[[paste0(vec[j,1],vec[j,2])]] = perm_res
}