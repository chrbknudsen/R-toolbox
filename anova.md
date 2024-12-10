---
title: 'anova'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you perform an ANOVA?
- What even is ANOVA?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to run an analysis of variance on models
- Explain the requisites for runnin an ANOVA
- Explain what an ANOVA is
::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

Studying the length of penguin flippers, we notice that
there is a difference between the average length between
three different species of penguins:


``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
library(palmerpenguins)
penguins %>% 
  group_by(species) %>% 
  summarise(mean_flipper_length = mean(flipper_length_mm, na.rm = TRUE))
```

``` output
# A tibble: 3 × 2
  species   mean_flipper_length
  <fct>                   <dbl>
1 Adelie                   190.
2 Chinstrap                196.
3 Gentoo                   217.
```

If we only had two groups, we would use a t-test to determine
if there is a significant difference between the two groups. But
here we have three. And when we have three, or more, we use
the ANOVA-method, or rather the `aov()` function: 


``` r
aov(flipper_length_mm ~ species, data = penguins) %>% 
  summary() 
```

``` output
             Df Sum Sq Mean Sq F value Pr(>F)    
species       2  52473   26237   594.8 <2e-16 ***
Residuals   339  14953      44                   
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
2 observations deleted due to missingness
```
We are testing if there is a difference in flipper_length_mm 
when we explain it as a function of species. Or, in other words,
we analyse how much of the variation in flipper length is
caused by variation between the groups, and how much is caused
by variation within the groups. If the difference between those
to parts of the variation large enough, we conclude that there is
a significant difference between the groups.

In this case, the p-value is very small, and we reject the
NULL-hypothesis that there is no difference in the variance 
between the groups, and conversely that we accept the 
alternative hypothesis that there is a difference.


## Are we allowed to run an ANOVA?

There are some conditions that needs to be fullfilled. 

1. The observations must be independent.

In this example that we can safely assume that the length of the
flipper of a penguin is not influenced by the length of another
penguin.

2. The residuals have to be normally distributed

Typically we also test if the data is normally distributed. Let us
look at both:

Is the data normally distributed?


``` r
penguins %>% 
  ggplot(aes(x=flipper_length_mm)) +
  geom_histogram() +
  facet_wrap(~species)
```

``` output
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

``` warning
Warning: Removed 2 rows containing non-finite outside the scale range
(`stat_bin()`).
```

<img src="fig/anova-rendered-unnamed-chunk-3-1.png" style="display: block; margin: auto;" />
That looks reasonable.

And the residuals?


``` r
aov(flipper_length_mm ~ species, data = penguins)$residuals %>% 
  hist(.)
```

<img src="fig/anova-rendered-unnamed-chunk-4-1.png" style="display: block; margin: auto;" />
That looks fine - if we want a more specific test, those exists,
but will not be covered here.

3. Homoskedacity 

A weird name, it simply means that the variance in the different
groups are more or less the same. We can calculate the variance
and compare:


``` r
penguins %>% 
  group_by(species) %>% 
  summarise(variance = var(flipper_length_mm, na.rm = TRUE))
```

``` output
# A tibble: 3 × 2
  species   variance
  <fct>        <dbl>
1 Adelie        42.8
2 Chinstrap     50.9
3 Gentoo        42.1
```

Are the variances too different? As a rule of thumb, we have a 
problem if the largest variance is more than 4-5 times larger
than the smallest variance. This is OK for this example.

If there is too large difference in the size of the three groups,
smaller differences in variance can be problematic.

:::: solution

## More specific methods exist.

There are probably more than than three tests for homoskedacity, here 
are three:

Fligner-Killeen test:


``` r
fligner.test(flipper_length_mm ~ species, data = penguins)
```

``` output

	Fligner-Killeen test of homogeneity of variances

data:  flipper_length_mm by species
Fligner-Killeen:med chi-squared = 0.69172, df = 2, p-value = 0.7076
```

Bartlett's test:


``` r
bartlett.test(flipper_length_mm ~ species, data = penguins)
```

``` output

	Bartlett test of homogeneity of variances

data:  flipper_length_mm by species
Bartlett's K-squared = 0.91722, df = 2, p-value = 0.6322
```
Levene test:

``` r
library(car)
```

``` output
Loading required package: carData
```

``` output

Attaching package: 'car'
```

``` output
The following object is masked from 'package:dplyr':

    recode
```

``` output
The following object is masked from 'package:purrr':

    some
```

``` r
leveneTest(flipper_length_mm ~ species, data = penguins)
```

``` output
Levene's Test for Homogeneity of Variance (center = median)
       Df F value Pr(>F)
group   2  0.3306 0.7188
      339               
```
For all three tests - if the p-value is >0.05, there is a significant
difference in the variance - and we are not allowed to use the 
ANOVA-method. In this case we are on the safe side.

::::

### But where is the difference?

Yes, there is a difference between the average flipper length
of the three species. But that might arise from one of the species
having extremely long flippers, and there not being much 
difference between the two other species. 

So we do a posthoc analysis to confirm where the diffrences 
are.

The most common is the tukeyHSD test, HSD standing for
"Honest Significant Differences":


``` r
aov_model <- aov(flipper_length_mm ~ species, data = penguins)
TukeyHSD(aov_model)
```

``` output
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = flipper_length_mm ~ species, data = penguins)

$species
                      diff       lwr       upr p adj
Chinstrap-Adelie  5.869887  3.586583  8.153191     0
Gentoo-Adelie    27.233349 25.334376 29.132323     0
Gentoo-Chinstrap 21.363462 19.000841 23.726084     0
```
We get the estimate of the pair-wise differences and 
lower and upper 95% confidence intervals for those differences.


Alternativer:
Normalfordelte data og homogene variansforhold:
Tukey's HSD (generelt bedste valg).
Bonferroni (hvis meget konservativ tilgang ønskes).
Ikke-homogene variansforhold:
Games-Howell (mest robust).
Wilcoxon (ikke-parametrisk).
Fokuseret på en kontrolgruppe:
Dunnett's test.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content

::::::::::::::::::::::::::::::::::::::::::::::::

