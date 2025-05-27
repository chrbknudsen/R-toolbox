---
title: 'Statistical tests'
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

for dem alle følger vi metoden

1. Formulate hypotheses, 
2. Calculate test statistic, 
3. Determine p-value, 
4. Make decision


Den skal nok deles op. Og overskriftshierarkierne er et bud på hvordan.



## Enkeltprøve-tests

### One-sample chi-square test
EJ KORREKTURLÆST
#### Used for
Testing whether observed categorical frequencies differ from expected frequencies under a specified distribution.

#### Assumptions
- Observations are independent.  
- Categories are mutually exclusive and collectively exhaustive.  
- Expected count in each category is at least 5 (for the chi-square approximation to be valid).

#### Strengths
- Simple to compute and interpret.  
- Does not require the data to be normally distributed.  
- Applicable to any number of categories.

#### Weaknesses
- Sensitive to small expected counts (violates asymptotic approximation).  
- Does not indicate which categories contribute most to the discrepancy without further investigation.  
- Requires independence; cannot be used for paired or repeated measures.

#### Example

##### Hypothesis
- **Null hypothesis (H₀):** The proportions of outcomes equal the specified distribution.  
- **Alternative hypothesis (H₁):** At least one category’s proportion differs from the specified distribution.


``` r
# Observed counts of die rolls in 60 trials:
observed <- c(8, 12, 9, 11, 10, 10)

# Expected probabilities for a fair die:
p_expected <- rep(1/6, 6)

# Perform one-sample chi-square goodness-of-fit test:
test_result <- chisq.test(x = observed, p = p_expected)

# Show results:
test_result
```

``` output

	Chi-squared test for given probabilities

data:  observed
X-squared = 1, df = 5, p-value = 0.9626
```

Interpretation:
With a χ² statistic of 1 and a p-value of 0.963, we
fail to reject the null hypothesis.
This means that, given our data, there is
no evidence to conclude the die is unfair.


### One-sample z test

### One-sample t test

### One-sample Poisson test

### Shapiro–Wilk test for normalitet

### Kolmogorov–Smirnov én-prøve-test (goodness-of-fit)

### χ² goodness-of-fit test

## To-prøve-tests og parrede tests

### Two-sample F test


er det det samme som Two-sample F-test for variance?

We use this when we want to determine if two independent samples originate
from populations with the same variance.


### Paired t-test




### Two-sample t test (equal variances)

### Two-sample t test (unequal variances)

### Mann–Whitney U-test (Wilcoxon rank-sum)

### Wilcoxon signed-rank test

### Kolmogorov–Smirnov to-prøve-test

### Levene’s test for homoskedasticitet

### Bartlett’s test for homoskedasticitet

## Variansanalyse (ANOVA/ANCOVA)

### One-way ANOVA

### One-way ANCOVA

### Welch’s ANOVA (uden antagelse om lige varianser)

### Repeated-measures ANOVA

### Friedman test (nonparametrisk gentagne målinger)

### Post-hoc: Tukey HSD

### Post-hoc: Dunnett’s test

### Post-hoc: Bonferroni korrektion

## Ikke-parametriske k-prøve-tests

### Kruskal–Wallis test

### Rank correlation

### Anderson–Darling test

## Regression og korrelation

### Simple linear regression

### Multiple regression

### Pearson correlation

### Spearman’s rank correlation

### Kendall’s tau

### Multiple logistic regression

### Poisson regression

### Negative binomial regression

### Ordinal logistic regression

### Linear mixed-effects modeller (LME)

### Generalized linear mixed-effects modeller (GLMM)

### Generalized Estimating Equations (GEE)

## Kontingenstabel- og proportions-tests

### Contingency-table methods (χ² osv.)

### McNemar’s test

### Fisher’s exact test

### Barnard’s exact test

### Cochran–Armitage trend test (ordinal tabel)

### Cochran’s Q test (≥3 matched proportions)

### Stuart–Maxwell test (marginal homogenitet)

### Two-sample test for binomial proportions / Mantel–Haenszel test

### Chi-square test for R×C-tabeller

### Chi-square test for trend (Mantel-extension)

### Chi-square test for heterogenitet (2×k-tabeller)

## Incidens- og rate-tests

### One-sample test for incidence rates

### Two-sample comparison of incidence rates

### Trend-test for incidence rates over flere eksponeringsgrupper

### Exact rate ratio test

## Overlevelsesanalyse

### Log-rank test

### Parametric survival methods (Weibull)

### Cox proportional hazards model

### Accelerated Failure Time (AFT) modeller (eksponentiel, log-logistisk, …)

### Gray’s test for konkurrentrisiko

### Test af proportional hazards-antagelsen (Schoenfeld residualer)

## Aftale- og concordance-mål

### Kappa statistic

### Intraclass Correlation Coefficient (ICC)

### Bland–Altman analysis
EJ KORREKTURLÆST
#### Used for
Assessing agreement between two quantitative measurement methods by examining the mean difference (bias) and the limits of agreement.

#### Assumptions
- Paired measurements on the same subjects.  
- Differences (method A – method B) are approximately normally distributed.  
- No strong relationship between the magnitude of the measurement and the difference (homoscedasticity).

#### Strengths
- Provides both a visual (Bland–Altman plot) and numerical summary (bias and limits) of agreement.  
- Easy to interpret clinically: shows how far apart two methods can differ for most observations.  
- Does not rely on correlation, which can be misleading for agreement.

#### Weaknesses
- Assumes constant bias across range of measurements.  
- Sensitive to outliers, which can widen limits of agreement.  
- Requires adequate sample size (n ≥ 30 preferred) to estimate limits reliably.

#### Example

##### Hypothesis
- **Null hypothesis (H₀):** Mean difference between methods A and B is zero (no systematic bias).  
- **Alternative hypothesis (H₁):** Mean difference ≠ 0 (systematic bias exists).


``` r
# Simulated paired measurements on 12 subjects:
methodA <- c(100.5, 102.3,  99.7, 101.2, 100.9,  98.4, 102.0, 101.5, 100.2,  99.9, 101.8, 100.7)
methodB <- c(100.8, 102.0,  99.9, 101.5, 100.6,  98.7, 102.2, 101.3, 100.4, 100.1, 101.6, 100.9)

# Compute differences and means:
diffs <- methodA - methodB
means <- (methodA + methodB) / 2

# Calculate bias and limits of agreement:
bias <- mean(diffs)
sd_diff <- sd(diffs)
loa_upper <- bias + 1.96 * sd_diff
loa_lower <- bias - 1.96 * sd_diff

# Perform t-test on differences:
t_result <- t.test(diffs, mu = 0)

# Create Bland–Altman plot:
library(ggplot2)
ba_data <- data.frame(mean = means, diff = diffs)
ggplot(ba_data, aes(x = mean, y = diff)) +
  geom_point() +
  geom_hline(yintercept = bias,       linetype = "solid") +
  geom_hline(yintercept = loa_upper,  linetype = "dashed") +
  geom_hline(yintercept = loa_lower,  linetype = "dashed") +
  labs(
    title = "Bland–Altman Plot",
    x     = "Mean of Method A and B",
    y     = "Difference (A – B)"
  )
```

<img src="fig/stat-tests-1-rendered-bland_altman-1.png" style="display: block; margin: auto;" />

``` r
# Print numerical results:
bias; loa_lower; loa_upper; t_result
```

``` output
[1] -0.075
```

``` output
[1] -0.5560084
```

``` output
[1] 0.4060084
```

``` output

	One Sample t-test

data:  diffs
t = -1.0587, df = 11, p-value = 0.3124
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 -0.23092763  0.08092763
sample estimates:
mean of x 
   -0.075 
```

The mean difference (bias) is -0.07 units, with 95% limits of 
agreement from -0.56 to 0.41 units. 
The t-test for zero bias yields a p-value of 0.312, so we
fail to reject the null hypothesis.
This indicates that there is
no statistically significant bias; the two methods agree on average.




::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::



