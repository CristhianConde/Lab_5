library(tidyverse)
library(readxl)


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

#Editing Peru

p <- readxl::read_excel(path = "Peru.xlsx", sheet = 1)

head(p)
str(p)

yr_p <- as.character(p$year)
mt_p <- as.character(p$month)
str(yr_p)
str(mt_p)

mt_p <- str_c("0",mt_p, sep = "")
str(mt_p)

yr_mt_p <- str_c(yr_p,mt_p,sep = "-")
head(yr_mt_p)

p$date <- yr_mt_p
str(p)

library(stringr)

deg <- str_sub(string = p$Lat, start = 1, end = 2)
head(deg)
head(p)
min <- str_sub(string = p$Lat, start = 4, end = 12)
head(min)

cardirect <- str_sub(string = p$Lat, start = 13, end = 13)
head(cardirect)

deg <- as.numeric(deg)
min <- as.numeric(min)


deg.c <- deg + min/60
head(deg.c)


deg.lon <- str_sub(string = p$Long, start = 1, end = 2)
head(deg.lon)

min.lon <- str_sub(string = p$Long, start = 4, end = 19)
head(min.lon)

cardirect.lon <- str_sub(string = p$Long, start = 20, end = 20)
head(cardirect.lon)

deg.lon <- as.numeric(deg.lon)
min.lon <- as.numeric(min.lon)

head(min.lon)

deg.long.c <- (deg.lon + min.lon/60)*-1
head(deg.long.c)

p$deg.lon <- deg.long.c
p$deg.lat <- deg.c

head(p)

write.csv(x = p, file = "Peru_fixed.csv", row.names = F)
