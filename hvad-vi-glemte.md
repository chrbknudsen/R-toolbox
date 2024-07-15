---
title: 'hvad-vi-glemte'
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

Hvad vi glemte at fortælle dig om.

1. Det kan godt se ud som om vi får et bestemt resultat. Men hver gang
vi har numeriske operationer der involverer decimaler - alt numeric - kan vi
forvente at der er numeriske fejl. Det er ikke det samme som fejl - det er 
det vi ser når 1/3 bliver repræsenteret som 33%


``` r
7/13 - 3/31
```

``` output
[1] 0.4416873
```

er forskelligt fra 

``` r
print(7/13 - 3/31, digits = 16)
```

``` output
[1] 0.4416873449131513
```



``` r
integrand <- function(x) {1/((x+1)*sqrt(x))}
integrate(integrand, lower = 0, upper = Inf)
```

``` output
3.141593 with absolute error < 2.7e-05
```


Uwes maxim
Computers are cheap and thinking hurts

Optimering af kode:
Your first duty is to create clear correct code.
Only optimize when the code is debugged and stable
and when optimization is likely to make a significant difference. Spending
an our to save a millisecond is not useful.

R is a good thing because it is a language.
The power of language is abstraction.
The way to make abstractions in R is to write functions.

og det er når vi begynder at skrive funktoner, at vi bevæger os fra
at bruge R, til at programmere i R.

Når der skrives funktioner - så skriv små funktioner. Der gør en ting. Og kun
en ting. Det er langt lettere at finde fejlen, når (ikke hvis) den opstår.
Og små funktioner har større sandsynlighed for at være nyttige i andre 
sammenhænge.

Funktioner hvis output er en funktion.


``` r
mycumfun <- ecdf(rnorm(10))
mycumfun(0)
```

``` output
[1] 0.3
```


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

