#1
#a
w = c(45,77,5,8,110)
#b
x = mean(w)
y = var(w)
z = sd(w)
#c
w.sq = w^2
w.sq
#d
sum.w.sq = sum(w.sq)
#e
n = length(w)
w.var.comp = sum(w)/n
formula.result = (1/n-1)*(sum.w.sq - n*(w.var.comp)^2)
#f
mean.multiply.data = mean(w*5)
sd.multiply.data = sd(w*5)
diffVal.mean.data = mean(w*6)
diffVal.sd.data = sd(w*6)
# The for the data set before multiplying by 5 was 49 and the standard deviation was 45.105
#   After multiplying by 5 was 245 and standard deviation was 225.52
#   After multiplying by another number in this case 6 the mean was 294 and the standard deviation was 270.63
# The standard deviation is how spread out the data is, multiplying by 5 or 6 will spread the value by that much.

#g
mean.add.5 = mean(w+5)
sd.add.5 = sd(w+5)

mean.add.20 = mean(w+20)
sd.add.20 = sd(w+20)

mean.add.100 = mean(w+100)
sd.add.100 = sd(w+100)

# When 5 is added the mean changes. Anytime a number summed to the values in the dataset the mean changes
# But the standard deviation stays the same. For example, I added 20 and the mean changed to 69, but the standard devation stayed the same.

#2
row1 = c(3,5,8)
row2 = c(9,2,1)
row3 = c(3,2,9)

myMatrix = rbind(row1,row2,row3)
myMatrix

matrix = 

#a 
colm3 = myMatrix[3,]
colm3
#b
myelt = myMatrix[3,2]
myelt
#c
2:5
matrix2 = matrix(2:5, nrow=2,ncol=2)
matrix2

#d
t(matrix2)
det(matrix2)
#The t() command transposes the matrix
#The det() command gives you the determiant of the matrix,

#3
mylist = list(mymatrix =  matrix(2:5, nrow=2,ncol=2), myNames =  c("Ruby","Miguel","Tiffany","Tyler"))
mylist #shows list
#a
?det
mydet = det(mylist$mymatrix)
mydet #shows det
#b
favname = mylist$myNames[3] # usemyNames[] normally to extract any name you want 
favname #shows the name tiffany
 
#4
?swiss
#a
ag.col = swiss[,2]
ag.col #displays
#b
mean.perc.male.ag = mean(ag.col)
mean.perc.male.ag
#c
row40 = swiss[40,] #extracts 40th row
row40 #displays
#d
summary(swiss)

#5
sumAndRoot <- function(x)
{
  theSum = x+x
  theRoot= sqrt(x)
  function1output = list( "Sum"=theSum, "Root"=theRoot)
  return(function1output)
}
function1output = sumAndRoot(14)
function1output #display

#6
triangleArea <- function(b,h)
{
  area = (b*h) / 2
  return(area)
}

function2out = triangleArea(3.9, 4.6)
function2out #displays

#7
#problem1
sum = 0
for(numbers in 1:999) #below means 1000 = 999
{
  if(numbers %% 3 == 0 | numbers %% 5 == 0)
  {
    sum = sum + numbers
  }
}
paste(sum)

#probelm5

#probelm6
totalSq = 0
totalSum = 0
for(num in 1:100)
{
  totalSq = totalSq + num^2
  totalSum = totalSum + num
}
totalSumSq = totalSum^2

paste(totalSumSq - totalSq)

