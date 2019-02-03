# install.packages("Rcrawler")
library(Rcrawler)

# preparing CSS config table
configCSS <- read.table(textConnection("
CSSPattern;PatternNames
h1;title
.priceheader;price
.icon-cd-year+ .iconDetail;year
.kmDrive+ .iconDetail;kmDriven
.fuelType+ .iconDetail;fuel
.sellerType+ .iconDetail;seller
.icon-cd-Transmission+ .iconDetail;transmission
.ownerFirst+ .iconDetail;owner
.milage+ .iconDetail;milage
.engine+ .iconDetail;engine
.seats+ .iconDetail;seatNb
.borderBottom:nth-child(1) .on;info"), sep = ';', header = T, stringsAsFactors = F)


# crawling a website
Rcrawler(Website = "https://www.cardekho.com/used-car-details/" , 
         no_cores = 4, 
         crawlUrlfilter = 'used-car-details',
         ExtractCSSPat = configCSS$CSSPattern,
         PatternsNames = configCSS$PatternNames)


# converting the crawled list of informations to a dataframe
df <- data.frame(do.call("rbind", DATA))


# saving
save(configCSS, DATA, INDEX, df, 
     file = 'D:/R studio/New folder/RWebCrawling/carDekho.RData')
# load(file = 'E:/VAM/Jan 2019 presentation/dataCrawlingInR/carDekho.RData', verbose = T)

load(file = 'E:/MY_Project_Crawling/RWebCrawling/carDekho.RData')





























