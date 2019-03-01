# standard deviation calculation 
x = c(1,5,6,10)
devs = x-mean(x)
sq.devs = devs^2
sum.sq.dev = sum(sq.devs)
sd.x = sqrt(sum.sq.dev/(length(x)-1))

sd(x)

hist(Nile, breaks = 100)

b = c(TRUE,FALSE,TRUE)
sum(b)
pi
y = c(2,3,pi)
w = c(2,3,'dog')

inchesToCm = function(x)
{
  cmLength = 2.54*x
  return(cmLength)
}

inchesToCm(1)

area = function(radius)
{
  theArea = pi*radius^2
  return (theArea)
}

area(5)

hyplength = function(a,b)
{
  length = a^2 + b^2
  return(paste("the hyp is:" ,sqrt(length)))
}

hyplength(3,4)

w = c(2,3)
z = c(4,7)
myMatrix = rbind(w,z)


myMatrix[2,2]
myMatrix[1,]
myMatrix[,1]

#list

mylist = list(x="cat", y=c(1,3,4,1))
mylist
mylist$x
mylist$y
mylist[[1]]
mylist[1]
mylist[2,3]
mylist$y[3]
mylist[[2]][3]      #gets row 2 and isolates 3 out
myhist = hist(Nile)
myhist
mycounts = myhist$counts
mycounts

#dataframe
mydata = data.frame(names = c("Nick","Chris"), major = c("CS","Physics"), numPets = c(3,0))
mydata

mydata$major  #list the majors , you can also put this information into a variable
class(mydata) #you can see the class which it's a data frame

#
View(ChickWeight) #gives you a whole view
mean(ChickWeight$weight)
hist(ChickWeight$weight)
table(ChickWeight$Diet)
ChickWeight[1:12, ]
mysubset = subset(ChickWeight, Diet == 2)
mysubset

xx = c(5,6,8,20)
xx == 6 #you can save it in a variable
mytest = xx
mytest

xx>10
xx %% 3


subset(ChickWeight, weight > 70 &  weight < 100)
xx[xx<=8]

#loop
?seq
y = data.frame(myseq = seq(from = 10, to = 20, by = .25))
y
write.csv(y, file = "myseq.csv")  #puts into a file named .csv

rep(6,each = 10)

#forlops
for(i in 1:3)
{
  paste(2*i)
}


for(i in c(3,6,10))
{
  print(i+15)
}

mywords = c("math", "horse", "to")
nchar(mywords)

for(i in 1:3)
{
  print(nchar(mywords[i]))
}

#feb11
#recurive

fibvec = 0;
fibvec[1] = 1;  #You have to start the first two at 1
fibvec[2] = 1;

for(i in 3:10) #This will start at three 
{
  fibvec[i] =  fibvec[i-1] + fibvec[i-2]
  
}

fibvec

#webscraping
library(rvest)
#rankings
mywebpage = read_html("https://www.imdb.com/list/ls031775422/") #opens
mynodes = html_nodes(mywebpage, '.text-primary') #pulls out

rankingstext = html_text(mynodes) #convert to text

rankings = as.numeric(rankingstext)
rankings

titlenodes = html_nodes(mywebpage, '.lister-item-header a')
titletext = html_text(titlenodes)

runnodes = html_nodes(mywebpage, ".runtime")
runtext = html_text(runnodes)
runtext

runtime.num = unlist(strsplit(runtext, split= " "))
runtime.num
runtime.num = matrix(runtime.num, ncol=2, byrow=TRUE)
runtime.num
runtime.vec = as.numeric(runtime.num[,1])
runtime.vec

runtime.vec2 = c(runtime.vec[1:23], NA, runtime.vec[24:43])
runtime.vec2
hist(runtime.vec2, col="black")

moviedata = data.frame(title = titletext, rank = rankings, min = runtime.vec2)

#loops
avec = c(6,3,4,10,2,55)
oversum = NULL;
for(i in 1:6)
{
  if(avec[i]>5)
    print(avec[i])
  else
    print("not")
 oversum = c(oversum, avec[i])
}
oversum

#inclassExercises
#1&=
thex = c(7,25,30,9)
size = length(thex)
for(i in 1:size)
{
  sqrt.x[i] = sqrt(thex[i])
  print(sqrt(thex[i]))
}
sqrt.x

#examples

x.cord = c(0,1,5)
y.cord = c(-3,2,7)

plot(x.cord, y.cord, type = 'b', xlab = 'x',ylab = 'y', main = 'graph', cex = 2, ylim = c(-3,15) )

#funcPlotting

func = function(x)
{
  x^3 -3*x
}
curve(func, from = -3, to =3)

##
#importingDATA
joined.data = merge(classBeverage, ClassfavoriteNumData, all=TRUE)
View(joined.data)

#changing name of colum in data frame
colnames(classBeverage)
colnames(classBeverage)[1] = "Name of Student"

joined.data$sqrtNumPets = sqrt(joined.data$NumPets)
joined.data$petIndicator = ifelse(joined.data$NumPets>0, "yes", "no")
View(joined.data)

complete.data = joined.data[complete.cases(joined.data),]
View(complete.data)

joined.data[4,4] = mean(joined.data$FavoriteNum, na.rm = TRUE)
View(joined.data)

#coulm0?
state.x77

library(MASS)
data()
View(Pima.tr)

#
##
#types of data

party = c('r','d','d','r','d','oth','d','r','r')
class(party)

?factor
party = factor(party, levels = c("oth","d","r"))   #use levels= to order them so now other wll com first
str(party)

gender = c(1,1,2,2,1,2,1,1,1) #1-male #2-female
class(gender)
summary(gender)

gender.factor= factor(gender, levels = c(1,2), labels = c("male", "female"))
gender.factor
summary(gender, factor)

#1
#a 
z = c(70,72,69,NA,84,75)
#b
which(z>71)
#c


##############################################################################
#matrices in R

summary(mtcars)
str(mtcars)


mtcars$am = factor(mtcars$am, levels = c(0,1), labels = c("automatic", "manual"))

mtcars$vs =  factor(mtcars$vs, levels = 0:1, labels = c("v-shaped", "straight"))
table(mtcars$am , mtcars$vs)
summary(mtcars)

split(mtcars, mtcars$gear)

databygear = split(mtcars, mtcars$gear)
?by

plot(mtcars$disp , mtcars$mpg)
mymodel = lm(mpg ~ disp, data=mtcars)
#mpg = 29,6 + -.0412 * disp
abline(mymodel)


str(mymodel)
mymodel$residuals

by(mtcars, mtcars$gear, summary)
by(mtcars, mtcars$am, function(x) lm(x[,1]~x[,3]))
