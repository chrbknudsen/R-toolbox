---
title: "Data sets"
bibliography: poster_refs.bib
citeproc: true  
---


<!-- Referencer er lidt bøvlet... Vi laver dem ved at indsætte interne links.
TJEK at nummereringen er som den skal være hvis du ændrer noget.

Vi vil gerne have de der "1 er dette præparat, 2 det andet" i
en celle, snarere end i nye linier - stribningen er forvirrende.

Og vi kunne også godt tænke os dimensionerne angivet i beskrivelsen.
-->

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

_Dimensions:_ Rows: 23 Columns: 8

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BETACAR.csv)

:::: spoiler
### Metadata

|  Variable  |  Description/Code                               | Unit   |   
|------------|-------------------------------------------------|--------|
|  Prepar    |  Preparation<br>1=SOL<br>2=ROCHE<br>3=BASF-30<br>4=BASF-60  |        |
|  Id        |  Subject #                                      |        |
|  Base1lvl  |  1st Baseline Level                             | µmol/L |
|  Base2lvl  |  2nd Baseline Level                             | µmol/L |
|  Wk6lvl    |  Week 6 Level                                   | µmol/L |
|  Wk8lvl    |  Week 8 Level                                   | µmol/L |
|  Wk10lvl   |  Week 10 Level                                  | µmol/L |
|  Wk12lvl   |  Week 12 Level                                  | µmol/L |

::::

### BIGI

Basic Index of Gender Inequality (BIGI) introduced by Stoet and Geary in 2019
provides a symmetric index of gender inequality. It calculates the ratio
between three different equality indicators for men and women, and returns 
the average of them.

The ratio is calculated, and centered. Eg. if women in a given country have
an expected healthy life span of 71 years, and men have an expected healthy 
life span of 68 years, the ratio is 71/68 = 1.044118. A value of 1 will indicate
total equality.

This is done for life satisfaction (base on data from Gallup), healthy life span
and education (data for the latter two from Global Gender Gap). Education is 
calculated as the worst ratio of values for litteracy, enrollment in primary and
secondary education.

The three ratios are normalised to set parity equal to 0 and 
the overall BIGI score is calculated as the average of the three indicators.
As a result, values below 0 represent a disadvantage for boys and men, 
while values above 0 a disadvantage for girls and women.

A final indicator, AADP, calculates the average of the absolute values, i.e. give an indication
of inequality (0 is still parity) regardless of which sex is disadvantaged. 

All data is averaged over the period 2012 to 2016

_Dimensions:_ Rows: 134 Columns: 9

[Source](data.md#stoet_10)^10^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BIGI.csv)

:::: spoiler
### Metadata
|  Variable              |  Description/Code                                 | Unit   |   
|------------------------|---------------------------------------------------|--------|
|  rank                  | Ranking by AADP                                   |        |
|overall_rank            | Ranking by absolute value of BIGI                 |        |
|country                 |                                                   |        |
|BIGI                    | BIGI score as described                           |        |
|AADP                    | AADP score as described                           |        |
|basic_education         | Worst ratio of educational indicators, normalised |        |
|healthy_life_span       | Ratio of healthy life span, normalised            |        |
|life_satisfaction       | Ratio of life satisfaction, normalised            |        |
|human_development_index | HDI for country                                   |        |



::::


### BLOOD 

A case-control study of riskfactors (hormone levels in blood samples) for 
breast cancer. Individuals are matched on age and current postmenopausal homone
use (PMH). 

Each row contains unique ID, representing both cases (have breast cancer) and
control (does not have breast cancer). The column matchid matches the controls
with their respective cases. Cases have identical ID and matchid.

Note the different ways of coding missing values.

Useful for logistic regression to assess the association between testosterone
and breast cancer, controlling for age and current PMH use. Either with testosterone
as a continuous variable or as a categorical variabel in quartiles, with the first
quartile as the reference group.

_Dimensions_: Rows: 510 Columns: 9   

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BLOOD.csv)

:::: spoiler
### Metadata

|Variable  |  Description        |  Code                  | Unit  | 
|----------|---------------------|------------------------|-------|
|Id        |  ID                 |                        |       |
|matchid   |  Matched ID         |                        |       |
|case      |  1 = case <br> 0 = control |     |       |
|curpmh    |  Current PMH use <br> 1 = yes <br> 0 = no   |            |       |
|ageblood  |  Age at blood draw  |                        | years |
|estradol  |  Estradiol          |                        | pg/mL |
|estrone   |  Estrone †              |             | pg/mL |
|testost   |  Testosterone †       |             | ng/dL |
|prolactn  |  Prolactin ‡           |      | ng/L  |

† 999 indicates missing data
‡ 99.99  indicates missing data

::::





### BONEDEN

Data from a twin study on the relationship between bone density and cigarette
consumption [source](data.md#hopper_2)^2^. 41 pairs of middle-aged australian female 
twins with different smoking histories had their bone density measured at a hospital
in Victoria, as well
as other factors, details in metadata below. 

_Dimensions:_ Rows: 41 Columns: 25   

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BONEDEN.csv)

:::: spoiler
### Metadata

The data set is rather wide, and the columns are split up in this describtion.

|  Variable  |  Code       | Unit  | 
|------------|-------------|-------|
|  ID        |             |       |
|  Age       |  Age        | years |
|  zyg       |  Mono- or dizygotic twins<br>1 = mz<br> 2 = dz  |       |


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
|  men       |  Menopause Status<br>0: Premenopausal<br> 1: Postmenopausal<br>2: unknown or hysterectomy |                  |
|  pyr       |  Pack-years smoking         | year             |
|  ls        |  Lumbar spine †             | g/cm^2^          |
|  fn        |  Femoral neck ‡             | g/cm^2^          |
|  fs        |  Femoral shaft ⸸            | g/cm^2^          |

Pack-years are defined as how many years the woman have smoked a pack of 
cigarettes pr day, normally ca. 20 cigarettes pr pack.

† Lumbar spine: L1-L5. 

‡ Femoral neck: Collum femoris

⸸ Femoral shaft: Corpus femoris

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

_Dimensions:_ Rows: 70 Columns: 24 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BOTOX.csv)

:::: spoiler
## Metadata

|  Variable  |  Code                                   | unit |
|------------|-----------------------------------------|------|
|  ID        |                                         |      |
|  group     |  1 = TL <br> 2 = Placebo <br> 3 = Botox |      |
|  pain0     |  pain score month 0                     |  %   |
|  pain05    |  pain score month 0.5                   |  %   |
|  pain1     |  pain score month 1                     |  %   |
|  pain2     |  pain score month 2                     |  %   |
|  pain3     |  pain score month 3                     |  %   |
|  pain4     |  pain score month 4                     |  %   |
|  pain5     |  pain score month 5                     |  %   |
|  pain6     |  pain score month 6                     |  %   |
|  pain7     |  pain score month 7                     |  %   |
|  pain8     |  pain score month 8                     |  %   |
|  pain9     |  pain score month 9                     |  %   |
|  pain10    |  pain score month 10                    |  %   |
|  pain11    |  pain score month 11                    |  %   |
|  pain12    |  pain score month 12                    |  %   |
|  pain13    |  pain score month 13                    |  %   |
|  pain14    |  pain score month 14                    |  %   |
|  pain15    |  pain score month 15                    |  %   |
|  pain16    |  pain score month 16                    |  %   |
|  pain17    |  pain score month 17                    |  %   |

For all pain scores 999 indicates missing value.

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

_Dimensions:_ Rows: 1200 Columns: 18

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BREAST.csv)

:::: spoiler
## Metadata

|variable |  Description                                            | unit    |
|---------|---------------------------------------------------------|---------|
|Id       |  ID                                                     |         |
|case     |  case <br> 1 = case <br> 0 = control                    |         |
|age      |  age                                                    | years   |
|agemenar |  age at menarche                                        | years   |
|agemenop |  age at menopause                                       | years   |
|afb      |  age at first birth  98=nullip                          | years   |
|parity   |  parity                                                 |         |
|bbd      |  Benign Breast disease <br> 1 = yes <br> 0 = no         |         |
|famhx    |  family history breast cancer <br> 1 = yes <br> 0 = no   |         | 
|bmi      |  BMI                                                    | kg/m^2^ |
|hgt      |  Height                                                 | inches  |
|alcohol  |  Alcohol use                                            | g/day   |
|pmh      |  PMH status <br> 2 = never user <br> 3 = current user   |         | 
|dur3     |  Duration of Estrogen use  (months)                     | months  |
|dur4     |  Duration of Estrogen + progesterone use  (months)      | months  |
|csmk     |  Current Smoker <br> 1 = yes <br> 0 = no                |         | 
|psmk     |  Past smoker <br> 1 = yes <br> 0 = no                   |         | 
|foluptm  |  Months of follow up Note: Some subjects provided no <br> follow up after the 1990 questionnaire: foluptm=0 for <br> these people     |  months |

::::

###  CORNEAL

Data from a randomized trial of two different active drugs of the fluoroquinolone-group,
M and G along with a placebo, P.
93 subjects were placed in one of three groups:

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

_Dimensions:_ Rows: 186 Columns: 17   

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/CORNEAL.csv)


:::: spoiler
## Metadata


|Variable  |  Variable label                       | unit |
|----------|---------------------------------------|------|
|  id      |  ID                                   |      |
|  tr      |  Treatment <br> 1 = M <br> 2 = G <br> 3 = P  |      |
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
|  c3      |  Central Visit 3(day 14)              | mm |
|  s3      |  Superior Visit 3                     | mm |
|  i3      |  Inferior Visit 3                     | mm |
|  t3      |  Temporal Visit 3                     | mm |
|  n3      |  Nasal Visit 3                        | mm |

99 indicates missing values

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

_Dimensions:_ Rows: 910 Columns: 8     

[Source](data.md#rosner_1)^1^

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
|gly_a1c   |  Hemoglobin A1c                |  %   |
|ht_cm     |  Height †                      | cm   |
|wt_kg     |  Weight                        | kg   |

† 999.9 indicates missing data

::::

### EAR

Data on 214 children with acute otitis media in one or both
ears. They were randomly assigned 14 days of antibiotic treatment with either 
CEF (cefaclor) or AMO (amoxicillin). Status of their ear infection at a 
follow up visit after 14 days were recorded. 

_Dimensions:_ Rows: 278 Columns: 5 

[Source](data.md#rosner_1)^1^

Additional [reference](data.md#mandel_3)

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/EAR.csv)

:::: spoiler

### Metadata

| Variable  |         Description                                   |
|-----------|-------------------------------------------------------|
| Id        |  ID                                                   |  
| Clear     |  Clearance by 14 days <br> 1 = yes <br> 0 = no        |
| Antibo    |  Antibiotic <br>1 = CEF <br> 2 = AMO                  |  
| Age       |  Age <br> 1 = <2 yrs <br> 2 = 2-5 yrs <br> 3 = 6+ yrs |
| Ear       |  Ear <br> 1 = 1st ear <br> 2 = 2nd ear                |

::::

### EFF

Data from a litterature search on the efficacy (that is - is it working?) of
a number of aminoglycosides for the treatment of infectious diseases. 

Note that this dataset is basically the same as the dataset NEPHRO, where the
nephrotoxicity of the preparations described in the same papers is reported.

We get the sample size of patients in different studies, and the number of 
patients that were cured for their infection. Which antibiotic is best?

_Dimensions:_ Rows: 64 Columns: 6  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/EFF.csv)

:::: spoiler

## Metadata

|Variable  |  Description/Code|
|----------|----------------------------------------|
|Name      |  Study name                            |
|Id        |  Study Number                          |
|Endpnt    |  Endpoint  1=efficacy                  |
|Antibio   |  Antibiotic                            |
|          |  1 = Amikacin <br> 2 = Gentamicin <br> 3 = Netilmicin <br> 4 = Sisomycin <br> 5 = Tobramycin|
|Samp_sz   |  Sample Size                           |
|Cured     |  Number Cured                          |

::::

###  ENDOCRIN

Data for comparison of measurements of four hormones in five subjects. Measurements
were done twice on blood samples from each subject. Are the measurements reproducable?

_Dimensions:_ Rows: 10 Columns: 6 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/ENDOCRIN.csv)

:::: spoiler

## Metadata

| Variable   |  LABEL           | unit  |
|------------|------------------|-------|
|  Subject   |  Subject number  |       |
|  Replicat  |  REPLICATE #     |       |
|  Estrone   |  Estrone         | pg/mL |
|  Estradol  |  Estradiol       | pg/ml |
|  Androste  |  Androstenedione | ng/dL |
|  Testost   |  Testosterone    | ng/dL |


::::

### ESTRADL

Data on 211 women. Measurement of estradiol, ethnicity, number of children, 
BMI and Waist/hip ratio.

_Dimensions:_ Rows: 211 Columns: 10  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/ESTRADL.csv)

:::: spoiler

## Metadata

|Variable |  Code	                                                  | unit    |
|---------|---------------------------------------------------------|---------|
|Id       |  Identification number                                  |         |
|Estradl  |  Estradiol                                              | pg/ml   |
|Ethnic   |  Ethnicity <br> 0 = African-American <br> 1 = Caucasian |         |
|Entage   |  Age                                                    | year    |
|Numchild |  Parity, number of children  9=missing                  |         |
|Agefbo   |  Age at 1st birth (= 0 if numchild = 0) †               | year    |
|Anykids	|  Any children <br> 1 = yes <br> 0 = no <br> 9 = missing |         |
|Agemenar |  Age at menarche †                                      | years   |
|BMI      |  Body Mass Index                                        | kg/^m^^ |
|WHR      |  waist-hip ratio                                        |         |

CAVE: Note the coding of Agefbo

† 99 = missing

::::

### ESTROGEN

The influence on different doses of estrogen on systolic and diastolic blood pressure
is investigated. 31 subjects are placed into 1 of three study types, and recives
treatment two times for four weeks, with a two week washout period between.

Are there any significant differences between the different treatments - or carry over
effects on blood pressure in the different groups?

Also an example of untidy data with values in column names.


_Dimensions:_ Rows: 62 Columns: 22

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/ESTROGEN.csv)

:::: spoiler

## Metadata

|Variable  |  LABEL                        | unit |
|----------|-------------------------------|------|
|Id        |  ID                           |      |
|std_typ   |  STUDY TYPE <br> 1 = 0.625MG VS PLACEBO <br> 2 = 1.25MG VS PLACEBO <br> 3 = 1.25MG VS 0.625MG        |      |
|period    |  PERIOD                       |      |
|trtgrp    |  TREATMENT <br> 1 = PLACEBO <br>   2 = 0.625MG <br> 3 = 1.25MG |      |
|sysd1r1   |  SYSTOLIC BP DAY 1 READING 1  |  mmHg    |
|diasd1r1  |  DIASTOLIC BP DAY 1 READING 1 |  mmHg    |
|sysd1r2   |  SYSTOLIC BP DAY 1 READING 2  |  mmHg    |
|diasd1r2  |  DIASTOLIC BP DAY 1 READING 2 |  mmHg    |
|sysd1r3   |  SYSTOLIC BP  DAY 1 READING 3 |  mmHg    |
|diasd1r3  |  DIASTOLIC BP DAY 1 READING 3 |  mmHg    |
|sysd2r1   |  SYSTOLIC BP DAY 2 READING 1  |  mmHg    |
|diasd2r1  |  DIASTOLIC BP DAY 2 READING 1 |  mmHg    |
|sysd2r2   |  SYSTOLIC BP DAY 2 READING 2  |  mmHg    |
|diasd2r2  |  DIASTOLIC BP DAY 2 READING 2 |  mmHg    |
|sysd2r3   |  SYSTOLIC BP DAY 2 READING 3  |  mmHg    |
|diasd2r3  |  DIASTOLIC BP DAY 2 READING 3 |  mmHg    |
|sysd3r1   |  SYSTOLIC BP DAY 3 READING 1  |  mmHg    |
|diasd3r1  |  DIASTOLIC BP DAY 3 READING 1 |  mmHg    |
|sysd3r2   |  SYSTOLIC BP DAY 3 READING 2  |  mmHg    |
|diasd3r2  |  DIASTOLIC BP DAY 3 READING 2 |  mmHg    |
|sysd3r3   |  SYSTOLIC BP DAY 3 READING 3  |  mmHg    |
|diasd3r3  |  DIASTOLIC BP DAY 3 READING 3 |  mmHg    |

999: Missing bloodpressure data.

::::

### FEV

Data on 654 children seen in the [Childhood Respiratory Disease Study](learners/data.md#tage_6)^6^ in East Boston 
Massachusetts in 1980. Forced Expiratory Volume (FEV), an index of pulmonary
function was measured, along with, age, height, sex and smoking status. 

FEV is the volume of air (in liters) that can be expelled from the lungs in 
one second.

Usefull for demonstrating linear regressions, also multiple linear regression
with categorical interactions, and change in FEV as a function of height and sex.


_Dimensions:_ Rows: 654 Columns: 6 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FEV.csv)

:::: spoiler

## Metadata

|Variable |  Description                                                        |  Unit | 
|---------|---------------------------------------------------------------------|-------|
| Id      |  ID number                                                          |       |
| Age     |  Age                                                                | years |
| FEV     |  FEV                                                                | l     |
| Hgt     |  Height                                                             | in    |
| Sex     |  Sex <br> 0 = female <br> 1 = male                                  |       |
| Smoke   |  Smoking Status <br> 0 = non-current smoker <br> 1 = current smoker |       |

::::


### FIELD

Data from a study of the ocular disease Retinitis pigmentosoa (RP). 
The condition can result in substantial loss of vision, in some cases complete
blindness. It has been discovered that this disease is linked to two genes.
Mutations in the rhodosin gene RHO account for many cases that are predominantly
inherited, whereas mutations in the RPGR gene account for many sex-linked
cases; only males can have the RPGR mutation.
The study measures the visual field of approx. 100 patients in each group (RHO and
RPGR). The field of vision is measured in °^2^. 

Are there differences in the baseline level of visual field between the two
groups? Does the rate of decline differ between the two groups?

_Dimensions:_ Rows: 1326 Columns: 8  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/FIELD.csv)

:::: spoiler

## Metadata

|  Variable  |  Description                       | unit  | 
|------------|------------------------------------|-------|
|  id        |  ID                                |       |
|  group     |  group <br> 1 = RHO <br> 2 = RPGR  |       |
|  age       |  age at visit                      | years |
|  gender    |  gender <br> 1 = m <br> 2 = f      |       |
|  dtvisit   |  date of visit (month/day/year)    |       |
|  folowup   |  time from 1st visit               | years |
|  totfldod  |  total field area right eye (OD)   | °^2^  |
|  totfldos  |  total field area left eye (OS)    | °^2^  |

Note: all RPGR individuals have to be male

::::

### HEART

A dataset showing the prevalence of different heart conditions, in different
populations, and of different symptoms.

_Dimensions:_ Rows: 7 Columns: 9  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/HEART.csv)

:::: spoiler

## Metadata

|Variable    |  code                                                                          |
|------------|--------------------------------------------------------------------------------|
|Diagnosis   |  Y1 = normal <br> Y2 = atrial septal defect without pulmonary stenosis or pulmonary hypertension <br>  Y3 = ventricular septal defect with valvular pulmonary stenosis <br> Y4 = isolated pulmonary hypertension <br> Y5 = transposed great vessels <br> Y6 = ventricular septal defect without pulmonary hypertension <br>  Y7 = ventricular septal defect with pulmonary hypertension       |
|Prevalence  |  Prevalence                                                                    |
|X1          |  age 1-20 years old                                                            |
|X2          |  age>20 years old                                                              |
|X3          |  mild cyanosis                                                                 |
|X4          |  easy fatigue                                                                  |
|X5          |  chest pain                                                                    |
|X6          |  repeated respiratory infections                                               |
|X7          |  EKG axis more than 110                                                        |

::::

### HORMONE

Data on the influence of four hormones, compared with a saline solution on
the pancreatic and biliary secretions in laying hens. [White leghorn hens](https://en.wikipedia.org/wiki/Leghorn_chicken), aged 14-29 weeks, were
fitted with cannulas for collection of pancreatic and biliary secretions, and 
a jugular cannula for infusion of the hormones. One trial pr day was performed,
until the jugular cannula stopped working - therefore there are a different 
number of observations pr. hen. 

_Dimensions:_ Rows: 398 Columns: 11

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/HORMONE.csv)

:::: spoiler

## Metadata

|  Variable  |  Description/Code | unit |
|------------|--------|----------------|
|  ID        |  ID |      |
|  Bilsecpr  |  Biliary secretion-pre | µl/min       |
|  Bilphpr   |  Biliary pH-pre | pH     |
|  Pansecpr  |  Pancreatic secretion-pre |µl/min |
|  Panphpr   |  Pancreatic pH-pre                     | pH     |
|  Dose      |  Dose | APP: ng/mL plasma <br> CKK, VIP, SEC: µg/kg/h       |
|  Bilsecpt  |  Biliary secretion-post | µl/min |
|  Bilphpt   |  Biliary pH-post | pH     |
|  Pansecpt  |  Pancreatic secretion-post | µl/min |
|  Panphpt   |  Pancreatic pH-post | pH     |
|  Hormone   |  Hormone <br> 1 = SAL <br> 2 = APP <br> 3 = CCK <br> 4=SEC <br> 5=VIP |      |

A value of 0 for pH indicate missing values.

* SAL: Saline
* APP: Avian pancreatic polypeptide
* CCK: Cholecystokinin
* SEC: Secretine
* VIP: Vasoactive intestinal peptide

::::

### HOSPITAL

The dataset is part of a larger set, collected on patients discharged from
a hospital in Pennsylvania, as part of a study on use of antibiotic in hospitals.

Is the length of hospitalization affected on whether a patient received
antibiotics? 


_Dimensions:_ Rows: 25 Columns: 9  

[Source](data.md#rosner_1)^1^ & [reference](data.md#townsend_8)^8^.


[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/HOSPITAL.csv)

:::: spoiler

## Metadata

|  Variable  |  Label                                               | unit |
|------------|------------------------------------------------------|------|
|  Id        |  id no.                                              |      |
|  Dur_stay  |  Duration of hospital stay                           |      |
|  Age       |  Age                                                 |      |
|  Sex       |  Sex <br> 1 = male <br> 2 = female                   |      |
|  Temp      |  First temperature following admission               |      |
|  WBC       |  First WBC(x1000) following admission                |      |
|  Antibio   |  Received antibiotic <br> 1 = yes <br> 2 = no        |      |
|  Bact_cul  |  Received bacterial culture <br> 1 = yes <br> 2 = no |      |
|  Service   |  Service <br> 1 = med <br> 2 = surg.                 |      |

WBC: White Bloodcell Count, an indicator of infection.


::::



### INFANTBP

100 3 day old infants were given a drop of various solutions (salt or sugar),
and the vigour with witch they sucked was recorded. First ten measurements were
done with solutions only containing salt (or no salt at all). As a control, after
the measurements of the response to salt, the response to sugar solutions were
recorded. A common hypothesis is that the response to the taste of salt depends
on the blood pressure. Is this true?

_Dimensions:_ Rows: 100 Columns: 18  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/INFANTBP.csv)


:::: spoiler

## Metadata

|  Variable  |    Description                       | unit |
|------------|--------------------------------------|------|
|  ID        |                                      |      |
|  Mn_sbp    |  Mean SBP †                          | mmHg |
|  Mn_dbp    |  Mean DBP †                          | mmHg |


**Salt Taste Variables**

|  Variable  |    Description                       | 
|------------|--------------------------------------|
|  MSB1slt   |  MSB-trial 1 ‡ water                  |
|  MSB2slt   |  MSB-trial 2 water                   |
|  MSB3slt   |  MSB-trial 3 0.1 molar salt + water  |
|  MSB4slt   |  MSB-trial 4 0.1 molar salt + water  |
|  MSB5slt   |  MSB-trial 5 water                   |
|  MSB6slt   |  MSB-trial 6 water                   |
|  MSB7slt   |  MSB-trial 7 0.3 molar salt + water  |
|  MSB8slt   |  MSB-trial 8 0.3 molar salt + water  |
|  MSB9slt   |  MSB-trial 9 water                   |
|  MSB10slt  |  MSB-trial 10 water                  |

**Sugar Taste Variables**

|  Variable  |   Description                       |
|------------|-------------------------------------|
|  MSB1sug   |  MSB-trial 1 non-nutritive sucking  |
|  MSB2sug   |  MSB-trial 2 water                  |
|  MSB3sug   |  MSB-trial 3 5% sucrose + water     |
|  MSB4sug   |  MSB-trial 4 15% sucrose + water    |
|  MSB5sug   |  MSB-trial 5 non-nutritive sucking⸸ |


† For mean bloodpressure (Mn_sbp/Mn_dbp) 99.99 indicates a missing value.

‡ Unit of all MSB data is "mean number of sucks pr burst of sucking". 999.99 indicates a missing value; 0 indicates the baby did not suck.

⸸ non-nutrive sucking is sucking without the infant receiving liquid.

::::

### LEAD

A study of the effect of exposure to lead on neurological and psychological 
parameters for children. 124 children living in varying proximity 
to a lead smelter in El Paso in Texas, USA in 1972 and 1973 were studied.
Intelligence tests 
([WISC](https://en.wikipedia.org/wiki/Wechsler_Intelligence_Scale_for_Children) 
or [WPPSI](https://en.wikipedia.org/wiki/Wechsler_Preschool_and_Primary_Scale_of_Intelligence)) 
depending on age were performed as well as a neurological 
[finger tapping test](https://en.wikipedia.org/wiki/Tapping_rate).
Behavioral parameters as reported by the parents are also included.

Does lead concentration in the blood affect intelligence, behaviour 
and neurological parameters?

_Dimensions:_ Rows: 124 Columns: 40  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/LEAD.csv)


:::: spoiler

## Metadata

**Demographic variables**

|  Variable  |  Description                 | Unit |
|------------|------------------------------|------|
|  id        |  Identification number       |      |
|  area      |  Residence on Aug '72 <br> 1 = 0-1  <br> 2 = 1-2.5  <br> 3 = 2.5-4.1 | Miles from smelter |
|  ageyrs    |  Age           | Years |
|  sex       |  1 = Male <br> 2 = Female       |      |

**IQ test results**

|  Variable  |  Description                                                           |
|------------|------------------------------------------------------------------------|
|  iqv_inf   |  Information subtest in WISC and WPPSI                           |
|  iqv_comp  |  Comprehension subtest in WISC and WPPSI                        |
|  iqv_ar    |  Arithmetic subtest in WISC and WPPSI                             |
|  iqv_ds    |  Digit span subtest (WISC) and Sentence Completion (WPPSI)          |
|  iqv_raw   |  Raw score/Verbal IQ                                           |
|  iqp_pc    |  Picture completion subtest in WISC and WPPSI                     |
|  iqp_bd    |  Block design subtest in WISC and WPPSI                           |
|  iqp_oa    |  Object assembly subtest (WISC), animal house subtest (WPPSI)       |
|  iqp_cod   |  Coding subtest (WISC), geometric design subtest(WPPSI)           |
|  iqp_raw   |  Raw socre/performance IQ (total of scores pc, bd, oa & cod)  |
|  hh_index  |  Hollingshead index of social status                        |
|  iqv       |  Verbal IQ                                                       |
|  iqp       |  Performance IQ                                                  |
|  iqf       |  Full scale IQ (not sum or average of iqv or iqp)                 |
|  iq_type   |  Type of IQ test <br> 1 = WISC <br> 2 = WPPSI <br> (WISC usually given to children age >= 5 year 1 month<br> WPPSI usually given to children age < 5 year)                       |

**Lead exposure**

|  Variable  |  Description                                                           | Unit |
|------------|------------------------------------------------------------------------|------|
|  lead_grp  |  Blood lead level group <br> 1 = blood lead levels < 40  in both 1972 & 1973 (control group) <br> 2 = blood lead levels >= 40 in both 72 & 1973, or >= 40 in 1973 alone (3 cases) (currently exposed group) <br> 3 = blood lead levels >= 40 in 1972 and < 40 in 1973 (previously exposed group) | µg/100mL |
|            |  |      |
|  Group     |  1=control group <br> 2=exposed group                     |      |
|  ld72      |  Blood lead values in 1972 †                      |  µg/100mL    |
|  ld73      |  Blood lead values in 1973                     | µg/100mL     |
|  fst2yrs   |  Did child live for 1st 2 years within 1 mile of smelter <br> 1 = yes <br>  2 = no |      |
|  totyrs    |  Total number of years spent within 4.1 miles of smelter  |years      |

† 99 indicates missing data

**Symptom data (as reported by parents)**

|  Variable  |  Description                |
|------------|-----------------------------|
|  pica      |  An eating disorder <br> 1 = yes <br> 2 = no         |
|  colic     |  Colic <br> 1 = yes <br> 2 = no         |
|  clumsi    |  Clumsiness <br> 1 = yes <br> 2 = no    |
|  irrit     |  Irritability <br> 1 = yes <br> 2 = no  |
|  convul    |  Convulsions  <br> 1 = yes <br> 2 = no   |

**Neurological test data**

|  Variable  |  Description                                                     | Unit |
|------------|------------------------------------------------------------------|------|
|  _2plat_r  |  Number of taps for right hand in the 2-plate tapping test (number of taps in one 10 second trial)   † |      |
|  _2plat_l  |  Number of taps for left hand in the 2-plate tapping test (number of taps in one 10 second trial)  † |      |
|  visrea_r  |  Visual reaction time right hand †                |  ms    |
|  visrea_l  |  Visual reaction time left hand †                  | ms      |
|  audrea_r  |  Auditory reaction time right hand †                |   ms   |
|  audrea_l  |  Auditory reaction time left hand †                |  ms    |
|  fwt_r     |  Finger-wrist tapping test right hand (number of taps in one 10 second trial)  † |      |
|  fwt_l     |  Finger-wrist tapping test left hand (number of taps in one 10 second trial)  † |      |
|  hyperact  |  WWPS - Werry-Weiss-Peters Scale for hyperactivity <br> 0 = no activity . . . . 4 = severely hyperactive <br> (as reported by parents) †|      |
|  maxfwt    |  Finger-wrist tapping test in dominant hand (max of fwt_r,fwt_l)  |      |

† 99 indicates missing data

::::

### MICE

Retinitis Pigmentosa (RP) is a group of hereditary conditions that can 
cause night blindness and partial or total loss of vision. One method of following
the progression is taking electroretinograms (ERG), a measure of 
electrical activity in the retina. Amplitudes of these measurements declines
as the disease progresses. A hypothesis is
that direct exposure of the retina to sunligt is harmful. To test this
hypothesis a specific gene linked to the RP was introduces to a group of mice.
They were then randomly assigned to lighting conditions (Trtgrp) from birth.
A control group were treated similarly. 


Data should probably be log-transformed to ensure normality.

_Dimensions:_ Rows: 240 Columns: 6

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/MICE.csv)

:::: spoiler

## Metadata

|  Variable  |  Description           | unit |
|------------|------------------------|------|
|  Id        |  ID                    |      |
|  Group     | <br> 1 = RP <br> 2 = normal |      |
|  Trtgrp    |  Treatment group <br> A = light <br> B = dim <br> C = dark |      |
|  Age       |  Age                   | days |
|  B_amp     |  B Amplitude  †  |      |
|  A_amp     |  A Amplitude  † ‡  |      |

† The amplitude of B- and A-waves corresponding to different
frequencies of light in the ERG.

‡ Not measured for the control group

9999 = missing.

::::

### NEPHRO

Data from a litterature [study](data.md#buring_5)^5^ on nephrotoxicity of
of several different aminoclycosides.

Note that this dataset is closely related to the datasets EFF and OTO, where
EFF reports efficacy of the preparations, and OTO reports a combination of 
efficacy and side effects. 

We get the sample size of patients in different studies, and the number of 
patients that experienced nephrotoxicity. Which antibiotic is best?

_Dimensions:_ Rows: 72 Columns: 6  

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/NEPHRO.csv)

:::: spoiler

## Metadata

|  Variable  |  Description/Code                                  |
|------------|----------------------------------------------------|
|  name      |  Study name                                        |
|  id        |  Study number                                      |
|  Endpnt    |  Endpoint  2=nephrotoxicity                        |
|  Antibio   |  Antibiotic <br>1=Amikacin<br>2=Gentamicin<br>3=Netilmicin<br>4=Sisomycin<br>5=Tobramycin  |
|  Samp_sz   |  Sample size                                       |
|  Side_eff  |  Number with side effects                          |

::::

### NIFED

A test of nifedipine as a drug for reducing chest pain in patients with angina.
Unless the patient was withdrawn, discharged or died the study ran for 14 days.
Patients were randomly assigned either nifedipine or propanolol, and given
identical dosage at level 1 of therapy. If pain did not cease or recurred, the 
patient progressed to level 2 with increased dosage. Similar with a progression
to level 3. A secondary objective was to understand the effect of these drugs on
heart rate and blood pressure.

_Dimensions:_ Rows: 34 Columns: 10 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/NIFED.csv)

:::: spoiler

## Metadata

|  Variable  |  Description            |  Code                    |
|------------|-------------------------|--------------------------|
|  Id        |  ID                     |                          |
|  trtgrp    |  Treatment group        |  N=nifedipine/P=propanolol  |
|  bashrtrt  |  Baseline heart rate †  |  beats/min               |
|  lv1hrtrt  |  Level 1 heart rate ‡   |  beats/min               |
|  lv2hrtrt  |  Level 2 heart rate     |  beats/min               |
|  lv3hrtrt  |  Level 3 heart rate     |  beats/min               |
|  bassys    |  Baseline systolic bp † |  mm Hg                   |
|  lv1sys    |  Level 1 systolic bp ‡  |  mm Hg                   |
|  lv2sys    |  Level 2 systolic bp    |  mm Hg                   |
|  lv3sys    |  Level 3 systolic bp    |  mm Hg                   |


† Immediately prior to randomization.

‡ Highest heart rate and systolic blood pressure at baseline and each level of
  therapy respectively.

Values of 999 indicates that either

(a) the patient withdrew from the study prior to entering this level of therapy

(b) the patient achieved pain relief prior to reaching this level or therapy,

(c) the patient encountered this level of therapy, but this particular piece
       of data was missing.

::::

### OTO

Data from a litterature [study](data.md#buring_5)^5^ on nephro- and ototoxicity and efficacy of
of several different aminoclycosides.

Note that this dataset is closely related to the datasets EFF and NEPHRO, where
EFF reports efficacy of the preparations, and NEPHRO reports on nephrotoxicity.

We get the sample size of patients in different studies, and the number of 
patients that experienced sideeffects. Which antibiotic is best?

_Dimensions:_ Rows: 50 Columns: 6   

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/OTO.csv)

:::: spoiler

## Metadata

|  Variable  |  Description/Code        |
|------------|--------------------------|
|  Name      |  Study Name              |
|  Id        |  Study Number            |
|  Endpnt    |  Endpoint <br> 1 = efficacy <br> 2 = nephrotoxicity <br> 3 = ototoxicity|
|  Antibio   |  Antibiotic <br> 1 = Amikacin <br> 2 = Gentamicin <br> 3 = Netilmicin <br> 4 = Sisomycin <br> 5 = Tobramycin|
|  Samp_sz   |  Sample Size             |
|  Side_eff  |  Number with side effect |

::::

### PIRIFORM

_Dimensions:_ Rows: 631 Columns: 5 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/PIRIFORM.csv)

:::: spoiler

## Metadata

|  Variable  |  Code                                  |
|------------|----------------------------------------|
|  ID        |                                        |
|  piriform  |  Piriformis Syndrome <br> 1 = Negative <br> 2 = Positive |
|  sex       |  Sex <br> 1 = Male <br> 2 = Female                            |
|            |  Age                                   |
|  maxchg    |  Max change between tibia and peroneal |

::::

### SEXRAT

Frequencies of different sex orders of the first 5 children born in families.

Does the probability of a male birth differ from 50%?

Are the sex distribution of successive offspring independent? Ie, does the 
sex of the first born child, affect the probability of the second child?


_Dimensions:_ Rows: 60 Columns: 8   

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SEXRAT.csv)

:::: spoiler

## Metadata


|  Variable   |  code                 |
|-------------|-----------------------|
|  nm_chld+   |  Number of children   |
|  sx_1       |  Sex of 1st born      |
|  sx_2       |  Sex of 2nd born      |
|  sx_3       |  Sex of 3rd born      |
|  sx_4       |  Sex of 4th born      |
|  sx_5       |  Sex of 5th born      |
|  sexchldn † |  Sex of all children  |
|  num_fam ‡  |  Number of families   |

+ For families with 5+ children, the sex of the first 5 children are listed.
The number of children is given as 5 for such families.

† The sex of successive births is given. Thus, MMMF means that the first
three children were males and the fourth child was a female. There were 484
such families.

‡ Number of families with specific gender contribution of children

Example; there are:

* 4400 families with 2 children where both children are male, 
* 4270 families with 2 children where the first child is male, and the second female and,
* 4633 families with 2 children where the first child is female and the second male.

::::


:::: spoiler

## Example

Compare P(child 2 is male | child 1 is female) with P(child 2 is male | child 1 is male)

That is, the probability child 2 is male given that child 1 is female.

```r
sexrat <- read_csv("https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SEXRAT.csv")
  
# Number of families with female first child:
  
sexrat %>% 
  filter(sx_1 == "F") %>% 
  summarise(nF1 = sum(num_fam))

# A tibble: 1 x 1
nF1
<dbl>
  1 25719

# Number of those families with a male second child:

sexrat %>% 
  filter(sx_1 == "F",
         sx_2 == "M") %>% 
  summarise(nF1M2 = sum(num_fam))

# A tibble: 1 x 1
nF1M2
<dbl>
  1 12882

# Point estimate for probability of child 2 being male, given child 1 is female:

pF1M2 <- 12882/25719
pF1M2

[1] 0.5008748

# Standard error of mean for proportions:

SEM_F1M2 <- sqrt(pF1M2*(1-pF1M2)/25719)
SEM_F1M2
[1] 0.003117757

# That gives us a 95% confidence interval for P(Child 2 is male | Child 1 is female):

pF1M2 + c(-1,1)*1.96*SEM_F1M2

[1] 0.4947640 0.5069856
# Doing the same calculations for P(Child 2 is male |  Child 1 is male)
# gives us an interval of (rounded):

[1] 0.512 0.524

# Which would indicate the having a male child first, increases the probability
# of having a second male child.
```

::::


### SMOKE

_Dimensions:_ Rows: 234 Columns: 8

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SMOKE.csv)

:::: spoiler

## Metadata

|  Variable  |  Code                                               | unit |
|------------|-----------------------------------------------------|------|
|  ID        |  ID number                                          |      |
|  Age       |  age                                                |      |
|  Gender    |  Gender <br> <br> 1 = male <br> 2 = female          |      |
|  Cig_day   |  Cigarettes/day                                     |      |
|  CO        |  Carbon monoxide (CO) (X 10)             |      |
|  Min_last  |  Minutes elapsed since last cigarette   |      |
|  LogCOadj  |  Log CO Adj † (X 1000)                  |      |
|  Day_abs   |  Days abstinent  Those abstinent less than 1 day <br> were given a value of zero.|      |

999 and 9999 = missing values

† This variable represents adjusted carbon monoxide (CO) values. CO values
were adjusted for minutes elapsed since last cigarette smoked using the formula
Log 10 CO (Adjusted) = Log 10 CO - (-0.000638) X (Min - 80), where Min is the
number of minutes elapsed since the last cigarette smoked.  

::::

### SWISS

Data from the Swiss Analgesic Study, done to assess the effect on renal function
and other health parameters, taking different phenacity based analgesics.

In this part of the dataset, we get measurements of serum creatinine for different 
years.

624 women from workplaces near Basel with a high intake of phenacitin-based
analgesics. This was the study-group. 626 women from the same workplaces, with 
a low, or non-existent intake of these analgecis, was studied as the control-group.

The study group was, based on the level of NAPAP (N-acetyl-P-aminophenyl) in their 
blood samples, divided into high and low level sub-groups. Both subgroups had 
higher NAPAP levels than the control

A base-line measurement of serum creatinine was taken in 1967-68, and followups
were done in 1969-1978. 

_Dimensions:_ Rows: 300 Columns: 10 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/SWISS.csv)

:::: spoiler

## Metadata

|  Variable   |  Codes                                            | unit    |
|-------------|---------------------------------------------------|---------|
|  ID         |  ID                                               |         | 
|  age        |  age                                              | years   |
|  group      |  Group <br> 1 = High NAPAP <br> 2 = Low NAPAP <br> 3 = control |         |
|  creat_68   |  Serum Creatinine 1968                | (mg/dL) |
|  creat_69   |  Serum Creatinine 1969                | (mg/dL) |
|  creat_70   |  Serum Creatinine 1970                | (mg/dL) |
|  creat_71   |  Serum Creatinine 1971                | (mg/dL) |
|  creat_72   |  Serum Creatinine 1972                | (mg/dL) |
|  creat_75   |  Serum Creatinine 1975                | (mg/dL) |
|  creat_78   |  Serum Creatinine 1978                | (mg/dL) |

For all `creat_xx`: 9.99 indicates missing data, i.e. NA-values.

::::

### TEAR

_Dimensions:_ Rows: 14 Columns: 61     

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TEAR.csv)

:::: spoiler

## Metadata

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

::::

### TEMPERAT

_Dimensions:_ Rows: 630 Columns: 6 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TEMPERAT.csv)

:::: spoiler

## Metadata

|  Variable  |    LABEL                                       | unit |
|------------|------------------------------------------------|------|
|  Date      |  DATE (MDY)                                    |      |
|  Out_temp  |  Outside temperature                            | °F   |
|  Room      |  Room location                                 |      |
|  In_temp   |  Inside temperature                            | °F   |
|  Cor_fac   |  Correction FACTOR ADDED<br>1 = YES<br>0 = NO) |      |
|  Typ_wea   |  TYPE OF WEATHER<br>1 = SUNNY<br>2 = PARTLY CLOUDY<br>3 = CLOUDY<br>4 = RAINY<br>5 = FOGGY <br>9 = MISSING|      |


::::

### TENNIS1

_Dimensions:_ Rows: 444 Columns: 12 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TENNIS1.csv)

:::: spoiler

## Metadata

|  VARIABLE  |  VARIABLE NAME                                    | unit |
|------------|---------------------------------------------------|------|
|  Id        |  ID                                               | |
|  Age       |  Age    99=missing                                | years| 
|  Sex       |  Sex <br> 1 = male <br> 2 = female                             | |
|  Num_epis  |  Number of episodes of tennis elbow  9= missing     | |
|  Typ_last  |  Type of raquet used during last episode <br> 1 = conventional size <br> 2 = mid-size <br> 3 = over-size <br> 9 = missing         | |
|  Wgt_last  |  Weight of racquet used during last episode       | |
|            |          <br> 1 = heavy                                  | |
|            |          <br> 2 = medium                                 | |
|            |          <br> 3 = light                                  | |
|            |          <br> 4 = don't know                             | |
|            |          <br> 9 = missing                                | |
|  Mat_last  |  Material of racquet used during last episode     | |
|            |        <br>  1 = wood                                   | |
|            |        <br>  2 = aluminium                               | |
|            |        <br>  3 = fiberglass and composite               | |
|            |        <br>  4 = graphite                               | |
|            |        <br>  5 = steel                                  | |
|            |        <br>  6 = composite                              | |
|            |        <br>  7 = other                                  | |
|            |        <br>  9 = missing                                | |
|  Str_last  |  String type of racquet used during last episode  | |
|            |        <br>  1 = nylon                                  | |
|            |        <br>  2 = gut                                    | |
|            |        <br>  3 = don't know                             | |
|            |        <br>  9 = missing                                | |
|  Typ_curr  |  Type of racquet used currently                   | |
|            |  <br> 1 = conventional size                      | |
|            |  <br> 2 = mid-size                               | |
|            |  <br> 3 = over-size                              | |
|            |  <br> 9 = missing                                | |
|  Wgt_curr  |  Weight of racquet used currently                 | |
|            |  <br> 1 = heavy                                  | |
|            |  <br> 2 = medium                                 | |
|            |  <br> 3 = light                                  | |
|            |  <br> 4 = don't know                             | |
|            |  <br> 9 = missing                                | |
|  Mat_curr  |  Material of racquet used currently               | |
|            |  <br> 1 = wood                                   | |
|            |  <br> 2 = aluminium                              | |
|            |  <br> 3 = fiberglass and composite               | |
|            |  <br> 4 = graphite                               | |
|            |  <br> 5 = steel                                  | |
|            |  <br> 6 = composite                              | |
|            |  <br> 7 = other                                  | |
|            |  <br> 9 = missing                                | |
|  Str_curr  |  String type of racquet used currently            | |
|            |  <br> 1 = nylon                                  | |
|            |  <br> 2 = gut <br> 3 = don't know <br> 9 = missing                                    | |

::::

### TENNIS2

_Dimensions:_ Rows: 88 Columns: 16 

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/TENNIS2.csv)

:::: spoiler

## Metadata

|  VARIABLE  |  PERIOD*  |  VARIABLE NAME                                                             |
|------------|-----------|----------------------------------------------------------------------------|
|  id        |           |  ID                                                                        |
|  age       |           |  Age                                                                       |
|  sex       |           |  Sex <br> 1 = male <br> 2 = female <br> 9 = missing                                                                      |
|  drg_ord   |           |  Drug order <br> 1 = motrin-placebo <br> 2 = placebo-motrin |
|  painmx_2  |  2        |  During study period, pain during maximum activity vs baseline <br> 1 = worst <br> 2 = unchanged <br> 3 = slightly improved (25%) <br> 4 = moderately improved (50%) <br> 5 = mostly improved (75%) <br> 6 = completely improved <br> 9 = missing |
|  pain12_2  |  2        |  Within 12 hours following maximal activity, compared to                   |
|            |           |    same period at baseline  (same code as painmx_2)                        |
|  painav_2  |  2        |  During the average day of study period pain vs. baseline                  |
|            |           |    (same code as painmx_2)                                                 |
|  painov_2  |  2        |  Overall impression of drug efficacy vs. baseline (same code as painmx_2)  |
|  painmx_3  |  3        |  During study period, pain during maximum activity vs.                      |
|            |           |    baseline   (same code as painmx_2)                                      |
|  pain12_3  |  3        |  Within 12 hours following maximal activity, compared to same period at baseline   (same code as painmx_2)                |
|  painav_3  |  3        |  During the average day of study period pain vs. baseline                   |
|            |           |    (same code as painmx_2)                                                 |
|  painov_3  |  3        |  Overall impression of drug efficacy vs. baseline                           |
|            |           |    (same code as painmx_2)                                                 |
|  painmx_4  |  4        |  During study period, pain during maximum activity vs.                      |
|            |           |    baseline   (same code as painmx_2)                                      |
|  pain12_4  |  4        |  Within 12 hours following maximal activity, compared to                   |
|            |           |    same period at baseline  (same code as painmx_2)                        |
|  painav_4  |  4        |  During the average day of study period pain vs. baseline                   |
|            |           |    (same code as painmx_2)                                                 |
|  painov_4  |  4        |  Overall impression of drug efficacy vs baseline                           |
|            |           |    (same code as painmx_2)                                                 |


* PERIOD 2 = Pain scores after the first active drug period compared with baseline
  
  PERIOD 3 = Pain scores after the washout period compared with baseline

  PERIOD 4 = Pain scores after the second active drug period compared with baseline

::::

### VALID

Two ways of assessing consumption of specific foods were compared. 173 nurses
recored four weeks of diet recording (DR), approximately equally spaced over
12 months. After each recording period, a food-frequency questionaire (FFQ) were
completed. Diet recording and subsequent calculation of consumption of specific
nutrients are considered the gold standard, but are more expensive to administer
than the FFQ, where subjects record the number of servings of >100 individual
food items typically eaten. 

Compare the estimates of consumption between the two recording methods. 
Is a given respondent placed in the same quintile for eg alcohol consumption
measured by DR as measured by FFQ?


_Dimensions:_ Rows: 173 Columns: 9   

[Source](data.md#rosner_1)^1^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/VALID.csv)

:::: spoiler

## Metadata

|  Variable  |  Description              | unit  |
|------------|---------------------------|-------|
|  Id        |  ID number                |       |
|  sfat_dr   |  Saturated fat-DR         |   g   | 
|  sfat_ffq  |  Saturated fat-FFQ        |  g    |
|  tfat_dr   |  Total fat-DR             |  g    |
|  tfat_ffq  |  Total fat-FFQ            |  g    |
|  alco_dr   |  Alcohol consumption-DR   |  oz   |
|  alco_ffq  |  Alcohol consumption-FFQ  |  oz   |
|  cal_dr    |  Total calories-DR        | kcal  |
|  cal_ffq   |  Total calories-FFQ       | kcal  |

::::

### spermatozoa

Data from a 7 year longitudinal study started in spring 1975 in Edinburgh.
Two classes at an elementary school participated and informed consent were
collected from 40 of the 42 boys in the classes. Every 3 months a 24 hour
urine sample were collected from each boy. These samples were analysed for the
precense of spermatozoa. In the variable observations are registered the result
of each urine sample.

The purpose of the study was to determine age of spermache.

The format of observations is unusual and suitable for cleaning exercises.

Det kan godt være vi lige skal kigge på:For further details about the study see Nielsen et al. (1986a, 1986b).
mere præcist:
Nielsen, C. T., Skakkebxk, N. E., Darling, J. A. B., Hunter, W. M., Richardson, D. W., Jorgensen, M., and Keiding, N. (1986a).
Longitudinal study of testosterone and luteinizing hormone (LH) in relation to spermarche, pubic hair, height and sitting height in normal boys. Acta Endocrinologica 113, Supplementum 279, 98-106.

Nielsen, C. T., Skakkebxk, N. E., Richardson, D. W., Darling, J. A. B., Hunter, W. M., J0rgensen, M., Nielsen, A., Ingerslev, O., Keiding, N., and Muller, J. (1986b). Onset of the release of spermatozoa (spermarche) in boys in relation to age, testicular growth, pubic hair and height. Journal of Clinical Endocrinology and Metabolism 62, 532--535.

_Dimensions:_ Rows: 40 Columns: 5 

Også Rosner...

[Source](learners/data.md#jorgensen_4)^4^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/spermatozoa.csv)

:::: spoiler

## Metadata

|  Variable       |  Description                                      | unit  |
|-----------------|---------------------------------------------------|-------|
| boy             |  ID                                               |       |
| first_positive  |  Age at first spermatozoa-positive urine sample   | years |
| entry           |  Age at start of study                            | years |
| exit            |  Age at end of study (eg. exit from study)        | years |
| observations    |  Spermatozoa-positive urine samples               |       |
|                 |  + = positive                                     |       |
|                 |  - = negative                                     |       |

::::



### who

_Dimensions:_ Rows: 405440 Columns: 10 

[Source](learners/data.md#jorgensen_4)^4^ and [Source](learners/data.md#who_7)^7^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/who.csv)

NB: Filen er semikolon-separeret

:::: spoiler

## Metadata

|  Variable  |  Description                      |  Unit            |
|------------|-----------------------------------|----------------------------|
|country     |  Landenavn                        |                            | 
|iso2        |  ISO2 countrycode                   |                            | 
|iso3        |  ISO3 countrycode                   |                            | 
|year        |  year                               | XXXX                       |         
|new         |  Artefakt fra databehandling      | Alle felter er "new"       |
|diag        |  Diagnostisk metode               |  *                         |
|sex         |  Sex <br> m = male <br> f = female                               |    |
|age_low     |  Nedre aldersinterval             |  year                        |
|age_high    |  Øvre aldersinterval              |  year                        |
|value       |  Antal observerede tilfælde af TB |                            |


*) diagnostisk metode
* sp positive pulmonary smear
* ne Negative pulmonary smear
* ep extrapulmonary
* relapse

::::


### Wine

A data set containing the results of a chemical analysis of three different
cultivars (variety of grape), from the same region in Italy.
We are provided with 13 different quantities.

Usable for PCA and RDA. Note that this data set does not have column-names.


_Dimensions:_ Rows: 178 Columns: 14 

[Source](learners/data.md#wine_9)^9^

[Download](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/wine.data)

:::: spoiler

## Metadata

|  Variable  |  Description                      |  Unit                      |
|------------|-----------------------------------|----------------------------|
|1           | Cultivar                          |                            | 
|2           | Alcohol                           |                %           | 
|3           | Malic acid                        |         g/L                | 
|4           | Ash                               |   g/L                      |         
|5           | Alcalinity of ash                 |   meq/L <br> (milliequivalents per liter)     | 
|6           | Magnesium                         |        mg/L                   |
|7           | Total phenols                     |g/L    |
|8           | Flavanoids                        |        g/L                  |
|9           | Nonflavanoid phenols              |              g/L            |
|10          | Proanthocyanins                   |               g/L           |
|11          | Colour intensity                  |   Absorbance                |
|12          | Hue                               |  Absorbance-ratio           |
|13          | OD280/OD315 of diluted wines      | Absorbance-ratio            |
|14          | Proline                           |  mg/L                       |

Absorbance is measured as the sum of absorbance-units at 420, 520 and 620 nm 
(blue, green and red light respectively, measuring the yellow, red, and blue colours of the wine.)

Hue is measured as absorbance at 420 nm divided by absorbance at 520 nm.

OD280/OD315 is measured as absorbance at 280 nm divided by absorbance at 315 nm.

::::



## References

<a id="rosner_1">1</a>: Rosner, Bernard A. Fundamentals of Biostatistics, 7/e, International Edition, 2011 ISBN: 9780538735896. https://www.cengage.com/cgi-wadsworth/course_products_wp.pl?fid=M20b&product_isbn_issn=9780538733496&token

der er også guf her https://www.doc88.com/p-5925003681540.html

https://statanaly.com/wp-content/uploads/2023/04/Fundamentals-of-Biostatistics-7th-Edition.pdf

<a id="hopper_2">2</a>: Hopper, J.H. & Seeman, E (1994). The bone density
of female twins discordant for tobacco use. New England Journal of Medicine, 330, 387-392.

<a id="mandel_3">3</a>: Mandel, E., Bluestone, C.D., Rockette, H.E., Blatter, M.M., Reisinger, K.S.,
Wucher, E.P. & Harper, J. 1982, Duration of effusion after antibiotic 
treatment for acute otitis media: Comparison of cefaclor and amoxicillin.
Pediatric Infections Diseases, 1, 310-316.

<a id="jorgensen_4">4</a>: Jorgensen, Merete; Keiding, Niels; Skakkebaek, Niels Erik. Estimation of Spermarche from Longitudinal Spermaturia Data
Biometrics, Vol. 47, No. 1 (Mar., 1991), pp. 177-193 
https://doi.org/10.2307/2532505
https://www.jstor.org/stable/2532505

<a id="buring_5">5</a>: Buring, J.E, Evans, D.A., Mayrent, S.L. Rosner, B. Colton, T & Hennekens, C.H. (1988). Randomized trials of aminoglycoside antibiotics. Reviews of Infectious Disease, 10(5) 951-957.

<a id ="tage_6">6</a>: Tage, I.B., Weiss, S.T., Rosner, B. & Speizer, F.E. (1979), Effect of parental cigarette smoking on pulmonary function in children. American Journal of Epidemiology, 110, 15-26.

<a id = "who_7">7</a>: https://www.who.int/teams/global-tuberculosis-programme/data

<a id = "townsend_8">8</a>: Townsend, T.R., Shapiro, M. Rosner, B. & Kass, E.H. (1979) Use of antimicrobial drugs in general hospitals. I. Description for population and definition of methods. Journal of Infetious Diseases, 139(6), 688-697.

<a id = "wine_9">9</a>: Aeberhard, S. & Forina, M. 1991, UCI Machine Learning Repository, https://doi.org/10.24432/C5PC7J

<a id = "stoet_10">10</a>: Stoet, G. & Geary, D.C. 2019, A simplified approach to measuring national gender inequality, PLOS ONE, 14(1), 1-18, https://doi.org/10.1371/journal.pone.0205349

https://www.unilus.ac.zm/lms/e-books/books/Basic_Sciences/Behavioural%20sciences%20and%20public%20health/Fundamentals%20of%20Biostatistics%20%287th%20Edition%29.pdf

† 
‡ 
⸸ 