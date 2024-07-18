---
title: 'Tidy Data'
teaching: 10
exercises: 2
---

::: questions
-   How do you write a lesson using R Markdown and `{sandpaper}`?
:::

::: objectives
-   Explain what tidy data is
:::

## Introduction

Most of what we want to do with our data is relatively simple. *If* the data is 
structured in the right way.

Working within the paradigm of `tidyverse` it is preferable if the data is *tidy*.

![test](fig/tidy_why.jpg){"Illustrations from the Openscapes blog Tidy Data for reproducibility, efficiency, and collaboration by Julia Lowndes and Allison Horst"}


Tidy data is not the opposite of messy data. Data can be nice and well 
structured, tidy as in non-messy, without being tidy in the way we understand 
it in this context.

![test2](fig/tidy_hadley_2.jpg){"Illustrations from the Openscapes blog Tidy Data for reproducibility, efficiency, and collaboration by Julia Lowndes and Allison Horst"}


Tidy data in the world of R, especially the dialect of R we call tidyverse, 
are characterized by:

-   Each variable is a column; each column is a variable.
-   Each observation is a row; each row is an observation.
-   Each value is a cell; each cell is a single value.

![ter](fig/tidy_hadley.jpg){"Illustrations from the Openscapes blog Tidy Data for reproducibility, efficiency, and collaboration by Julia Lowndes and Allison Horst"}

This way of structuring our data is useful not only in R, but also in other 
software packages. 

## Do's and dont's in Excel

Excel is a very useful tool, especially for collecting data.

But even though we are able to do everything we can do in R, in Excel, we 
will normally do the main part of our work with data in R. 

It is therefor a very good idea to think about how we collect and organise the 
data in Excel, to make our life easier later on.

We have collected some good rules of thumb for structuring data in Excel, based
on time-consuming and traumatic experiences wrangling data from Excel to R.

**Always**

* Use one column for one variable
* Use one row for one observation
* Use one cell for one value
* Begin your data in the upper left corner (cell A1)
* Use one sheet for each type of data


**Never (EVER!)**

* Modify your raw data - always make a copy before making any change
* Merge cells
* Use colors for information



::: keypoints
-   tidy data provides a consistent way of organizing data
:::
