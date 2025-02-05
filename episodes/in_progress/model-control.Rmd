---
title: 'model-control'
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

Det har du lært i undervisningen. Så måske du skulle have fulgt med der.

Men, overordnet. Kontrol eller tjek af om modellen opfylder betingelserne for
at man må bruge den. Det kunne være:

Fordeling af residualer. Er de normalfordelte. Er der tydelige mønstre i residualplottet
linearitetsantagelsen
multikollinearitet
outliers.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

