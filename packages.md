---
title: 'packages'
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

## Why

Hold dine pakker opdateret! Hold også R opdateret, men husk også at holde
pakkerne opdateret.

Hvordan finder vi ud af hvilke af vores pakker der er forældet? 

packages tab er fin.

Vi kan også bruge `old.packages()`, der ser hvilke pakker vi har installeret,
og fortæller om der er en nyere udgave tilgængelig.

update.packages() tilbyder også at installere dem.


## library vs package::funktion()

og package:::funktion()


## Package management

Hvad gør man når man vil have en helt bestemt version af en pakke - eksempelvis
fordi den pakker man gerne vil bruge, ikke er tilgængelig for den version af R
man kører.
p_load()
p_delete()
pacman pakken.-
p_install_version
p_load_gh("trinker/regexr")

Til når man i sit script egentlig ikke gider 
p_load(tidyverse,stringr,httr,jsonlite,lubridate)

pacman::p_update(update = F)


``` r
library(pacman)
pacman::p_update(update = F)
```

``` output
[1] "codetools" "lattice"   "MASS"      "Matrix"    "spatial"  
```

``` r
p_load(tidyverse)
```
## Conflicts

I øvrigt - saml indlæsning af dine pakker ét sted. I starten af scriptet. 
Når du indlæser et bibliotek, indlæser du alle funktionerne i det bibliotek.
Eksemplet er tidyverse filter.

Det er lettere at gennemskue hvad der sker i et script hvis lag fungerer 
på samme måde gennem hele scriptet. Har du brug for en speciel udgave så
brug :: notationen.

dplyr::lag(1:5)
stats::lag(1:5)

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

