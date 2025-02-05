---
title: 'missing-data'
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
tre slags manglende data. 

* Missing completely at random
* Missing at random
* Missing not at random

Tilgange

listwise deletion. Vi sender spørgeskemaer ud. og ikke alle svarer.
Dem sletter vi. Nogen svarer ikke på alle spørgsmål. Dem sletter vi også.
Vi kunne også kalde det for "complete case analysis" - vi analyserer kun
på de komplette cases.

pairwise deletion

Imputationer

Hot deck imputation

mean substitution. Dårlig ide

regressions subsistitution. Lidt bedre. Men ikke god.

Multiple imputation - lader til at være god.
maximum likelihood imputation


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

