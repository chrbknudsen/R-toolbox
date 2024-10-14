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

## What is the normal distribution

A probability distribution is a mathematical function, that describes
the likelyhood of different outcomes in a random experiment. It gives us
probabilities for all possible outcomes, and is normalised so that the sum
of all the probabilities is 1. 

Probability distribtutions can be discrete, or they can be continuous. The normal
distribution is just one of several different continuous probability distributions. 

The normal distribution is especially important, for a number of reasons:

1. If we take a lot of samples from a population and calculate the averages of 
a given variable in those samples, the averages, or means will be normally 
distributed. This is know as the Central Limit Theorem [KAN VI SÆTTE ET LINK IND?]

2. Many natural (and human made) processes follow a normal distribution.

3. The normal distribution have useful mathematical properties. It might not 
appear to be simple working with the normal distribution. But the alternative is
worse.

4. Many statistical methods and tests are based on assumptions of normality.

## How does it look?
The normal distribution follows this formula:

$$
f(x) = \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
$$

If a variable in our population is normally distributed, have a mean $\mu$ and a 
standard deviation $\sigma$, we can find the probability of observing the value 
$x$ of the varibel by plugging in the values, and calculate $f(x)$.

Note that we are here working with the population mean and standard deviation. 
Those are the "true" mean and standard deviation for the _entire_ universe. That 
is signified by using the greek letters $\mu$ and $\sigma$. In practise
we do not know what those true values are.

### What does it mean that our data is normally distributed

We have an entire section on that - but in short: The probabilities we get 
from the formula above should match the frequencies we observe in our data.

## How does it look?

It is useful to be able to compare the distributions of different variables.
That can be difficult if one have a mean of 1000, and the other have a mean
of 2. Therefore we often work with standardized normal distributions, where
we transform the data to have a mean of 0 and a standard deviation of 1. So
let us look at the standardized normal distribution.

If we plot it, it looks like this:

![The Normal Distribution. Source: https://en.m.wikipedia.org/wiki/File:The_Normal_Distribution.svg](fig/The_Normal_Distribution.svg){alt='The Normal Distribution.'}
The area under the curve is 1, equivalent to 100%.

The normal distribution have a lot of nice mathematical properties, some of which
are indicated on the graph. 

CDF-plottet - så vi har forbindelsen til den deskriptive 
statistik.

Konceptet med - hvad er sandsynligheden for at se en observation der ligger
x standardafvigelser fra middelværdien.

This allows us to calculate the probability of finding a certain value in the data,
if the data is normally distributed, if we know the mean and the standard deviation.

R provides us with a set of functions:

pnorm the probability of having a smaller value than. 
qnorm the value corresponding to a given probability
dnorm the probability density of the norma distribution at a given x.

Og det er for den standardiserede normalfordeling N(0,1)

De har mulighed for at returnere værdier for en hvilken som helst normalfordeling
med arbitrære middelværdi og standardafvigelse.

An example:

If the height of men are normally distributed, with a mean (mu) = 183 cm, and 
a standarddeviation of 9.7 cm. How probably is it to find a man that is taller
than 2 meters? 

Directly:

``` r
1 - pnorm(200,183,9.7)
```

``` output
[1] 0.03983729
```
In this example, pnorm returns the probability of an observation smaller than
200, if data is normally distributed with mean 183, and standard deviation 9.7.

The probability of finding any observation is 1. So the probability of finding
an observation larger than 200, is 1 minus the probability of finding an observation 
smaller than 200.

Manually we could calculate the distance from 200 to 183 = 17. And divide that
with the standard deviation 9.7: 17/9.7 = 1.752577. 


``` r
1 - pnorm(1.752577)
```

``` output
[1] 0.03983732
```



How many men are between 170 and 190 cm tall?
Lidt før dette punkt skal vi videre til næste lesson.

Og efter clt videre til hypotesetests

## CLT

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



### Fordelingsfunktionerne i R.

De hyppigst forekommende fordelinger har hver deres sæt af funktioner.

#### rnorm
I samme familie finder vi runif, rbeta og en del andre:

``` r
rnorm(5, mean = 0, sd = 1 )
```

``` output
[1] -2.4613469 -0.4073859  1.5888362 -0.8104937 -0.9370240
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

## Er ting normalfordelte?

Normalfordelingen kaldes normal fordi Karl Pearson og Francis Galton i det 19.
århundrede observerede at det var en statistisk fordeling der forklarede 
rigtig mange fænomener i befolkningsdata. Højde, vægt, blodtryk, intelligenskvotienter
mv. Faktisk var det den der forklarede flest (af de ting de nu undersøgte).

Og så er det i øvrigt den fordeling som middelværdier af stikprøver vil tilnærme sig
jf. den centrale grænseværdisætning.

Så den er normal fordi det er normen, den hyppigst forekommende. Ikke at forveksle
med en mere løs, dagligsprogs, normativ (pun intended) anvendelse af ordet norm. Normalen i 
en statistisk sammenhæng er ganske enkelt den hyppigst forekommende observation.

Det i statistisk forstand normale, normen, er at have brune øjne (>50% af klodens
befolkning har brune øjne). Det betyder ikke at der er noget galt med at have
blå øjne.

Og rigtig mange ting er ret tæt på at være normalfordelte. Men i virkeligheden
er der ikke mange fænomener der følger normalfordelingen fuldstændig. Et eksempel:

Serum (en del af blod) Molybdæn (der er et essentielt sporstof i human fysiologi), har en 
middelværdi på 1.55 og en standardafvigelse på 0.74 hos normale, raske mennesker.

Rifai, N. (2017). Tietz textbook of clinical chemistry and molecular diagnostics : Tietz textbook of clinical chemistry and molecular diagnostics - e-book. Elsevier - Health Sciences Division.

Hvis vi antager at serum-Molybdæn er normalfordelt i populationen, kan vi 
beregne hvor stor en andel af den normale raske befolkning i danmark, der har 
en Molybdæn-koncentration under 0:


``` r
pnorm(0, mean = 1.55, sd = 0.74)
```

``` output
[1] 0.01810352
```
Hvilket vil sige at vi forventer at lidt over 100.000 danskere har et negativt 
indhold af Molybdæn i blodet. Hvilket er fysisk umuligt.
Hvorfor går det så godt alligevel? Fordi serum molybdæn er normalfordelt _nok_.




::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

