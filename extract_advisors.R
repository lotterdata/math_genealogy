library(stringr)
library(magrittr)

test <- readLines("mgp_1979.txt")
ids <- test[(sapply(test,function(x) str_detect(x,"id\\.php\\?id")))] %>%
       sapply(function(x) str_sub(x,
                               start=str_locate(x,"=")[1]+1,
                               end=str_locate(x,">")[1]-1)) %>%
       as.character() %>%
       unique()
rm(test)