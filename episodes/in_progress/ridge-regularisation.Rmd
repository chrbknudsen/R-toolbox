---
title: 'ridge-regularisation'
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

samme mølle som lasso. Men med en anden loss-funktion. 
Og den kan derfor ikke kan nå til samme resultater. Bl.a. 
at den vist ikke kan reducere koefficienter til 0.

Men det er vist autokorrelation den i højere grad kan håndtere.

funktionen er den samme - men alpha sættes til noget andet.

Udfordringerne er de samme hvad angår at tune hyperparameteren.

Så minimeringsøvelsen går på:


$$\sum_{i=1}^{n}(y_i - \sum_{j} x_{ij}\beta_j)^2 + \lambda\sum_{j=1}^p \beta_j^2$$






Eller, lidt kortere:
d
$$RSS + \lambda\sum_{j=1}^p \beta_j^2$$

Hvorfor kan det ikke gå i 0?


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

