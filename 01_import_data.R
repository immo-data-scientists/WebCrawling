# install.packages("Rcrawler")
library(Rcrawler)

# preparing CSS config table
configCSS <- read.table(textConnection("
CSSPattern;PatternNames
.price;price
.dotlist span~ span+ span;place
.dotlist span:nth-child(1);kmDriven
.dotlist span:nth-child(2);fuel
.title a;modelInfo"), sep = ';', header = T, stringsAsFactors = F)


# crawling a website
Rcrawler(Website = "https://www.cardekho.com/" , 
         no_cores = 4, 
         MaxDepth = 2, 
         crawlUrlfilter = 'used-cars',
         ExtractCSSPat = configCSS$CSSPattern,
         PatternsNames = configCSS$ColNames)

# converting the crawled list of informations to a dataframe
df <- data.frame(do.call("rbind", DATA))


# saving
save(configCSS, DATA, INDEX, df, 
     file = 'E:/VAM/Jan 2019 presentation/dataCrawlingInR/carDekho.RData')

# load(file = 'E:/VAM/Jan 2019 presentation/dataCrawlingInR/carDekho.RData', verbose = T)



































