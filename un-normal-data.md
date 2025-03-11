---
title: 'What to do with data that is not normal'
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

So your data is not normally distributed. What to do?

First of all - should it actually _be_ normally distributed?

The normal distribution is the most normal. But that just means that it is the
most common, not that the majority of data is normally distributed. 

problemet optræder typisk fordi man ønsker at lave en regression. 

Men det er vigtigt at lade være med at gå i panik - for man kan sagtens lave
en lineær regression selvom data ikke er normal fordelte. Se evt de antagelser
vi gør os omkring den lineære regression. Der står intet om at data skal være
normalfordelte.

Så hvis data følger en anden fordeling, så kan det være fint nok. Men inden
man finder det bedste bud fra LINK TIL SIDEN OM HVILKEN FORDELING DATA FØLGER, 
bør man overveje om der er domæneviden der kan fortælle os hvilken fordeling
data følger.

Og så laver man "bare" en glm med rette link og familie i stedet for en lm, no 
problem.

Lav under alle omstændigheder et density plot, og kig på hvordan data ser ud.
Hvis plottet er højreskævt (det er hvor halen til højre er længere  end halen 
på venstre side. Det betyder at de fleste observationer ligger til venstre).
kan man evt løse problemet ved at transformere data med en log eller kvadratrods 
transformation. Box-Cox transformationen kan også hjælpe. kvadratroden bruges
når skewness er moderat.

Er det venstreskævt (så er halen til venstre længere), vil man ofte kunne løse 
problemet med de inverse funktioner - dvs exp eller kvadrat.

Kan problemet ikke løses på den måde, behøver man ikke nødvendigvis gå i panik 
alligevel. For ANOVA er ret robust overfor afvigelser fra normalitet.


Så er der glm. brug poisson-regression hvis det er tælledata.
Logistisk ved binære og den negative binomiale regression hvis der er overdispersion (og det 
må vi hellere definere hvad er)

Så er der de ikke-parametriske metoder. Mann-Whitney U-test som alternativ til
t-testen ved to uafhængige stikprøver.
Wilcoxon signed-rank test - som alternativ til den parrede t-test.
kruskal-wallis. Alternativ til ANOVA for flere grupper.


4. Robuste metoder
Robust regression: Mindsker indflydelsen af outliers og leverer mere stabile estimater.
Median regression: Fokuserer på medianen i stedet for gennemsnittet.
5. Bootstrapping
Bootstrapping: En resampling-metode, der ikke kræver antagelser om datafordelingen. Bruges til at estimere konfidensintervaller og standardfejl.
6. Kernel Density Estimation (KDE)
KDE: Bruges til at estimere tæthedsfunktionen for data uden at antage en bestemt fordeling.
7. Permutation tests
Permutation tests: Bruger resampling til at teste hypoteser uden at antage en bestemt fordeling.
8. Visualisering
Q-Q plots: Bruges til at sammenligne datafordelingen med en teoretisk fordeling.
Box plots: Viser median, kvartiler og potentielle outliers.

## robust regression


``` r
# Installer og indlæs MASS-pakken

library(MASS)

# Generer et eksempel-dataset med outliers
set.seed(123)
x <- rnorm(100)
y <- 2 * x + rnorm(100)

# Tilføj nogle outliers
y[c(10, 20, 30)] <- y[c(10, 20, 30)] + 10

# Visualiser dataene
plot(x, y, main="Data med outliers", xlab="X", ylab="Y")
abline(lm(y ~ x), col="blue", lwd=2) # Tilføj almindelig lineær regressionslinje

# Udfør robust regression
robust_model <- rlm(y ~ x)

# Tilføj robust regressionslinjen til plottet
abline(robust_model, col="red", lwd=2)
legend("topleft", legend=c("Lineær regression", "Robust regression"), col=c("blue", "red"), lwd=2)
```

<img src="fig/un-normal-data-rendered-unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

``` r
# Vis resultaterne
summary(robust_model)
```

``` output

Call: rlm(formula = y ~ x)
Residuals:
     Min       1Q   Median       3Q      Max 
-1.93154 -0.63535 -0.08813  0.64806 11.03570 

Coefficients:
            Value   Std. Error t value
(Intercept) -0.1185  0.1040    -1.1396
x            1.9961  0.1139    17.5258

Residual standard error: 0.9663 on 98 degrees of freedom
```

## median regression

Den skal måske være sin egen episode

Median regression, også kendt som kvantil regression med kvantilen sat til 0.5, fokuserer på at estimere medianen af den afhængige variabel i stedet for gennemsnittet. Dette gør den robust over for outliers og skewed data. Vi kan bruge quantreg-pakken i R til at udføre median regression.


``` r
# Installer og indlæs quantreg-pakken

library(quantreg)
```

``` output
Loading required package: SparseM
```

``` r
# Generer et eksempel-dataset med outliers
set.seed(123)
x <- rnorm(100)
y <- 2 * x + rnorm(100)

# Tilføj nogle outliers
y[c(10, 20, 30)] <- y[c(10, 20, 30)] + 10

# Visualiser dataene
plot(x, y, main="Data med outliers", xlab="X", ylab="Y")
abline(lm(y ~ x), col="blue", lwd=2) # Tilføj almindelig lineær regressionslinje

# Udfør median regression
median_model <- rq(y ~ x, tau=0.5)

# Tilføj median regressionslinjen til plottet
abline(median_model, col="green", lwd=2)
legend("topleft", legend=c("Lineær regression", "Median regression"), col=c("blue", "green"), lwd=2)
```

<img src="fig/un-normal-data-rendered-unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

``` r
# Vis resultaterne
summary(median_model)
```

``` warning
Warning in rq.fit.br(x, y, tau = tau, ci = TRUE, ...): Solution may be
nonunique
```

``` output

Call: rq(formula = y ~ x, tau = 0.5)

tau: [1] 0.5

Coefficients:
            coefficients lower bd upper bd
(Intercept) -0.19314     -0.35067  0.07348
x            2.08636      1.90977  2.26538
```


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

