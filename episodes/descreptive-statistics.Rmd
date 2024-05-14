---
title: 'descreptive_statistics'
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

## And the purpose of statistics


Statistics is the science of collecting, summarizing, presenting and interpreting data, and of using them to estimate the magnitude of associations and test hypotheses. It has a central role in medical investigations” 

Typer af data

kumulativ fordelingsfunktion - graf -> 25%, 50% og 75% kvantiler

Og så kan vi jo også beregne en 5% kvantil - der hvor 5% af observationerne er
mindre (og 95% er større)

Hvordan beregner vi middelværdi?

Hvorda beregner vi spredning/standardafvigelse

Hvordan med variansen?

Hvordan ville vi egentlig sige noget om variationen i data? 

-> forskellen på alle observationerne og middelværdien.

-> kvadreret
-> men det giver noget snask i enhederne
-> så vi tager kvadratroden.

Herfra videre til normalfordelingen

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

