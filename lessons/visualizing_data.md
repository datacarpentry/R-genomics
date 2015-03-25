# This is a lesson for how to visualize your data

*The text below is all rough, and much of it is just a start

First we are going to input data

```
dataset<-read.table("file/name/here",sep=...,header=T)
```

There are several differerent summary statistics that we can run 

```
mean(dataset$variable)
sd(dataset$variable)
quantile(dataset$variable, c(0.025,0.975))
```

These statistics desribe how a particular variable is distributed, but we may have this variable from several genomes, and we would want to know how the distribution may differ.  To do this we can use the `ddply()` function from the `"plyr"` package.
```
library(plyr)
ddply(dataset, .(categorical_variable), summarise,
mean=mean(variable),
sd=sd(variable),
hi_95=quantile(variable, 0.975),
lo_95=quantile(variable, 0.025))
```

To start plotting this we will use the ggplot2() package.  We will start with a blank plot and add aesthetic layers to it.  

```
ggplot(dataset)  # note the error
ggplot(dataset)+geom_boxplot(aes(x=categorical_variable, y= variable))
```

With this plot we can see the distributions of data (quantiles and median) categorized by our categorical variable.  While this visualization can show you how your data is distributed (is it skewed?), you can also begin comparing between categorical variables (is my variable greater under one category than another)?


