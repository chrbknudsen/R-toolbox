---
title: 'descript_stat'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you write a lesson using R Markdown and `{sandpaper}`?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to use markdown with the new lesson template
- Demonstrate how to include pieces of code, figures, and nested challenge blocks

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Det kan være en udfordring hvis deltagene ikke ved hvad et 
gennemsnit er. 

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Descriptive statistic involves summarising or describing a set of data. 
It usually presents quantitative descriptions in a short form, and helps to
simplify large datasaets.

Most descriptive statistical parameters applies to just one variable in our
data, and includes:

* Mean
* Median
* Mode
* Standard deviation
* Range
* Variance
* Quartiles - especially the Interquartile Range, IQR
* Skewness
* Kurtosis
* Percentiles

The easiest way to get summary statistics on data is to use the `summarise` function
from the `tidyverse` package.

```r
library(tidyverse)
```

```output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.0     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```


In the following we are working with the `palmerpenguins` dataset:

```r
library(palmerpenguins)
```


## Mean
The average of all datapoints:


```r
penguins %>% 
  summarise(avg_mass = mean(body_mass_g, na.rm = T))
```

```output
# A tibble: 1 × 1
  avg_mass
     <dbl>
1    4202.
```
The variable contains missing data, encoded as NA, which we remove from the
data before calculating the mean.

Barring significant outliers, `mean` is an expression of position of the data.
This is the weight we would expect a random penguin in our dataset to have. We
also have three different species of penguins in the dataset, and they have 
quite different average weights. There is also a significant difference in the
average weight for the two sexes. We will get to that at the end of this 
segment.


## Median
Similarly to the average/mean, the `median` is an expression of the location 
of the data. If we order our data by size, from the smallest to the largest
value, and locate the middle observation, we get the median. This is the 
value that half of the observations is smaller than. And half the observations
is larger.


```r
penguins %>% 
  summarise(median = median(body_mass_g, na.rm = T))
```

```output
# A tibble: 1 × 1
  median
   <dbl>
1   4050
```
We can note that the mean is larger that the median. This indicates that the data
is skewed, in this case toward the larger penguins. 

## Mode

Mode is the most common, or frequently occurring, observation. R does not have 
a build-in function for this, but we can easily find the mode by counting the
different observations,and locating the most common one. We typically do not use
this for continous variables. The mode of the `sex` variable in this dataset
can be found like this:

```r
penguins %>% 
  count(sex) %>% 
  arrange(desc(n))
```

```output
# A tibble: 3 × 2
  sex        n
  <fct>  <int>
1 male     168
2 female   165
3 <NA>      11
```

We count the different values in the `sex` variable, and arrange the counts
in descending order (`desc`). The mode of the `sex` variable is male.

In this specific case, we note that the dataset is pretty balanced regarding the
two sexes.

## Standard deviation
The standard deviation is a measurement of the variation or dispersion in the
values. We have a mean, but how much variation do we actually have?

A histogram is typically a good way to visualise the data:

```r
penguins %>% 
  ggplot(aes(body_mass_g)) +
  geom_histogram()
```

```output
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

```warning
Warning: Removed 2 rows containing non-finite outside the scale range
(`stat_bin()`).
```

<img src="fig/descript-stat-rendered-unnamed-chunk-6-1.png" style="display: block; margin: auto;" />

We see a large peak around 3500 gram, but there is a lot of variation in the data,
that is, it is spread out.

NOTE: We are still looking at three different species of penguins, with two sexes,
and it might be more reasonable to look only at one species, and one sex. We'll
get to that.

The standard deviation is easily found similarly to the previous examples:

```r
penguins %>% 
  summarise(stddev = sd(body_mass_g, na.rm = T))
```

```output
# A tibble: 1 × 1
  stddev
   <dbl>
1   802.
```
The standard deviation is found by subtracting the mean from every observation,
squaring the results, and calculating the mean of these squared deviations from
the mean. Finally we take the square-root of the sum, and get the standard deviation.

## Variance
The variance is similar to the standard deviation. Actually we have already 
calculated it above; the standard deviation is the square-root of the variance.

Since the standard deviation occurs in several statistical tests, it is more
frequently used that the variance. It is also more intuitively relateable to 
the mean.

NOTE - måske vi skal have variansen nævnt før standardafvigelsen?

The variance is calculated similarly to the previous examples:


```r
penguins %>% 
  summarise(var = var(body_mass_g, na.rm = T))
```

```output
# A tibble: 1 × 1
      var
    <dbl>
1 643131.
```

## Range
The range of the data is simply the smallest and larges observations.
Since this returns more than one value, we use the function reframe
instead of summarise:

```r
penguins %>% 
  reframe(range = range(body_mass_g, na.rm = T))
```

```output
# A tibble: 2 × 1
  range
  <int>
1  2700
2  6300
```

However it is typically more usefull to extract the two values to 
separate columns in the output:

```r
penguins %>% 
  summarise(min = min(body_mass_g, na.rm = T),
            max = max(body_mass_g, na.rm = T))
```

```output
# A tibble: 1 × 2
    min   max
  <int> <int>
1  2700  6300
```
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor
This also illustrates for the learners that we can calculate more than one
summary statistics in one summarise function.

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

The range, like the variance and the standard deviation informs us of the
spread of the observations.

## Quartiles - especially the Interquartile Range, IQR

We saw the median. That was the value where 50% of the observations in the 
dataset were smaller. That is also called the 50% quantile. 

Similarly we have other quantiles. The 25% quantile is the value where 25% of
the observations are smaller. And the 75% quantile is where 75% of the values
are smaller. We are typically interested in the interquartile range, that is
the range, in which we find 50% of the observations, centered around the median.

Like previous summary statistics, we get it using the summarise function:


```r
penguins %>% 
  summarise(iqr = IQR(body_mass_g, na.rm = T))
```

```output
# A tibble: 1 × 1
    iqr
  <dbl>
1  1200
```

It is often interesting to also know the values for the 25% quartile (also 
called the first quartile), and the 75% quartile (aka third quartile).
The function `quantile` allows us to specify exactly which quantile we 
want:


```r
quantile(penguins$body_mass_g, probs = .25, na.rm = T)
```

```output
 25% 
3550 
```

```r
quantile(penguins$body_mass_g, probs = .75, na.rm = T)
```

```output
 75% 
4750 
```
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor
probs because if we select a random penguin, we have a 25% chance of selecting
a penguin that weighs less than 3550 gram.
This ties in to percentiles and qq-plots.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

## Skewness

We previously saw a histogram of the data, and noted that the observations 
were skewed to the left, and that the "tail" on the right was longer than
on the left. That skewness can be quantised.

There is no function for skewness build into R, but we can get it from the
librar `e1071`


```r
library(e1071)
skewness(penguins$body_mass_g, na.rm = T)
```

```output
[1] 0.4662117
```
The skewness is positive, indicating that the data are skewed to the left, just
as we saw. A negative skewness would indicate that the data skew to the right.

## Kurtosis

Og her skal vi nok lige have styr på den intuitive forståelse af det.

## Percentiles

Just as with the interquartile range, where we calculated the 25% and 75% 
quantiles, we can calculate any quantile. 

Here eg. the 1% quantile:


```r
quantile(penguins$body_mass_g, probs = .01, na.rm = T)
```

```output
  1% 
2900 
```
or, the value where 1% of the observations are smaller.

## Everythin Everywhere all at once

A lot of these descriptive values can be gotten for every variable in the 
dataset using the `summary` function:

```r
summary(penguins)
```

```output
      species          island    bill_length_mm  bill_depth_mm  
 Adelie   :152   Biscoe   :168   Min.   :32.10   Min.   :13.10  
 Chinstrap: 68   Dream    :124   1st Qu.:39.23   1st Qu.:15.60  
 Gentoo   :124   Torgersen: 52   Median :44.45   Median :17.30  
                                 Mean   :43.92   Mean   :17.15  
                                 3rd Qu.:48.50   3rd Qu.:18.70  
                                 Max.   :59.60   Max.   :21.50  
                                 NA's   :2       NA's   :2      
 flipper_length_mm  body_mass_g       sex           year     
 Min.   :172.0     Min.   :2700   female:165   Min.   :2007  
 1st Qu.:190.0     1st Qu.:3550   male  :168   1st Qu.:2007  
 Median :197.0     Median :4050   NA's  : 11   Median :2008  
 Mean   :200.9     Mean   :4202                Mean   :2008  
 3rd Qu.:213.0     3rd Qu.:4750                3rd Qu.:2009  
 Max.   :231.0     Max.   :6300                Max.   :2009  
 NA's   :2         NA's   :2                                 
```
Here we get the range, the 1st and 3rd quantiles (and from those the IQR), 
the median and the mean and, rather useful, the number of missing values in 
each variable.

We can also get all the descriptive values in one table, by adding more than
one summarising function to the summarise function:


```r
penguins %>% 
  summarise(min = min(body_mass_g, na.rm = T),
            max = max(body_mass_g, na.rm = T),
            mean = mean(body_mass_g, na.rm = T),
            median = median(body_mass_g, na.rm = T),
            stddev = sd(body_mass_g, na.rm = T),
            var = var(body_mass_g, na.rm = T),
            Q1 = quantile(body_mass_g, probs = .25, na.rm = T),
            Q3 = quantile(body_mass_g, probs = .75, na.rm = T),
            iqr = IQR(body_mass_g, na.rm = T),
            skew = skewness(body_mass_g, na.rm = T),
            kurtosis = kurtosis(body_mass_g, na.rm = T)
  )
```

```output
# A tibble: 1 × 11
    min   max  mean median stddev     var    Q1    Q3   iqr  skew kurtosis
  <int> <int> <dbl>  <dbl>  <dbl>   <dbl> <dbl> <dbl> <dbl> <dbl>    <dbl>
1  2700  6300 4202.   4050   802. 643131.  3550  4750  1200 0.466   -0.740
```
Which leads us to a table that is a bit too wide.

As noted, we have three different species of penguins in the dataset. Their 
weight varies a lot. If we want to do the summarising on each for the species,
we can group the data by species, before summarising:


```r
penguins %>% 
  group_by(species) %>% 
  summarise(min = min(body_mass_g, na.rm = T),
            max = max(body_mass_g, na.rm = T),
            mean = mean(body_mass_g, na.rm = T),
            median = median(body_mass_g, na.rm = T),
            stddev = sd(body_mass_g, na.rm = T)
  )
```

```output
# A tibble: 3 × 6
  species     min   max  mean median stddev
  <fct>     <int> <int> <dbl>  <dbl>  <dbl>
1 Adelie     2850  4775 3701.   3700   459.
2 Chinstrap  2700  4800 3733.   3700   384.
3 Gentoo     3950  6300 5076.   5000   504.
```
We have removed some summary statistics in order to get a smaller table.

Finally boxplots offers a way of visualising some of the summary statistics:

```r
penguins %>% 
  ggplot(aes(x=body_mass_g, y = sex)) +
  geom_boxplot()
```

```warning
Warning: Removed 2 rows containing non-finite outside the scale range
(`stat_boxplot()`).
```

<img src="fig/descript-stat-rendered-unnamed-chunk-19-1.png" style="display: block; margin: auto;" />
The boxplot shows us the median (the fat line in the middel of each box)m, the 
1st and 3rd quartiles (the ends of the boxes), and the range, with the whiskers
at each end of the boxes, illustrating the minimum and maximum. Any observations,
more than 1.5 times the IQR from either the 1st or 3rd quartiles, are deemed as 
outliers and would be plotted as individual points in the plot.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

