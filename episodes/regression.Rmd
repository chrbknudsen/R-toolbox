---
title: 'regression'
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

Lineær regression

her er noget data.

Det ser jo ud som om det ligger på en ret linie.

Den kunne se således ud - graf

En ret linie har formen

$$ y = ax + b$$

Eller, mere generelt

$$ Y = \beta_0 + \beta_1X$$
$\beta_0$ er skæringen med y-aksen. $\beta_1$ er liniens hælding. Altså hvor
meget værdien af Y på linien ændrer sig når vi ændrer X med 1.

Y omtaler vi ofte som den afhængige variabel, og X som den uafhængige. Det er X
vi i et forsøg kan ændre på. Og så finder vi ud af hvad Y bliver når vi har gjort det.

Øvelsen i en lineær regression er at finde ud af hvilke $\beta$ der giver en
ret linie, der passer bedst med de punkter vi har.

Alle punkterne i vores datasæt har en x-værdi og en y-værdi. Og med vores ligning
kan vi for en given x-værdi beregne hvad y burde være i følge modellen. Den passer
sjælden præcist med de værdier vi har i datasættet.

Derfor beskriver vi ligningen, modellen, lidt mere generelt:

$$ Y = \beta_0 + \beta_1X + \epsilon$$

$\epsilon$ er fejlen. Det er forskellen på hvad modellen siger y er for en 
bestemt værdi af x. Og så det y i virkeligheden er i vores data.

Vi har altså et $\epsilon$ for hver observation i vores datasæt.

Når vi laver sådan en lineær model, finder R de $\beta_0$ og $\beta_1$ der
giver den mindst mulige sum af alle $\epsilon$ for alt vores data. $\epsilon$ kan
være både negativ og positiv. Så i stedet for bare at lægge dem samme, kvadrerer vi dem
først. Det gør at de alle er positive, og derfor ikke kan udligne hinanden. Det 
gør også noget af den bagvedliggende matematik enklere.

Når det er den helt enkle lineære model vi har her, kan vi springe noget matematik over, og 
beregne koefficienterne direkte:

$$\beta_1 = \frac{\sum_{i=1}^{n} (x_i - \overline{x})(y_i - \overline{y})}{\sum_{i=1}^{n} (x_i - \overline{x})^2}$$

$$\beta_0 = \overline{y} - \beta_1\overline{x}$$


Hvordan gør vi det?

lm(y~x, data = data)


summary - fortolkning af parametre.

Forudsætning: residualerne skal være normal fordelte. med andre ord, test det!

## Multipel lineær regression

Det er når vi har mere end en uafhængig parameter vi vil bruge til at forklare
den afhængige.

lm(y~x+z, data = data)

Det er årsage tila t vi bruger $\beta$ og nummererer. Det hænger også sammen
med den matematik der foregår bag kulissen, som vi ikke vil bruge tid på.

Teknikken kaldes "ordinary least squares" eller OLS regression. Så det er ikke
så farligt hvis nogen taler om OLS. Det betyder enten at de virkelig ved hvad de
taler om. Eller at de ikke har forstået så meget af det.

yderligere en omgang tolkning af parametre.

lad nu være med at overfitte. Vi kan bygge en model der 100% forklarer data.
Det er ikke det samme som at det er en god model.


## predict!

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

