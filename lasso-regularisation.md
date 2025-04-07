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

Det vi typisk gør, er at vi forsøger at minimere en såkaldt loss-funktion.
Det er typisk RSS (kvadrerede residualer).

$$RSS = \sum(y_i - \hat{y_i})^2$$

Algoritmen der klarer beregningerne for os justerer på snedig vis $\beta$'erne 
så RSS bliver så lille som muligt.
Vi kan tænke på det som forskellen på de "sande" værdier som vi kender, og de
forudsagte værdier, baseret på modellen og vors uafhængige variable. For alle
vores observationer beregner vi forskellen, kvadrerer dem og lægger dem alle sammen.

Når vi bygger modellen, er en af de ting vi skal tage stilling til, hvor mange
og hvilke variable vi skal have med. Har vi tilstrækkeligt mange med kan vi
forudsige y meget præcist. Men det fører let til at modellen i virkeligheden 
ikke har fundet sammenhænge mellem den afhængige og de uafhængige variable, men
i stedet har "lært" datasættet uden ad.

Den bedste model er derfor den hvor vi har så få uafhængige variable med som muligt.
Men samtidig forklarer mest muligt af variationen

Og alt det her hører nok hjemme et andet sted end hvor vi specifik taler om 
LASSO. 



Et problem er at vi skal tage stilling til, er hvor mange og hvilke variable
vi skal have med i modellen. Hvis vi medtager tilstrækkeligt mange parametre,
skal det nok lykkes at forklare alt.

En teknik der kan udvælge er lasso. I stedet for at optimere på RSS, optimerer vi på:


$$\sum_{i=1}^{n}(y_i - \sum_{j} x_{ij}\beta_j)^2 + \lambda\sum_{j=1}^p |\beta_j|$$





Eller, lidt kortere:
d
$$RSS + \lambda\sum_{j=1}^p |\beta_j|$$



Så det udtryk vi nu forsøger at minimere - algoritmen gør det for os - 
er nu tilføjet summen af alle vores koefficienter - i absolutte værdier, så de
ikke kommer til at udligne hinanden. Og så ganger vi en faktor på. Det betyder
at hvis der er mange variable med i modellen - så bliver straf-leddet større.
Og derfor vil algoritmen kunne opnå et bedre resultat, ved at lade nogen af 
koefficienterne blive 0. Så bidrager de ikke længere til loss-funktionen, og den
bliver mindre. 

$\lambda$ styrer hvor hårdt vi straffer modellen for at have for mange eller
for store koefficienter. Det betyder også at der er en parameter som ikke 
styres af algoritmen, men som vi selv skal vælge. Det er en hyperparameter,
som vi selv skal optimere på.

Netto resultatet er at vi lader en algoritme styre hvilke variable vi skal
have med i modellen. Og så kan vi ikke rigtigt beskyldes for at være gået på
p-fisketur.


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

her skal vi nok lege lidt med data og parametre. For det er et dårligt 
eksempel i x giver det fin mening at drat ikke skal være med. Men det er noget
snask at z ikke piller nogen ud overhovedet. For den feature vil vi gerne vise.

``` r
y <- mtcars$hp
x <- mtcars %>% 
  select(mpg, wt, drat, qsec) %>% 
  data.matrix()
z <- data.matrix(mtcars[, c('mpg', 'wt', 'drat', 'qsec', 'cyl', 'disp')])
```
Og nu kan vi så lave en Lasso regression. funktionen hedder glmnet. Og den kan
lave andre former for regression. Hvis det er lasso, skal argumentet alpha 
sættes til 1. Vi skal selv vælge straf termen lambda. Vi prøver med 1.5


``` r
set.seed(47)
model <- glmnet(x,y,alpha = 1, lambda = 1.5)
coef(model)
```

``` output
5 x 1 sparse Matrix of class "dgCMatrix"
                    s0
(Intercept) 488.868159
mpg          -2.851152
wt           22.951695
drat          .       
qsec        -20.098919
```
Og så får vi et resultat for koefficienterne. Bemærk at koefficienten fro `drat`
er blevet helt væk. Ved man lidt om biler er det ikke meget overraskende (men
dog en lille smule).

Men er det den bedst tænkelige lambda?

Det betyder at vi har brug for en måde at sammenligne. Hvis vi bygger en model
med en bestemt lambda - hvor god er den så rent faktisk. Og det kan vi sammenligne
med en anden model med et andet lambda.

Så vi krydsvaliderer. Vi tager vores data, og deler det op i eksempelvis 10
"folds" eller portioner. Så vælger vi en lambda, og fitter modellen på de 9 sidste fold, og 
ser hvor godt den forudsiger de "sande" værdier i den 1. fold. Det gentager vi,
hvor vi fitter på alle fold, bortset fra den anden. Osv. Når vi er færdige
har vi 10 kvalitetsmål for en bestemt værdi af lambda. Og tager gennemsnittet
af dem. Så har vi et kvalitetsmål for en bestemt værdi af lambda.

Gentag processen for en masse forskellige lambda, og vi kan vælge den lambda
der har det bedste mål for kvaliteten.
Det gider vi heller ikke gøre i hånden. Så der er heldigvis en funktion der 
gør det:


``` r
set.seed(47)
model <- cv.glmnet(x, y, alpha = 1)
```

Modellen indeholder nu værdier for mange forskellige lambda.
Det kan vi plotte:


``` r
plot(model)
```

<img src="fig/lasso-regularisation-rendered-unnamed-chunk-6-1.png" style="display: block; margin: auto;" />
Vi kan kigge på plottet og finde den bedste værdi. Vi kan også trække det
ud af modellen:


``` r
best_l <- model$lambda.min
best_l
```

``` output
[1] 2.668219
```
Nu ved vi hvilket lambda vi skal bruge, og så kan vi fitte vores lasso model
med den:


``` r
best_model <- glmnet(x,y,alpha = 1, lambda = best_l)
coef(best_model)
```

``` output
5 x 1 sparse Matrix of class "dgCMatrix"
                   s0
(Intercept) 484.20742
mpg          -2.95796
wt           21.37988
drat          .      
qsec        -19.43425
```

CAVE. Det kan godt være det er værd at skalere værdierne. 


``` r
range(mtcars$mpg)
```

``` output
[1] 10.4 33.9
```

``` r
range(mtcars$wt)
```

``` output
[1] 1.513 5.424
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

