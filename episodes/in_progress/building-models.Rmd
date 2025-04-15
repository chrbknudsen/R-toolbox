---
title: 'building-models'
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
OK. det er lidt mere kompliceret end som så.

Så vi starter med det grundlæggende, og kigger på kun på lineære modeller.

Målet er at forudsige en afhængig variabel. Det er ikke nødvendigvis en
forklaring. Er der 100% korellation mellen en afhængig og en uafhængig variabel,
kan vi 100% forudsige den afhængige. Men det er ikke en forklaring. Der er forskel
på korellation og kausalitet.

Og det vil vi gøre ved at tage de uafhængige varible vi har, og bruge et udvalg
af dem, evt. i kombinationer, til at forudsige den afhængige variabel.

Den kombination af uafhængige variable, der i modellen bedst forudsiger den 
afhængige variabel er den model der (baseret på det data vi nu har), er 
"bedst". 

Første trin er at identificere de variable som teoretisk, eller som anden
forskning, har vist er relevante.

Andet trin. Undersøg dine data. lav korrelationsanalyser og visualiseringer,
for at se hvilke variable der har en stærk sammenhæng med den afhængige variabel.

Afgør hvilke variable der skal indgå i modellen. 

Mål hvor god modellen er. Og test den på nye data. 

AIC, BIC afbalancerer modeltilpasning og kompleksitet.

Forward selection, backward elimination, stepwise regression

Regularisering - lasso, ridge eller elastic net.

Dataforberedelse. manglende værider, fejl, outliers, inkonsistente data.
Skalering og normalisering af variable.
evt. transformation af data. Eksempelvis log-transformation ved skæve fordeligner.

Feature engineering: oprettelse af nye variable baseret på eksisterende.
Herunder valg og konstruktion af de mest informative features.

Opdel data i træning, validering og test-set.

Modelvalg - lineær, logistisk, træer og den slags.


Hvilke forudsætninger har modellen. Eg. lineariet, homoskedacitet, normalfordelte
residualer.

Evaluering af hvor godt modellen klarer sig. R^2, RMSE, MAE. 

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

