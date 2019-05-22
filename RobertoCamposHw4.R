#1 (a) Import the data into R. Convert all categorical variables to “factor” type variables.
library(readxl)
default_of_credit_card_clients <- read_excel("Downloads/default of credit card clients.xls")
creditdata = default_of_credit_card_clients
names(creditdata)[names(creditdata)=="default payment next month"] <- "default"
View(creditdata)
class(creditdata)
head(creditdata)
creditdata$SEX = factor(creditdata$SEX)
creditdata$EDUCATION =factor(creditdata$EDUCATION)
creditdata$MARRIAGE =factor(creditdata$MARRIAGE)
creditdata$default=factor(creditdata$default)

#b
set.seed(500)
#c split into training %50 and test %50
?sample
rand.num = sample(1:30000)
credit.train = creditdata[rand.num<15001,]
credit.test = creditdata[rand.num>15000,]


#d
#i
library(tree)
credittree <- tree(default~., data = credit.train) 
plot(credittree)
text(credittree)
summary(credittree)

#ii  Give the overall misclassification rate for both training and test data.

credit.pred = predict(credittree, newdata = credit.test, type = 'class')
table(credit.pred, credit.test$default)
(2222+511)/15000

#iii iii. Give the misclassification rate for the subgroups of people who will default and people who won’t default next month.
misclass.default.yes =  511 / (511+1054)
misclass.default.yes

#511 / (511+1054) 30 percent
misclass.default.no = 2222 / (11213+2222)
misclass.default.no
#2222 / (11213+2222) 16 percent

#iv: 4 nodes


#e optimal = 2
credit.cv = cv.tree(credittree, FUN=prune.misclass, K=10)
credit.cv
plot(credit.cv)
summary(credit.cv)



#f about 17-18 percent
credit.prune = prune.tree(credittree, best =2)
summary(credit.prune)
plot(credit.prune)
text(credit.prune, pretty = T)
credit.prune.pred = predict(credit.prune, newdata = credit.test, type = 'class')
table(credit.prune.pred, truth = credit.test$default)
(511 + 2222) / 15000  

#g
library(randomForest)
creditForest = randomForest(default~., data = credit.train)
creditForest
error.by.mtry = numeric(7)
oob.error = numeric(7)
for(i in 1:7)
{
  creditForest2 = randomForest(default~., data = credit.train, mtry = i, ntree = 400)
  oob.error[i] = creditForest2$err.rate[400]
  pred.mtry = predict(creditForest2, newdata = credit.test, type = 'class')
  num.misclassified = sum(credit.test$default!=pred.mtry)
  error.by.mtry[i] = num.misclassified
  print(i)
}

error.by.mtry / 15000

oob.error

plot(1:7, oob.error, col = "blue", pch = 19, type = 'b', ylim = c(0,.3))
points(1:7, error.by.mtry/15000, col = "red", pch = 19, type = 'b')
# for the pruned 17-18 percent and for the forest it was 18-19 percent mostly 18

#h 
creditForest
# the default is better

#2
View(iris)
head(iris)
library(tree)
iris.tree = tree(Species~., data = iris)
summary(iris.tree)
plot(iris.tree)
text(iris.tree)
#a)  54 observations
#b) setosa = 0 ,  versi = .907 , virginica = .0925
#c) versicolor
#d) the rule Petal.length < 4.95
#e) -2 * (49 * log(.90741) + 5 *log(.09259))
#f) max> & < min
