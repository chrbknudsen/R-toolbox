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

## Two-sample F-test for variance

We use this when we want to determine if two independent samples originate
from populations with the same variance.

## listen over tests

### Enkeltprøve-tests

One-sample chi-square test

One-sample z test

One-sample t test

One-sample Poisson test

Shapiro–Wilk test for normalitet

Kolmogorov–Smirnov én-prøve-test (goodness-of-fit)

χ² goodness-of-fit test

### To-prøve-tests og parrede tests

Two-sample F test

Paired t-test

Two-sample t test (equal variances)

Two-sample t test (unequal variances)

Mann–Whitney U-test (Wilcoxon rank-sum)

Wilcoxon signed-rank test

Kolmogorov–Smirnov to-prøve-test

Levene’s test for homoskedasticitet

Bartlett’s test for homoskedasticitet

### Variansanalyse (ANOVA/ANCOVA)

One-way ANOVA

One-way ANCOVA

Welch’s ANOVA (uden antagelse om lige varianser)

Repeated-measures ANOVA

Friedman test (nonparametrisk gentagne målinger)

Post-hoc: Tukey HSD

Post-hoc: Dunnett’s test

Post-hoc: Bonferroni korrektion

### Ikke-parametriske k-prøve-tests

Kruskal–Wallis test

Rank correlation

Anderson–Darling test

### Regression og korrelation

Simple linear regression

Multiple regression

Pearson correlation

Spearman’s rank correlation

Kendall’s tau

Multiple logistic regression

Poisson regression

Negative binomial regression

Ordinal logistic regression

Linear mixed-effects modeller (LME)

Generalized linear mixed-effects modeller (GLMM)

Generalized Estimating Equations (GEE)

### Kontingenstabel- og proportions-tests

Contingency-table methods (χ² osv.)

McNemar’s test

Fisher’s exact test

Barnard’s exact test

Cochran–Armitage trend test (ordinal tabel)

Cochran’s Q test (≥3 matched proportions)

Stuart–Maxwell test (marginal homogenitet)

Two-sample test for binomial proportions / Mantel–Haenszel test

Chi-square test for R×C-tabeller

Chi-square test for trend (Mantel-extension)

Chi-square test for heterogenitet (2×k-tabeller)

### Incidens- og rate-tests

One-sample test for incidence rates

Two-sample comparison of incidence rates

Trend-test for incidence rates over flere eksponeringsgrupper

Exact rate ratio test

### Overlevelsesanalyse

Log-rank test

Parametric survival methods (Weibull)

Cox proportional hazards model

Accelerated Failure Time (AFT) modeller (eksponentiel, log-logistisk, …)

Gray’s test for konkurrentrisiko

Test af proportional hazards-antagelsen (Schoenfeld residualer)

### Aftale- og concordance-mål

Kappa statistic

Intraclass Correlation Coefficient (ICC)

Bland–Altman analyse


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

