---
layout: lesson
root: .
lastupdated: March 28, 2016
contributors: ["Kate Hertweck", "Susan McClatchey", "Tracy Teal", "Ryan Williams", "Michelle Berry", "Ellis Valentiner", "Rob Weyant", "Clayton Yochum"]
topic: R
software: R
dataurl: https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv

---

<!-- USING THIS LESSON TEMPLATE -->
<!-- Lesson specific information is taken from the YAML header at the top of the page -->

<!-- THE LESSON INFORMATION -->


#AARUG Beginner R Workshop
=======


<!-- ###### INDEX OF LESSONS ON THIS TOPIC ###### -->

## Lessons:


1. [Lesson 00 Before we start](00-before-we-start.html)
2. [Lesson 01 Introduction to R](01-intro-to-R.html)
3. [Lesson 02 Starting with data](02-starting-with-data.html)
4. [Lesson 03 Introducing `data.frame`](03-data-frames.html)
5. [Lesson 04 Aggregating and analyzing data with dplyr](04-dplyr.html)
6. [Lesson 05 Data visualisation with ggplot2](05-data-visualization.html)

## Data

Data files for the lesson are available here: [{{page.dataurl %}}]({{page.dataurl %}})


### Requirements

*These lessons assume no prior knowledge of the skills or tools*, but working
through this lesson requires working copies of the software described below.
To most effectively use these materials, please make sure to install everything
*before* working through this lesson.




{% if page.software == "Python" %}
{% include pythonSetup.html %}
{% elsif page.software == "Spreadsheets" %}
{% include spreadsheetSetup.html %}
{% elsif page.software == "R" %}
{% include rSetup.html %}
{% else %}
{% include anySetup.html %}
{% endif %}

## Contributors:
Lesson plans were adapted from [Software Carpentry](http://software-carpentry.org/) and [Data Carpentry](http://www.datacarpentry.org/) lessons    

Contributors include: {{page.contributors | join: ', ' %}}

