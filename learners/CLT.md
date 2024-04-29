---
title: CLT
---

# Et bevis for Central Limit Teoremet.

Overordnet: CLT forklarer hvorfor mange fordelinger af data, tenderer en normalfordeling (klokkekurven), når stikprøvestørrelsen bliver stor, uanset den oprindelige fordelings form.

## Moment generende funktioner
Vi starter med at introducere fænomenet "moment genererende funktion".

Vi har en fordeling, det kunne eksempelvis være normalfordelingen.

Den er defineret ved:

$$X(x) = \frac{1}{\sqrt{2\pi \sigma^2}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}$$
Hvor $\mu$ er middelværdien, og $\sigma$ er standardafvigelsen (og $\var^2$ er variansen).

Vi definerer nu en momentgenererende funktion:

$$M(t) = E[e^{tX}]$$

Hvor X er funktionen der definerer vores fordeling. Det er helt generelt.
X kan være funktionen for normalfordelingen ovenfor. Det kunne være en
anden.

Den der eksponentialfunktion der er i udtrykket kan vi selvfølgelig 
bare beregne med en knap på lommeregneren. Eller en funktion i R.

Inde bagved hiver lommeregneren så fat i en såkaldt taylor-række:
$$e^{tX} = 1 + tX + \frac{(tX)^2}{2!} + \frac{(tX)^3}{3!} + \cdots$$

Det næste led er så $\frac{(tX)^4}{4!}$. Det tillader os at beregne
venstresiden med den præcision vi ønsker, vi tilføjer bare flere led.

Under passende forudsætninger, har vi lov til at erstatte X med $E(X)$, hvor
$E(X) = \mu$, altså middelværdien - også kaldet forventningsværdien. Eller på engelsk "Expectation value". Det er der "E" kommer fra.

Gør vi det får vi:

$$M(t) = 1 + tE[X] + \frac{t^2 E[X^2]}{2!} + \frac{t^3 E[X^3]}{3!} + \cdots$$

Hvis vi differentierer $M(t)$ med hensyn til t, får vi:
$$M'(t) = E[X] + 2\frac{t E[X^2]}{2!} + 3\frac{t^2 E[X^3]}{3!} + \cdots$$
Hvis vi indsætter t=0, får vi:
$$M'(0) = E[X]$$
Altså forventningsværdien, eller middelværdien.

Differentierer vi to gange med hensyn til t, og indsætter t=0, får vi:

$$M''(0) = E[X^2]$$

Det er det såkaldte "rå andet moment" af vores fordelingsfunktion, og fra det
kan vi få variansen. Det er et "råt" moment fordi vi ikke får variansen 
direkte.

Variansen er defineret ved:
$$Var(X) = E[(X - \mu)^2]$$
Det er kvadratet på forskellen mellem værdierne og værdiernes middelværdi.

Det kan vi udvide til:
$$\text{Var}(X) = E[X^2] - (E[X])^2$$
Med andre ord, det rå andet moment, minus det rå første moment kvadreret,
giver os variansen.

Vi kan fortsætte, tredie moment, som vi får ved at differentiere mht t tre gange, og indsætte t = 0, giver os "skewness", eller skævhed. Det fjerde er "kurtosis", der hedder det samme på dansk. Det er et udtryk for hvor tykke
haler en fordeling har.

En central pointe er at hvis alle momenterne for to fordelingsfunktioner er ens, så er funktionerne ens. 

## Videre!
Med dette på plads, kan vi komme videre.

Den centrale grænseværdisætning fortæller os, at når vi har en population med
et defineret gennemsnit og standardafvigelse. Og tager tilpas mange 
stikprøver fra den (og de i øvrigt er uafhængige og identisk fordelte), 
så vil gennemsnittet af disse stikprøver være normalfordelte. 
Uanset hvilken fordeling populationen ellers har.

Hvis ellers vi overholder reglerne, kan vi derfor betragte et gennemsnit af 
en stikprøve som normalfordelt. Og det betyder at vi kan bruge de 
veldefinerede egenskaber ved normalfordelingen til at lave statistiske tests,
beregne konfidensintervaller og andet godt.



## Hvad er det vi prøver at bevise?

Lad os tage et antal tilfældige variable, $X_1 ... X_n$, der er uafhængige og 
ens fordelt, med et konstant, kendt gennemsnit $\mu$ og konstant, endelig 
varians $\sigma^2$.

Så definerer vi en tilfældig variabel Z:

$$ Z = \frac{\overline{X} - \mu}{\sigma/\sqrt{n}}$$

Med disse definitioner:

$$\mu = E(X_i)$$
Det er den "sande" middelværdi for populationen

$$\sigma^2 = Var(X_i) $$
Det er den "sande" varians for populationen.

Men vi kender ikke den sande middelværdi (eller varians for den sags 
skyld). Men vi kan beregne middelværdien af vores stikprøve:

$$\overline{X} = \frac{1}{n}\sum_{i=1}^nX_i$$
Postulatet fra sætningen er, at denne tilfældige variable Z, tilnærmer sig
standard normalfordelingen (med middelværdi 0, og standardafvigelse 1).

Det er det vi ønsker at bevise.

Bemærk at dette X ikke er det samme som ovenfor hvor vi arbejdede med moment
genererende funktioner.

Kan vi forstå dette som at X er vores stikprøver? Hm...

## selve beviset

Vi starter med at definere en ny tilfældig variabel Y. 

$$Y_i = \frac{X_i - \mu}{\sigma}$$

Forventningsværdien og variansen for hvert $Y_i$ er givet ved:

$$E(Y_i) = E\left(\frac{X_i - \mu}{\sigma}\right) = \frac{1}{\sigma}E(X_i - \mu) = \frac{1}{\sigma}(E(X_1)-\mu) = \frac{1}{n}(\mu - \mu) = 0$$

$$Var(Y_i) = Var\left(\frac{X_i - \mu}{\sigma}\right) = \frac{1}{\sigma^2}Var(X_i - \mu) = \frac{1}{\sigma^2}Var(X_i) = \frac{\sigma^2}{\sigma^2} = 1$$

Nu definerer vi endnu en tilfældig variabel, S, der er summen af alle $Y_i$:
$S = Y_1 + ... Y_n$. 

Så kan vi beregne forventingsværdien (gennemsnittet) og variansen af S:

$$E(S) = E\left(\sum_{i = 1}^{n}Y_i\right) = \sum_{i = 1}^{n}E(Y_i) = \sum_{i = 1}^{n}0 = 0$$

$$Var(S) = Var\left(\sum_{i = 1}^{n}Y_i\right) = \sum_{i = 1}^{n}Var(Y_i) = \sum_{i = 1}^{n}1 = n$$

Og nu "the moment of truth", pun intended. Vi definerer endnu en tilfældig variabel
Z:

$$Z = \frac{S \sqrt{n}}{n} = \frac{S}{\sqrt{n}}$$

Og nu handler det så om at vise, at dette Z, som kommer fra vores stikprøver, 
er det samme Z som vi definerede ovenfor.

$$

Z = \frac{S\sqrt{n}}{n} \\
= \frac{\sqrt{n}}{n}\sum_{i=1}^nY_i \\
= \frac{\sqrt{n}}{n}\sum_{i=1}^n \frac{X_i - \mu}{\sigma} \\
= \frac{\sqrt{n}}{n\sigma}\left[\left(\sum_{i=1}^n X_i \right) - n\sigma\right] \\
= \frac{\sqrt{n}}{\sigma}(\overline{X} - \mu) \\
= \frac{\overline{X}-\mu}{\sigma/\sqrt{n}}
$$

Det betyder, at vi kender forventningsværdien og variansen af Z:

$$E(Z) = E\left(\frac{S\sqrt{n}}{n}\right) = \frac{\sqrt{n}}{n}E(S) = 0$$
og
$$Var(Z) = Var\left(\frac{S\sqrt{n}}{n}\right) = \frac{n}{n^2}Var(S) = \frac{n^2}{n^2} = 1$$

Nu vil vi gerne finde den momentgenerende funktion for $Y_i$. 

Der var et par ting vi fandt ud af ovenfor:

$$E(Y_i) = 0$$

$$E(Y_i^2) = Var(Y_i) - E(Y_i)^2 = 1 -0^2 = 1$$

$$M_{Y{_i}}(t) = 1 + \frac{t}{1!}E(Y_{i}) + \frac{t^2}{2!}E(Y_{i}^2) + \frac{t^3}{3!}E(Y_{i}^3) + ... \frac{t^n}{n!}E(Y_{i}^n) \\
= 1 + \frac{t^2}{2!} + \frac{t^3}{3!}E(Y_{i}^3) + ... \frac{t^n}{n!}E(Y_{i}^n)$$

Nu vil vi så gerne have en momentgenererende funktion for S. S var summen af
en række fordelinger Y: $S = Y_1 + ... Y_n$.

Her skal vi bruge en potensregneregel:

Hvis $S = X + Y$, hvor X og Y er uafhængige, så er den momentgenererende funktion 
for S:

$$M_S(t) = E\left[e^{t(X+Y)}\right] = E\left[e^{tX}e^{tY}\right]$$

Når vi så ser på den S vi gerne vil have, i stedet for eksemplet lige ovenfor,
får vi:

$$M_S(t) = \prod_{i=1}^n M_{Y_{i}}(t) \\
= \left[M_{Y_{i}}(t)\right]^n \\
= \left( 1+ \frac{t^2}{2!} + \frac{t^3}{3!}E(Y_i^3) + ... + \frac{t^n}{n!}E(Y_i^n)   \right)^n
$$
Og så hiver vi fat på den momentgenerende funktion for $Z = \frac{S}{\sqrt{n}}$:

$$M_z(t) = M_s\left(\frac{t}{\sqrt{n}}\right) = \\
\left( 1+ \frac{t^2}{2!(n^{½})^2} + \frac{t^3}{3!(n^{½})^3}E(Y_i^3) + ... + \frac{t^n}{n!(n^{½})^n}E(Y_i^n)   \right)^n
$$


Så tager vi den naturlige logaritme til $M_Z(t)$:

$$
\ln(M_Z(t)) = n\ln \left(1 + \frac{t^2}{2!n} + \frac{t^3}{3!n^{3/2}}E(Y_i^3) + ... + \frac{t^n}{n!n^{n/2}}E(Y_i^n) \right)
$$

På samme måde som der var en taylor-række for $e^x$, er der en taylor-række for 
$\ln(1+x)$:

$$
\ln(1+x) = x - \frac{x^2}{2} + \frac{x^3}{3} - \frac{x^4}{4} + \frac{x^5}{5} - \frac{x^6}{6} + ... \\
= \sum_{n=1}^{\infty}\frac{(-1)^{n+1}}{n}x^n
$$

Dette bringer mig til den del af Matematisk Analyse 3 som jeg virkelig hadede.