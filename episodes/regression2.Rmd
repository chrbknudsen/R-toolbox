---
title: 'Ikke lineær'
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

Vi taler stadig om at det er et kontinuerligt y. 

lm(y~x:z + x*z)

summary, fortolkning af parametre og koefficienter.

## predict() 

som hjælp til at forstå parametrene.

## polynomisk
Og hvorfor vi en gang imellem skal bruge I()


::::::::::::::::::::::::::::::::::::: keypoints 

- De her ikke lineære ting er i virkeligheden lineære modeller.
- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

