---
title: 'notes'
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

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge 

## Challenge 1: Can you do it?

What is the output of this command?

```r
paste("This", "new", "lesson", "looks", "good")
```

:::::::::::::::::::::::: solution 

## Output
 
```output
[1] "This new lesson looks good"
```

:::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::


``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
# download.file("https://raw.githubusercontent.com/KUBDatalab/R-PUFF/main/data/FEV.csv", "data/fev.csv", mode = "wb")
```
## Data

Ingen har givet os data. Så her er noget data på lungevolumen hos børn/unge 
i alderen 3-19, både rygere og ikke rygere, og af begge køn. Højden 
har vi også. Højde er i tommer. Volumen tror vi nok er i liter.


``` r
fev <- read_csv("data/fev.csv")
summary(fev)
```

## scatterplot analysis

Vi ved ikke helt hvad en "scatterplot analysis" er. Men her er et scatterplot:


``` r
fev %>% ggplot(aes(x=Hgt, y = FEV)) +
  geom_point() 
```
Det får os til at tro at der måske er en lineær sammenhæng mellem højde og lungevolumen.

## En ret linie

ggplot kan lave det direkte. Men husk at sætte "method" i geom_smooth:

``` r
fev %>% ggplot(aes(x=Hgt, y = FEV)) +
  geom_point() +
  geom_smooth(method = "lm")
```


## Sådan en linie har en ligning

$$y = ax + b$$


Or:

$$FEV = aHgt + b$$
a er hældningen (slope). b is the intercept between the line and the y-axis.

R can find slope and intercept for us:




``` r
model <- lm(FEV ~ Hgt, data = fev)
model
```

Read the formula as: FEV is a function of Hgt. Hgt is the independent variabel. FEV the dependent. But this is not a statistics course, you can read about that in your textbook. Intercept is -5.433. Try to guess what value the slope has.


What else:


``` r
summary(model)
```
Here we get the p-values of the estimates of intercept and slope, handily coded with *** to indicate different levels of significance $\alpha$.

We also get a $R^2$ value describing the propotion of the variability of the data described by the model.


In general it is a good idea to take a look at the residuals:


``` r
hist(model$residuals)
```
The residuals should be normal distributed (one of the assumptions of the
linear regression, but we assume that has been covered in the textbook).

Also take a look at the actual residuals, comparing the predicted values
with the residuals:

``` r
plot(fitted(model), model$residuals)
```
If there is a pattern in the residuals it is an indication that there is more signal in the data than we found with the model. Here it looks like there is something happening in the higher end of FEV - the dispersion of the values is qualitatively different in the two ends of the fit.


Maybe that dispersion at the end is due to Sex?

We can make the previous plot, just colored by Sex (Sex is recorded as
0's and 1's). We need to coeerce Sex to a categorical variable using `factor()`:


``` r
fev %>% ggplot(aes(x=Hgt, y = FEV, color = factor(Sex))) +
  geom_point() +
  geom_smooth(method = "lm")
```
The dispersion is probably not related to Sex. We almost only have boys/men with a height above ~70 inches. And we see a large variability amongst them, i overensstemmelse med den større variabilitet vi ser blandt mænd i snart sagt alle sammenhænge.

## might it be age - multiple regression!

Maybe FEV is dependent on both Height **and** Age?

``` r
model2 <- lm(FEV ~Age + Hgt , data = fev)
model2 %>% summary()
```
In the simpler model Adjusted R-squared was 
0.7533. This larger model represents a slight improvement.

$$FEV = \beta_2Age + \beta_1Hgt + \beta_0$$

What if we only look at the girls/women?



``` r
lm(FEV ~Age + Hgt , data = fev %>% filter(Sex == 0)) %>% summary()
```
Adjusted $R^2$ is worse!


and for the men/boys?

``` r
lm(FEV ~Age + Hgt , data = fev %>% filter(Sex == 1)) %>% summary()
```

It actually gets better. 

## Can we make a model where we bake in Sex?

Now it get complicated enough that we really need to think about how to 
explain it...

It might be easier after looking at the result


``` r
lm(FEV ~ Age:factor(Sex) + Hgt:factor(Sex) + Age*Hgt, data = fev)  
```
The intercept is what it is.

For each unit increase in Age, FEV decreases by 0.334. For each unit increase in
Hgt FEV increases by 0.0534. factor(Sex)1:Hgt tells us, that boys/men "experience"
a decrease in FEV of 0.00292 for each unit increase of Height. Or:
Girls _and_ boys get an increase of FEV of 0.0534 for each inch of height. But 
FEV for boys is corrected downwards by 0.00292. 

Similar with Age. Girls _and_ boys decrease their FEV with 0.334 for each year. But
boys get an "compensatory" increase of 0.0303.

Age:Hgt is a bit more complicated. We _multiply_ the age and height of both sexes - 
a unit increase in _that_ value increses FEV with 0.00605. 

Does the final bit make sense? Physiologically? No idea.

Looking closer at the model result:


``` r
lm(FEV ~ Age:factor(Sex) + Hgt:factor(Sex) + Age*Hgt, data = fev)  %>% summary()
```
The model is now so complicated that we see elements that are not significant.
Maybe the model is too complicated.
 




## correlation matrix
Pairwise correlations between the variables:

``` r
cor(fev)
```

The diagonal is very uninteresting.

We can get the pairwise $R^2$ directly:

``` r
cor(fev)^2
```

We can visualise it:


``` r
library(corrplot)

corrplot(cor(fev), bg = "black")
```
We may need to play around with background color to even be able to see the
small values.

We think this function gives a nicer plot:

``` r
library(GGally)
ggpairs(fev, progress = F)
```


## non-linear model

We have already seen a non-linear model!


``` r
lm(FEV ~ Age:factor(Sex) + Hgt:factor(Sex) + Age*Hgt, data = fev)
```
We multiply Age and Hgt. That is not linear!

lm can still be used. A non-linear model is simply a linear model with non-linear
dependent variables.


``` r
lm(FEV ~ Age + Hgt + Sex, data = fev)
```

If we want the polynomial expansion for fx Hgt (automagically):

``` r
lm(FEV ~ poly(Hgt, 2, raw=TRUE), data=fev) %>% summary()
```
Or, if we want to control it more directly:

``` r
lm(FEV ~ Hgt + I(Hgt^2), data = fev)
```
We need to encapsulate the quadratic expression in `I()` - otherwise R will
try to interpret stuff before lm can do its math.


``` r
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
```


``` r
mydata$rank <- factor(mydata$rank)
view(mydata)
```


``` r
myprobit <- glm(admit ~ gre + gpa + rank, family = binomial(link = "probit"), 
    data = mydata)

mylogit <- glm(admit ~ gre + gpa + rank, family = binomial(link = "logit"), 
    data = mydata)
```


``` r
myprobit %>% summary()
```

``` r
mylogit
```


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

