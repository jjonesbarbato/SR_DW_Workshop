#Project Set 1
#Create initial price per carat box plot
qplot(x = color, y = price/carat, 
      data=subset(diamonds), 
      geom='boxplot') 
ggsave('BasePriceHistogram.png')
#Now restrict to remove outliers
qplot(x = color, y = price/carat, 
      data=subset(diamonds), 
      geom='boxplot') + coord_cartesian(ylim=c(0,10000))
ggsave('RestrictedHistogram.png')

#Create the frequency polygon chart to show the count of records by weight
#Required lowering the bins size to accomodate the small values of the carat weight
#Also removing the upper tail for greater than 2 carats gave a further refinement
qplot(x=carat, data=subset(diamonds, diamonds$carat<2), binwidth=0.01, geom= 'freqpoly') 

