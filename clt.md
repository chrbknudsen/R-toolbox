---
title: 'CLT'
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
An important phenomenon working with data is the "Central Limit Theorem".

It states that, if we take a lot of samples from a distribution, the mean of 
those samples will approximate the normal distribution, even though the distribution
in it self is not normally distributed.

The uniform distribution is not normally distributed. Without any additional arguments,
it will produce x random values between 0 and 1, with equal probability for all
possible values. Here we get 100 random values, and plot a histogram of them:


``` r
random_numbers <- runif(100) 
hist(random_numbers)
```

<img src="fig/clt-rendered-unnamed-chunk-1-1.png" style="display: block; margin: auto;" />
This is definitely not normally distributed. 

The mean of these random numbers is:

``` r
mean(random_numbers)
```

``` output
[1] 0.4309456
```
The important point of the Central Limit Theorem is, that if we take a large
number of random samples, and calculate the mean of each of these samples,
the means will be normally distributed.

We could also have found the mean of the 100 random numbers like this:


``` r
mean(runif(100))
```

``` output
[1] 0.4957344
```
And we can use the `replicate()` function to repeat that calculation several times, in this case 1000 times:


``` r
repeated_means <- replicate(1000, mean(runif(100)))
```


``` r
hist(repeated_means)
```

<img src="fig/clt-rendered-unnamed-chunk-5-1.png" style="display: block; margin: auto;" />

The histogram looks quite normally distributed, even though the distribution
from which we drew the random samples were not.

This is the essense of the Central Limit Theorem. The distrubution
of the means of our samples will approximate the normal distribution,
regardless of the underlying distribution. 

Because of this, we are able to treat the mean (and a number of 
other statistical describtors), as normally distributed - _and_
use the properties we know the normal distribution to have to
work with them.

Og så indsætter vi et link til beviset - for det er for langhåret
til at have med her.




::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

