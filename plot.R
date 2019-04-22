
#aggregate----------------------
cty_mpg <- aggregate(mpg$cty, by=list(mpg$manufacturer), FUN=mean)

#change column name--------------------
colnames(cty_mpg) <- c("make", "mileage") 

#sort-----------------------
cty_mpg <- cty_mpg[order(cty_mpg$mileage), ]

#to retain order in plot---------------
cty_mpg$make <- factor(cty_mpg$make, levels = cty_mpg$make) 

#get the list------------------
head(cty_mpg, 4)

#plot-------------------
ggplot(cty_mpg, aes(x=make, y=mileage)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title="Ordered Bar Chart", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

##############################################################

#lollipop chart---------------------------
ggplot(cty_mpg, aes(x=make, y=mileage)) + 
  geom_point(size=3) + 
  geom_segment(aes(x=make, 
                   xend=make, 
                   y=0, 
                   yend=mileage)) + 
  labs(title="Lollipop Chart", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

#########################################################

ggplot(cty_mpg,aes(x = make, y = mileage))+
  geom_point(size = 3 ,col = "tomato")+
  geom_segment(aes(x = make,xend = make,
                   y = min(mileage),yend = max(mileage),
                   linetype = "Dashed",
                   size = "0.1"))+
  labs(subtitle = "")


