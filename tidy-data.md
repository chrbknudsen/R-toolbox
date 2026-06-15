---
title: 'Tidy Data'
teaching: 10
exercises: 2
---

::: questions
-   How do we structure our data best?
:::

::: objectives
-   Explain what tidy data is
:::




## Introduction

Most of what we want to do with our data is relatively simple. *If* the data is 
structured in the right way.

Working within the paradigm of `tidyverse` it is preferable if the data is *tidy*.

![](fig/tidy_why.jpg){alt=''}


Tidy data is not the opposite of messy data. Data can be nice and well 
structured, tidy as in non-messy, without being tidy in the way we understand 
it in this context.

![](fig/tidy_hadley_2.jpg){alt=''}


Tidy data in the world of R, especially the dialect of R we call tidyverse, 
are characterized by:

-   Each variable is a column; each column is a variable.
-   Each observation is a row; each row is an observation.
-   Each value is a cell; each cell is a single value.

![](fig/tidy_hadley.jpg){alt=''}

This way of structuring our data is useful not only in R, but also in other 
software packages. 

## An examples

This is an example of untidy data, on new cases of tubercolosis in Afghanistan.
It is well structured, however there are information in the column names.

"new_sp_m014" describes "new" cases. Diagnosed with the "sp" method (culturing 
a sample of sputum and identifying the presence of Mycobacterium Tuberculosis 
bacteria). In "m" meaning males, between the ages of 0 and 14.

Picking out information on all new cases eg. distribution between the two sexes
is difficult. Similar problems arise if we want to follow the total number
of new cases.


``` output
# A tibble: 10 × 6
   country      year new_sp_m014 new_sp_m1524 new_sp_m2534 new_sp_m3544
   <chr>       <dbl>       <dbl>        <dbl>        <dbl>        <dbl>
 1 Afghanistan  2000          52          228          183          149
 2 Afghanistan  2001         129          379          349          274
 3 Afghanistan  2002          90          476          481          368
 4 Afghanistan  2003         127          511          436          284
 5 Afghanistan  2004         139          537          568          360
 6 Afghanistan  2005         151          606          560          472
 7 Afghanistan  2006         193          837          791          574
 8 Afghanistan  2007         186          856          840          597
 9 Afghanistan  2008         187          941          773          545
10 Afghanistan  2009         200          906          705          499
```

Getting this data on a tidy format is not trivial, but a resulting, tidy, 
organised dataset would look something like this:


``` output
# A tibble: 40 × 7
   country      year new   method sex   age_group cases
   <fct>       <dbl> <fct> <fct>  <fct> <fct>     <dbl>
 1 Afghanistan  2000 new   sp     m     0-14         52
 2 Afghanistan  2000 new   sp     m     15-24       228
 3 Afghanistan  2000 new   sp     m     25-34       183
 4 Afghanistan  2000 new   sp     m     35-44       149
 5 Afghanistan  2001 new   sp     m     0-14        129
 6 Afghanistan  2001 new   sp     m     15-24       379
 7 Afghanistan  2001 new   sp     m     25-34       349
 8 Afghanistan  2001 new   sp     m     35-44       274
 9 Afghanistan  2002 new   sp     m     0-14         90
10 Afghanistan  2002 new   sp     m     15-24       476
# ℹ 30 more rows
```

The fact that we are recording "new" cases is now a variable in it self. The
method used is also a variable, and the categorical variabel sex is similarly 
a separate variable as is the age group.

The variables `new`, `method` and `sex` might appear redundant - all values
are identical, however the entire dataset contains data on non-new cases, other
methods for diagnosis and the other sex, recorded as "f".

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
* Use colours for information


Illustrations from the Openscapes blog Tidy Data for reproducibility, efficiency, and collaboration by Julia Lowndes and Allison Horst

::: keypoints
-   tidy data provides a consistent way of organizing data
:::
