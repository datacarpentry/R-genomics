---
layout: lesson
root: .
lastupdated: March 28, 2016
contributors: ["Kate Hertweck", "Susan McClatchey", "Tracy Teal", "Ryan Williams", "Michelle Berry", "Ellis Valentiner", "Rob Weyant", "Clayton Yochum"]
topic: R
software: R
dataurl: https://github.com/AnnArborRUserGroup/AARUG-R-workshop/tree/gh-pages/data

---

<!-- USING THIS LESSON TEMPLATE -->
<!-- Lesson specific information is taken from the YAML header at the top of the page -->

<!-- THE LESSON INFORMATION -->


#AARUG Beginner R Workshop
=======


<!-- ###### INDEX OF LESSONS ON THIS TOPIC ###### -->

## Lessons:


0. [Lesson 00 Before we start](00-before-we-start.html)
1. [Lesson 01 Introduction to R](01-intro-to-R.html)
2. [Lesson 02 Starting with data](02-starting-with-data.html)
3. [Lesson 03 Aggregating and analyzing data with dplyr](04-dplyr.html)
4. [Lesson 04 Data visualisation with ggplot2](05-data-visualization.html)
5. Stats models

## Data

Cats data is available [here]({{page.dataurl}}/cats.csv)
         	
Gapminder data is available [here]({{page.dataurl}}/gapminder-FiveYearData.csv)


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

