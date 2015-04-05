
library(stringr)
library(XML)
library(magrittr)

phd <- NULL
students <- NULL


for(id in ids){
    url <- str_c("http://genealogy.math.ndsu.nodak.edu/id.php?id=",id)
    dt <- readHTMLTable(url) %>% data.frame()
    
    phd <- rbind(phd,c(id,nrow(dt)))
    if(nrow(dt)>0){
        names(dt) <- c("Name","School","Year","Descendents")
        for(i in 1:nrow(dt)){
            students <-rbind(students,
                             c(id,as.character(i),as.character(dt$Year[i])))
        }
    }
}

