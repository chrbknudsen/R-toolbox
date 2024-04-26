---
title: 'logistisk'
teaching: 10
exercises: 2
editor_options: 
  markdown: 
    wrap: 72
---

::: questions
-   How do you write a lesson using R Markdown and `{sandpaper}`?
:::

::: objectives
-   Explain how to use markdown with the new lesson template
-   Demonstrate how to include pieces of code, figures, and nested
    challenge blocks
:::

## Logistisk Regression

Hvad nu hvis den afhængige variabel ikke er kontinuært, men kategorisk?
Altså at vi forsøger at forudsige eksempelvis "syg/rask", baseret på en
række kontinuærte uafhængige variable.

Først binær, vi har en række variable, baseret på dem forsøger vi at
forudsige om udfaldet er det ene eller det andet af to mulige udfald.

### Formel for Logistisk Regression

Logistisk regressionsmodel kan matematisk beskrives ved:

$$\text{logit}(p) = \log\left(\frac{p}{1 - p}\right) = \beta_0 + \beta_1X_1 + \beta_2X_2 + \ldots + \beta_kX_k$$

hvor: 

$p$ er sandsynligheden for, at den afhængige variabel $Y$ tager
værdien 1. 

$\beta_0, \beta_1, \ldots, \beta_k$ er koefficienter, som
modellen estimerer. 

\*$X_1, X_2, \ldots, X_k$ er de uafhængige
variabler.


Funktionen ser således ud:

```r
library(ggplot2)

logistic_function <- function(x) {
  1 / (1 + exp(-x))
}


x_values <- seq(-10, 10, by = 0.1)
logistic_values <- logistic_function(x_values)
data <- data.frame(x = x_values, logistic = logistic_values)


ggplot(data, aes(x = x, y = logistic)) +
  geom_line() +
  labs(title = "Logistic Function",
       x = "Logit value x",
       y = "Probability p") +
  theme_minimal()
```

<img src="fig/regression3-rendered-unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

Og pointen er altså at vi hælder noget input ind, og så får vi
langt henadvejen enten 0 eller 1 ud. Der vil stort set altid
være en gråzone, hvor sandsynligheden for et bestemt udfald er
en del større end 0, men også en del mindre end 1. Vi vil 
ofte vælge at sætte grænsen ved 50%, men vær opmærksom på, at 
det betyder at vi får et udfald der er 0, selvom sandsynligheden
for at svaret er 1 i virkeligheden er 49%


# fit modellen

Alt det er udemærket. Måden vi i praksis gør det på er ved:

model \<- glm(y \~ x1 + x2, family = binomial, data = data)

# koefficienter og p-værdier

summary(model)

# predict

new_data \<- data.frame(x1 = c(1, 2, 3), x2 = c(4, 5, 6)) predict(model,
newdata = new_data, type = "response")

## andre

glm kan andet. Det kommer vi ikke ind på.

### Probit?

det er link funktionen der styrer det. Vi har jo en sandsynlighed - og
den går ffra 0 til 1. Hvis vi skal fitte det til en model, skal skalaen
være uendelig. Den tranformation foretages af linkfunktionen.

Normalt bruger vi logitfunktionen.

Probit er når vi bruger den kumulative fordelingsfunktion for
normalfordelingen. Den er populær når man antager at der ligger en
underliggende normalitet i respons. Eksempelvis i reaktion på dosis i
toxikologi.

Der er andre.

::: keypoints
-   Use `.md` files for episodes when you want static content
-   Use `.Rmd` files for episodes when you need to generate output
-   Run `sandpaper::check_lesson()` to identify any issues with your
    lesson
-   Run `sandpaper::build_lesson()` to preview your lesson locally
:::
