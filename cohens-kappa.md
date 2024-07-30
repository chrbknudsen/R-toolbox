---
title: 'cohens-kappa'
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

## TL;DR
Cohens Kappa bruges til at måle om kategorisering af ting sker pålideligt.

To eller flere "raters" kategoriserer et eller andet. 

Skal et udsagn i et spørgeskema vurderes positivt eller negativt?

Der er ikke tilstrækkeligt objektive kriterier til at lade computeren gøre det. 
Så der skal et skøn fra et menneske ind over. Og best practice er at lade flere skønne.

I humanvidenskaberne taler man om et resultat er "intersubjektivt overførbart". Om
to personers subjektive vurderinger, baseret på tilgængelige data, er ens. 

Cohens Kappa lader os teste hvor ensartede skønnene er, og tager højde for at to 
raters måske er enige ved et tilfælde, og ikke fordi de skønner ens.

Cohens Kappa kan bruges direkte for to kategoriske variable. Enten to nominale 
eller to ordinale variable. Men kun for præcist to raters.

Der findes varianter, der er gode til forskellige ting:

* Vægtet kappa (weighted kappa), der kun kan bruges for ordinale variable
* Light's kappa, 
* Fleiss kappa. 

Særligt Light's og Fleiss kappa er nyttige når man har mere end to raters.
Forskellene er subtile - så læs selv op på dem.

## den korte forklaring
Funktionen kan findes i biblioteket vcd

``` r
library(vcd)
```

``` output
Loading required package: grid
```

``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
```

``` output
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

Vi genererer 30 observationer, med to raters, og de kategoriske muligheder:
dpe, dis, sch, neu, other.





``` r
head(diagnoses)
```

``` output
# A tibble: 6 × 2
  rater1 rater2
  <chr>  <chr> 
1 dep    dep   
2 dep    dep   
3 dep    dep   
4 dep    dep   
5 dep    dep   
6 dep    dep   
```


Dette er et eksempel på data hvor Cohens Kappa faktisk bruges. To psykologer 
vurderer 30 forskellige patienter, og stiller en diagnose. Som en del af deres
træning, testes de på om de stiller samme diagnoser som mere erfarne.

Vi skal have en tabel med deres ratings:


``` r
tabel <- table(diagnoses)
tabel
```

``` output
      rater2
rater1 dep dis neu oth sch
   dep   7   1   3   0   2
   dis   0   8   0   0   2
   neu   0   0   1   0   0
   oth   0   0   0   4   0
   sch   0   0   0   0   2
```
Det er denne tabel der skal ind i funktionen:
Var der fuld enighed mellem de to raters, 


``` r
res.k <- Kappa(tabel)
res.k
```

``` output
            value    ASE     z  Pr(>|z|)
Unweighted 0.6507 0.0999 6.513 7.372e-11
Weighted   0.5588 0.1282 4.359 1.304e-05
```

Vægtet eller uvægtet? Hvis der ikke er vægte, tæller vi bare om der er enighed.
Med vægte - så er der nogen uenigheder der er dårligere end andre. 
Det kan godt være to raters er uenige om farven på blomsten er rød eller mørkerød.
Men det er værre hvis de er uenige om den er rød eller gul. Det styres af vægtene.


Et 95% konfidensinterval (pil ved argumenter hvis du vil have et andet) kan findes
ved:

``` r
confint(res.k)
```

``` output
            
Kappa              lwr       upr
  Unweighted 0.4548491 0.8464610
  Weighted   0.3075771 0.8100699
```
Er det godt? Den uvægtede Kappa for vores ratere er 0.65. [Fleiss et al (2003)](https://onlinelibrary.wiley.com/doi/book/10.1002/0471445428), mener at vide,
at 



|value             |Beskrivelse                          |
|:-----------------|:------------------------------------|
|>0.75             |Excellent agreement beyond chance    |
|0.4> value < 0.75 |Fair to good agreement beyond chance |
|<0.4              |Poor agreement beyond chance         |


[McHugh (2012)](https://doi.org/10.11613/BM.2012.031)
har en tabel:


|Value of K  |Level of agreement | % of data that are reliable|
|:-----------|:------------------|---------------------------:|
|0 - 0.20    |None               |                      0 - 4%|
|0.21 - 0.39 |Minimal            |                     4 - 15%|
|0.40 - 0.59 |Weak               |                    15 - 35%|
|0.60 - 0.79 |Moderate           |                    35 - 63%|
|0.80 - 0.90 |Strong             |                    64 - 81%|
|Above 0.90  |Almost Perfect     |                   82 - 100%|

Men den er nok lidt kæk i sine vurderinger. 61% enighed betragtes som godt.
Det er ofte ikke helt godt nok.
Så overvej nøje hvad den faktisk bruges til. I et klinisk laboratorium er det 
ikke så godt hvis 40% af vurderinger er forkerte.

## Forudsætninger

For Cohens kappa:

To outcome categorical variables - ordinal eller nominal

De to outcome variable skal have præcis de samme kategorier

Parrede observationer. Det vil sige, at hver ting skal være kategoriseret to 
gange, af to uafhængige raters (eller metoder)

De samme to raters skal bruges for alle deltagere.

Hypoteser:

Null hypotesen, kappa = 0, hvis der er enighed, er det tilfældigt.
Den alternative hypotese, kappa != 0, Enigheden er forskellig fra tilfældigheder.

## Den tekniske forklaring
Kappa er defineret som:

$$\kappa = P_0 - \frac{P_e}{1-P_e}$$


$P_0$ er andelen af observeret enighed, $P_e$ er andelen af tilfældig enighed.

Når man ser hvordan den beregnes, lugter det af $\chi^2$-testen. 
Det er ikke et tilfælde:
Feingold, Marcia (1992). "The Equivalence of Cohen's Kappa and Pearson's Chi-Square Statistics in the 2 × 2 Table." Educational and Psychological Measurement 52(1): 57-61. <http://hdl.handle.net/2027.42/67443>

Hvis der er to raters og to udfald, er test statistikken for Kappa den samme
som for Pearsons chi i anden. Så de er i familie.

Anyway, definitionen betyder at værdierne kan gå fra -1 til 1. Hvis den er 0,
er enigheden ikke bedre end hvad vi ville få tilfældigt. Ved negative værdier
er den mindre end hvad vi ville få tilfældigt. Hvis positiv er enigheden større
end ved tilfældighed.



``` r
##        Doctor2
## Doctor1 Yes No Total
##   Yes   a   b  R1   
##   No    c   d  R2   
##   Total C1  C2 N
```

a, b, c og d er de observerede, talte, værdier
$R_1 = a + b$ 
$R_2 = c + d$
$C_1 = a + c$
$C_2 = b + d$
og

ad $N = a + b + c + d$ adf 



$$P_0 = \frac{a + c}{N}$$

Det var den lette.

$P_e$ finder vi ved at finde sandsynligheden for at begge raters tilfældigt siger ja.

Doctor1 siger Ja til $\frac{R_1}{N}$ tilfælde.
Doctor2 siger Ja til $\frac{C_1}{N}$ tilfælde
Sandsynligheden for at de tilfældigt begge siger ja er 
$R1/N * C1/N$


Så finder vi sandsynligheden for at de begge tilfældigt siger nej
Doctor1 siger nej til $R_2/N$
Doctor2 siger nej til $\frac{C_2}{N}$
Sandysnligheden for at de begge tilfældigt siger nej er:
$R_2/N * C_2/N$

Sandsynligheden for at de er enige er derfor:
$R_1/N * C_1/N + R_2/N * C_2/N$

Så har vi Pe. Og kan beregne Kappa som:
$\kappa = ((a+d)/N - (R_1/N * C_1/N + R_2/N * C_2/N))   / 1 - (R_1/N * C_1/N + R_2/N * C_2/N)$

Det bliver noget mere langt, men ikke nødvendigvis langhåret, hvis der er 
mere end en kategori.

Der er en formel for SE. 

$SE_\kappa = \frac{P_e + P_2^2 - \sum_i P_{i+}P_{+i}(P_{i+} + P_{+i})}{N(1+ P_e)^2}$

Og så kan der beregnes konfidensintervaller på sædvanligvis efter normalfordelingen:

$\kappa +- Z_{\alpha/2} SE_\kappa$

i+ og +i er række og kolonne summerne.

Gider vi gøre det? Nej, det gider vi ikke.
Der er en funktion.

## Tolkning

## Andet

Hvor bruges det? Blandt andet inden for psykiatri/psykologi. Visse kliniske 
observationer kan pege på "personlighedsforstyrrelse" eller "Neurose". Hvilken 
af de to diagnoser der stilles, afhænger i ret høj grad af et skøn. Derfor får 
vi to uafhængige læger til at stille diagnosen.

Når de læger bliver trænet, bliver de bedt om at vurdere forskellige 
beskrivelser af patienter, og de testes på i hvor høj grad de er enige med 
mere rutinerede læger.

Men den kan bruges også til meget andet. Markedsundersøgeres bedømmelse af 
svar fra respondenter. Eller hvis vi bygger en algoritme der kan se forskel
på hunde og katte på billeder - er den enig med et menneske?

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

