###############################Working Good##################################################
library(Rcrawler)

Rcrawler(Website = "https://www.olx.in/maruti-suzuki/", 
         no_cores = 4, 
         MaxDepth = 3, 
         crawlUrlfilter = "maruti-suzuki",
         KeywordsFilter = "maruti",
         ExtractCSSPat = c(".brbottdashc8:nth-child(1) td:nth-child(1) a", 
                           "#offerdescription td+ td a", 
                           "td~ td+ td .block", 
                           "tr+ .brbottdashc8 td+ td .block", 
                           "tr+ .brbottdashc8 a",
                           "#offer_active .gray",
                           "#offer_active .nowrap .rel"),
         PatternsNames = c("Brand", 
                           "Model", 
                           "Year", 
                           "km", 
                           "Fuel",
                           "Place",
                           "IdNo"))

df <- data.frame(do.call("rbind", DATA))
View(df)
myList <- lapply(df, unlist, use.names = TRUE)

myList <- unlist(myList, use.names=FALSE)



Rcrawler(Website = "https://www.olx.in/cars/", 
         no_cores = 4, 
         no_conn = 4,
         MaxDepth = 3, 
         KeywordsFilter = "cars",
         KeywordsAccuracy = 100,
         ExtractCSSPat = c(".brbottdashc8:nth-child(1) td:nth-child(1) a", 
                           "#offerdescription td+ td a", 
                           "td~ td+ td .block", 
                           "tr+ .brbottdashc8 td+ td .block", 
                           "tr+ .brbottdashc8 a",
                           "#offer_active .gray",
                           "#offer_active .nowrap .rel"),
         PatternsNames = c("Brand", 
                           "Model", 
                           "Year", 
                           "km", 
                           "Fuel",
                           "Place",
                           "IdNo"))

df <- data.frame(do.call("rbind", DATA))
View(df)



#######################################################################################################################

Rcrawler(Website = "https://www.cardekho.com/" , 
         no_cores = 4, 
         no_conn = 4,
         MaxDepth = 1, 
         crawlUrlfilter = 'used-cars',
         ExtractCSSPat = c(".price", 
                           ".dotlist span~ span+ span", 
                           ".dotlist span:nth-child(1)", 
                           ".dotlist span:nth-child(2)",
                           ".title a"),
         PatternsNames = c("Price", 
                           "Place", 
                           "Km", 
                           "fuel",
                           "Info"))



df <- data.frame(do.call("rbind", DATA))
View(df)


#######################################################################################################################

library(Rcrawler)

Rcrawler(Website = "https://www.cardekho.com/used-car-details/" , 
         no_cores = 4, 
         no_conn = 4,
         MaxDepth = 3, 
         crawlUrlfilter = 'used-car-details',
         ExtractCSSPat = c(".priceheader", 
                           ".icon-cd-year+ .iconDetail", 
                           ".kmDrive+ .iconDetail", 
                           ".fuelType+ .iconDetail",
                           ".sellerType+ .iconDetail",
                           ".icon-cd-Transmission+ .iconDetail",
                           ".ownerFirst+ .iconDetail",
                           ".milage+ .iconDetail",
                           ".engine+ .iconDetail",
                           ".seats+ .iconDetail",
                           ".borderBottom:nth-child(1) .on"),
         PatternsNames = c("Price", 
                           "Year", 
                           "Km", 
                           "fuel",
                           "Seller",
                           "Transmission",
                           "Owner",
                           "Milage",
                           "engine",
                           "seatNb",
                           "info"))



df <- data.frame(do.call("rbind", DATA))
View(df)

#######################################################################################################################

library(stringr)
x <- str_replace_all(df[,2], "[\r\n\t\\s\\/]" , "")
