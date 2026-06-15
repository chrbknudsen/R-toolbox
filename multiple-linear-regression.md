---
title: 'Multiple Linear Regression'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you run a multiple linear regression?
- What about conditional effects?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Learn how to build and trim a model with multiple independent variabels
- Learn how to build a model with interaction terms


::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

A linear regression is relatively simple to understand and visualise. 
We have a dependent variable that we try to predict - model - using an 
independent variable. In principle we can change the independent variable, and 
the model will predict the change in the dependent variable. We can visualise
this using a relatively simple graph, plotting the two variables against each other,
and adding the line representing the model.

But what if we have reason to believe that the dependent variable depends on
more than one independent variable?

Let us find some data for illustrating this.

Before anything else, we load the `tidyverse` package, download the data, and
read it using `read_csv()`: 




``` r
library(tidyverse)
download.file("https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BONEDEN.csv",
              destfile = "data/BONEDEN.csv", mode = "wb")
boneden <- read_csv("data/BONEDEN.csv")
```

The data records the bonedensity in different parts of the skeleton of 
female monozygotic twins, as well as height, age, weight, smoking, alcohol, tea and 
coffee-habits. We are going to study the second twins, where all variables are
suffixed with the digit "2":


``` r
density <- boneden |> select(age, contains("2"))
head(density)
```

``` output
# A tibble: 6 × 12
    age   ht2   wt2  tea2  cof2  alc2  cur2  men2  pyr2   ls2   fn2   fs2
  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
1    27   160    56    42    21     0     0     0  13.8  0.76  0.68  1.04
2    42   159    72    20    21     1     1     0  48    0.89  0.64  1.11
3    59   156    54     7    28     0     0     1  20.5  0.51  0.64  0.86
4    61   162    58    21    35     0     0     1  29.8  0.85  0.69  1.03
5    47   150    58    91     0     0     1     1  25    0.59  0.54  0.96
6    33   158    54    14    14     0     0     0   5    0.83  0.5   1.06
```

:::: callout

The package `tidyselect` is a part of the `tidyverse`. It contains functions that
allow us to choose variables/columns based on patterns in their names rather than
specifying the names directly. `contains("2")` here return all columns with a name
containing the string "2".

::::

More specically we are trying to model the bone density in the femoral shaft 
(lårbensskaft). As an intial hypothesis, we are going to assume that the density
depends on height (`ht2`), age (`age`), weight (`wt2`), tea (`tea2`) and coffee
consumption (`cof2`).

That is, we assume that there is a linear correlation between the bone density
and each of the independent variables.

The simple linear regresion between just the bone density and the height, can be
done with:


``` r
lm(fs2 ~ ht2, data = density) |> 
  summary()
```

``` output

Call:
lm(formula = fs2 ~ ht2, data = density)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.41406 -0.02810  0.00190  0.07658  0.30722 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.78744    0.71928  -2.485 0.017351 *  
ht2          0.01766    0.00445   3.969 0.000301 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.1315 on 39 degrees of freedom
Multiple R-squared:  0.2877,	Adjusted R-squared:  0.2694 
F-statistic: 15.75 on 1 and 39 DF,  p-value: 0.0003006
```
Where we pipe the output of the regression to the summary function to take a 
closer look. There is a significant correlation between bone density and height. If
we increase the height of a woman by one centimeter, the density of her femoral
shaft is expected to increase by 0.0177 $g/cm^3$. The correlation is significant,
that is, we are rather sure that the estimate of this coefficient is different from 0.

Now we would like to add the other independent variables to the model.

The model we are building can be described using math as:

$$ \text{fs2} = w_0 + w_1\text{ht2} + w_2\text{wt2} + w_3\text{tea2} + w_4\text{cof2} + \epsilon  $$
That is - we would like to figure out which coefficients $w_1$ to $w_4$, and 
which intercept $w_0$ will give us estimates of fs2, that minimizes the error 
$\epsilon$

This is pretty straight forward. Instead of running `lm(fs2~ht2, data = density`,
we add the additional independent variables using the `+` sign. And again we 
pipe the result to the summary function to take a closer look:


``` r
lm(fs2 ~ ht2 + age + wt2 + tea2 + cof2, data = density) |> 
summary()
```

``` output

Call:
lm(formula = fs2 ~ ht2 + age + wt2 + tea2 + cof2, data = density)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.247601 -0.061517  0.005634  0.067826  0.166474 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.2800114  0.7774507  -0.360 0.720887    
ht2          0.0090956  0.0046455   1.958 0.058246 .  
age         -0.0068373  0.0015669  -4.364 0.000108 ***
wt2          0.0038274  0.0014934   2.563 0.014836 *  
tea2        -0.0009246  0.0009837  -0.940 0.353677    
cof2        -0.0005310  0.0009328  -0.569 0.572778    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.1043 on 35 degrees of freedom
Multiple R-squared:  0.5978,	Adjusted R-squared:  0.5403 
F-statistic:  10.4 on 5 and 35 DF,  p-value: 3.566e-06
```
It is _that_ simple. Interpreting the results on the other hand is a bit
more complicated. 

The bone density, for a newborn woman (0 years old), that is 0 centimeters high,
weighing 0 kilogram, who does not drink either tea or coffee, is -0.28 $g/cm^3$ - 
which is obviously either impossible, or a discovery that would get you an 
invitation to Stockholm.

For each centimeter the woman grows, _if all other variables are held constant!_
the bone density is expected to _increase_ by 0.0091 $g/cm^3$.

For each year the woman grows older, _if all other variables are held constant!_
the bone density is expected to _decrease_ by 0.0068 $g/cm^3$.

For each kilogram the woman puts on weight, _if all other variables are held constant!_
the bone density is expected to _increase_ by 0.0038 $g/cm^3$.

The coefficient for the height variable is not significant (if we have decided
on a 5% significanse level), and neither consumption of teo nor coffee has a 
significant influence on bone density. According to this model.

Is this a good model? No. The coefficients for Tea and coffee consumption 
are not significant, and should not be in the model. Let us remove them.

But let us remove them one by one. First coffee that has the worst p-value:


``` r
lm(fs2 ~ ht2 + age + wt2 + tea2, data = density) |> summary()
```

``` output

Call:
lm(formula = fs2 ~ ht2 + age + wt2 + tea2, data = density)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.26036 -0.06261  0.01682  0.06366  0.17393 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.2209640  0.7632342  -0.290   0.7739    
ht2          0.0085364  0.0044976   1.898   0.0657 .  
age         -0.0068645  0.0015514  -4.425 8.58e-05 ***
wt2          0.0041140  0.0013927   2.954   0.0055 ** 
tea2        -0.0007497  0.0009257  -0.810   0.4233    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.1034 on 36 degrees of freedom
Multiple R-squared:  0.5941,	Adjusted R-squared:  0.5489 
F-statistic: 13.17 on 4 and 36 DF,  p-value: 1.048e-06
```
Note that not only is the coefficient for tea still not significant, it actually
gets "worse". On the other hand, the coefficient for weight now is larger, 
ie explains more of the variation.


:::: callout

Why does this happen? 

What the model does is "trying" to explain the variation in `fs2`, using the 
independent variables. We have an underlying assumption that we can change
those variables independently. However, they are often correlated. In this case
there is a relatively large correlation between `cof2` and  `wt2`. When we remove
`cof2` from the model, some of the variation explained by `cof2` can now be 
captured by `wt2`.

::::

We do not actually explain that much of the variation in `fs2`. The R^2^ value
tells us how much of the variation is explained by the model, and 0.5941 is 
not _that_ impressive. We will be able to explain everything, including random
noise in the data. We just need to add enough independent variables to our model.
Some of the random noise will be explained by even a random varible.

This is called `overfitting`, and one of ways we try to identify that, is by looking
at the `Adjusted R-squared` instead. This adjusts the R^2^ for the number of 
variables we have in the model. This is the measure of how good the model is, that
we prefer.


We continue our "leave-one-out" approach. `tea2` is the "worst" performing 
variable measured by the p-value, and that is the next one we will remove:




``` r
lm(fs2 ~ ht2 + age + wt2 , data = density) |> summary()
```

``` output

Call:
lm(formula = fs2 ~ ht2 + age + wt2, data = density)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.273490 -0.058038  0.005241  0.067527  0.169512 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.569569   0.627355  -0.908  0.36981    
ht2          0.010524   0.003751   2.806  0.00796 ** 
age         -0.006489   0.001474  -4.404 8.74e-05 ***
wt2          0.004077   0.001385   2.943  0.00559 ** 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.1029 on 37 degrees of freedom
Multiple R-squared:  0.5867,	Adjusted R-squared:  0.5531 
F-statistic:  17.5 on 3 and 37 DF,  p-value: 3.078e-07
```
Now we have a model where all coefficients are significant.

:::: callout
What about the intercept? 

The estimate of the intercept is not significant. Is that a problem?

No, not in this case. The intercept is the estimate of what `fs2`  would be
if all the independent variables are 0. That might be meaningful for age, but
definitely not for height or weight. 

Also the thing we are interested in is not actually making predictions, in that
case we would like a better estimate of the intercept, but in studying the 
effect of height, age and weight on bonedensity.

::::

:::: challenge

The dataset contains more variables than we have examined here. Alcohol consumption
`alc`, and how many years the individual women have been smoking `pyr`. 

We also only studied half of the dataset, the variables ending in "2". Data on
the other twins have variables ending in "1". 

Build a model predicting the bonedensity of the femoral shaft `fs1` using a selection
of the variables `age`, ht1`, `wt1`, `tea1`, `cof1`, `alc1` and `pyr1`. 

Make sure that only significant (p<0.05) variables are included. 

What is the adjusted R squared value?


:::: solution


``` r
dens_exercise <- boneden |> 
  select(age, contains("1"), -c(cur1, ls1, fn1, men1 ))

model_1 <- lm(fs1~., data = dens_exercise)
model_2 <- lm(fs1 ~ age + ht1 + wt1+ cof1 + alc1 +pyr1, data = dens_exercise)
model_3 <- lm(fs1 ~ age + ht1 + wt1 + alc1 +pyr1, data = dens_exercise)
model_4 <- lm(fs1 ~ age + ht1 + wt1 + pyr1, data = dens_exercise)
model_5 <- lm(fs1 ~ age + ht1 + pyr1, data = dens_exercise)
model_6 <- lm(fs1 ~ age + ht1, data = dens_exercise)

summary(model_6)$adj.r.squared
```

``` output
[1] 0.2555525
```


::::

::::


## Categorical data

We also have categorical variables in the data. Can we use them?

Yes!

### First way - categorical values as independent variables

Let us add information about menopausal status, `men2`:


``` r
density <- density |> 
  mutate(men2 = factor(men2))

cat_model <- lm(fs2 ~ ht2 + age + wt2 + men2, data = density)
summary(cat_model)
```

``` output

Call:
lm(formula = fs2 ~ ht2 + age + wt2 + men2, data = density)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.282979 -0.049356 -0.006728  0.066710  0.171457 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.532553   0.643852  -0.827 0.413764    
ht2          0.010650   0.003898   2.732 0.009799 ** 
age         -0.008232   0.002098  -3.924 0.000389 ***
wt2          0.004191   0.001414   2.963 0.005450 ** 
men21        0.053401   0.051460   1.038 0.306514    
men22       -0.026286   0.059796  -0.440 0.662939    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.1032 on 35 degrees of freedom
Multiple R-squared:  0.6067,	Adjusted R-squared:  0.5505 
F-statistic:  10.8 on 5 and 35 DF,  p-value: 2.462e-06
```

There are three different categorical values in `men2`. 0: premenopausal,
1: Postmenopausal and 2: Unknown or hysterectomy.

If we want to add categorical data to the model, we need to make sure they are
encoded as categorical, otherwise the model will treat them as continous values. 
We do that by running `factor()` on the relevant variable.

Again this is relatively simple, the interpretation on the other hand is a bit
more complex. The coefficients for `ht2`, `age` and `wt2` now tells us how the value
of `fs2` changes for the base case 0, premenopausal. The coefficient of `factor(men2)1`
tells us that there is an added "bonus" to the bonedensity to become postmenopausal.
And `factor(men2)2` that there is a "penalty" of -0.026286 to have the "unknown" 
status. The coefficients are not significant, so this might be a bad example.

### The second way - interaction

Maybe the influence of menopause status is not direct, but rather in the form that
the coefficient for `wt2` depends on menopausal status. Ie increasing weight 
might lead to increasing bonedensity. But to different degrees depending on menopausal status.

We can add this interaction term to the model by multiplying the categorical variable
to the variabel where we suspect that there might be an interaction:


``` r
interact_model <- lm(fs2 ~ ht2 + age + wt2*men2, data = density)
summary(interact_model)
```

``` output

Call:
lm(formula = fs2 ~ ht2 + age + wt2 * men2, data = density)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.264590 -0.053534 -0.000568  0.057129  0.168441 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.355334   0.648878  -0.548 0.587642    
ht2          0.009842   0.004014   2.452 0.019661 *  
age         -0.007966   0.002084  -3.823 0.000555 ***
wt2          0.003272   0.002281   1.434 0.160913    
men21       -0.166698   0.196497  -0.848 0.402355    
men22        0.149021   0.264316   0.564 0.576703    
wt2:men21    0.003455   0.003070   1.126 0.268439    
wt2:men22   -0.002592   0.004025  -0.644 0.524081    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.1021 on 33 degrees of freedom
Multiple R-squared:  0.637,	Adjusted R-squared:  0.5601 
F-statistic: 8.274 on 7 and 33 DF,  p-value: 8.211e-06
```
Once again it is "simple" to do, more complicated to interpret.

The (estimated) coefficients for `ht2`and `age` should be understood as before.

But now we have a good deal more coefficients. `factor(men2)1` and `factor(men2)2` should also 
be understood as before.

`wt2` is also still the same as before. But we have two new. If the specific woman
is postmenopausal, there is an additional term, wt2:men21 that needs to be
added to the prediction.



:::: challenge

What is the prediction for `fs2` for a 52 year old, 164 centimeter high, postmenopausal
woman weighing 62 kg?

:::: solution

We find it by adding all the terms:

* intercept: -0.355334
* 52 × age: 52 × -0.007966 = -0.414232
* 164 × ht2: 164 × 0.009842 = 1.613488
* 62 × wt2: 62 × 0.003272 = 0.202864
* factor(men2)1 = -0.166698 (because men2 is = 1)
* 65 × wt2:men21 = 62 × 0.003455 = 0.21421

The result is: 1.094298

An alternative way would be to construct a dataframe containing the values 
for which we want to make the prediction, and use the `predict` function:


``` r
new_data <- data.frame(
  ht2 = 164,
  age = 52,
  wt2 = 62,
  men2 = factor(1, levels = levels(density$men2))
)

predict(interact_model, newdata = new_data)
```

``` output
       1 
1.094928 
```


::::

::::


::::::::::::::::::::::::::::::::::::: keypoints 

- We can do linear regression on multiple independent variables
- Be careful not to overfit - only retain variables that are significant (and sensible)
- We can fit just as well on categorical variables - but make sure they _are_ categorical
- Interpreting linear models with multiple variables are not trivial
_ Interpreting linear models with interaction terms are even less trivial

::::::::::::::::::::::::::::::::::::::::::::::::

