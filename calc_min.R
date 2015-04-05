library(dplyr)

df <- data.frame(advisor.id=students[,1], year=as.numeric(students[,3])) %>%
      filter(!is.na(year)) 

min.student <- group_by(df,advisor.id) %>%
               summarise(year.first.student = min(year))