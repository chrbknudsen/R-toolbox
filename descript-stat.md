---
title: 'descript_stat'
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

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Det kan være en udfordring hvis deltagene ikke ved hvad et 
gennemsnit er. 

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


Hvad er deskriptive/summary-stats?

lokalitet - median, gennemsnit
spredning - standardafvigelse, varians. IQR.

Men også forekomst af NA-værdier.


```r
levels(palmerpenguins::penguins$sex)
```

```output
[1] "female" "male"  
```



::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

