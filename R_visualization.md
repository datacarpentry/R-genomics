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

# First we are going to input data

`dataset<-read.table("file/name/here",sep=...,header=T)`

