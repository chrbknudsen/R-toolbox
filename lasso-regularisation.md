---
title: 'lasso-regularisation'
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





## Least Absolute Shrinkage and Selection Operator.

Når vi laver en lineær model, forsøger vi at finde koefficienterne i udtrykket:

$$\hat{y}= \beta_0 + \beta_1*x_1 + \beta_2*x_2 + \beta_3*x_3 +....$$

Og vi er specifikt ude efter dem der minimerer forskellen på de "sande" værdier
af y vi kender, og modellens forudsigelse $\hat{y}$

Det vi typisk gør, er at vi forsøger at minimere dette udtryk:
Det er typisk RSS (kvadrerede residualer).

$$RSS = \sum(y_i - \hat{y_i})^2$$
Jo mindre det tal er, jo bedre er modellen.

Et problem er at vi skal tage stilling til, er hvor mange og hvilke variable
vi skal have med i modellen. Hvis vi medtager tilstrækkeligt mange parametre,
skal det nok lykkes at forklare alt.

En teknik der kan udvælge er lasso. I stedet for at optimere på RSS, optimverer vi på:

$$\sum_{i=1}^{n}(y_i - \sum_{j} x_{ij}\beta_j)^2 + \lambda\sum_{j=1}^p |\beta_j|$$


$$\mathcal{L}(\mathbf{w}) = \frac{1}{2N} \sum_{i=1}^{N} (y_i - \mathbf{x}_i^T \mathbf{w})^2 + \alpha \sum_{j=1}^{p} |w_j|
$$
Eller, lidt kortere:

$$RSS + \lambda\sum_{j=1}^$$


I lasso, forsøger vi at minimere:

\(RSS + lambda * summen af beta_j\)

hvor j går fra 1 til p (antallet af variable vi har i vores model), og lambda
er større end eller lig 0.

Det svarer til at vi for hvert led i summen for rss, tilføjer et lambda*beta_j

Hvordan finder vi lambda? Vi vælger det der giver os mindst MSE.

Så vi beder en algoritme om at minimere udtrykket ovenfor - og det er lidt mere
komplekst.

Det vi fitter er nemlig ikke blot modellen, det er også:

$\sum_{i=1}^{n}(y_i - \sum_{j} x_{ij}\beta_j)^2 + \lambda\sum_{j=1}^p |\beta_j|$

x'erne er vores prediktive variable. y er hvad vi prøver at fitte - det er det
"sande" svar, det vi vil forudsige. Hvis vores model - det midterste sumtegn - 
rammer præcis, giver det præcist y, og y minus modellen giver så 0. 
Vi lægger så den absolutte værdi af vores koefficienter sammen, og ganger med 
lambda.

Vi skal finde den optimale værdi af lambda - og algoritmen vil lade nogle af 
prediktorerne (beta-værdierne) ende på 0, fordi det minimerer det samlede udtryk.

Det er en fiks måde algoritmisk at få pillet prediktorer ud, der ikke bidrager.

Hvordan gør man så?

Vi napper mtcars som eksempel. Vi skal nok have fundet et andet på et tidspunkt.

og så skal vi bruge pakker der implementerer løsningen - for vi gider ikke selv
skrive koden.


``` r
library(tidyverse)
library(glmnet)
```

``` output
Loading required package: Matrix
```

``` output

Attaching package: 'Matrix'
```

``` output
The following objects are masked from 'package:tidyr':

    expand, pack, unpack
```

``` output
Loaded glmnet 4.1-8
```

Implementeringen af lasso i glmnet, kræver at den afhængige variabel ligger i en
vektor, og at prediktor variablene ligger i en matrix.

Vi vil forudsige antallet af hestekræfter i en bil, baseret på mpg, wt, drat og
qsec

Og cyl, og disp - de er ikke med i hvad jeg i skrivende stund følger, men lad os prøve


``` r
y <- mtcars$hp
x <- mtcars %>% 
  select(mpg, wt, drat, qsec) %>% 
  data.matrix()
z <- data.matrix(mtcars[, c('mpg', 'wt', 'drat', 'qsec', 'cyl', 'disp')])
```



``` r
set.seed(2)
model <- cv.glmnet(z, y, alpha = 1)

best_l <- model$lambda.min
plot(model)
```

<img src="fig/lasso-regularisation-rendered-unnamed-chunk-4-1.png" style="display: block; margin: auto;" />
Det er ganske mystisk at jeg ikke får samme optimale lambda som det eksempel
jeg følger. det er ok at der er små forskelle også mellem de enkelte kørsler 
der er et stokastisk element i krydsvalideringen.

men eksemplet finder lambda 5.616. Det er ret langt fra de 2-3 jeg finder.

Det skal der nok bores lidt i.


``` r
best_model <- glmnet(z,y,aplha = 1, lambda = best_l)
coef(best_model)
```

``` output
7 x 1 sparse Matrix of class "dgCMatrix"
                     s0
(Intercept) 315.5141283
mpg          -2.8386873
wt            7.4066930
drat         16.3768363
qsec        -14.8706337
cyl           5.9732285
disp          0.1470938
```
Hvilket får mig til at mene at jeg skal holde mig til
de oprindelige fire, og pille cyl og disp ud - for her er der ingen
parametre der pilles ud - og det er en lidt træls pointe at misse.

Det er nemlig også den primære forskel på lasso og ridge. Ridge regressionen 
kan indskrænke koefficienter mod 0, mens lasso kan indskrænke dem til 0. Og altså helt
fjerne det - det får vi ved at sætte alpha til 0.

Og så er der en elastic net regularisering der også kommer automatisk her - det er 
når vi sætter alpha til noget mellem 0 og 1.


``` r
best_model$beta
```

``` output
6 x 1 sparse Matrix of class "dgCMatrix"
              s0
mpg   -2.8386873
wt     7.4066930
drat  16.3768363
qsec -14.8706337
cyl    5.9732285
disp   0.1470938
```


``` r
summary(best_model)
```

``` output
          Length Class     Mode   
a0        1      -none-    numeric
beta      6      dgCMatrix S4     
df        1      -none-    numeric
dim       2      -none-    numeric
lambda    1      -none-    numeric
dev.ratio 1      -none-    numeric
nulldev   1      -none-    numeric
npasses   1      -none-    numeric
jerr      1      -none-    numeric
offset    1      -none-    logical
call      5      -none-    call   
nobs      1      -none-    numeric
```



::::callout
## regularisation

Vi gør modellen mere regulær - eller ordnet, ved at tilføje elementer til problemet,
der gør det lettere at løse. Det er vist ikke en helt perfekt forklaring. Men den
nærmer sig.

::::

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

