# Question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="/home/jd/OneDrive/Entwicklung/R/us.csv")
dateDownloadedUs <- date()

tbl_us <- read.table("/home/jd/OneDrive/Entwicklung/R/us.csv", sep = ",", header = TRUE)
subsetUs <- subsetUs[!is.na(subsetUs)]
bigVal <- subsetUs[subsetUs > 23]
length(bigVal)

# Question 2
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL2, destfile = "/home/jd/OneDrive/Entwicklung/R/gas.xlsx")
dateDownloadedGas <- date()
read.xlsx("/home/jd/OneDrive/Entwicklung/R/gas.xlsx", sheetIndex = 1, header = TRUE)


# Question 4
library(XML)
fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
dateDownloadedRes <- date()
doc <- xmlTreeParse(fileURL3, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

# Question 5
fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
dateDownloadedPid <- date()
