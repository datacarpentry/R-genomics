---
layout: lesson
root: .
lastupdated: August 14, 2016
contributors: ["Kate Hertweck", "Susan McClatchey", "Tracy Teal", "Ryan Williams"]
maintainers: ["Tracy Teal"]
domain: Genomics
topic: R
software: R
dataurl:
status: Under Development
---

<!-- USING THIS LESSON TEMPLATE -->
<!-- Lesson specific information is taken from the YAML header at the top of the page -->

<!-- THE LESSON INFORMATION -->


# Data Carpentry {{ page.topic }} for {{ page.domain }}
=======

Data Carpentry's aim is to teach researchers basic concepts, skills,
and tools for working more effectively with data.
The lessons below were designed for those interested
in working with {{page.domain %}} data in {{page.topic %}}.


**Content Contributors: {{page.contributors | join: ', ' %}}**


**Lesson Maintainers: {{page.maintainers | join: ', ' %}}**


**Lesson status: {{ page.status }}**

<!--
  [Information on Lesson Status Categories]()
-->

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

Data Carpentry's teaching is hands-on, so participants are encouraged to use
their own computers to insure the proper setup of tools for an efficient workflow.
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

<p><strong>Twitter</strong>: @datacarpentry
