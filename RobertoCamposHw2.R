#RobertoCampos
#Stat128
#Feb 19, 2019

###
#1.

# (a) Input the vector x containing (-7,10,43,NA,7.6,100,NA,13).
x = c(-7,10,43,NA,7.6,100,NA,13)
x
# (b) Extract all the elements smaller than 14. Save the result as el.lt.14.
lengthOfX = length(x)
el.lt.14 = NULL;
for(i in 1:lengthOfX)
{
  if(is.na(x[i]) | x[i] < 14)                                     #na condition has to be checked first
  {
    print(x[i])
    el.lt.14 = c(el.lt.14, x[i])
  }
}
el.lt.14

# (c) Determine the location of values smaller than 14. Save the result as ind.lt.14.
ind.lt.14 = c(which(is.na(x) | x < 14))
ind.lt.14

# (d) Find the standard deviation of the values in x. Save the result as sd.x.
sd.x. = sd(x , na.rm=TRUE)
sd.x.

# (e) Write one line of code whose output will give the number of missing values in x and will work generally on any vector with missing values. This function will help: is.na(x).
which(is.na(x))

# (f) Remove the missing values without specifying their indices, so don’t use x[-c(4,7)]. Save the result as x.not.na. Use a function to identify missing values. Consider !is.na(vector). Why is the ! needed? Compare the outputs of is.na(x) and !is.na(x).
x.not.na = NULL;
for(i in 1:lengthOfX)
{
  if(!is.na(x[i]))
    x.not.na = c(x.not.na, x[i])
}
x.not.na

is.na(x)   #is.na() will give you FALSE output when it's not NA
!is.na(x)  #!is.na() will give you TRUE output when it is not NA

####
#2.

#a
# Use arithmetic in R to verify that
# Store your answer as x.3 (a scalar).
x.3 = ((((5/2)^2) + 4) / (2*(5/2)))
x.3.x = (41/20)
x.3 == x.3.x

#b
seq.1 = 0;
seq.1[1] = 1;
for(i in 1:500)
{
  seq.1[i+1] = (seq.1[i]^2 + 4) / (2*seq.1[i])
}
seq.1
#yes, to 2

#c
seq.2 = 0;
seq.2[1] = 300;
for(i in 1:595)
{
  seq.2[i+1] = (seq.2[i]^2 + 4) / (2*seq.2[i])
}
seq.2
#begins at x1 then begins to converge to 2 

#d
seq.3 = 0;
seq.3[1] = 100;
for(i in 1:300)
{
  seq.3[i+1] = (seq.3[i]^2 + 4) / (2*seq.3[i])
}
seq.3
#yes, it depends on x1 

#e
xx = c(1:596)
plot(xx, seq.2, type = 'l')

###
#3.

# use the dataframe called “mtcars” which is built into R for this exercise. Use ?mtcars to see what is in
?mtcars

# dataframe and View(mtcars) to see the data in a spreadsheet format (View() has a capital “V”). 
View(mtcars)
# (a)Try the command dim(mtcars). What does it tell you? You can look at the help file.
?dim()
dim(mtcars)
#tells the rows and columns

# (b)Use the class() function to verify mtcars is a dataframe.
class(mtcars)

# (c) Use the which() function to find the row numbers of rows where the number of cylinders was 8. Store the result in a vector named rows.8.cyl.
rows.8.cyl. = which(mtcars[2]==8)
rows.8.cyl.
# (d) Extract the rows corresponding to cars with 8 cylinder engines into a new dataframe called eightcylinder.
eightcylinder = NULL
for(i in 1:14)
{
  eightcylinder = list(eightcylinder, mtcars[rows.8.cyl.[i],])
}
eightcylinder = unlist(eightcylinder)
eightcylinder = matrix(eightcylinder, ncol = 11, byrow = TRUE)
eightcylinder = data.frame(mpg=eightcylinder[,1], cyl=eightcylinder[,2], disp = eightcylinder[,3], hp = eightcylinder[,4], drat = eightcylinder[,5], wt = eightcylinder[,6], qseq = eightcylinder[,7], vs = eightcylinder[,8], am = eightcylinder[,9], gear = eightcylinder[,10], carb = eightcylinder[,11])
eightcylinder

# (e) In the new eightcylinder dataframe, find the mean mpg (miles per gallon) for the cars with manual
# transmissions. Store the result in a scalar called mean.manual.mpg.
mean.manual.mpg. = mean(eightcylinder$mpg)
mean.manual.mpg.

####
#4


# (a) Use the plot() function to plot the function y = x3/(x+1) from x = −4 to x = 3. It will be easier if you create a fine grid of points from -4 to 3 using the seq() function.
x.grid = seq(from = -4, to = 3, by = .01)
y = (x.grid)^3/((x.grid)+1)
plot(x.grid, y, type = "l") 

# (b) Assuming adult male heights are normally distributed with mean 69.1 inches and standard deviation 2.9 inches, generate 450 random male heights and store them in a vector named rand.male.heights. Use the command rnorm(n=450,mean=69.1,sd=2.9). Check out the help file for details.
rand.male.heights = rnorm(n=450,mean=69.1,sd=2.9)

# (c) Obtain a histogram of the heights. Set the freq argument inside the hist() command to FALSE to obtain probabilities instead of frequencies along the y-axis, i.e. hist(vector, freq=FALSE).
hist(rand.male.heights, freq = FALSE)

# (d) Overlay a normal curve with mean 69.1 and standard deviation 2.9 on your histogram. You can use the command curve(dnorm(x,mean=69.1,sd=2.9),add=TRUE). The dnorm() command calculates the y-value at x of the normal distribution with the specified mean and standard deviation.
curve(dnorm(x,mean=69.1,sd=2.9),add=TRUE)

#
#5 

#Create a vector named x with the values 4,18,72,27,43,65.
# (a) Write a for-loop which saves the cube of each element of x in a new vector named w.
x = c(4,18,72,27,43,65)
w = NULL
for(i in 1:length(x))
{
  w = c(w , x[i]^3)
}
 
print(w)

# (b) Redo part (a) without a loop, by using operations on a vector. Store your result as w.vectorized.
w.vectorized = c(4^3,18^3,72^3,27^3,43^3,65^3)
print(w.vectorized)

# (c) Write a for loop which finds the product of each element of x with the element before it, starting with the second element, and stores the results in a vector called myproducts.
myproducts = NULL
for(i in 2:length(x))
{
  myproducts= c(myproducts, (x[i]*x[i+1]))
}

print(myproducts)


#
# 6.
#Generate the first 50 Fibonacci numbers and store them in a vector named fib.vec.
# (a) Using a “for” loop and “if-then” control structure, add the odd Fibonacci numbers in your vector of the first 50 Fibonaccis. Store your result in a scalar named sum.odd.fibs. The modulus function %% will help. First, write a logical test to test if a number is odd. Ask me if you need hints.

fibu = 0;
fibu[1] = 1;  #You have to start the first two at 1
fibu[2] = 1;
sum.odd.fibs = 0
for(i in 3:50) #This will start at three 
{
    fibu[i] =  fibu[i-1] + fibu[i-2]
}
fib.vec = c(fibu)
print(fib.vec)

for(i in 1:length(fib.vec))
{
  if(fib.vec[i] %% 2 != 0)
    sum.odd.fibs = sum.odd.fibs + fib.vec[i]
  
}
sum.odd.fibs

# (b) Repeat part (a), now storing your result as sum.odd.fibs.2, but don’t use any loops. Work on the vector itself and subset it in a helpful way. If x is a vector, x %% 2 returns a vector of remainders, not TRUE/FALSEs, so you need to do more...
theOddfib = which(fib.vec %% 2 != 0)

sum.odd.fibs.2 = c(fib.vec[theOddfib])
sum(sum.odd.fibs.2)

# 7. 
# Scrape the data on time and date for 100 meter freestyle world records for men on Wikipedia at this url https: //en.wikipedia.org/wiki/World_record_progression_100_metres_freestyle. Plot the time against the year of each world record (so you will need to extract the year from the string representing date, the command strsplt() can help here).
library(rvest)
url = 'https://en.wikipedia.org/wiki/World_record_progression_100_metres_freestyle'


 webpage = read_html(url)
 time_data_html = html_nodes(webpage, "td:nth-child(2)") 
 time_data = html_text(time_data_html) #convert to text
 print(time_data)
 
 newtimes = strsplit(time_data, split = "\n")
 newtimes
 theTimes = gsub(":",'' , theTimes)
 theTimes = gsub(" ", "", theTimes)
 theTimes
 
theTimes = theTimes[1:140]
as.numeric(theTimes)
plot(theTimes)
data.frame(theTimes)


dates.html = html_nodes(webpage, 'td:nth-child(6) , td:nth-child(6) span')
dates.data = html_text(dates.html)
data.frame(unique(dates.data))




