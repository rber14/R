#RobertoCampos
#stat128
#march4
#hw3


# 1. In this exercise, you will import data from an Excel file on Canvas, bring it into RStudio, then merge it with a dataset built into R.
#a)
library(readxl)
deptOfEducationFundingbyState <- read_excel("Downloads/deptOfEducationFundingbyState.xlsx")
View(deptOfEducationFundingbyState)

#b merge state.x77 with a

state.x77
View(state.x77)
rownames(state.x77)


m0 = merge(deptOfEducationFundingbyState, state.x77 , by.x = "State or Other Area", by.y = 0  )
View(m0)

m0$`State or Other Area` = NULL #gets rid of non numeric column
View(m0)

#c
cor(m0)
#murder and income are corolated with funds

#d
library(corrplot)
corrplot(cor(m0), method="circle")

#2 Read the background information about the Pima Indians Diabetes dataset here: https://www.kaggle.com/uciml/pima-indians-diabetes-database/home.
#(a) Gotohttps://www.kaggle.com/uciml/pima-indians-diabetes-databaseandimportthisdatasetintoRStu- dio.
#b

#thus was not on the homework?
diabetes <- read_csv("Downloads/diabetes.csv")
summary(diabetes)

#c
plot(diabetes$BMI, diabetes$SkinThickness)
reg = lm(BMI~SkinThickness, data = diabetes)
abline(reg)

#d
library(lattice)
splom(diabetes[c(1:5)])
#blood pressure and glucose
#skinthickness and blood pressure

#e
ageCol = diabetes[c(8)]
View(ageCol)

ageToDays = 0;
temp = 0;
for(i in 1:length(ageCol))
{
  temp = ageCol*365
  ageToDays = list(temp)
}
convertedYrToDays = data.frame(ageToDays)
colnames(convertedYrToDays) = "days"
View(convertedYrToDays)
diabetes$days = convertedYrToDays
colnames(diabetes)[10] = "days"
View(diabetes)



#3 
#Read the help file on the built in dataset ChickWeight. Note this is a different file that we used in a previous hw assignment.
?ChickWeight
#a weight time chick and diet are variables

#b
View(ChickWeight)
?tapply()

new = subset(ChickWeight, ChickWeight$Time==21)
mean.new = mean(new$weight)
#c
split(ChickWeight, ChickWeight$Diet)

#4
data.prob4 = data.frame(gender = c("F","F","M","F","M","M","M","M","F","M"))
on.off = c("1","1","0","0","1","0","1","0","0","0")
data.prob4df = cbind(data.prob4, on.off)
View(table(data.prob4df$gender, data.prob4df$on.off))
