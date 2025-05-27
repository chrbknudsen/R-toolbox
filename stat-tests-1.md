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


::::::::::::::::::::::::::::::::::::::::::::::::

:::: instructor
Den her side er virkelig ikke egnet til undervisningsbrug. Det er oversigten
med eksempler og ret korte forklaringer.
Hele siden kan nok med fordel deles ret meget op.
::::

A collection of statistical tests

For all tests, the approach is:

1. Formulate hypotheses
2. Calculate test statistic
3. Determine p-value
4. Make decision




## Enkeltprøve-tests

### One-sample chi-square test

EJ KORREKTURLÆST

#### Used for

Testing whether observed categorical frequencies differ from expected frequencies under a specified distribution.

**Real-world example:** Checking if the observed M&M candy color proportions match the manufacturer’s claimed distribution.

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
- **Null hypothesis (H₀):** The proportions of M&M colors equal the manufacturer’s claimed distribution.  
- **Alternative hypothesis (H₁):** At least one color’s proportion differs from the claimed distribution.



``` r
# Observed counts of M&M colors:
observed <- c(red = 20, blue = 25, green = 15, brown = 18, orange = 12, yellow = 10)

# Manufacturer's claimed proportions:
p_expected <- c(red = 0.20, blue = 0.20, green = 0.20, brown = 0.20, orange = 0.10, yellow = 0.10)

# Perform one-sample chi-square goodness-of-fit test:
test_result <- chisq.test(x = observed, p = p_expected)

# Display results:
test_result
```

``` output

	Chi-squared test for given probabilities

data:  observed
X-squared = 3.1, df = 5, p-value = 0.6846
```

Interpretation:
The test yields χ² = 3.1 with a p-value = 0.685. We
fail to reject the null hypothesis.
Thus, there is
no evidence to conclude a difference from the claimed distribution..


### One-sample z test

EJ KORREKTURLÆST!

#### Used for

- Testing whether the mean of a single sample differs from a known population mean when the population standard deviation is known.  
- **Real-world example:** Checking if the average diameter of manufactured ball bearings equals the specified 5.00 cm when σ is known.

#### Assumptions
- Sample is a simple random sample from the population.  
- Observations are independent.  
- Population standard deviation (σ) is known.  
- The sampling distribution of the mean is approximately normal (either the population is normal or n is large, e.g. ≥ 30).

#### Strengths
- More powerful than the t-test when σ is truly known.  
- Simple calculation and interpretation.  
- Relies on the normal distribution, which is well understood.

#### Weaknesses
- The true population σ is only very rarely known in practice.  
- Sensitive to departures from normality for small samples.  
- Misspecification of σ leads to incorrect inferences.

#### Example

##### Hypothesis
- **Null hypothesis (H₀):** The true mean diameter μ = 5.00 cm.  
- **Alternative hypothesis (H₁):** μ ≠ 5.00 cm.


``` r
# Sample of diameters (cm) for 25 ball bearings:
diameters <- c(5.03, 4.97, 5.01, 5.05, 4.99, 5.02, 5.00, 5.04, 4.96, 5.00,
               5.01, 4.98, 5.02, 5.03, 4.94, 5.00, 5.02, 4.99, 5.01, 5.03,
               4.98, 5.00, 5.04, 4.97, 5.02)

# Known population standard deviation:
sigma <- 0.05

# Hypothesized mean:
mu0 <- 5.00

# Compute test statistic:
n <- length(diameters)
xbar <- mean(diameters)
z_stat <- (xbar - mu0) / (sigma / sqrt(n))

# Two-sided p-value:
p_value <- 2 * (1 - pnorm(abs(z_stat)))

# Output results:
z_stat; p_value
```

``` output
[1] 0.44
```

``` output
[1] 0.6599371
```


Interpretation:
The sample mean is 5.004 cm. The z-statistic is 0.44 
with a two-sided p-value of 0.66. We
fail to reject the null hypothesis.
Thus, there is
no evidence to conclude a difference from the specified diameter of 5.00 cm.


### One-sample t test

EJ KORREKTURLÆST!

#### Used for
- Testing whether the mean of a single sample differs from a known or hypothesized population mean when the population standard deviation is unknown.  
- **Real-world example:** Determining if the average exam score of a class differs from the passing threshold of 70%.

#### Assumptions
- Sample is a simple random sample from the population.  
- Observations are independent.  
- The data are approximately normally distributed (especially important for small samples; n ≥ 30 reduces sensitivity).

#### Strengths
- Does not require knowing the population standard deviation.  
- Robust to mild departures from normality for moderate-to-large sample sizes.  
- Widely applicable and easily implemented.

#### Weaknesses
- Sensitive to outliers in small samples.  
- Performance degrades if normality assumption is seriously violated and n is small.  
- Degrees of freedom reduce power relative to z-test.

#### Example

##### Hypothesis

- **Null hypothesis (H₀):** The true mean exam score μ = 70.  
- **Alternative hypothesis (H₁):** μ ≠ 70.


``` r
# Sample of exam scores for 20 students:
scores <- c(68, 74, 71, 69, 73, 65, 77, 72, 70, 66,
            75, 68, 71, 69, 74, 67, 72, 70, 73, 68)

# Hypothesized mean:
mu0 <- 70

# Perform one-sample t-test:
test_result <- t.test(x = scores, mu = mu0)

# Display results:
test_result
```

``` output

	One Sample t-test

data:  scores
t = 0.84675, df = 19, p-value = 0.4077
alternative hypothesis: true mean is not equal to 70
95 percent confidence interval:
 69.1169 72.0831
sample estimates:
mean of x 
     70.6 
```

Interpretation:
The sample mean is 70.6. The t-statistic is 0.85 with 19 degrees of freedom and a two-sided p-value of 0.408. We
fail to reject the null hypothesis.
Thus, there is
no evidence to conclude the average score differs from the passing threshold of 70.


### One-sample Poisson test

EJ KORREKTURLÆST!

#### Used for
- Testing whether the observed count of events in a fixed period differs from a hypothesized Poisson rate.  
- **Real-world example:** Checking if the number of customer arrivals per hour at a call center matches the expected rate of 30 calls/hour.

#### Assumptions
- Events occur independently.  
- The rate of occurrence (λ) is constant over the observation period.  
- The count of events in non-overlapping intervals is independent.

#### Strengths
- Exact test based on the Poisson distribution (no large-sample approximation needed).  
- Valid for small counts and rare events.  
- Simple to implement in R via `poisson.test()`.

#### Weaknesses
- Sensitive to violations of the Poisson assumptions (e.g., overdispersion or time-varying rate).  
- Only assesses the overall rate, not the dispersion or clustering of events.  
- Cannot handle covariates or more complex rate structures.

#### Example

##### Hypothesis
- **Null hypothesis (H₀):** The event rate λ = 30 calls/hour.  
- **Alternative hypothesis (H₁):** λ ≠ 30 calls/hour.


``` r
# Observed number of calls in one hour:
observed_calls <- 36

# Hypothesized rate (calls per hour):
lambda0 <- 30

# Perform one-sample Poisson test (two-sided):
test_result <- poisson.test(x = observed_calls, T = 1, r = lambda0, alternative = "two.sided")

# Display results:
test_result
```

``` output

	Exact Poisson test

data:  observed_calls time base: 1
number of events = 36, time base = 1, p-value = 0.272
alternative hypothesis: true event rate is not equal to 30
95 percent confidence interval:
 25.21396 49.83917
sample estimates:
event rate 
        36 
```

Interpretation:
The test reports an observed count of 36 calls versus an expected 30 calls, yielding a p-value of 0.272. We
fail to reject the null hypothesis.
Thus, there is
no evidence to conclude the call rate differs from 30 calls/hour.


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
Assessing agreement between two quantitative measurement methods by examining 
the mean difference (bias) and the limits of agreement. It tests if any difference
is constant across the range of measurements, and if there is heteroskedasticity
in the data (are there differences that are dependent on measurement levels)
**Real-world example:** Comparing blood pressure readings from a new wrist monitor and a standard sphygmomanometer.


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
# Simulated paired blood pressure measurements (mmHg) on 12 subjects:
wrist   <- c(120, 122, 118, 121, 119, 117, 123, 120, 118, 119, 122, 121)
sphyg   <- c(119, 121, 117, 122, 118, 116, 124, 119, 117, 120, 121, 122)

# Compute differences and means:
diffs    <- wrist - sphyg
means    <- (wrist + sphyg) / 2

# Calculate bias and limits of agreement:
bias     <- mean(diffs)
sd_diff  <- sd(diffs)
loa_up   <- bias + 1.96 * sd_diff
loa_low  <- bias - 1.96 * sd_diff

# Test for zero bias:
t_test   <- t.test(diffs, mu = 0)

# Bland–Altman plot:
library(ggplot2)
ba_df <- data.frame(mean = means, diff = diffs)
ggplot(ba_df, aes(x = mean, y = diff)) +
  geom_point() +
  geom_hline(yintercept = bias,    linetype = "solid") +
  geom_hline(yintercept = loa_up,   linetype = "dashed") +
  geom_hline(yintercept = loa_low,  linetype = "dashed") +
  labs(title = "Bland–Altman Plot",
       x = "Mean of Wrist & Sphyg Measurements",
       y = "Difference (Wrist – Sphyg)")
```

<img src="fig/stat-tests-1-rendered-bland_altman-1.png" style="display: block; margin: auto;" />

``` r
# Print numerical results:
bias; loa_low; loa_up; t_test
```

``` output
[1] 0.3333333
```

``` output
[1] -1.596741
```

``` output
[1] 2.263408
```

``` output

	One Sample t-test

data:  diffs
t = 1.1726, df = 11, p-value = 0.2657
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 -0.2923355  0.9590022
sample estimates:
mean of x 
0.3333333 
```

The mean difference (bias) is 0.33 units, with 95% limits of 
agreement from -1.6 to 2.26 units. 
The t-test for zero bias yields a p-value of 0.266, so we
fail to reject the null hypothesis.
This indicates that there is
no statistically significant bias; the two methods agree on average.




::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content


::::::::::::::::::::::::::::::::::::::::::::::::



