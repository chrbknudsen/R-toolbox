---
title: 'Logistic regression'
teaching: 10
exercises: 2
editor_options: 
  markdown: 
    wrap: 72
---

::: questions
-   How do you run a logistic regression?
:::

::: objectives
-   Learn how to run a logistic regression
:::

## Logistic Regression

Using linear regression, or even non-linear multiple regression techniques, we can
predict the expected value of a dependent continuous variable given values
of one or more independent variables. 

But what if the dependent variable we want to predict is not continous, but
categorical? 

Eg, if we try to predict an outcome like "Healthy/Sick" based on a number of
independent variables?

We do that using the logistic regression. Strictly speaking the logistic model
does not predict a yes/no answer, but rather the probability that the answer is
yes (and conversely that it is no). Rather than the continous outcome the linear
methods model for the dependent variable, the logistic regression returns a 
probability. By definition that lies somewhere between 0 and 1 (or 0% and 100%).

And since the linear methods we would like to use for doing the actual logistic
regression does not play nice with those bounds, we need to think about 
probabilities in a different way.

## A new way of thinking about probability.

We often talk about there being a "67%" probability or chance of something. 
Reading p-values, we do that all the time. A p-value of 0.05, equivalent to 
5%, tells us that if we run the test often enough, there is a 5% chance of
seeing a result as extreme as the test value purely by chance, if the null-hypothesis
is true.

5% is equivalent to 5 instances out of 100 possibilities. As indicated above, we
want to convert those 5% to something that does not have a range between 0 and 1.

Therefore, we convert probabilities to odds. 

Odds are a different way of representing probabilities. A lot of statistics
and probability theory have their roots in gaming and betting, so let us use
that as an example. 

If two soccer-teams play, and we want to bet on the outcome, the betting company
we place our bet at, will give us odds. 1:9 indicates that if the two teams play
10 times, one team will win 1 game, and the other will win 9 times (assuming that
a tie is not possible, and glossing over a lot of other details that relates more
to the companys profits). That is equivalent to one team having a 10% chance of
winning, and the other having a 90% chance of winning. 

The connection between the two numbers is found by:

$$odds = \frac{p}{1-p}$$

We have now transformed a probability going between 0 and 1, to odds, that can
go between 0 and positive infinity. 

## Going a step further

Modelling probabilities is difficult, because they can only have values between
0 and 1. Converting them to odds, give us something that can have values between
0 and infinity (positive). If we take one extra step, we can convert those odds
to something that is continuous and, can have any value.

We do that by taking the (natural) logarithm of the odds, and the entire 
conversion from probability to log-odds, is called the logit-function:

$$logit(p) = \log(\frac{p}{1-p})$$


:::: challenge
Remember the probabilities of the soccer-match? One team had a 10% probability 
of winning, corresponding to odds 1:9. That means that the other team 
have a 90% probability of winning, or odds 9:1. Try to run the logit function on both of
those probabilities. Do you notice a nice relation between them?

:::: solution


``` r
log(0.1/(1-0.1))
```

``` output
[1] -2.197225
```


``` r
log(0.9/(1-0.9))
```

``` output
[1] 2.197225
```

The two log-odds values have different signs, but are otherwise identical. This
is nice and symmetrical.

:::
::::


## So - what are we modelling?

This:

$$\text{logit}(p) = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_k X_k$$

And that looks familiar, and the net result of _all_ the stuff about odds, logit-functions
etc. have exactly that as their goal; we can now use all the nice techniques
from the linear regressions to model categorical values.

It's not exactly that simple. In the linear regression we fit the data to a
line, where we in the logistic regression fits the data to a sigmoid curve:

<img src="fig/logistic-regression-rendered-logit_func_plot-1.png" style="display: block; margin: auto;" />




## OK, lets make a fit already!


We start be getting some data. Download the FEV dataset, but start by creating
a folder called "data":


``` r
download.file("https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FEV.csv", "data/FEV.csv", mode = "wb")
```


``` error
Error in read_csv("https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FEV.csv"): could not find function "read_csv"
```

``` r
fev <- read_csv("data/FEV.csv")
```

The data contains measurements of age, height, sex and lung function for 654 
children, as well as an indication of wether or not they smoke.


``` r
fev
```

``` error
Error: object 'fev' not found
```

We will do a logistic regression, to see if we can predict wether or not a child
is smoking, based on all the other variables (except the Id value).

As both Sex and Smoke are categorical values, it is important that they are 
actually coded as categorical values in the data, in order for R to be able to
handle them as such:


``` r
fev <- fev %>% 
  mutate(Sex = factor(Sex),
         Smoke = factor(Smoke))
```

``` error
Error in fev %>% mutate(Sex = factor(Sex), Smoke = factor(Smoke)): could not find function "%>%"
```

We can now build a model. It looks almost like the linear model, but rather
than using the `lm()` function we use the `glm()`, or "generalised linear model",
which is able to handle logistic models. It _is_ general, so we need to specify
that we are running a binomial (ie two possible outcomes) fit. We save the 
result to an object, so we can take a closer look:


``` r
log_model <- glm(Smoke ~ Age + FEV + Hgt + Sex, family = "binomial", data = fev)
```

``` error
Error in eval(mf, parent.frame()): object 'fev' not found
```


The result in itself looks like this:


``` r
log_model
```

``` error
Error: object 'log_model' not found
```
And if we take a closer look:


``` r
summary(log_model)
```

``` error
Error: object 'log_model' not found
```
Interestingly lungfunction does not actually predict smoking status very well.

But what does the coefficients actually mean?

The intercept is not very interesting in itself, and we do not generally 
interpret directly on it. It represents the log-odds of smoking if all the
predictive variables (Age, FEV, Hgt, and Sex) are 0. And the log-odds in that
case is not very informative.

We have a positive coefficient for Age. That means, that for each unit increase
in age, here 1 year, the log-odds for smoking increase by 0.43075, _if all other_
variables are kept constant. Since we have log-odds, we can find the increase
in odds for smoking by taking the exponential of the log-odds:


``` r
exp(0.43075)
```

``` output
[1] 1.538411
```
That is - the odds for smoking increase by 53.8% for each year a child get older.

The coefficients for FEV and Hgt are treated similarly. Note that for FEV, the 
coefficient is negative. That means the log-odds, and therefore odds, for smoking
decreases as lungfunction measured by FEV, increases. As always _if all other_
variables are kept constant.

Sex is a bit different. Because Sex is a categorical variable, the coefficient
indicates that there is a difference between the two different sexes. And because
it is negative, we can calculate that the odds for smoking if the child is female
is


``` r
exp(-1.16517)
```

``` output
[1] 0.3118696
```
compared with male childre, equivalent to a reduction in odds by about 68.8%

## How to get the odds quickly?

We can get the odds in one go, rather than running the exponential function on
them one by one:


``` r
exp(coef(log_model))
```

``` error
Error: object 'log_model' not found
```
We use the `coef()` function to extract the coefficients, and then take the
exponential on all of them.

## And what about the probabilities?

Sometimes it would be nice to get probabilities instead of odds. We can get those
using this expression:


``` r
1/(1+exp(-coef(log_model)))
```

``` error
Error: object 'log_model' not found
```

Why does that work? 


``` r
odds <- exp(coef(log_model))
```

``` error
Error: object 'log_model' not found
```

``` r
odds/(1+odds)
```

``` error
Error: object 'odds' not found
```

(Intercept) 
≈
8.24
×
1
0
−
9
≈8.24×10 
−9
 :

Interceptet giver log-oddsene, når alle variabler er 0, hvilket sjældent er meningsfuldt i praksis. Denne meget lave sandsynlighed viser blot, at sandsynligheden for udfaldet er meget lav, når alle variabler sættes til 0 (hvilket i nogle tilfælde kan være udenfor det realistiske område).
Age (0.606):

En sandsynlighed på ca. 0.606 betyder, at for hver stigning i Age (alder) med én enhed, øger sandsynligheden for udfaldet sig med 60.6%, når de andre variabler holdes konstante.
Dette svarer til en positiv effekt på sandsynligheden for udfaldet, hvilket tyder på, at ældre alder øger sandsynligheden for udfaldet (f.eks. rygning, hvis det er det, vi modellerer).
FEV (0.367):

En sandsynlighed på ca. 0.367 indikerer, at for hver enhedsstigning i FEV (lungekapacitet), falder sandsynligheden for udfaldet til 36.7%, når de andre variabler holdes konstante.
Dette viser, at højere FEV sandsynligvis reducerer sandsynligheden for udfaldet.
Hgt (0.553):

Sandsynligheden på 0.553 betyder, at højere højde (Hgt) har en svag positiv effekt på sandsynligheden for udfaldet, med en sandsynlighed på 55.3% for udfaldet pr. enhedsstigning i højde, når andre variabler holdes konstante.
Sex1 (0.238):

En sandsynlighed på 0.238 indikerer, at det at tilhøre kategori 1 i Sex reducerer sandsynligheden for udfaldet til 23.8% sammenlignet med referencen (Sex = 0), når alle andre variabler holdes konstante.



## What about the p-values?

Samme surdej som ved andre p-værdier.

## Hvordan med forudsigelser? hvordan gør vi det?

predicted_probabilities <- predict(log_model, type = "response")



### Probit?

det er link funktionen der styrer det. Vi har jo en sandsynlighed - og
den går ffra 0 til 1. Hvis vi skal fitte det til en model, skal skalaen
være uendelig. Den tranformation foretages af linkfunktionen.

Normalt bruger vi logitfunktionen.

Probit er når vi bruger den kumulative fordelingsfunktion for
normalfordelingen. Den er populær når man antager at der ligger en
underliggende normalitet i respons. Eksempelvis i reaktion på dosis i
toxikologi.

Der er andre.

::: keypoints
-   Use `.md` files for episodes when you want static content
:::
