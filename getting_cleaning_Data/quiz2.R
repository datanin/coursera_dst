# Question 2
library(sqldf)


# Question 4
hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)

# Question 5
wurl <- 'http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for'
download.file(wurl, destfile='/home/jd/ownCloud/Entwicklung/R/wksst8110.for')
# wkss_df <- read.csv('/home/jd/ownCloud/Entwicklung/R/wksst8110.for')
wkss_df <- read.fwf(file='/home/jd/ownCloud/Entwicklung/R/wksst8110.for', skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
wkss_sum <- sum(wkss_df[,4])