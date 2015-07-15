---
title: "Weekly Usage Report Process"
author: "Paul Maier"
date: "Monday, May 25, 2015"
output: html_document
---

## Activity

To calculate these measures, use the SQL queries in 
```
C:\Users\Paul\Paul Maier\Scripts\MySQL Queries\Build Up Usage Report\Activity Bar Charts
``` 
The remaining value, Sessions, should be available from the weekly Class Logs and the Class Activity report available on the Admin account on Adaptemy.

## Cumulative Progress

To create this line plot, you first need to fill in the fields in the data CSV. Week 37's version is available at
``` 
C:\Users\Paul\Paul Maier\RData\line_chart_data_BU_week_37_modified.csv
```
The sheet requires you to fill in hours, sparks, concepts and skill. It also provides optional fields for mean sparks and mean skill, which you'll get in a second.

To pull the sparks and skill for the week, use 
``` 
C:\Users\Paul\Paul Maier\Scripts\MySQL Queries\Build Up Usage Report\Build Up Only sparks and skill by user by date_revised to not include duplicates.sql
``` 
and alter the dates within the file to match the dates of the week you're measuring. It will give you the sum of the sparks or skill points along with the mean per session. It's pretty nifty.

To pull the concepts and learning hours, use 
``` 
C:\Users\Paul\Paul Maier\Scripts\MySQL Queries\Build Up Usage Report\ldh weekly report with outcomes, time, questions.sql
``` 
since you'll need that for the next section anyway. The count of sessions with 2 as the outcome is the number of concepts. The sum of all the seconds divided by 3600 is the number of learning hours.

Once you fill in that data to the appropriate sheet, then you'll need to make minor alterations to the line chart script, found at 
``` 
C:\Users\Paul\Paul Maier\RData\Build Up Cumulative Learning Line Chart for Usage Report.R
``` 
Make sure the axes are appropriate for the magnitude of the cumulative measures, and manually change the weeks on the x axis. Then you can just load the script in R and run the function without any arguments.

## Behaviour

Because you ran the "ldh weekly report" script in the prior section, you have most of your data. 

__Important and confusing:__ You need to divide the total seconds and total answered questions by the count of sessions available from the skill version of "Build Up Only sparks and skill by user by date" query to get the seconds learning and questions answered values. _I made an error on this for Week 37. My bad. I have fixed it._

Simply divide the correct questions by the attempted questions, both in the "ldh weekly report" results, for percentage of correct answers. 

Average sparks and skill points have already been calculated for you by the "Build Up Only sparks and skill" query.

## Content

This section is why there are two separate "ldh weekly report" queries. One aggregates by lesson entry (action), and one aggregates by lesson exit (outcome). 

I create these graphs by making a pivot table from the CSV in Excel and then creating a pivot chart from that. I add data labels and change the font of them and the legend to 12. Then you can just copy and paste directly from Excel to the Word document.
