---
title: 'Cohens Kappa'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can agrement on classification be quantified?
- How is Cohens $\kappa$ calculated?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Learn to calculate Cohens $\kappa$
- Become familiar with the usecases for Cohens $\kappa$
- Know the limitations of Cohens $\kappa$
::::::::::::::::::::::::::::::::::::::::::::::::

## What do we use it for?

We use Cohens Kappa (or $\kappa$), to compare if two sets of categorisations
are done reliably.

Imagine a set of images. We ask two persons to answer a simple question - is there
a cat on the images. To what degree do the two persons agree on the presence 
or absence of cats?

That seems simple enough. However if they agree that there is a cat, this might
indicate that they are both good at identifying cats, and of course agrees. 
But they might just as well be very bad at recognizing cats - but agree by
random chance. 


## Where is it used?

*Inter-Rater Reliability*. That is the example from earlier. To what degree do two "raters" agree
on their rating or classification of something? This is useful in subjects and
research where subjective assessments are important, such as psychology, medicine
and languages.

*Intra-Rater Reliability*. Here we test how consistent a single rater is. Are my
ratings from a week ago, consistent with the ratings I make today?

*Comparison of diagnostic tests*. It can be used to compare the results of two
different diagnostic tests for some medical condition. Does the cheaper, less
invasive test, give the same results as the more expensive invasive test?

*Natural language processing* (NLP). When we categorise textual data, eg, evaluating
the sentiment of a text, or identify named entities - how well does two methods 
or persons agree?

*Educational research*. Will two teachers give the same grade to the same papers
turned in by students.

*Comparison of classifications from machine learning models* basically the extension of the above cases.
But where one (or more) of the raters are not human, but rather an algorithm doing the classifications.

In humanities we are concerned with intersubjectively transferability - based
on available data, are the subjective evaluation of two different persons 
in agreement.

## Limitations

Cohens $\kappa$ can be used directly for two nominal (no order of the classes) 
categorical variables. 
The main limitation is that Cohens $\kappa$ only applies for exactly two
raters.

## How do we calculate it?

The library `vcd` contains a function `Kappa()` that does the heavy lifting.

It needs a so called confusion matrix. Let us begin by constructing one.

First we read in the dataset:


``` r
library(tidyverse)
diagnoses <- read_csv("https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/diagnoses.csv")
```

The object `diagnoses` now contains 30 observations. Imagine two psychiatrists 
both evaluating 30 patients. They diagnose one of these disorders: Depression
(dep), Schizophrenia (sch), Dissociative disorder (dis), Neurosis (neu) and
Other (oth). To what degree do they agree?


``` r
head(diagnoses)
```

``` output
# A tibble: 6 × 2
  rater1 rater2
  <chr>  <chr> 
1 dep    dep   
2 dep    dep   
3 dep    dep   
4 dep    dep   
5 dep    dep   
6 dep    dep   
```


``` r
conf_table <- table(diagnoses)
conf_table
```

``` output
      rater2
rater1 dep dis neu oth sch
   dep   7   1   3   0   2
   dis   0   8   0   0   2
   neu   0   0   1   0   0
   oth   0   0   0   4   0
   sch   0   0   0   0   2
```

This is the confusion matrix. 7 patients are diagnosed with depression by
both raters (psychiatrists). But looking at Schizophrenia, we see that two
patients are diagnosed with Schizophrenia by rater2, but with Depression by
rater1.

This is the table we need to provide to the `Kappa()` function:


``` r
library(vcd)
```

``` output
Loading required package: grid
```

``` r
res.k <- Kappa(conf_table)
res.k
```

``` output
            value    ASE     z  Pr(>|z|)
Unweighted 0.6507 0.0999 6.513 7.372e-11
Weighted   0.5588 0.1282 4.359 1.304e-05
```

::::spoiler
## Unweighted vs Weighted?

For some use cases it does not really matter what kind of disagreement 
the two raters have. They of course should agree, but the disagreement of 
classifying a Golden Retriver as a Labrador Retriver, is not as serious as 
mistaking it for a Chihuahua. 

The Unweighted $\kappa$ is calculated with the
assumption that the different disagreements are of equal seriousness. 

The Weighted $\kappa$ assumes that some disagreements are worse than others.

::::

## How confident are we in $\kappa$?

The function `confint()` will give us the 95% confidence interval of the $\kappa$
calculated:


``` r
confint(res.k)
```

``` output
            
Kappa              lwr       upr
  Unweighted 0.4548491 0.8464610
  Weighted   0.3075771 0.8100699
```

## Interpretation

Cohens $\kappa$ takes into account the possibility that the two raters agree
by chance. This makes it a more robust measure of agreement than simply looking
at the precent agreement. It returns a value between -1 and 1, 1 indicating
perfect agreement, 0 no agreement besides random chance, and negative values
less agreement than we would expect by chance.

So. Is an unweighted $\kappa$ of 0.6507 good or bad?

That depends on what we are actually classifying. Classifying psychiatric disorders
is obviously more important than classifying dog breeds. 


[Fleiss et al (2003)](https://onlinelibrary.wiley.com/doi/book/10.1002/0471445428), 
argues that the rules-of-thumb in this table are good indications:


|Value of K        |Level of agreement                   |
|:-----------------|:------------------------------------|
|>0.75             |Excellent agreement beyond chance    |
|0.4> value < 0.75 |Fair to good agreement beyond chance |
|<0.4              |Poor agreement beyond chance         |

Whereas [McHugh (2012)](https://doi.org/10.11613/BM.2012.031) presents this
table:


|Value of K  |Level of agreement | % of data that are reliable|
|:-----------|:------------------|---------------------------:|
|0 - 0.20    |None               |                      0 - 4%|
|0.21 - 0.39 |Minimal            |                     4 - 15%|
|0.40 - 0.59 |Weak               |                    15 - 35%|
|0.60 - 0.79 |Moderate           |                    35 - 63%|
|0.80 - 0.90 |Strong             |                    64 - 81%|
|Above 0.90  |Almost Perfect     |                   82 - 100%|

The estimates of the % of data that are reliable depends on the distribution of
the classifications, and the values in this table should be taken with a grain of
salt.




## Assumptions

Cohens $\kappa$ have the following requirements:

* Two raters (or coders). No more, no less.

* Nominal scale – there are no order to the classifications. 

* Same set of items – both raters rate the exact same cases.

* Independence of ratings – the two ratings must not influence each other.

* Mutually exclusive categories – an arbitrary case can only get _one_ classification.








## The math

We define $\kappa$ as:

$$\kappa =  \frac{P_0 - P_e}{1-P_e}$$

Where $P_0$ is the degree of agreement we observe, and $P_e$ is the degree of agreement
that is random. 

The null hypothesis declares that any agreement is random, and $\kappa$ is 0.
If $\kappa$ is different from 0, the agreement is not random.

If we are looking at two raters, in this example doctors, determining if
a patient is sick, a simple yes/no question in this case we will get these results:


``` r
##        Doctor2
## Doctor1 Yes No Total
##   Yes   a   b  R1   
##   No    c   d  R2   
##   Total C1  C2 N
```

$P_0$, the observed percentage of agreement is now easy to calculate. It is the sum
of "a" and "d", divided by the number of patients:

$$P_0 = \frac{a + d}{N}$$

The random agreement $P_e$ takes a bit more math:

* Doctor 1 answers "yes" in $\frac{R_1}{N}$ cases.
* Doctor 2 answers "yes" in $\frac{C_1}{N}$ cases.

Based on this, the probability that they both, randomly and by chance, answer
"yes" is:

$$\frac{R1}{N}  \frac{C1}{N}$$

And for the random agreement of "no":

*Doctor1 answers "no" in $\frac{R2}{N}$ cases
* Doctor2 answers "no" in $\frac{C2}{N}$ cases

And the probability that they both, again randomly and by chance, answers
"no" is:

$$\frac{R2}{N} \frac{C2}{N}$$

We then calculate the total probability that the two raters agree by chance 
by adding the two ways they can do that:

$$P_e = \frac{R1}{N}  \frac{C1}{N}+ \frac{R2}{N} \frac{C2}{N}$$

Now that we have both $P_0$ and $P_e$, we can calculate $\kappa$, 
and confidence intervals: $\kappa \pm Z_{\alpha/2} SE_\kappa$ based on the 
Z-distribution (if normality is assured, otherwise the t-distribution).


::::spoiler
## This looks like something I have seen before?

If you have ever looked at how the math in a $\chi^2$ test works, this might
look familiar. Thats because it actually is.

With two raters and two categories, the $\kappa$ statistic is the same. And
if you want to delve deeper into that, you can look up this paper:

Feingold, Marcia (1992). "The Equivalence of Cohen's Kappa and Pearson's Chi-Square Statistics in the 2 × 2 Table." Educational and Psychological Measurement 52(1): 57-61. <https://hdl.handle.net/2027.42/67443>


::::




## Alternatives

Cohens $\kappa$ only works (directly) for nominal values, and two raters.
The option of weighting the data give us some options for using it on ordinal
values, but more direct options exist.

* Weighted $\kappa$ is used for ordinal values. We use the function `kappa2()` from the `irr` package.
* Light's $\kappa$ is used for studying interrater agreement between more than 2 raters. We use the function `kappamlight()` from the `irr` package.
* Fleiss $\kappa$ is also used when having more than 2 raters. *But* does _not_
require the same raters for each subject.



::::::::::::::::::::::::::::::::::::: keypoints 

- With two raters Cohens $\kappa$ can be used as a measure of interrater agreement on categorical, nominal classes.
- Other methods exists for ordinal classes, and more than two raters. 
::::::::::::::::::::::::::::::::::::::::::::::::

