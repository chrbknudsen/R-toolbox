---
title: 'making-a-new-course'
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
Sådan laver du et ny kursus baseret på denne toolbox.


på kodesiden af https://github.com/KUBDatalab/R-toolbox er der en grøn knap.
"use this template". vælg 
"create a new repository"

Giv det et navn, og gør det public.
Husk at vælge at det er et kubdatalab repo, ellers kommer det til at ligge hos dig selv.

Der skal redigeres ting - config.yaml

title
source

created - ændre dato.

episodes - tag kun dem med du vil have med. Juster evt. rækkefølge

Husk også at evt. opdateringer ikke følger med. Rettelser i originalmaterialet
slår ikke igennem på den nye side.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

