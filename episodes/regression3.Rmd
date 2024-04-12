---
title: 'logistisk'
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



## Logistisk Regression
Hvad nu hvis den afhængige variabel ikke er kontinuært, men kategorisk?

Først binær.

### Formel for Logistisk Regression

Logistisk regressionsmodel kan matematisk beskrives ved:

$$\text{logit}(p) = \log\left(\frac{p}{1 - p}\right) = \beta_0 + \beta_1X_1 + \beta_2X_2 + \ldots + \beta_kX_k$$

hvor:
- \( p \) er sandsynligheden for, at den afhængige variabel \( Y \) tager værdien 1.
- \( \beta_0, \beta_1, \ldots, \beta_k \) er koefficienter, som modellen estimerer.
- \( X_1, X_2, \ldots, X_k \) er de uafhængige variabler.



# fit modellen
model <- glm(y ~ x1 + x2, family = binomial, data = data)

# koefficienter og p-værdier
summary(model)

# predict
new_data <- data.frame(x1 = c(1, 2, 3), x2 = c(4, 5, 6))
predict(model, newdata = new_data, type = "response")

## andre
glm kan andet. Det kommer vi ikke ind på.

### Probit? 

det er link funktionen der styrer det. Vi har jo en sandsynlighed - 
og den går ffra 0 til 1. Hvis vi skal fitte det til en model, skal skalaen
være uendelig. Den tranformation foretages af linkfunktionen.

Normalt bruger vi logitfunktionen.

Probit er når vi bruger den kumulative fordelingsfunktion for normalfordelingen.
Den er populær når man antager at der ligger en underliggende normalitet i 
respons. Eksempelvis i reaktion på dosis i toxikologi.

Der er andre.


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

