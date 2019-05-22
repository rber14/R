#(a)  First, import the data to RStudio.  You can use the ’Import dataset’ dropdown menu andtype in the URL above.Be sure to change the code in the dialog box so thatread.csv()is used instead of readcsv().  
#     This will ensure character data import as factortype data.  Copy and paste the import command from the console or dialog box to yourscript so I can see what you did.
library(readr)
kidneydata <- read.csv("Downloads/kidneydata.csv")
View(kidneydata)

#b Write a command to check that the ’class’ variable is of factor type.
#this checks if the class is factor type
is.factor(kidneydata)
class(kidneydata)
levels(kidneydata)
#c
set.seed(113)
#d sep data int training ser with 200 and test with 197
rand.num = sample(1:397)
kidney.train = kidneydata[rand.num<200,]
kidney.test = kidneydata[rand.num>197,]

#e run subngle prune tree
library(tree)
kidneytree <- tree(class~., data = kidney.train) 
plot(kidneytree)
text(kidneytree)
summary(kidneytree)

#f get test data misclassification rate for people with kidney disease and people without
kidney.pred = predict(kidneytree, newdata = kidney.test, type = 'class')
table(kidney.pred, kidney.test$class)



