z = c(10,8,25,NA,2,NA)
mean(z , na.rm = TRUE)
sd(z , na.rm =TRUE)
sum(is.na(z))

z[4] = 9
z[6] = 9
z

#d
z[c(1,length(z))]

#e
z = c(10^2 , 8^2, 25^2, 9^2, 2^2, 9^2)
z

#better way
sqrt(z)

#f
which(z %% 2 == 0)

#g
evenValues = z[c(1,2,5)]
evenValues

#2
w = matrix(c(1,7,3,2) , nrow=2, ncol =2))
w

#a
mylist = list(vector = z, list = w)
mylist
#b
mylist$vector
#c
mylist$vector[2]
#d 
mylist[[1]] #returns matrix
mylist[1] #returns list


#3
View(ToothGrowth)
#a
            #1.
ToothGrowth[,3]

            #2. 
ToothGrowth$dose
#b
ToothGrowth[4,]

#c
obj =  ToothGrowth[ToothGrowth$supp == "OJ", ]
obj

#d
mean(obj$len)

#e
mean(ToothGrowth$len)

#4
#a nd b
myvec = c("cat","spider","dog","horse")

for(i in 1:length(myvec))
{
  if(nchar(myvec[i]) >= 4)
    print(myvec[i])    #nchar returns the number of words for example cat returns 3
  if(nchar(myvec[i]) %% 2 != 0)
    print("*")
    
}

#5
#a
discrim = function(a,b,c){
  return(b^2-4*a*c)
}
discrim(1,1,1)

#b
geo = function(n){
  thesum = 0;
  
  for(i in 1:n)
  {
    thesum = thesum + .5^i
  }
  return (thesum)
}

geo(3)

rep(.5, 3) #repeats the first in put as many times as the second input 

?rm
