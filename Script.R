library(tidyverse)
library(readxl)
library(tidyverse)

#Editing Alaska

a <- readxl::read_excel(path = "Alaska.xlsx", sheet = 1)

head(a)
str(a)

yr <- as.character(a$year)
mo <- as.character(a$month)
mo <- str_c("0",mo, sep = "")

yr_mo <- str_c(yr,mo,sep = "-")
head(yr_mo)

a$date <- yr_mo

write.csv(x = a, file = "Alaska_fixed.csv", row.names = F)
