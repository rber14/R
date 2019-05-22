#1. Use data in the birthwt dataset in the MASS library for this exercise. 
#   I suggest ggplot() but you may use base graphics if you prefer.
library(ggplot2)
library(MASS)
View(birthwt)

#a    Construct three density plots of birthweight (bwt)
#      grouping by race in the same plotting pane.
a = subset(birthwt, birthwt$race==1)
b = subset(birthwt, birthwt$race==2)
c = subset(birthwt, birthwt$race==3)

aa = density(a$bwt)
bb = density(b$bwt)
cc = density(c$bwt)

plot(bb, main="birthweight (bwt)", col = "blue", xlim=c(0,6000))
lines(aa, col = 'red')
lines(cc, col = 'green')
legend(x = "topright",legend=c("race=1", "race=2", "race=3"),col = c("red", "blue", "green"),lty = 1 ,cex = .5, title = 'legend')

#b   Construct a multipane scatterplot 
#    of mother’s weight (lwt) versus birthweigth 
#    with a separate pane/facet for smoking status.

plotb = ggplot(birthwt, aes(x = birthwt$bwt, y = birthwt$lwt, col = smoke)) + labs(x="BirthWeight", y="Mother's weight") + ggtitle("1b")+ theme(plot.title = element_text(hjust = 0.5))+ geom_point() + facet_grid(.~smoke)
plotb     

#2  The dataset called Sitka in the package MASS contains size 
#   measurements over time for 79 Sitka spruce trees under two conditions (control and ozone- rich). 
#   Use ggplot() this question (not plot() in base graphics).

View(Sitka)

#a  Produce a plot of size (y) versus Time (x) for tree 1.
sitkaTree1 = subset(Sitka, tree==1)
sitkaTree1
aplot = ggplot(sitkaTree1, aes( x = sitkaTree1$Time, y = sitkaTree1$size)) + labs(x="Time", y="Size") +  ggtitle("2a")+ theme(plot.title = element_text(hjust = 0.5)) + geom_point() + geom_line() 
aplot

#b  Produce a plot of size (y) versus Time (x) for all 79 trees with a separate line for each tree. 
#   Use the color or each line to denote the condition (control or ozone-rich).

p = ggplot(Sitka, aes(x = Time, y = size, group = tree, colour = treat)) + geom_line()
p

#c   Same as previous graph in part 
#    (b) on facet based on control or ozone-rich. 
#    Based on this graph, does there appear to be a difference in growth between the two conditions?

p2 = ggplot(Sitka, aes(x =Time, y = size, group = tree)) + geom_line(aes(color = tree)) + facet_grid(.~treat)
p2


#there is a difference between the two conditions, 
#the control is not consistent in growths
#the ozone is much more predictacble in growths



