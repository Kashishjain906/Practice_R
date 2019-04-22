#we get total dimensions...
dim(midwest)

#we get the names of columns...
names(midwest)

######################################################################

#Scatterplotusing midwest data in between area and population total...
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot", 
       caption = "Source: midwest")
gg

##using geom_encircle in scatterplot.....
midwest_search <- midwest[midwest$poptotal > 350000 & 
                            midwest$poptotal <= 500000 & 
                            midwest$area > 0.01 & 
                            midwest$area < 0.1, ]
gg <- gg + geom_encircle(aes(x=area, y=poptotal), 
                          data=midwest_search, 
                          color="red", 
                          size=2, 
                          expand=0.08)
gg

##########################################################

##Scatterplot with overlapping points using mpg data....
g <- ggplot(mpg,aes(cty,hwy))+
  geom_point()+
  geom_smooth(method ="loess", se=F)+
  labs(subtitle = "mpg: city vs highway",
       ylim ="highway",
       xlim ="city",
       caption = "source :mpg")
g

###########################################################

##jittered plot using mpg...
theme_set(theme_bw())
g1 <-ggplot(mpg,aes(cty,hwy))+
  geom_jitter(width = .5, size = 1)+
  labs(subtitle = "city vs highway",
       ylim = "highway",
       xlim = "city",
       title = "jittered plot",
       caption = "source:mpg")
g1

############################################################

##count plot..
g2 <- ggplot(mpg,aes(cty,hwy))+
  geom_count(col = "tomato3",show.legend = F)+
  labs(subtitle = "mpg: city vs highway",
       ylim = "highway",
       xlim = "city",
       title = "counts plot",
       caption = "source: mpg")
g2

###############################################################

##Bubble plot....
mpg_select <- mpg[mpg$manufacturer %in% c("audi","ford","honda","hyundai"), ]

g3<- ggplot(mpg_select,aes(displ,cty))+
  geom_jitter(aes(col = manufacturer,size = hwy))+
  geom_smooth(aes(col = manufacturer),method = "lm", se = F)+
  labs(subtitle = "mpg: display vs city",
       ylim ="city",
       xlim = "display",
       title = "Bubble plot",
       caption = "source:mpg")
g3

##############################################################

#Density plot.....
g4 <- ggplot(mpg, aes(cty))+
  geom_density(aes(fill=factor(cyl)), alpha=0.8) + 
  labs(title="Density plot", 
       subtitle="City Mileage Grouped by Number of cylinders",
       caption="Source: mpg",
       x="City Mileage",
       fill="# Cylinders")
g4

##############################################################

df <- as.data.frame(table(mpg$class))
colnames(df) <- c("class","freq")
g4 <- ggplot(df,aes(x ="",y = freq, fill = factor(class)))+
  geom_bar(width = 1,stat = "identity")+
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust=0.5))+
  labs(fill = "class",
       ylim = NULL,
       xlim = NULL,
       title = "pie chart of class",
       caption = "source:mpg")
pie1 <- g4 + coord_polar(theta = "y", start = 0)
pie1

########################################################

theme_set(theme_dark())

#by this we are seting the condititon for data frame....
mpg_search <- mpg[mpg$cty>27 && mpg$hwy >=35, ]

#box plot for mpg dataset...
box1 <- ggplot(mpg,aes(cty,hwy))+
  geom_count()+
  geom_smooth(method = "lm",se = F)

#we are making box plot.....
ggMarginal(box1,type = "boxplot", fill = "transparent")

#############################################################

library(gganimate)
library(gapminder)

theme_set(theme_bw())

animate1 <- ggplot(gapminder,aes(gdpPercap,lifeExp,size = pop ,frame = year))+
  geom_point()+
  geom_smooth(method = "lm",show.legend = FALSE,aes(group = year))+
  facet_wrap(~continent,scales = "free")+
  scale_x_log10()
gganimate(animate1,interval = 0.2)

#################################################################

##base plot-----------------------------------
theme1 <- ggplot(midwest, aes(x = area, y = poptotal))+
  geom_point(aes(col = state, size = popdensity))+
  stat_smooth(method = "gam", se = F) +
  xlim(c(0,0.1))+ ylim(c(0,500000))+
  labs(subtitle = "midwest: area vs population",
       y = "Population",
       x = "area",
       caption = "source: midwest")
theme1

##legend to the left-------------------------------
plot1 <- theme1+ theme(legend.position = "left")+
  labs(subtitle = "legend in the left")
plot1


##legend to the right-------------------------------
plot2 <- theme1+ theme(legend.position = "right")+
  labs(subtitle = "legend in the right")
plot2


##No legend will appear-----------------------------
plot3 <- theme1+ theme(legend.position = "none")+
  labs(subtitle = "No legend")
plot3


##legent at bottom- right and inside the plot--------------------------
plot4 <- theme1 + theme(legend.text = element_text(size = 12, color = "tomato",
                                                   face = "bold"),
                        legend.justification =  c(1,0),
                        legend.position = c(0.95,0.05),
                        legend.background = element_blank(),
                        legend.key = element_blank())+
  labs(subtitle = "legend at bottom-rigth inside the plot")
plot4


##legend at top left and inside the plot-----------------------------
plot5 <- theme1 + theme(legend.text = element_text(size = 12, color = "tomato",
                                                   face = "bold"),
                        legend.justification =  c(0,1),
                        legend.position = c(0.05,0.95),
                        legend.background = element_blank(),
                        legend.key = element_blank())+
  labs(subtitle = "legend at top-left inside the plot")
plot5

##############################################################

#correlation of matrix------------------------
mtcars
corr <- round(cor(mtcars), 1)


##correlogram plot------------------------------------------
ggcorrplot(corr, hc.order = TRUE, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="circle", 
           colors = c("tomato2", "white", "springgreen3"), 
           title="Correlogram of mtcars", 
           ggtheme=theme_bw)

############################################################
#load data----------------------
data("mtcars")

#create new column for car name---------------------------------
mtcars$'car name' <- rownames(mtcars)

#compute normalized mpg-------------------------------------
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2)

#above / below avg flag-------------------------------
mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")

#sort---------------------------------------------
mtcars <- mtcars[order(mtcars$mpg_z), ]

#convert to factor to retain sorted order in plot----------------------
mtcars$'car name' <- factor(mtcars$'car name', levels = mtcars$'car name')

#diverging barcharts----------------------------------------------
diverging_plot <- ggplot(mtcars,aes(x= 'car name',y = mpg_z,label = mpg_z))+
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="Normalised mileage from 'mtcars'", 
       title= "Diverging Bars") + 
  coord_flip()

diverging_plot


###########################################################################
##Area chart-------------------------------

library(lubridate)
data("economics")#load data---------

#compute % Returns------------------------------
economics$return_perc <- c(0, diff(economics$psavert)/economics$psavert[-
                             length(economics$psavert)])  

# Create break points and labels for axis ticks
brks <- economics$date[seq(1, length(economics$date), 12)]
lbls <- lubridate::year(economics$date[seq(1, length(economics$date), 12)])


ggplot(economics[1:100, ], aes(date, return_perc)) + 
  geom_area() + 
  scale_x_date(breaks=brks, labels=lbls) + 
  theme(axis.text.x = element_text(angle=90)) + 
  labs(title="Area Chart", 
       subtitle = "Perc Returns for Personal Savings", 
       y="% Returns for Personal savings", 
       caption="Source: economics")

###############################################################

