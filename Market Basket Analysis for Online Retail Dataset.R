
#   Association Rules
#Import necessary packages
install.packages("readxl")
library(readxl)
install.packages("arules") 
library(arules)
install.packages("plyr")
library(plyr) 
install.packages("arulesViz")
library(arulesViz) 
library(data.table)
install.packages("ggplot2")
library(ggplot2)

#read dataset 
mydataset <- read_excel("C:/Users/rahil/Desktop/UL papers/Association rules/Online Retail.xlsx")
summary(mydataset)
str(mydataset2)
mydataset<- data.frame(mydataset) 
head(mydataset)

## Preprocessing and cleaning of data
mydataset2 <- subset(mydataset, UnitPrice > 0)

excluded_codes <- c("D", "DOT", "S", "POST", "M", "C2", "AMAZONFEE", "B", "BANK CHARGES", "CRUK", "m", "PADS")
mydataset2 <- mydataset2[!mydataset2$StockCode %in% excluded_codes, ]

giftcardrows <- mydataset2$InvoiceNo[grepl("gift", mydataset2$StockCode)]
mydataset2 <- mydataset2[!mydataset2$InvoiceNo %in% giftcardrows,]

mydataset2$Description <- gsub(",", "", mydataset2$Description, fixed = TRUE)
mydataset2 <- subset(mydataset2, select = -c(5, 6, 7, 8))

#Transforming into basket format
basket <- aggregate(Description ~ InvoiceNo, mydataset2, function(x) paste(x, collapse = ","))
write.csv(basket, "Products.csv", quote = FALSE, row.names = FALSE)
suppressWarnings({
  transactions <- read.transactions(file = "Products.csv", format = "basket", sep = ",", cols = 1)
  transactions@itemInfo$labels <- gsub("\"", "", transactions@itemInfo$labels)
})
summary(transactions)

#graph of most frequent items 
itemFrequencyPlot(transactions, topN = 10, type = "absolute", col = "cadetblue", main = "Most 8 Frequently Purchased Items")

install.packages("RColorBrewer")
library(RColorBrewer)
dev.off()
itemFrequencyPlot(transactions,topN=10,type="absolute",col=brewer.pal(n=5, name="Set3"), main="Most 8 Frequently Purchased Items")

#Applying Apriori
rules <- apriori(transactions,parameter = list(supp=0.001, conf=0.8))
summary(rules)
inspect(rules[1:5])

min(rules@quality$lift)
length(rules)

conf <- sort (rules, by="confidence", decreasing=TRUE)
inspect(head(conf))
summary(conf)

#What were the other items purchased by customers who bought the green Regency tea plate?

params <- list(support = 0.001, confidence = 0.8)
rules_tea <- apriori(data = transactions, parameter = params, appearance = list(lhs = "REGENCY TEA PLATE GREEN"))
inspect(rules_tea)

#visualisation
plot(rules, method = "two-key plot")
top10 <- head(rules, n = 10, by = "confidence")
plot(top10, method="paracoord")

#ECLAT algorithm
eclat<- eclat(transactions, parameter=list(support=0.01, minlen = 2))
summary(eclat)
inspect(sort(eclat, by='support', descending=TRUE)[1:6])

plot(sort(eclat, by='support', decreasing=TRUE)[1:6], method='paracoord')





