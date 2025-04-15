---
main_topsize: 0.2 #percent coverage of the poster
main_bottomsize: 0.1
#ESSENTIALS
title: 'Målsyede kurser'
author:
  - name: '**Ene Rammer**'
    affil: 2
    main: true
    orcid: '0000-0001-6220-3709'
    twitter: 
    email: 'enrn@kb.dk'
  - name: '**Christian Knudsen**'
    affil: 1
    main: true
    orcid: '0000-0002-9816-768X'
    email: 'cbk@kb.dk'
  
affiliation:
  - num: 1
    address: Hvad stedet nu hedder for tiden.
  - num: 2
    address: Roskilde Universitetsbibliotek

main_findings:
  - "Made-to-Measure data kurser"
logoleft_name: Datalab_colours_clear.png
logoright_name: DKB_logo_expanded_black_RGB.png
# logocenter_name: http://raw.githubusercontent.com/brentthorne/posterdown/master/images/qr-code-black.png
output: 
  posterdown::posterdown_betterport:
    self_contained: true
    pandoc_args: --mathjax
    number_sections: false
bibliography: poster_refs.bib
link-citations: true
knit: (function(inputFile, encoding) { rmarkdown::render(inputFile, encoding = encoding, output_file = file.path(dirname(inputFile), 'poster.html')) })

---



# Introduktion

KUB Datalab er Københavns Universitetsbiblioteks tilbud til studerende om 
vejledning og undervisning i arbejde med data. Vi tilbyder kurser i grundlæggende
programmering, dataanalyse og -visulisering. Undervisningen sker både "indlejret"
hvor vi indgår i et egentligt kursusforløb på universitetet, og som åbne kurser.

Studerende henvender sig regelmæssigt med ønsker om kurser med _meget_ specifikt
indhold. Dette behov vil vi gerne imødekomme, men det er for ressourcekrævende
at skulle udvikle enkeltstående kurser for måske kun 5 studerende. 

Vi har derfor udviklet et meget omfattende generelt kursus, der dækker mange, men
dog ikke alle, de eksempler på konkrete ønsker vi har oplevet. 
Dog foreløbig kun i programmeringssproget R, omend de fleste af teknikkerne er 
sprog-agnostiske.




# Infrastruktur

Materialet er opbygget i Workbench infrastrukturen fra Carpentries [@TheCarpentries] 
med brug af sandpaper [@sandpaper] pakken, og tilgængeliggjort på GitHub.

Det indeholder en samling af "episoder", ideelt i en længde svarende til ca.
25 minutters undervisning. Episoderne kan ikke være fuldstændigt uafhængige;
nogle emner baserer sig på en forståelse af grundlæggende statistiske begreber
og kendskab til R, men idealet er at de er så uafhængige af andre som muligt,
men så afhængige som nødvendigt. 





# Metoder

Kursets didaktiske tilgang er baseret på Teaching Tech Together [@teachingtech]
og Carpentries [@TheCarpentries] filosofien. 

Der er fokus på "code-along" hvor de studerende forventes og opfordres til at "taste med". Målet er ikke at 
dække mest mulig teori, men at efterlade de studerende med praktiske færdigheder.

<div style="break-after: column;"></div>
# Teknik


``` error
Error in knitr::include_graphics("kursussiden.png"): Cannot find the file(s): "kursussiden.png"
```

Med udgangspunkt i Github-pages, klones den samlede kursusside til et nyt
repositorie på Github. Baseret på de konkrete behov redigeres en enkelt 
setup-fil, så kun de ønskede episoder indgår. Redigeringen tager under fem 
minutter, mens det tager GitHub op til en halv time at "bygge" siden. 



# Indhold


### Datahåndtering og Workflow

• Reproducible Data Analysis
• Reading data from file
• Tidy Data
• A deeper dive into pipes
• R on Ucloud
• Setup for GIS

### Udforskende Dataanalyse og Visualisering
• Descriptive Statistics
• Table One
• Nicer barcharts
• How is the data distributed?
• The normal distribution
• Testing for normality

### Statistiske Grundbegreber og Teori
• Central Limit Theorem
• Power Calculations

### Regressionsanalyse
• Linear regression
• Multiple Linear Regression
• Logistic regression

### Avancerede Analyseteknikker
• k-means
• ANOVA


``` error
Error in knitr::include_graphics("horst_new_mat.png"): Cannot find the file(s): "horst_new_mat.png"
```


# Praktiske eksempler

## R for studenterforskere

Panum UngdomsForsker Forening, PUFF, er en studenterforening drevet af frivillige
medicinstuderende på Københavns Universitet, der arbejder for at forbedre vilkårene
for medicinsk studenterforskning. 

PUFF har gennem flere år tilbudt et kursus i statistisk metode & det statistiske
programmeringssprog R. Kurset blev gennemført over 5 eftermiddage/aftener á 3 timer,
og med en professor i biomedicinsk statistik som underviser. Efter COVID-19 
pandemien oplevede de vanskeligheder med at tiltrække deltagere til det relativt
dyre kursus.

KUB Datalab har siden 2023 overtaget R-delen af kurset, baseret på materiale
trukket fra vores toolbox.

## Introduktion til statistik

Noget om noget med Roskilde og statistik

# Bonus

Ud over at danne grundlag for målsyede kurser, fungerer værktøjskassen også som
intern videnbank, hvor vi kan finde noter om hvordan man gør specifikke ting. 


# Hvor finder du den?
https://github.com/kubdatalab/R-toolbox

https://kubdatalab.github.io/R-toolbox/

# Referencer
