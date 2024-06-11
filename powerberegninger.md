---
title: 'powerberegninger'
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

https://www2.compute.dtu.dk/courses/introstat/slides02323/week12.pdf

Vi laver en undersøgelse af et eller andet. Vi vil gerne finde svar på noget - 
virker denne sovemedicin bedre end en anden - for en given værdi af bedre.
Det kunne være "patienten sover to timer længere". Vi ønsker nu at vide, hvor
stor en stikprøve vi skal tage, for at se en forskel på to timer.

Der er to måder det kan gå galt på. Vi kan lave en type 1 fej - hvor vi
afviser nul-hypotesen. Selvom den faktisk er sand. Det er et tilfælde af at 
medicinen ikke virker, men vi tror den virker.

Type to - er der hvor vi ikke afviser nul-hypotesen, selvom den alternative
hypotese er sand (og vi derfor burde have afvist nul-hypotesen). Det er en
situation hvor medicinen virker - men det opdager vi ikke.

Risikoen betegner vi som hhv \alpha og \beta :
P(type 1 fejl) = alpha

P(type 2 fejl) = beta

Testens styrke er 1-beta. da beta er sandsynligheden for at medicinen virker, 
uden at vi opdager det, er styrken derfor et udtryk for sandsynligheden for at 
vi opdager at medicinen virker - når den faktisk virker.

Powerberegningerh handler om at kunne planlægge sin undersøgelse, så man
på forhånd har en ide om hvor præcise resultater (eksempelvis konfidensinterval) 
man kan forvente.
Og at på forhånd have en ide om hvor stor en effekt man kan forvente at opdage.

En ting er selve forsøgets udformning. Dobbeltblindt, hvornår gives medicin,
den slags. Men her koger det ned til:
Hvis jeg ønsker en given præcision og/eller power - hvor stor en stikprøve 
skal jeg så foretage. Nyttigt, da der ofte er omkostninger forbundet ved at 
indsamle data - men også etik - hvor vi foretager forsøg på levende væsener.

Så  - vi har brug for at vide hvor stor en effekt vi enten ønsker, eller 
kan forvente at se. Vi har brug for et signifikans niveau. 

I beregningerne indgår 
* n stikprøvestørrelsen
* delta - effektstørrelsen ofte udtrykt i cohens et eller ndet
* power - defineret ovenfor
* sd - standardafvigelsen i populationen
* sig.level - signifikansniveauet vi arbejder med.

sd er implicit 1, da det delta vi arbejder med måles i standardafvigelsesenheder.
Det er med andre ord implicit givet i definitionen af cohens d, som er 
forskellen mellem to middelværdier, divideret med den samlede standardafvigelse.
Ønsker vi at specificere en anden standard afvigelse, skal vi tage højde for det
i beregningen af effektstørrelsen. Hvis effektstørrelsen ønskes at være 0.2 og 
vi ved at standardafvigelsen er 2 - så er vores delta nu effektstørrelse*standardafvigelse
lig 2*0.2 = 0.4

Exactly one of the parameters n, delta, power, sd, and sig.level must be passed as NULL

Og det skal den, fordi det er en vi ønsker at beregne. Vi har en holdning til delta,
et ønske om en bestemt power, et estimat på sd (som altså hænger sammen med 
delta og derfor er implicit), og et ønske signifikansniveau. Hvor stor skal n 
være for at vi kan opnå det?
Eller - vi har kendt alt andet end delta - hvor stor en forskel kan vi forvente
 at kunne se. Med andre ord, det er relativt enkelt. Vi plotter bare tallene
 ind i funktionen, og får et svar.


``` r
 power.t.test(n = 500, sig.level = 0.05, power = 0.80, type = "two.sample")
```

``` output

     Two-sample t test power calculation 

              n = 500
          delta = 0.1773605
             sd = 1
      sig.level = 0.05
          power = 0.8
    alternative = two.sided

NOTE: n is number in *each* group
```


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

