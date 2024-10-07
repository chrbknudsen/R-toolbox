---
title: "Data sets"
bibliography: poster_refs.bib
citeproc: true  
---


<!-- Referencer er lidt bøvlet... Vi laver dem ved at indsætte interne links.
TJEK at nummereringen er som den skal være hvis du ændrer noget. -->

### BETACAR

Data from a study of bio availability of four different preparations of 
betacarotene:

1. Solaten (30 mg capsules)
2. Roche (60 mg capsules)
3. Badische Anilin und Soda Fabrik (BASF) (30 mg capsules)
4. BASF (60 mg capsules)

23 volunteers had their beta-carotene levels measured in two consecutive-day
fasting blood samples. They were then randomized to one of the four preparations,
and took 1 pill every other day for 12 weeks. Blood samples were drawn after 
6, 8, 10 and 12 weeks.

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BETACAR.csv)

:::: spoiler
### Metadata

|  Variable  |  Description/Code                               | Unit   |   
|------------|-------------------------------------------------|--------|
|  Prepar    |  Preparation 1=SOL/2=ROCHE/3=BASF-30/4=BASF-60  | NULL   |
|  Id        |  Subject #                                      | NULL   |
|  Base1lvl  |  1st Baseline Level                             | µmol/L |
|  Base2lvl  |  2nd Baseline Level                             | µmol/L |
|  Wk6lvl    |  Week 6 Level                                   | µmol/L |
|  Wk8lvl    |  Week 8 Level                                   | µmol/L |
|  Wk10lvl   |  Week 10 Level                                  | µmol/L |
|  Wk12lvl   |  Week 12 Level                                  | µmol/L |

::::




### BLOOD

A case-control study of riskfactors (hormone levels in blood samples) for 
breast cancer. Individuals are matched on age and current postmenopausal homone
use (PMH). 

Each row contains unique ID, representing both cases (have breast cancer) and
control (does not have breast cancer). The column matchid matches the controls
with their respective cases. Cases have identical ID and matchid.

Note the different ways of coding missing values.

Useful for logistic regression to asscess the association between testosterone
and breast cancer, controlling for age and current PMH use. Either with testosterone
as a continuous variable or as a categorical variabel in quartiles, with the first
quartile as the reference group.

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BLOOD.csv)

:::: spoiler
### Metadata

|Variable  |  Description        |  Code                  | Unit  | 
|----------|---------------------|------------------------|-------|
|Id        |  ID                 |                        |       |
|matchid   |  Matched ID         |                        |       |
|case      |  Case/control       |  1=case/ 0=control     |       |
|curpmh    |  Current PMH use    |  1=yes / 0=no          |       |
|ageblood  |  Age at blood draw  |                        | years |
|estradol  |  Estradiol          |                        | pg/mL |
|estrone   |  Estrone            |  missing=999           | pg/mL |
|testost   |  Testosterone       |  missing=999           | ng/dL |
|prolactn  |  Prolactin          |  xx.xx  missing=99.99  | ng/L  |

::::





### BONEDEN

Data from a twin study on the relationship between bone density and cigarette
consumption [source](#hopper_2)^2^. 41 pairs of middle-aged australian female 
twins with different smoking histories had their bone density measured at a hospital
in Victoria, as well
as other factors, details in metadata below. 

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BONEDEN.csv)

:::: spoiler
### Metadata

The data set is rather wide, and the columns are split up in this describtion.

|  Variable  |  Code       | Unit  | 
|------------|-------------|-------|
|  ID        |             |       |
|  Age       |  Age (yrs)  | years |
|  zyg       |  1=mz 2=dz  |       |

mz - monozygotic twins

dz - dizygotic twins

The following variables are dublicated, in the form of 

xx1 for the lighter smoking twin and 

xx2 for the heavier smoking twin

|  Variable  |  Code                       | unit             |
|------------|-----------------------------|------------------|
|  ht        |  Height                     | cm               |
|  wt        |  Weight                     | kg               |
|  tea       |  Tea                        | cups/week        |
|  cof       |  Coffee                     | cups/week        |
|  alc       |  Alcohol                    | drinks/week      |
|  cur       |  Current Smoking            | (cigarettes/day) |
|  men       |  Menopause Status           |                  |
|            |  0: Premenopausal           |                  |
|            |  1: Postmenopausal          |                  |
|            |  2: unknown or hysterectomy |                  |
|  pyr       |  Pack-years smoking         | year             |
|  ls        |  Lumbar spine               | g/cm^2^          |
|  fn        |  Femoral neck               | g/cm^2^          |
|  fs        |  Femoral shaft              | g/cm^2^          |

Pack-years are defined as how many years the woman have smoked a pack of 
cigarettes pr day, normally ca. 20 cigarettes pr pack.

Lumbar spine: L1-L5. 

Femoral neck: Collum femoris

Femoral shaft: Corpus femoris

::::

### BOTOX

69 patients with piriformis syndrome participated in a randomized double-blind 
clinical trial. 

Piriformis syndrom is a condition involving malfunction of the
piriformis muscle - a deep buttock muscle, which often causes buttock and lumbar 
pain with sciatica. 

Patients were injected with one of three substances directly in the piriformis muscle:

1. a combination of triamcinolone and lidocaine (TL)
2. a placebo
3. Botox

The randomization was set up with approximately ½ assigned to group 1, 1/6 to 
group 2 and 1/3 to group 3. 

Patients were asked to return 2 weeks (0.5), and monthly post injection. At each
visit patients rated their percentage of improvement of pain comparied to baseline,
on a visual analog scale, with a range of -100 to 100%, negative numbers indicating
worsening. One patient had the condition in both legs leading to 70 observations
in the dataset. 

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BOTOX.csv)

:::: spoiler
## Metadata

|  Variable  |  Code                               |
|------------|-------------------------------------|
|  ID        |                                     |
|  group     |  1 = TL                             |
|            |  2 = Placebo                        |
|            |  3 = Botox                          |
|  pain0     |  pain score month 0  missing=999    |
|  pain05    |  pain score month 0.5  missing=999  |
|  pain1     |  pain score month 1  missing=999    |
|  pain2     |  pain score month 2  mising=999     |
|  pain3     |  pain score month 3  missing=999    |
|  pain4     |  pain score month 4  missing=999    |
|  pain5     |  pain score month 5  missing=999    |
|  pain6     |  pain score month 6  missing=999    |
|  pain7     |  pain score month 7  missing=999    |
|  pain8     |  pain score month 8  missing=999    |
|  pain9     |  pain score month 9  missing=999    |
|  pain10    |  pain score month 10  missing=999   |
|  pain11    |  pain score month 11  missing=999   |
|  pain12    |  pain score month 12  missing=999   |
|  pain13    |  pain score month 13  missing=999   |
|  pain14    |  pain score month 14  missing=999   |
|  pain15    |  pain score month 15  missing=999   |
|  pain16    |  pain score month 16  missing=999   |
|  pain17    |  pain score month 17  missing=999   |

::::



### BREAST

A dataset describing 1200 women in the NHS. In 1990 it was confirmed that they
were postmenopausal and free of any cancer. The selection was done so that
200 of the women were using postmenopausal hormones (PMH) in 1990, and 1000 had 
never used PMH. 
The objective was to identify a possible relation between incidence of breast 
cancer between 1990 to 2000 with PMH use in 1990.

The objective was to relate breast cancer incidence from 1990 to 2000 
with PMH use in 1990. Data on PMH use are found in three variables, `pmh` registers
PMH use in 1990, where `dur3` and `dur4` registers length of use of two different 
PMH. In the variable `foluptm` the time between the first questionnaire (in 1990),
and a follow up date is recorded in months. If a control that follow up date was
the date of the last questionnaire in 2000, if a case, the date of diagnosis of breast 
cancer.
Other cancer risk factors are recorded.

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BREAST.csv)

:::: spoiler
## Metadata

|variable |  Description                                            | unit    |
|---------|---------------------------------------------------------|---------|
|Id       |  ID                                                     |         |
|case     |  case                                                   |         |
|         |  1 = case                                               |         |
|         |  0 = control                                            |         |
|age      |  age                                                    | years   |
|agemenar |  age at menarche                                        | years   |
|agemenop |  age at menopause                                       | years   |
|afb      |  age at first birth  98=nullip                          | years   |
|parity   |  parity                                                 |         |
|bbd      |  Benign Breast disease                                  |         |
|         |  1 = yes                                                |         |
|         |  0 = no                                                 |         |   
|famhx    |  family history breast cancer                           |         |
|         |  1 = yes                                                |         |
|         |  0 = no                                                 |         | 
|bmi      |  BMI                                                    | kg/m^2^ |
|hgt      |  Height                                                 | inches  |
|alcohol  |  Alcohol use (grams/day)                                | g/day   |
|pmh      |  PMH status                                             |         |
|         |  2 = never user                                         |         |
|         |  3 = current user                                       |         | 
|dur3     |  Duration of Estrogen use  (months)                     | months  |
|dur4     |  Duration of Estrogen + progesterone use  (months)      | months  |
|csmk     |  Current Smoker                                         |         |
|         |  1 = yes                                                |         |
|         |  0 = no                                                 |         | 
|psmk     |  Past smoker                                            |         |
|         |    1 = yes                                              |         |
|         |    0 = no                                               |         | 
|foluptm  |  Months of follow up Note: Some subjects provided no    |  months |
|         |  follow up after the 1990 questionnaire: foluptm=0 for  |         |
|         |  these people                                           |         |

::::

###  CORNEAL

Data from a randomized trial of two different active drugs of the fluoroquinolone-group,
M and G along with a placebo, P.
93 subjects placed in one of three groups:

| Group | Eye 1 | Eye 2|
|-------|-------|------|
|   A   |  G    |  P   |
|   B   |  M    |  P   |
|   C   |  G    |  M   |

Each subject was asked to administer the two assigned preparations four times 
per day for 10 days. The response was measured at baseline (without treatment),
on visit 1, and again at visit 2 after 7 days, and at visit 3, on day 14. Note
that at day 14, the subjects had stopped administering the preparations. The
response was meased as corneal sensitivity in five regions of the eyes, central,
superior, inferior, temporal and nasal. Sensititivy was measured in mm, with
a range for 40-60 mm. High values indicate greater, normal, sensitivity, low values
lower, abnormal, sensitivity.

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/CORNEAL.csv)


:::: spoiler
## Metadata


|Variable  |  Variable label                       | unit |
|----------|---------------------------------------|------|
|  id      |  ID                                   |      |
|  tr      |  Treatment                            |      |
|          |  1=M                                  |      |
|          |  2=G                                  |      |
|          |  3=P                                  |      |
|  c1      |  Central  visit 1                     | mm |
|  s1      |  Superior visit 1                     | mm |
|  i1      |  Inferior Visit 1                     | mm |
|  t1      |  Temporal visit 1                     | mm |
|  n1      |  Nasal Visit 1                        | mm |
|  c2      |  Central Visit 2(day 7)               | mm |
|  s2      |  Superior Visit 2                     | mm |
|  i2      |  Inferior Visit 2                     | mm |
|  t2      |  Temporal Visit 2                     | mm |
|  n2      |  Nasal Visit 2                        | mm |
|  c3      |  Central Visit 3(day 14)  missing=99  | mm |
|  s3      |  Superior Visit 3         missing=99  | mm |
|  i3      |  Inferior Visit 3         missing=99  | mm |
|  t3      |  Temporal Visit 3         missing=99  | mm |
|  n3      |  Nasal Visit 3            missing=99  | mm |

::::

### DIABETES

A study on whether maintaining diabetes control in type I diabetes affects growth
and development in childhood. 94 boys aged 9-15 where examined approx. every 
3 months, leading to 910 visits. At each visit the degree of diabetes control 
where assessed by measuring HgbA1c (glycosylated hemoglobin). The exact dates 
of the visits are registered in the mon, day and yr_a1c variables, the age, 
height and weight where registered as well ad the HgbA1c measurement.

The HgbA1c measurement is the percentage of hemoglobin that is glycosylated.
The normal range is between 4.0 and 5.6%, with values larger than 6.5% being
indicative of diabetes. The normal range does not appear to change by pubertal stage.

[source](#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/DIABETES.csv)

:::: spoiler
### Metadata

|Variable  |  Code                          | unit |
|----------|--------------------------------|------|
|ID        |                                |      |
|mon_a1c   |  Month                         |      |
|day_a1c   |  Day A1c                       |      |
|yr_a1c    |  Yr                            |      |
|age_yrs   |  Age in years                  | year |
|gly_a1c   |  Hemoglobin A1c                |  %  |
|ht_cm     |  Height in  missing=999.9      | cm   |
|wt_kg     |  Weight in                     | kg   |

::::

### EAR

Data on 214 children with acute otitis media in one or both
ears. They were randomly assigned 14 days of antibiotic treatment with either 
CEF (cefaclor) or AMO (amoxicillin). Status of their ear infection at a 
follow up visit after 14 days were recorded. 


[source](#rosner_1)^1^

Additional [reference](#mandel_3)

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/EAR.csv)

:::: spoiler

### Metadata

| Variable  |         Description    |
|-----------|------------------------|
| Id        |  ID                    |  
| Clear     |  Clearance by 14 days  |  
|           |   1 = yes              |  
|           |   0 = no               |
| Antibo    |  Antibiotic            |  
|           |  1 = CEF               |  
|           |  2 = AMO               |  
| Age       |  Age                   |  
|           |  1=<2 yrs              |  
|           | 2=2-5 yrs              |
|           | 3=6+ yrs               |
| Ear       |  Ear                   |
|           |  1=1st ear             |
|           |  2=2nd ear             |

::::

### EFF

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/EFF.csv)


|Variable  |  Description/Code|
|----------|----------------------------------------|
|Name      |  Study name                            |
|Id        |  Study Number                          |
|Endpnt    |  Endpoint  1=efficacy                  |
|Antibio   |  Antibiotic                            |
|          |  1=Amikacin/2=Gentamicin/3=Netilmicin/ |
|          |  4=Sisomycin/5=Tobramycin              |
|Samp_sz   |  Sample Size                           |
|Cured     |  Number Cured                          |



###  ENDOCRIN

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/ENDOCRIN.csv)


| Variable   |  LABEL           |
|------------|------------------|
|  Subject   |  SUBJECT #       |
|  Replicat  |  REPLICATE #     |
|  Estrone   |  ESTRONE         |
|  Estradol  |  ESTRADIOL       |
|  Androste  |  ANDROSTENEDIONE |
|  Testost   |  TESTOSTERONE    |


### ESTRADL

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/ESTRADL.csv)


|Variable |  Code	                                           |
|---------|--------------------------------------------------|
|Id       |  Identification number                           |
|Estradl  |  Estradiol                                       |
|Ethnic   |  Ethnicity 0=African-American;  1=Caucasian      |
|Entage   |  Age                                             |
|Numchild |  Parity, number of children  9=missing           |
|Agefbo   |  Age at 1st birth (=0 if numchild=0)  99=missing |
|Anykids	|  any children  1=yes;  0=no   9=missing          |
|Agemenar |  age at menarche   99=missing                    |
|BMI      |  Body Mass Index                                 |
|WHR      |  waist-hip ratio                                 |


### ESTROGEN

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/ESTROGEN.csv)


|Variable  |  LABEL                        |
|----------|-------------------------------|
|Id        |  ID                           |
|std_typ   |  STUDY TYPE                   |
|          |  1=0.625MG VS PLACEBO         |
|          |  2=1.25MG VS PLACEBO          |
|          |  3=1.25MG VS 0.625MG          |
|period    |  PERIOD                       |
|trtgrp    |  TREATMENT                    |
|          |  1=PLACEBO                    |
|          |  2=0.625MG                    |
|          |  3=1.25MG                     |
|sysd1r1   |  SYSTOLIC BP DAY 1 READING 1  |
|          |  MISSING=999                  |
|diasd1r1  |  DIASTOLIC BP DAY 1 READING 1 |
|          |  MISSING=999                  |
|sysd1r2   |  SYSTOLIC BP DAY 1 READING 2  |
|          |  MISSING=999                  |
|diasd1r2  |  DIASTOLIC BP DAY 1 READING 2 |
|          |  MISSING=999                  |
|sysd1r3   |  SYSTOLIC BP  DAY 1 READING 3 |
|          |  MISSING=999                  |
|diasd1r3  |  DIASTOLIC BP DAY 1 READING 3 |
|          |  MISSING=999                  |
|sysd2r1   |  SYSTOLIC BP DAY 2 READING 1  |
|          |  MISSING=999                  |
|diasd2r1  |  DIASTOLIC BP DAY 2 READING 1 |
|sysd2r2   |  SYSTOLIC BP DAY 2 READING 2  |
|diasd2r2  |  DIASTOLIC BP DAY 2 READING 2 |
|sysd2r3   |  SYSTOLIC BP DAY 2 READING 3  |
|diasd2r3  |  DIASTOLIC BP DAY 2 READING 3 |
|sysd3r1   |  SYSTOLIC BP DAY 3 READING 1  |
|diasd3r1  |  DIASTOLIC BP DAY 3 READING 1 |
|sysd3r2   |  SYSTOLIC BP DAY 3 READING 2  |
|diasd3r2  |  DIASTOLIC BP DAY 3 READING 2 |
|sysd3r3   |  SYSTOLIC BP DAY 3 READING 3  |
|diasd3r3  |  DIASTOLIC BP DAY 3 READING 3 |


### FEV

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FEV.csv)

|Variable |  Description      |  Format or Code                         |
|---------|-------------------|-----------------------------------------|
| Id      |  ID number        |                                         |
| Age     |  Age (yrs)        |                                         |
| FEV     |  FEV (liters)     |  X.XXXX                                 |
| Hgt     |  Height (inches)  |  XX.X                                   |
| Sex     |  Sex              |  0=female/1=male                        |
| Smoke   |  Smoking Status   |  0=non-current smoker/1=current smoker  |

FEV - Forced Expiratory Volume er et index for lungefunktion, der måler
det volumen luft (i liter) der kan udstødes af lungerne på et sekund. 

Data indeholder data på 654 børn i alderen fra 3 til 19 år i "Childhood
Respiratory Disease (CRD) Study", fra 1980 i Øst Boston, Massachusetts, USA.

Kilde er den generelle reference i bunden af denne side. Yderligere reference:
Tage, I.B., Weiss, S.T., Rosner, B. & Speizer, F.E. (1979),
Effect of parental cigarette smoking on pulmonary function in children.
American Journal of Epidemiology, 110, 15-26.

### FIELD
[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FIELD.csv)

|  Variable  |  Description                                                   |
|------------|----------------------------------------------------------------|
|  id        |  ID                                                            |
|  group     |  group (1=RHO/2=RPGR)                                          |
|  age       |  age at visit  (XX.X in years)                                 |
|  gender    |  gender (1=m/2=f)  Note: all RPGR individuals have to be male  |
|  dtvisit   |  date of visit (month/day/year)                                |
|  folowup   |  time from 1st visit in years                                  |
|  totfldod  |  total field area right eye (OD) in degrees²                   |
|  totfldos  |  total field area left eye (OS) in degrees²                    |

### HEART
[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/HEART.csv)

|Variable    |  code                                                                          |
|------------|--------------------------------------------------------------------------------|
|Diagnosis   |  Y1=normal                                                                     |
|            |  Y2=atrial septal defect without pulmonary stenosis or pulmonary hypertension  |
|            |  Y3=ventricular septal defect with valvular pulmonary stenosis                 |
|            |  Y4=isolated pulmonary hypertension                                            |
|            |  Y5=transposed great vessels                                                   |
|            |  Y6=ventricular septal defect without pulmonary hypertension                   |
|            |  Y7=ventricular septal defect with pulmonary hypertension                      |
|Prevalence  |  Prevalence                                                                    |
|X1          |  age 1-20 years old                                                            |
|X2          |  age>20 years old                                                              |
|X3          |  mild cyanosis                                                                 |
|X4          |  easy fatigue                                                                  |
|X5          |  chest pain                                                                    |
|X6          |  repeated respiratory infections                                               |
|X7          |  EKG axis more than 110                                                        |


### HORMONE
[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/HORMONE.csv)

|  Variable  |  Description/Code                      |
|------------|----------------------------------------|
|  ID        |  ID                                    |
|  Bilsecpr  |  Biliary secretion-pre                 |
|  Bilphpr   |  Biliary pH-pre                        |
|  Pansecpr  |  Pancreatic secretion-pre              |
|  Panphpr   |  Pancreatic pH-pre                     |
|  Dose      |  Dose                                  |
|  Bilsecpt  |  Biliary secretion-post                |
|  Bilphpt   |  Biliary pH-post                       |
|  Pansecpt  |  Pancreatic secretion-post             |
|  Panphpt   |  Pancreatic pH-post                    |
|  Hormone   |  Hormone 1=SAL/2=APP/3=CCK/4=SEC/5=VIP |


### HOSPITAL

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/HOSPITAL.csv)


|  Variable  |  Label                                  |
|------------|-----------------------------------------|
|  Id        |  id no.                                 |
|  Dur_stay  |  Duration of hospital stay              |
|  Age       |  Age                                    |
|  Sex       |  Sex  1=male/2=female                   |
|  Temp      |  First temperature following admission  |
|  WBC       |  First WBC(x1000) following admission   |
|  Antibio   |  Received antibiotic 1=yes/2=no         |
|  Bact_cul  |  Received bacterial culture 1=yes/2=no  |
|  Service   |  Service 1=med/2=surg.                  |

Fra studie af antibiotikabrug på et hospital i Pennsylvania. Baseret på 
journaler fra patienter der er udskrevet. WBC er "White Bloodcell Count".

Det kan have klinisk interesse om længden af indlæggelse er afhængig af 
om patienterne modtager antibiotika behandling.

Yderligere reference: 

Townsend, T.R., Shapiro, M., Rosner, B. & Kass, E.H. (1979) Journal of
Infectious Diseases, 139(6) 688-697.




### INFANTBP

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/INFANTBP.csv)

Salt Taste Variables

|  Variable  |  Format |  Description                         |
|------------|---------|--------------------------------------|
|  ID        |         |                                      |
|  Mn_sbp    |  xx.xx  |  Mean SBP 99.99=missing              |
|  Mn_dbp    |  xx.xx  |  Mean DBP 99.99=missing              |
|  MSB1slt   |  xxx.xx |  MSB-trial 1* water                  |
|  MSB2slt   |  xxx.xx |  MSB-trial 2 water                   |
|  MSB3slt   |  xxx.xx |  MSB-trial 3 0.1 molar salt + water  |
|  MSB4slt   |  xxx.xx |  MSB-trial 4 0.1 molar salt + water  |
|  MSB5slt   |  xxx.xx |  MSB-trial 5 water                   |
|  MSB6slt   |  xxx.xx |  MSB-trial 6 water                   |
|  MSB7slt   |  xxx.xx |  MSB-trial 7 0.3 molar salt + water  |
|  MSB8slt   |  xxx.xx |  MSB-trial 8 0.3 molar salt + water  |
|  MSB9slt   |  xxx.xx |  MSB-trial 9 water                   |
|  MSB10slt  |  xxx.xx |  MSB-trial 10 water                  |

Sugar Taste Variables

|  Variable  |  Format  |  Description                        |
|------------|----------|-------------------------------------|
|  MSB1sug   |  xxx.xx  |  MSB-trial 1 non-nutritive sucking  |
|  MSB2sug   |  xxx.xx  |  MSB-trial 2 water                  |
|  MSB3sug   |  xxx.xx  |  MSB-trial 3 5% sucrose + water     |
|  MSB4sug   |  xxx.xx  |  MSB-trial 4 15% sucrose + water    |
|  MSB5sug   |  xxx.xx  |  MSB-trial 5 non-nutritive sucking  |


* for MSB data 999.99 is a missing value; 0 indicates the baby did not suck.


### LEAD

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/LEAD.csv)

|  VARIABLE  |  DESCRIPTION                 |
|------------|------------------------------|
|  id        |  IDENTIFICATION NUMBER       |
|  area      |  AREA - RESIDENCE ON AUG'72  |
|            |  1=0-1 MILES FROM SMELTER    |
|            |  2=1-2.5 MILES               |
|            |  3=2.5-4.1 MILES             |
|  ageyrs    |  AGE in years xx.xx          |
|  sex       |  SEX  1=MALE  2=FEMALE       |


IQ TEST RESULTS

|  VARIABLE  |  DESCRIPTION                                                           |
|------------|------------------------------------------------------------------------|
|  iqv_inf   |  INF - INFORMATION SUBTEST IN WISC AND WPPSI                           |
|  iqv_comp  |  COMP - COMPREHENSION SUBTEST IN WISC AND WPPSI                        |
|  iqv_ar    |  AR - ARITHMETIC SUBTEST IN WISC AND WPPSI                             |
|  iqv_ds    |  DS - DIGIT SPAN SUBTEST(WISC) AND SENTENCE COMPLETION(WPPSI)          |
|  iqv_raw   |  V/RAW - RAW SCORE/VERBAL IQ                                           |
|  iqp_pc    |  PC - PICTURE COMPLETION SUBTEST IN WISC AND WPPSI                     |
|  iqp_bd    |  BD - BLOCK DESIGN SUBTEST IN WISC AND WPPSI                           |
|  iqp_oa    |  OA - OBJECT ASSEMBLY SUBTEST(WISC), ANIMAL HOUSE SUBTEST(WPPSI)       |
|  iqp_cod   |  COD - CODING SUBTEST(WISC), GEOMETRIC DESIGN SUBTEST(WPPSI)           |
|  iqp_raw   |  P/RAW - RAW SCORE/PERFORMANCE IQ (TOTAL OF SCORES PC, BD, OA, & COD)  |
|  hh_index  |  HH/INDEX - HOLLINGSHEAD INDEX OF SOCIAL STATUS                        |
|  iqv       |  IQV - VERBAL IQ                                                       |
|  iqp       |  IQP - PERFORMANCE IQ                                                  |
|  iqf       |  IQF - FULL SCALE IQ (NOT SUM OR AVERAGE OF IQV D IQP)                 |
|  iq_type   |  TYPE OF IQ TEST   1=WISC  2=WPPSI                                     |
|            |  (WISC USUALLY GIVEN TO CHILDREN GE 5 YRS 1 MONTH OF AGE               |
|            |  WPPSI USUALLY GIVEN TO CHILDREN LE 5YRS OF AGE)                       |
|  lead_grp  |  GROUP - BLOOD LEAD LEVEL GROUP                                        |
|            |  1=BLOOD LEAD LEVELS BELOW 40 MICROGRAMS/100ML IN                      |
|            |  BOTH 1972 & 1973 (control group)                                      |
|            |  2=BLOOD LEAD LEVELS GREATER THAN OR EQUAL TO                          |
|            |  40 MICROGRAMS/100ML                                                   |
|            |  IN BOTH 72 & 73 OR A LEVEL GREATER THAN OR                            |
|            |  EQUAL TO 40                                                           |
|            |  IN 73 ALONE (3 CASES ONLY) (currently exposed                         |
|            |  Group)                                                                |
|            |  3=BLOOD LEAD LEVELS GREATER THAN OR EQUAL TO                          |
|            |  40 MICROGRAMS/100ML                                                   |
|            |  IN 72 AND LESS THAN 40 IN 73                                          |
|            |  (previously exposed group)                                            |
|  Group     |  1=control group; 2=exposed group                                      |
|  ld72      |  LD72 - BLOOD LEAD VALUES (MICROGRAMS/100ML) IN72                      |
|            |  MISSING=99                                                            |
|  ld73      |  LD73 - BLOOD LEAD VALUES (MICROGRAMS/100ML) IN 73                     |
|  fst2yrs   |  FST2YRS - DID CHILD LIVE FOR 1ST 2 YRS WITHIN                         |
|            |  1 MILE OF SMELTER  1=YES  2=NO                                        |
|  totyrs    |  TOTYRS - TOTAL NUMBER OF YEARS SPENT WITHIN                           |
|            |  4.1 MILES OF SMELTER                                                  |


SYMPTOM DATA (AS REPORTED BY PARENTS)

|  VARIABLE  |  DESCRIPTION                |
|------------|-----------------------------|
|  pica      |  PICA   1=YES  2=NO         |
|  colic     |  COLIC  1=YES  2=NO         |
|  clumsi    |  CLUMSINESS  1=YES  2=NO    |
|  irrit     |  IRRITABILITY  1=YES  2=NO  |
|  convul    |  CONVULSIONS  1=YES  2=NO   |

CONTAIN NEUROLOGICAL TEST DATA

|  VARIABLE  |  DESCRIPTION                                                     |
|------------|------------------------------------------------------------------|
|  _2plat_r  |  # OF TAPS FOR RIGHT HAND IN THE 2-PLATE TAPPING                 |
|            |  TEST  (#TAPS IN ONE 10 SECOND TRIAL)                            |
|            |  MISSING=99                                                      |
|  _2plat_l  |  # OF TAPS FOR LEFT HAND IN THE 2-PLATE TAPPING TEST             |
|            |  (#TAPS IN ONE 10 SECOND TRIAL)                                  |
|            |  MISSING=99                                                      |
|  visrea_r  |  VISUAL REACTION TIME RIGHT HAND (MILLISECONDS)                  |
|            |  MISSING=99                                                      |
|  visrea_l  |  VISUAL REATION TIME LEFT HAND (MILLISECONDS)                    |
|            |  MISSING=99                                                      |
|  audrea_r  |  AUDITORY REACTION TIME RIGHT HAND (MILLISECONDS)                |
|            |  MISSING=99                                                      |
|  audrea_l  |  AUDITORY REACTION TIME LEFT HAND (MILLISECONDS)                 |
|            |  MISSING=99                                                      |
|  fwt_r     |  FINGER-WRIST TAPPING TEST RIGHT HAND                            |
|            |  (# TAPS IN ONE 10 SECOND TRIAL)                                 |
|            |  MISSING=99                                                      |
|  fwt_l     |  FINGER-WRIST TAPPING TEST LEFT HAND                             |
|            |  (#TAPS IN ONE 10 SECOND TRIAL)                                  |
|            |  MISSING=99                                                      |
|  hyperact  |  WWPS - WERRY-WEISS-PETERS SCALE FOR HYPERACTIVITY               |
|            |  0=NO ACTIVITY . . . . 4=SEVERLY HYPERACTIVE                     |
|            |  (AS REPORTED BY PARENTS) MISSING=99                             |
|  maxfwt    |  Finger-wrist tapping test in dominant hand(max of fwt_r,fwt_l)  |



### MICE

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/MICE.csv)

|  Variable  |  Description           |
|------------|------------------------|
|  Id        |  ID                    |
|  Group     |  GROUP 1=RP  2=NORMAL  |
|  Trtgrp    |  TREATMENT GROUP       |
|            |  A=LIGHT               |
|            |  B=DIM                 |
|            |  C=DARK                |
|  Age       |  AGE (days)            |
|  B_amp     |  B AMP  9999=missing   |
|  A_amp     |  A AMP  9999=missing   |


### NEPHRO

Data^1^ from a litterature search, comparing nephrotoxicity 
of several different aminoclycosides[^17]. Each row co

 [@sandpaper]


[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/NEPHRO.csv)

|  Variable  |  Description/Code                                  |
|------------|----------------------------------------------------|
|  name      |  Study name                                        |
|  id        |  Study number                                      |
|  Endpnt    |  Endpoint  2=nephrotoxicity                        |
|  Antibio   |  Antibiotic 1=Amikacin/2=Gentamicin/3=Netilmicin/  |
|            |  4=Sisomycin/5=Tobramycin                          |
|  Samp_sz   |  Sample size                                       |
|  Side_eff  |  Number with side effects                          |



### NIFED

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/NIFED.csv)

|  Variable  |  Description            |  Code                    |
|------------|-------------------------|--------------------------|
|  Id        |  ID                     |                          |
|  trtgrp    |  Treatment group        |  N=nifedipine/P=placebo  |
|  bashrtrt  |  Baseline heart rate*   |  beats/min               |
|  lv1hrtrt  |  Level 1 heart rate+    |  beats/min               |
|  lv2hrtrt  |  Level 2 heart rate     |  beats/min               |
|  lv3hrtrt  |  Level 3 heart rate     |  beats/min               |
|  bassys    |  Baseline systolic bp*  |  mm Hg                   |
|  lv1sys    |  Level 1 systolic bp    |  mm Hg                   |
|  lv2sys    |  Level 2 systolic bp    |  mm Hg                   |
|  lv3sys    |  Level 3 systolic bp    |  mm Hg                   |


* Immediately prior to randomization.

+ Highest heart rate and systolic blood pressure at baseline and each level of
  therapy respectively.

Values of 999 indicates that either

(a) the patient withdrew from the study prior to entering this level of therapy

(b) the patient achieved pain relief prior to reaching this level or therapy,

(c) the patient encountered this level of therapy, but this particular piece
       of data was missing.

### OTO

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/OTO.csv)

|  Variable  |  Description/Code                                    |
|------------|------------------------------------------------------|
|  Name      |  Study Name                                          |
|  Id        |  Study Number                                        |
|  Endpnt    |  Endpoint 1=efficacy/2=nephrotoxicity/3=ototoxicity  |
|  Antibio   |  Antibiotic 1=Amikacin/2=Gentamicin/3=Netilmicin/    |
|            |  4=Sisomycin/5=Tobramycin                            |
|  Samp_sz   |  Sample Size                                         |
|  Side_eff  |  Number with side effect                             |


### PIRIFORM

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/PIRIFORM.csv)

|  Variable  |  Code                                         |
|------------|-----------------------------------------------|
|  ID        |                                               |
|  piriform  |  Piriformis Syndrome 1=Negative,  2=Positive  |
|  sex       |  Sex  1=Male,  2=Female                       |
|  age       |  Age                                          |
|  maxchg    |  Max change between tibia and peroneal        |


### SEXRAT

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SEXRAT.csv)

|  Variable   |  code                 |
|-------------|-----------------------|
|  nm_chld+   |  Number of children   |
|  sx_1       |  Sex of 1st born      |
|  sx_2       |  Sex of 2nd born      |
|  sx_3       |  Sex of 3rd born      |
|  sx_4       |  Sex of 4th born      |
|  sx_5       |  Sex of 5th born      |
|  sexchldn*  |  Sex of all children  |
|  num_fam**  |  Number of families   |

+ For families with 5+ children, the sex of the first 5 children are listed.
The number of children is given as 5 for such families.

* The sex of successive births is given. Thus, MMMF means that the first
three children were males and the fourth child was a female. There were 484
such families.

** Number of families with specific gender contribution of children


### SMOKE

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SMOKE.csv)

|  Variable  |  Code                                               |
|------------|-----------------------------------------------------|
|  ID        |  ID number                                          |
|  Age       |  age                                                |
|  Gender    |  Gender        1=male/2=female                      |
|  Cig_day   |  Cigarettes/day                                     |
|  CO        |  Carbon monoxide (CO) (X 10) missing=999            |
|  Min_last  |  Minutes elapsed since last cigarette missing=9999  |
|  LogCOadj  |  Log CO Adj * (X 1000)  missing=9999                |
|  Day_abs   |  Days abstinent  Those abstinent less than 1 day    |
|            |  were given a value of zero.                        |


* This variable represents adjusted carbon monoxide (CO) values. CO values
were adjusted for minutes elapsed since last cigarette smoked using the formula
Log 10 CO (Adjusted) = Log 10 CO - (-0.000638) X (Min - 80), where Min is the
number of minutes elapsed since the last cigarette smoked.  


### SWISS

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SWISS.csv)

|  Variable   |  Codes                                            |
|-------------|---------------------------------------------------|
|  ID         |  ID                                               |
|  age (yrs)  |  age (yrs)                                        |
|  group      |  Group    1=High NAPAP, 2=Low NAPAP, 3 = control  |
|  creat_68   |  x.xx Serum Creatinine 1968 (mg/dL) 9.99=missing  |
|  creat_69   |  x.xx Serum Creatinine 1969 (mg/dL) 9.99=missing  |
|  creat_70   |  x.xx Serum Creatinine 1970 (mg/dL) 9.99=missing  |
|  creat_71   |  x.xx Serum Creatinine 1971 (mg/dL) 9.99=missing  |
|  creat_72   |  x.xx Serum Creatinine 1972 (mg/dL) 9.99=missing  |
|  creat_75   |  x.xx Serum Creatinine 1975 (mg/dL) 9.99=missing  |
|  creat_78   |  x.xx Serum Creatinine 1978 (mg/dL) 9.99=missing  |



### TEAR

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TEAR.csv)

|  Variable  |  Code                          |
|------------|--------------------------------|
|  ID        |                                |
|  od3bas1   |  OD 3sec baseline 1            |
|  od3bas2   |  OD 3 sec baseline 2           |
|  od3im1    |  OD 3 sec immediately post 1   |
|  od3im2    |  OD 3 sec immediately post 2   |
|  od3pst51  |  OD 3 sec 5min post 1          |
|  od3pst52  |  OD 3 sec 5min post 2          |
|  od3pt101  |  OD 3 sec 10min post 1         |
|  od3pt102  |  OD 3 sec 10min post 2         |
|  od3pt151  |  OD 3 sec 15min post 1         |
|  od3pt152  |  OD 3 sec 15min post 2         |
|  os3bas1   |  OS 3sec baseline 1            |
|  os3bas2   |  OS 3 sec baseline 2           |
|  os3im1    |  OS 3 sec immediately post 1   |
|  os3im2    |  OS 3 sec immediately post 2   |
|  os3pst51  |  OS 3 sec 5min post 1          |
|  os3pst52  |  OS 3 sec 5min post 2          |
|  os3pt101  |  OS 3 sec 10min post 1         |
|  os3pt102  |  OS 3 sec 10min post 2         |
|  os3pt151  |  OS 3 sec 15min post 1         |
|  os3pt152  |  OS 3 sec 15min post 2         |
|  od6bas1   |  OD 6 sec baseline 1           |
|  od6bas2   |  OD 6 sec baseline 2           |
|  od6im1    |  OD 6 sec immediately post 1   |
|  od6im2    |  OD 6 sec immediately post 2   |
|  od6pst51  |  OD 6 sec 5min post 1          |
|  od6pst52  |  OD 6 sec 5min post 2          |
|  od6pt101  |  OD 6 sec 10min post 1         |
|  od6pt102  |  OD 6 sec 10min post 2         |
|  od6pt151  |  OD 6 sec 15min post 1         |
|  od6pt152  |  OD 6 sec 15min post 2         |
|  os6bas1   |  OS 6 sec baseline 1           |
|  os6bas2   |  OS 6 sec baseline 2           |
|  os6im1    |  OS 6 sec immediately post 1   |
|  os6im2    |  OS 6 sec immediately post 2   |
|  os6pst51  |  OS 6 sec 5min post 1          |
|  os6pst52  |  OS 6 sec 5min post 2          |
|  os6pt101  |  OS 6 sec 10min post 1         |
|  os6pt102  |  OS 6 sec 10min post 2         |
|  os6pt151  |  OS 6 sec 15min post 1         |
|  os6pt152  |  OS 6 sec 15min post 2         |
|  od10bas1  |  OD 10 sec baseline 1          |
|  od10bas2  |  OD 10 sec baseline 2          |
|  od10im1   |  OD 10 sec immediately post 1  |
|  od10im2   |  OD 10 sec immediately post 2  |
|  od10ps51  |  OD 10 sec 5min post 1         |
|  od10ps52  |  OD 10 sec 5min post 2         |
|  od10p101  |  OD 10 sec 10min post 1        |
|  od10p102  |  OD 10 sec 10min post 2        |
|  od10p151  |  OD 10 sec 15min post 1        |
|  od10p152  |  OD 10 sec 15min post 2        |
|  os10bas1  |  OS 10 sec baseline 1          |
|  os10bas2  |  OS 10 sec baseline 2          |
|  os10im1   |  OS 10 sec immediately post 1  |
|  os10im2   |  OS 10 sec immediately post 2  |
|  os10ps51  |  OS 10 sec 5min post 1         |
|  os10ps52  |  OS 10 sec 5min post 2         |
|  os10p101  |  OS 10 sec 10min post 1        |
|  os10p102  |  OS 10 sec 10min post 2        |
|  os10p151  |  OS 10 sec 15min post 1        |
|  os10p152  |  OS 10 sec 15min post 2        | 

### TEMPERAT

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TEMPERAT.csv)

|  Variable  |    LABEL                                 |
|------------|------------------------------------------|
|  Date      |  DATE (MDY)                              |
|  Out_temp  |  OUTSIDE TEMERATURE  Degrees Fahrenheit  |
|  Room      |  ROOM LOCATION                           |
|  In_temp   |  INSIDE TEMPERATURE  Degrees Fahrenheit  |
|  Cor_fac   |  CORRECTION FACTOR ADDED (1=YES 0=NO)    |
|  Typ_wea   |  TYPE OF WEATHER                         |
|            |           1=SUNNY                        |
|            |           2=PARTLY CLOUDY                |
|            |           3=CLOUDY                       |
|            |           4=RAINY                        |
|            |           5=FOGGY                        |
|            |           9=MISSING                      |

### TENNIS1

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TENNIS1.csv)

|  VARIABLE  |  VARIABLE NAME                                    |
|------------|---------------------------------------------------|
|  Id        |  ID                                               |
|  Age       |  AGE    99=MISSING                                |
|  Sex       |  SEX   1=MALE / 2=FEMALE                          |
|  Num_epis  |  NUMBER OF EPISODES OF TENNIS ELBOW 9=MISSING     |
|  Typ_last  |  TYPE OF RACQUET USED DURING LAST EPISODE         |
|            |          1=CONVENTIONAL SIZE                      |
|            |          2=MID-SIZE                               |
|            |          3=OVER-SIZE                              |
|            |          9=MISSING                                |
|  Wgt_last  |  WEIGHT OF RACQUET USED DURING LAST EPISODE       |
|            |          1=HEAVY                                  |
|            |          2=MEDIUM                                 |
|            |          3=LIGHT                                  |
|            |          4=DON'T KNOW                             |
|            |          9=MISSING                                |
|  Mat_last  |  MATERIAL OF RACQUET USED DURING LAST EPISODE     |
|            |          1=WOOD                                   |
|            |          2=ALUMINUM                               |
|            |          3=FIBERGLASS AND COMPOSITE               |
|            |          4=GRAPHITE                               |
|            |          5=STEEL                                  |
|            |          6=COMPOSITE                              |
|            |          7=OTHER                                  |
|            |          9=MISSING                                |
|  Str_last  |  STRING TYPE OF RACQUET USED DURING LAST EPISODE  |
|            |          1=NYLON                                  |
|            |          2=GUT                                    |
|            |          3=DON'T KNOW                             |
|            |          9=MISSING                                |
|  Typ_curr  |  TYPE OF RACQUET USED CURRENTLY                   |
|            |          1=CONVENTIONAL SIZE                      |
|            |          2=MID-SIZE                               |
|            |          3=OVER-SIZE                              |
|            |          9=MISSING                                |
|  Wgt_curr  |  WEIGHT OF RACQUET USED CURRENTLY                 |
|            |          1=HEAVY                                  |
|            |          2=MEDIUM                                 |
|            |          3=LIGHT                                  |
|            |          4=DON'T KNOW                             |
|            |          9=MISSING                                |
|  Mat_curr  |  MATERIAL OF RACQUET USED CURRENTLY               |
|            |          1=WOOD                                   |
|            |          2=ALUMINUM                               |
|            |          3=FIBERGLASS AND COMPOSITE               |
|            |          4=GRAPHITE                               |
|            |          5=STEEL                                  |
|            |          6=COMPOSITE                              |
|            |          7=OTHER                                  |
|            |          9=MISSING                                |
|  Str_curr  |  STRING TYPE OF RACQUET USED CURRENTLY            |
|            |          1=NYLON                                  |
|            |          2=GUT                                    |
|            |          3=DON'T KNOW                             |
|            |          9=MISSING                                | 

### TENNIS2

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TENNIS2.csv)

|  VARIABLE  |  PERIOD*  |  VARIABLE NAME                                                             |
|------------|-----------|----------------------------------------------------------------------------|
|  id        |           |  ID                                                                        |
|  age       |           |  AGE                                                                       |
|  sex       |           |  SEX                                                                       |
|            |           |       1 = MALE                                                             |
|            |           |       2 = FEMALE                                                           |
|            |           |       9 = MISSING                                                          |
|  drg_ord   |           |  DRUG ORDER                                                                |
|            |           |       1 = MOTRIN-PLACEBO                                                   |
|            |           |       2 = PLACEBO-MOTRIN                                                   |
|  painmx_2  |  2        |  DURING STUDY PERIOD, PAIN DURING MAXIMUM ACTIVITY VS                      |
|            |           |    BAESLINE                                                                |
|            |           |       1 = WORST                                                            |
|            |           |       2 = UNCHANGED                                                        |
|            |           |       3 = SLIGHTLY IMPROVED (25%)                                          |
|            |           |       4 = MODERATELY IMPROVED (50%)                                        |
|            |           |       5 = MOSTLY IMPROVED (75%)                                            |
|            |           |       6 = COMPLETELY IMPROVED                                              |
|            |           |       9 = MISSING                                                          |
|  pain12_2  |  2        |  WITHIN 12 HOURS FOLLOWING MAXIMAL ACTIVITY, COMPARED TO                   |
|            |           |    SAME PERIOD AT BASELINE  (SAME CODE AS painmx_2)                        |
|  painav_2  |  2        |  DURING THE AVERAGE DAY OF STUDY PERIOD PAIN VS. BASELINE                  |
|            |           |    (SAME CODE AS painmx_2)                                                 |
|  painov_2  |  2        |  OVERALL IMPRESSION OF DRUG EFFICACY VS. BASELINE (SAME CODE AS painmx_2)  |
|  painmx_3  |  3        |  DURING STUDY PERIOD, PAIN DURING MAXIMUM ACTIVITY VS                      |
|            |           |    BASELINE   (SAME CODE AS painmx_2)                                      |
|  pain12_3  |  3        |  WITHIN 12 HOURS FOLLOWING MAXIMAL ACTIVITY, COMPARED TO                   |
|            |           |    SAME PERIOD AT BASELINE   (SAME CODE AS painmx_2)                       |
|  painav_3  |  3        |  DURING THE AVERAGE DAY OF STUDY PERIOD PAIN VS BASELINE                   |
|            |           |    (SAME CODE AS painmx_2)                                                 |
|  painov_3  |  3        |  OVERALL IMPRESSION OF DRUG EFFICACY VS BASELINE                           |
|            |           |    (SAME CODE AS painmx_2)                                                 |
|  painmx_4  |  4        |  DURING STUDY PERIOD, PAIN DURING MAXIMUM ACTIVITY VS                      |
|            |           |    BASELINE   (SAME CODE AS painmx_2)                                      |
|  pain12_4  |  4        |  WITHIN 12 HOURS FOLLOWING MAXIMAL ACTIVITY, COMPARED TO                   |
|            |           |    SAME PERIOD AT BASELINE  (SAME CODE AS painmx_2)                        |
|  painav_4  |  4        |  DURING THE AVERAGE DAY OF STUDY PERIOD PAIN VS BASELINE                   |
|            |           |    (SAME CODE AS painmx_2)                                                 |
|  painov_4  |  4        |  OVERALL IMPRESSION OF DRUG EFFICACY VS BASELINE                           |
|            |           |    (SAME CODE AS painmx_2)                                                 |


* PERIOD 2 = PAIN SCORES AFTER THE FIRST ACTIVE DRUG PERIOD COMPARED WITH BASELINE
  
  PERIOD 3 = PAIN SCORES AFTER THE WASHOUT PERIOD COMPARED WITH BASELINE

  PERIOD 4 = PAIN SCORES AFTER THE SECOND ACTIVE DRUG PERIOD COMPARED WITH BASELINE



### VALID

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/VALID.csv)

|  Variable  |  Description              |Format or Code  |
|------------|---------------------------|----------------|
|  Id        |  ID number                |                |
|  sfat_dr   |  Saturated fat-DR         |   XXXXX.XX     |
|  sfat_ffq  |  Saturated fat-FFQ        |   XXXXX.XX     |
|  tfat_dr   |  Total fat-DR             |   XXXXX.XX     |
|  tfat_ffq  |  Total fat-FFQ            |   XXXXX.XX     |
|  alco_dr   |  Alcohol consumption-DR   |   XXXXX.XX     |
|  alco_ffq  |  Alcohol consumption-FFQ  |   XXXXX.XX     |
|  cal_dr    |  Total calories-DR        |  XXXXXX.XX     |
|  cal_ffq   |  Total calories-FFQ       |  XXXXXX.XX     |


### spermatozoa

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/spermatozoa.csv)

|  Variable          |  Description                                      |  Format  |
|--------------------|---------------------------------------------------|----------|
|  dreng             |  ID                                               |          |
|  foerste_positive  |  Alder ved første spermatozoa-positive urinprøve  |          |
|  indgang           |  Alder ved start af studie                        |          |
|  udgang            |  Alder ved slut af studie (evt deltagelse i)      |          |
|  observationer     |  Spermatozoa-positive urinprøver                  | +/-      |

Et 7-års longitudinalt studie startet foråret 1975 i Edinburgh. To klasser på
en grundskole blev bedt om at deltage, og informeret samtykke blev indhentet 
hos 40 af de 42 drenge i klasserne. Hver tredie måned blev en 24 timers urinprøve 
indsamlet fra hver dreng, og disse prøver blev analyseret for tilstedeværelse
af spermatozoer. I observationer er registreret resultatet for hver urinprøve.
+ indikerer tilstedeværelse af spermatozoer, - fravær.

Særligt egnet til øvelse i rensning af data

Estimation of Spermarche from Longitudinal Spermaturia Data
Merete Jorgensen, Niels Keiding, Niels Erik Skakkebaek
Biometrics, Vol. 47, No. 1 (Mar., 1991), pp. 177-193 (17 pages)
https://doi.org/10.2307/2532505
•

https://www.jstor.org/stable/2532505

### who

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/who.csv)

NB: Filen er semikolon-separeret

|  Variable  |  Description                      |  Format or Code            |
|------------|-----------------------------------|----------------------------|
|country     |  Landenavn                        |                            | 
|iso2        |  ISO2 landekode                   |                            | 
|iso3        |  ISO3 landekode                   |                            | 
|year        |  År                               | XXXX                       |         
|new         |  Artefakt fra databehandling      | Alle felter er "new"       |
|diag        |  Diagnostisk metode               |  *                         |
|sex         |  Køn                              |  m for male, f for female  |
|age_low     |  Nedre aldersinterval             |  XX                        |
|age_high    |  Øvre aldersinterval              |  XX                        |
|value       |  Antal observerede tilfælde af TB |                            |


*) diagnostisk metode
* sp positive pulmonary smear
* ne Negative pulmonary smear
* ep extrapulmonary
* relapse


## References


Bortset fra who-sættet, der er en modificeret udgave af datasættet who fra 
tidyr-pakken.

Den oprindelige kilde til det datasæt: https://www.who.int/teams/global-tuberculosis-programme/data

spermatozoa datasættet er fra 
Estimation of Spermarche from Longitudinal Spermaturia Data
Merete Jorgensen, Niels Keiding, Niels Erik Skakkebaek
Biometrics, Vol. 47, No. 1 (Mar., 1991), pp. 177-193 (17 pages)
https://doi.org/10.2307/2532505


https://www.jstor.org/stable/2532505

https://www.cengage.com/cgi-wadsworth/course_products_wp.pl?fid=M20b&product_isbn_issn=9780538733496&token


@misc{misc_wine_109,
  author       = {Aeberhard,Stefan and Forina,M.},
  title        = {{Wine}},
  year         = {1991},
  howpublished = {UCI Machine Learning Repository},
  note         = {{DOI}: https://doi.org/10.24432/C5PC7J}
}





<a id="rosner_1">1</a>: Rosner, Bernard A. Fundamentals of Biostatistics, 7/e, International Edition, 2011 ISBN: 9780538735896

<a id="hopper_2">2</a>: Hopper, J.H. & Seeman, E (1994). The bone density
of female twins discordant for tobacco use. New England Journal of Medicine, 330, 387-392.

<a id="mandel_3">3</a>: Mandel, E., Bluestone, C.D., Rockette, H.E., Blatter, M.M., Reisinger, K.S.,
Wucher, E.P. & Harper, J. 1982, Duration of effusion after antibiotic 
treatment for acute otitis media: Comparison of cefaclor and amoxicillin.
Pediatric Infections Diseases, 1, 310-316.





[^17]: Buring, J.E, Evans, D.A., Mayrent, S.L. Rosner, B. Colton, T & Hennekens, C.H. (1988). Randomized trials of aminoglycoside antibiotics. Reviews of Infectious Disease, 10(5) 951-957.


