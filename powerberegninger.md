---
title: 'Power Calculations'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How large of a sample do I need to identify a result?
- How much confidence can I get using a specific sample size?
- How much power can I get using a specific sample size?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to use markdown with the new lesson template

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

We have some data on the lung volume of children, and want to see if there is
a difference between the (mean) lung volume of the two sexes. Ie if the mean for
boys is 1.87 and for girls is 1.84, there obviously is a difference. But is it 
significant?

We would do that by running at two-sample t-test. The null-hypothesis is that there
is no difference between the mean of the two samples, and if the p-value is
smaller than (typically) 0.05, we will reject the null-hypothesis.

That is not the same as concluding that there _is_ a difference, just that
the risk of of observing such a difference by random chance, if there really 
were no difference, is low (less than 5%).

This can go wrong in two ways. There might actually be no difference, but we
reject the null-hypothesis anyway, and conclude that a difference exist. 
That is a false positive; we see a difference where none is. We also call it a
type I error.

On the other hand, there might really be a diffence, but we fail to reject the
null hypothesis, that is we conclude that no difference exist, even though there
_is_ a difference. That is a false negative, or a type II error.

The risk of a type I error is $\alpha$ - which is what we specify choosing a 
level of significance, typically 0.05.

The risk of a type II error is related to the concept of "power", or $\beta$. 
Thas is the chance of seeing a difference where such a difference actually
exists. And the risk of not seeing it is therefore $1-\beta$.

These two concepts are combined in power-calculations.

## How many children do we need to test?

We begin by loading the data. You can download the data [from this link](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FEV.csv).


``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.2     ✔ tibble    3.3.0
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
✔ purrr     1.1.0     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
data <- read_csv("data/FEV.csv")
```

``` output
Rows: 654 Columns: 6
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
dbl (6): Id, Age, FEV, Hgt, Sex, Smoke

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

The dataset have measurements of the lung capacity (FEV) for boys and girls
between the ages of 3 and 19. Since we know that there _are_ significant differences
between the two sexes once they reach puberty, we will be looking at the data for 
prepubescent children.

``` r
test_data <- data |> 
  filter(Age < 10)
```

The means and standard deviations can be calculated like this:


``` r
test_data |> 
  group_by(Sex) |> 
summarise(mean = mean(FEV),
          sd = sd(FEV))
```

``` output
# A tibble: 2 × 3
    Sex  mean    sd
  <dbl> <dbl> <dbl>
1     0  2.00 0.508
2     1  2.07 0.514
```
In this dataset the girls are coded as "0" and the boys as "1". We see a difference
of 0.0757019.

Is there a difference? The null-hypothesis is that there is not. We have two
independent samples, so we are running a two-sample-t-test:


``` r
girls <- test_data |> 
filter(Sex == 0)
boys <- test_data |> 
filter(Sex == 1)

t.test(boys$FEV, girls$FEV)
```

``` output

	Welch Two Sample t-test

data:  boys$FEV and girls$FEV
t = 1.3021, df = 306.88, p-value = 0.1939
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.03870191  0.19010577
sample estimates:
mean of x mean of y 
 2.070799  1.995097 
```
The p-value is larger than 0.05, so we do not reject the null-hypothesis, and 
conclude that even though there might be a difference, we cannot rule out the
possibility that the difference we see between the two means is happening by chance.

How many children should we measure, if we wanted to see a difference of
0.0757019?

That is, how large a sample should we have, if we want to detect an actual
difference as small as this? This difference is often called the effect-size.

The effect size is relative to the absolute size of the means. A difference
of 0.08 is easier to detect when it is between 1.99 and 2.07 than if it is 
between 5461.31 and 5461.39.

Therefore we measure the effect size in standard deviations rather than in
absolute values. We denote that as `d` or Cohen's d. Often we want to see a 
specific effect size: 0.2 is considered small, 0.5 as medium and 0.8 as large.

In this case we have an effect size, but needs to convert it to standard deviations:

$$d = \frac{\mu_{boys} - \mu_{girls}}{\sigma_{pooled}}$$

Where the pooled standard deviation is calculated with:

$$\sigma_{pooled} = \sqrt{\frac{(n_{boys}-1)s_{boys}^2 + (n_{girls}-1)s_{girls}^2}{n_{boys}+n_{girls} -2}}$$

Which is a weighted average of the two standard deviations.

We need the following values:

``` r
test_data |> 
  group_by(Sex) |> 
  summarise(n = n(), mean = mean(FEV), sd = sd(FEV))
```

``` output
# A tibble: 2 × 4
    Sex     n  mean    sd
  <dbl> <int> <dbl> <dbl>
1     0   155  2.00 0.508
2     1   154  2.07 0.514
```


And now get the pooled standard deviation with:


``` r
s_p <- sqrt(((154-1)*0.5144072^2 + (155-1)*0.5075533^2)/(154+155-2))
```

And can then calculate Cohen's d, or, the effect size in standard deviations:


``` r
d <- (2.070799-1.995097)/s_p
d
```

``` output
[1] 0.1481504
```

Now we almost have all our ducks in a row. There is only one number we need to
decide on - the power. In this example we decide that it should be 0.9. To 
reiterate: If the difference exists, we want to have a 90% chance of detecting it. 

Or, conversely, we are willing to accept a 10% chance of a type II error, where
we fail to detect the difference.

R has a built in function for doing the final calculation for a two sample
t test. But we are going to use the `pwr` library. The results are the same,
but the calculations are different for different tests, and `pwr` provides 
functions for handling other tests.

The function we are going to use is `pwr.t.test`:


``` r
library(pwr)
pwr.t.test(d=d, sig.level = 0.05, power = 0.9, type = "two.sample")
```

``` output

     Two-sample t test power calculation 

              n = 958.4203
              d = 0.1481504
      sig.level = 0.05
          power = 0.9
    alternative = two.sided

NOTE: n is number in *each* group
```
We specify the effect size (d), the significanse level (0.05), the power 
we want (0.9), and the type of test we want to be able to do on the data ("two.sample").

And get the result that we need (at least) 959 observations in _each_ group,
in order to see the wanted effect size, with at a 5% significanse level and 
with a power of 0.9.

## How large effect sizes can we see?

The function is smart. There are four numbers involved: The effect size, the 
significanse level, the power and the number of observations. They are all
connected, and if we specify three of them, we will get the fourth.

Given the number of observations we have, we can calculate the power of the test:

``` r
pwr.t.test(n = 155, d=d, sig.level = 0.05, type = "two.sample")
```

``` output

     Two-sample t test power calculation 

              n = 155
              d = 0.1481504
      sig.level = 0.05
          power = 0.2552478
    alternative = two.sided

NOTE: n is number in *each* group
```
There is ~75% chance of getting a type II error. 


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content

::::::::::::::::::::::::::::::::::::::::::::::::

