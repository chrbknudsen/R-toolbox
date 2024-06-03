---
title: 'reproducible-analysis'
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
Når vi laver dataanalyse vil vi gerne gøre det reproducerbart. Resultatet 
i morgen skal gerne være det samme som i dag. Resultatet i dag skal gerne være 
det samme som i går.

En udfordring kan være hvis det data vi har liggende i hukommelsen på computeren
ikke er det vi havde forventet. Hvis der ligger noget fra i går, og vi ikke kan
huske at vi gangede alle tal med et eller andet, så kan vi få uventede resultater.

Derfor - Rmarkdown. Vi samler kode, forklaringer, prosatekst og andet godt i et 
dokument. Og når vi så knitr dokumentet, så gøres det i en helt frisk R-session.
Det sker uden at der er noget i hukommelsen, alle biblioteker er væk. Med det
resultat at vi får samme svar _hver_ gang.

rækkefølge af hvad vi gør. Hvis vi gør A og så B, kan vi få et andet resultat end
hvis vi gør B og dernæst A.

Dokumentation af hvad vi gør, men især hvorfor. 

Navngivning af chuncks.

Indlæs data med kode! Det er fint at lave peg og klik - men få
koden ind i markdown dokumentet. 

Behøver man gøre det i markdwon? Nej, det behøver man ikke.
Men så skal man selv være lidt mere vågen.



::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

