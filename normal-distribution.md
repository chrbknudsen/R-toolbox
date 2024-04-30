---
title: 'The normal distribution'
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

## The Normal Distribution

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

The normal distribution follows this formula:

$$
f(x) = \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
$$

It returns the probability density for a given x, population mean and population
standard deviation. We can see that it is the "true" mean and standard deviation for
the entire population, basically for the _entire_ universe, because they are 
written using greek letters.

If we plot the distribution, it looks like this:

![The Normal Distribution. Source: https://en.m.wikipedia.org/wiki/File:The_Normal_Distribution.svg](fig/The_Normal_Distribution.svg){alt='The Normal Distribution.'}
The area under the curve is 1, equivalent to 100%.

The normal distribution have a lot of nice mathematical properties, some of which
are indicated on the graph. 

CLT fører til at vi kan betragte middelværdien for vores data som normalfordelt.
selv når disse data ikke _er_ normalfordelte.

I praksis bruger vi t-fordelingen, der ser lidt anderledes ud - vi har nemlig 
ikke kendskab til hele populationens sande middelværdi og varians. t-fordelingen
har tykkere haler, der giver os større sikkerhed for vores konklusioner.

Hvad gør vi så? Hvis vi tager i princippet uendeligt mange stikprøver, samples,
og beregner middelværdierne, så vil disse middelværdier følge normalfordelingen.

hvis vi fremstiller linealer, og har en tese om at de er præcist 20 cm lange,
som de skal være. det er mu

Nu tager vi en stikprøve på størrelsen "n" fra produktionen. Måler dem, og beregner gennemsnittet.

Måler vi præcist nok, vil det gennemsnit formentlig adskille sig fra 20 cm. Det
gennemsnit er X-bar. 

I dette tilfælde antager vi at vi kender standardafvigelsen for vores produktion.

Hvis vi normerer alle vores målinger, så gennemsnittet er 0. Det gør vi ved at trække
gennemsnittet fra alle målinger. Og så standardafvigelsen er 1. Det gør vi ved at 
dividere alle målinger med standardafvigelsen.

Så vil gennemsnittet af vores stikprøve, fordi CLT, følge en normalfordeling.
Og vi kan se hvor det gennemsnit, denne z-score, placerer sig på den sande normalfordeling.

og ud fra de matematiske egenskaber fra normalfordelingen, kan vi se hvor underlig den
middelværdi vi måler, er.

og det er stadig ikke en specielt god forklaring...


Hvordan tester vi så om et datasæt er normalt fordelt?

Start med summary. I en normalfordeling er median og middelværdi ens.

Dernæst et histogram. Hvor mange observationer falder i et bestemt interval.
Det histogram skal helst ligne en normalfordeling.

Indsæt plot.

Men i hvor høj grad ligner det faktisk en normalfordeling?

Normalfordelingens egenskaber fortæller os at 50% af observationerne skal være
større end gennemsnittet. Og 50% af observationerne skal være mindre.

For hver eneste værdi på x-aksen i plottet af normalfordelingen, ved vi hvor stor en
del af observationerne der skal være mindre eller større. 

Så tæller vi op hvordan vores observationer faktisk fordeler sig. og sammenligner 
med hvordan normalfordelingen ser ud - så kan vi se afvigelsen.

her er der link til hvad jeg har fået skrevet om percentiler i episoden
om deskriptiv statistik.

indsæt qqplot.

Punkterne kan selvfølgelig følge linien 100%. I så fald er vores data i hvert fald
normal fordelte. 

Det vi oftest ser er at punkterne i midten af plottet følger linien ret nøje. Men at 
der er afvigelser i hver ende, hvor de enten ligger over eller under linien. 
Det giver fire forskellige udfald.

Hvis punkterne ligger over linien i begge ender.

Det indikerer at data har tykkere haler end forventet. at der er flere 
ekstreme værdier, både høje og lave, end vi forventer. større kurtosis end normalfordelingen.

punkter ligger under linien i begge ender:

data har tyndere haler end forventet. Der er færre ekstreme værdier end vi ville
forvente. lavere kurtosis end normalfordelingen. 

Øvre hale over, nedre hale under.
Skæve data, hvor data er skubbet mod højere værdier. Høje værdier optræder 
hyppigere end forventet. Eller lave værdier optræder sjældnere end forventet.

øvre under, nedre over. 
skæve data. i omvendt retning relativt til umiddelbart ovenstående.

kurtosis 

skewness

kan vi sætte tal på?

Ja. kurtosis og skewness. Jo tættere skewness kommer på 0, og kurtosis minus 3 på
0, jo tættere på normalfordelt er data.

R i sig selv kan ikke beregne det. Men det kan pakken
e1071

```r
library(e1071)
test <- rnorm(1000)
```

Skewness:

```r
skewness(test)
```

```output
[1] -0.05020859
```

kurtosis

```r
kurtosis(test)
```

```output
[1] -0.02373086
```
Bemærk at vores test-vektor er ret normal fordelt. Men ingen af parametrene er
lig 0.

Andre tests:
Shapiro-Wilk


```r
shapiro.test(test) 
```

```output

	Shapiro-Wilk normality test

data:  test
W = 0.99729, p-value = 0.09238
```
nul-hypotesen er her at data er normalfordelte. Hvis vi afviser null-hypotesen,vil det 
i dette tilfælde, være forkert i ca. 94% af tilfældene.

Testen er særligt godt til små stikprøver (<50, nogen siger den er ok op op til <2000)

Det er, vist nok, principielt et mål for den lineære korrelation mellem data og 
normalfordelte kvantiler - altså det vi ser i qq-plottet.

### Kolmogorov-Smirnov

vi skal specificere at det er normalfordelingen vi tester imod ("pnorm") - den kan
nemlig teste for andre fordelinger også.


```r
ks.test(test, "pnorm", mean = mean(test), sd = sd(test))
```

```output

	Asymptotic one-sample Kolmogorov-Smirnov test

data:  test
D = 0.026856, p-value = 0.4664
alternative hypothesis: two-sided
```
Vær forsigtig. Den forudsætter at vi kender "den sande" middelværdi og standardafvigelse,
i stedet for som i dette eksempel at estimere dem fra vores stikprøve.

NULL-hypotesen er også her at data er normalfordelte, p-værdien er her 0.99, og 
vi kan derfor ikke afvise null-hypotesen.

### Liliefors test
Den er en variation af ks-testen, der er  designet specifikt til at teste normalitet.
Og forudsætter _ikke_ at vi på forhånd kender middelværdi og standardafvigelse.


```r
library(nortest)
lillie.test(test)
```

```output

	Lilliefors (Kolmogorov-Smirnov) normality test

data:  test
D = 0.026856, p-value = 0.08616
```
Samme null-hypotese som før. Men læg igen mærke til at selvom data er 
designet til at være normalfordelte, så er p-værdien ikke 1. 

### Anderson-darling test

Ikke tilgængelig i R direkte:

```r
library(nortest)
ad.test(test)
```

```output

	Anderson-Darling normality test

data:  test
A = 0.7586, p-value = 0.04833
```
Også her er null-hypotesen at data er normaltfordelte. 


### Fordelingsfunktionerne i R.

De hyppigst forekommende fordelinger har hver deres sæt af funktioner.

#### rnorm
I samme familie finder vi runif, rbeta og en del andre:

```r
rnorm(5, mean = 0, sd = 1 )
```

```output
[1] -0.7152999 -0.7341053  0.7718805  1.3277633 -0.2392231
```
Den returnerer (her) fem tilfældige værdier fra en normalfordeling med (her) 
middelværdi 0 og standardafvigelse 1.



#### dnorm
densiteten. I plottet er det værdien på y-aksen af kurven. 

#### pnorm
Den kumulative fordeling. Hvis x er 0, er arealet fra minus uendelig til 0
lig pnorm(0). Og hvis vi bruger defaulet mean og sd, er det så 0.5.
Sandsynligheden for en værdi mindre end x.

#### qnorm
det er så den omvendte funktion af pnorm. Husk det på at et q er det omvendte af
et p.

i pnorm finder vi sandsynligheden for at værdien er mindre end x. I qnorm finder
vi x for en given sandsynlighed.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

