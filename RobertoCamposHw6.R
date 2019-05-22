#1. Suppose that 10% of Americans are left-handed.
#   Let the random variable X = the number of lefties among 30 randomly selected Americans.


#(a) Use R to calculate the probability of exactly 5 lefties among the 30 randomly selected Americans.
dbinom(5, size=30, prob=0.10)

#(b) Use R to calculate the probability distribution of X. 
#    Hint: You can use the function in R from part (a) to calculate
#    the probability of X = 0, 1, 2, 3, ..., 30 all at once.
myProbs = dbinom(1:30, size = 30, prob = .10)


#(c) Obtain a graph of your probabilities from part (b). Using this syntax plot(<probs from part (a) go here>,type="h").
plot(myProbs, type = 'h')

#(d) Suppose a class which holds 30 students has 3 left-handed desks. 
#    Use one command in R to calculate the probability there will be 
#    enough left-handed desks for a random group of 30 students.  

pbinom(3, size=30, prob = .1)

#2. Suppose that heights of women are 
#   normally distributed with mean 64 inches and standard deviation 2.5 inches.

#(a) What percent of women are over 6 feet tall?
# 1ft = 12 in
pnorm(72, mean = 64, sd = 2.5, lower.tail = FALSE)

#(b) What percent are between 60 and 70 inches tall?
pnorm(70, mean = 64, sd = 2.5) - pnorm(60, mean = 64, sd = 2.5)

#(c) Find the 90th percentile of womens heights.
qnorm(.9, mean = 64, sd = 2.5)

#(d) Randomly generate the heights of 10 women. 
#   Calculate the mean and standard deviation of the 10 sampled heights
#   and compare them to the population mean and standard deviation. 
#   Comment on how they compare.

sampledHeights = rnorm(10, mean = 64, sd = 2.5)
mean(sampledHeights)
sd(sampledHeights)

#(e) Repeat part (d) with a new sample.
sampledHeights2 = rnorm(10, mean = 64, sd = 2.5)
mean(sampledHeights2)
sd(sampledHeights2)

#3. It can be proven that that square of a standard normal random variable (mean=0, standard deviation = 1) has a chi-square distribution. 
#   You will see some simulation-based verification of this fact in the next exercise.

#(a) Randomly generate 10,000 values from a standard normal distribution, then square them.
x  <-rnorm(10000)


#(b) Obtain a histogram of your values from part (a).
hist(x^2, freq = FALSE)

#(c) Overlay a chi-square distribution with 1 degree of freedom. 
# (Hint: Use dchisq(x,df=1), which will generate the height of the Chi-square distribution with 1 degree of freedom 
# at the value x, within the function curve())
curve(dchisq(x,1),col="red",add=TRUE)

#(d) Use the values from part (a) to estimate the probability 
#    the square of a standard normal random variable is less then 2.
#use a loop to find which values in 10000^2 are less than 
pnorm(2, mean = mean(x), sd = sd(x), lower.tail = TRUE)

#(e) Find the exact probability a chi-square random variable with 1 degree of freedom 
#    is less than 2 using pchisq(). Compare to part (d).
#     - part d has a higher probability to be less then two
pchisq(2,1)


#4. An infinite series for the irrational number e is 1 + 1 + 1 + 1 ... 0! 1! 2! 3!

#(a) Write R code to generate a vector whose nth element is 1 for n = 0, 1, 2, 3..., 100. 
#    Do this using vector operations, n! not a for-loop.

myvec = c(0:100)
1/factorial(myvec)


#(b) Write R code to produce another vector of length 101 where the ith element in the vector 
#    is the cumulative sum of the elements 0,1,2,3..,i from the vector from part (a). 
#    So, the 1st element of the new vector is the sum of the 1st element of part (a) vector. 
#    The 2nd element is the sum of elements 1 and 2; the 3rd element is the sum of the elements 1,2 and 3, etc.

vectorSum = NULL;
vectorSum[1] = 1
for(i in 1:101)
{
  theSum = 0;
  for(j in 1:i)
  {
    theSum = theSum + myvec[j]
  }
  vectorSum[i] = theSum
}

#(c) plot elements in the 
plot(x = myvec ,y = vectorSum, type = 'l')
abline(h=exp(1))

