---
layout: lesson
root: .
title: Lesson Title
minutes: 5
---

R-visualization-genomics
=======================

Group
-----
Sarah Stevens, Mary Shelley, Ryan Williams, Sue McClatchy, Kate Hertweck

Learning objectives:
--------------------


Resources:
---------
* [RStudio cheatsheet](http://www.rstudio.com/resources/cheatsheets/)
* [Choosing a good chart] (http://extremepresentation.typepad.com/blog/2006/09/choosing_a_good.html)
* [Nature Points of Significance] (http://www.nature.com/collections/qghhqm/pointsofsignificance)
* [Kick the bar chart habit] (http://www.nature.com/nmeth/journal/v11/n2/pdf/nmeth.2837.pdf)

Prerequisites: Assuming use of RStudio and general knowledge of R or completion of [R for first timers](https://github.com/datacarpentry/datacarpentry/tree/master/lessons/R/materials)

Attitudes/dispositions:
* I feel more comfortable exploring ggplot().
* I am more at ease working in the R environment
* I feel comfortable with R help documents and online resources for various packages (or at least finding those)

Declarative knowledge
* There are appropriate and inappropriate ways of plotting the same data
* I know which resources to use to determine which plot will answer my research questions
* I know how and when to use a boxplot versus a bar chart
* I know how to summarize my data with descriptive statistics

Skills
* Quantitative analysis of data through descriptive statistics (means, sd's, CI's, etc.)
* Organizing data prior to ggplot use (reshape2, melt, cast,plyr,ddply)
* Basic plotting with ggplot()

Plot ideas:
* box plots or histograms of numerical distributions describing data (avg. read length, kmer-distribution) paired with summary statistics produced through ddply()

Challenge Questions:
* Fill in arguments for ggplot() in order to produce a new plot.
* Correct a mistake in a call to ggplot().

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


Applying Visualization to a Dataset
-----------------------------------

First we will install the following packages
```
install.packages("ggplot2")
install.packages("reshape2")
install.packages("plyr")
install.pacakges("vegan")

library(reshape2)
library(plyr)
library(ggplot2)
library(vegan)
```
These packages include many visualization, statistical, and data management tools that can be used to summarize your data and produce publication-ready plots.

First we will read in the data (journal.pone.0081760.s004.csv), we will remove some nonsenical labels for ease of visualization here.  We will also add a variable that allows us to count up SNPs in the database
```
data<-read.csv("~/Desktop/journal.pone.0081760.s004.csv")
data<-subset(data, RefGenomeID != "" & locus_tag != "")
data$count<-1

```

This dataset displays SNPs among multiple E.coli strains.  We are interested in looking at how many total SNPs there are per E.coli genome.  We will do this using ddply.  Here we could calculate multiple descriptive statistics that can be useful when visualizing relationships.  Alternatively, this data can be read in straight from the github repo.

```
dataset<-read.table("https://github.com/datacarpentry/R-genomics/raw/master/Ecoli_genomes_with_SNPs_per_locus_tag.txt",header=T,sep="\t")

```
We can then convert the data to long form
```
dataset_melt<-melt(dataset, id="RefGenomeID")
```
We will then create another object that will include information about the average number of SNPs per E.coli genome
```
av_snps<-ddply(dataset_melt, .(RefGenomeID),summarise,
average=mean(value),
SD=sd(value)
)
```


Now we will use ggplot to produce visualizations of these data.  These functions work in a step-wise manner, where we add visual layers to our data.

```
ggplot(av_snps)

```
The errror shows that we have no layers in our plot, so lets add bars to show the average number of SNPs per genome.  

```
av_snps<-arrange(av_snps, -average)
ggplot(av_snps)+geom_bar(aes(x=variable, y=average),stat="identity")

```

We can order them within the plot as well

```
ggplot(av_snps)+geom_bar(aes(x=reorder(variable,average), y=average),stat="identity")

```

These are hard to see.  We will arrange them, look at the top 10, and flip the axes so we can read labels.

```
av_snps<-arrange(av_snps,-average)
ggplot(av_snps[1:10,])+geom_bar(aes(x=reorder(variable,average), y=average),stat="identity")+coord_flip()
```

Lets add a layer that will show the variability around these averages (standard deviation)

```
p<-ggplot(av_snps[1:10,])+geom_bar(aes(x=reorder(variable,average), y=average),stat="identity")+coord_flip()
p+geom_errorbar(aes(x=reorder(variable,average),y=average,ymax=average+SD,ymin=average-SD))

```

We can also add informative labels easily

```
p<-ggplot(av_snps[1:10,])+geom_bar(aes(x=reorder(variable,average), y=average),stat="identity")+coord_flip()
p.error.bars<-p+geom_errorbar(aes(x=reorder(variable,average),y=average,ymax=average+SD,ymin=average-SD))
p.error.bars+labs(x="Average Number of SNPs",y="E. Coli Genomes")
```

Colors can be used as well

```
p<-ggplot(av_snps[1:10,])+geom_bar(aes(x=reorder(variable,average), y=average,fill=variable),stat="identity")+coord_flip()
p.error.bars<-p+geom_errorbar(aes(x=reorder(variable,average),y=average,ymax=average+SD,ymin=average-SD,colour=variable))
p.error.bars+labs(x="Average Number of SNPs",y="E. Coli Genomes")

```

We may also be interested in a multivariate analysis of these data.  We can ask the question, "Which genomes are most similar based on SNPs?"  This is analogous to saying, "Which of my samples are the most similar?"  We will do this using nonmetric multidimensional scaling or NMDS.

First we will transform data to presence-absence 

```
library(vegan)
transformed_data<-decostand(dataset[,-1],"pa")
```

Then we will produce the NMDS and look at one of the outputs

```
mds<-metaMDS(transformed_data, distance="jaccard",k=2,autotransform=F)
scores<-data.frame(dataset[,1],scores(mds))
head(scores)
names(scores)[1]<-"RefGenomeID"
```
We changed the neame above of the first column for ease of understanding.
Now let's look at the first two axes from our NMDS analysis and colour points by genome identity

```
ggplot(scores)+geom_point(aes(x=NMDS1,y=NMDS2,colour=RefGenomeID))
```

This visualization shows where points are in multidimensional space in relation to one another compressed down into a 2D form.  Points that are very close together are very similar while points that are very far apart are dissimilar.  These are just a few examples of how you can visualizae univariate, bivariate, and multivariate relationships in data.

