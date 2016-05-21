---
layout: lesson
root: .
lastupdated: March 28, 2016
contributors: ["Kate Hertweck", "Susan McClatchey", "Tracy Teal", "Ryan Williams", "Michelle Berry", "Ellis Valentiner", "Rob Weyant", "Clayton Yochum"]
topic: R
software: R
dataurl: https://raw.githubusercontent.com/AnnArborRUserGroup/AARUG-R-workshop/gh-pages/data

---

<!-- USING THIS LESSON TEMPLATE -->
<!-- Lesson specific information is taken from the YAML header at the top of the page -->

<!-- THE LESSON INFORMATION -->


AARUG Beginner R Workshop
=======


<!-- ###### INDEX OF LESSONS ON THIS TOPIC ###### -->

## Lessons:


0. [Lesson 00 Before we start](00-before-we-start.html)
1. [Lesson 01 Introduction to R](01-intro-to-R.html)
2. [Lesson 02 Starting with data](02-starting-with-data.html)
3. [Lesson 03 R Markdown](03-rmarkdown.html)
4. [Lesson 04 Herding Cats with dplyr](04-dplyr.html)
5. [Lesson 05 Data visualisation with ggplot2](05-data-visualization.html)
6. [Lesson 06 Statistics](06-statistics.html)

## Data

Cats data is available [here]({{page.dataurl}}/cats.csv)
         	
Birthwt data is available [here]({{page.dataurl}}/birthwt.csv)

## Socrative

We will use Socrative to work through exercises during the workshop  				

Student login: [https://b.socrative.com/login/student/](https://b.socrative.com/login/student/)		  

classroom: HHUCRA83F

## Slack

We will use Slack to communicate during the workshop. The AARUG slack group is also 
a valuable resource for hearing about R-related events and announcements and receiving help
on your R code. 

Request to join the AARUG slack group: [http://annarborrusergroup.github.io/slack/](http://annarborrusergroup.github.io/slack/)
			


## Requirements

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

