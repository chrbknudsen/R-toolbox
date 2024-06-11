---
title: 'opgaver'
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
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
library(gt)
```



## Opgave ang. mean og spredning

:::::::::::::::::::::::: challenge




Haemoglobin levels, g/100 ml for 70 women, raw data with highest and lowest 
values set as bold:
<!--html_preserve--><div id="hmlbwudibc" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#hmlbwudibc table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#hmlbwudibc thead, #hmlbwudibc tbody, #hmlbwudibc tfoot, #hmlbwudibc tr, #hmlbwudibc td, #hmlbwudibc th {
  border-style: none;
}

#hmlbwudibc p {
  margin: 0;
  padding: 0;
}

#hmlbwudibc .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hmlbwudibc .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#hmlbwudibc .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hmlbwudibc .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hmlbwudibc .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hmlbwudibc .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hmlbwudibc .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hmlbwudibc .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hmlbwudibc .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hmlbwudibc .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hmlbwudibc .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hmlbwudibc .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hmlbwudibc .gt_spanner_row {
  border-bottom-style: hidden;
}

#hmlbwudibc .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#hmlbwudibc .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hmlbwudibc .gt_from_md > :first-child {
  margin-top: 0;
}

#hmlbwudibc .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hmlbwudibc .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hmlbwudibc .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#hmlbwudibc .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#hmlbwudibc .gt_row_group_first td {
  border-top-width: 2px;
}

#hmlbwudibc .gt_row_group_first th {
  border-top-width: 2px;
}

#hmlbwudibc .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hmlbwudibc .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#hmlbwudibc .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#hmlbwudibc .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hmlbwudibc .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hmlbwudibc .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hmlbwudibc .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#hmlbwudibc .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hmlbwudibc .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hmlbwudibc .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hmlbwudibc .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#hmlbwudibc .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hmlbwudibc .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#hmlbwudibc .gt_left {
  text-align: left;
}

#hmlbwudibc .gt_center {
  text-align: center;
}

#hmlbwudibc .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hmlbwudibc .gt_font_normal {
  font-weight: normal;
}

#hmlbwudibc .gt_font_bold {
  font-weight: bold;
}

#hmlbwudibc .gt_font_italic {
  font-style: italic;
}

#hmlbwudibc .gt_super {
  font-size: 65%;
}

#hmlbwudibc .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#hmlbwudibc .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#hmlbwudibc .gt_indent_1 {
  text-indent: 5px;
}

#hmlbwudibc .gt_indent_2 {
  text-indent: 10px;
}

#hmlbwudibc .gt_indent_3 {
  text-indent: 15px;
}

#hmlbwudibc .gt_indent_4 {
  text-indent: 20px;
}

#hmlbwudibc .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id=""></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="V1" class="gt_row gt_right">14.8</td>
<td headers="V2" class="gt_row gt_right">13.0</td>
<td headers="V3" class="gt_row gt_right">12.2</td>
<td headers="V4" class="gt_row gt_right">11.6</td>
<td headers="V5" class="gt_row gt_right">12.1</td>
<td headers="V6" class="gt_row gt_right">10.4</td>
<td headers="V7" class="gt_row gt_right">10.6</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">12.0</td>
<td headers="V2" class="gt_row gt_right">11.6</td>
<td headers="V3" class="gt_row gt_right">9.9</td>
<td headers="V4" class="gt_row gt_right">10.7</td>
<td headers="V5" class="gt_row gt_right">12.0</td>
<td headers="V6" class="gt_row gt_right">12.7</td>
<td headers="V7" class="gt_row gt_right">9.4</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">12.1</td>
<td headers="V2" class="gt_row gt_right">12.9</td>
<td headers="V3" class="gt_row gt_right">11.9</td>
<td headers="V4" class="gt_row gt_right">13.8</td>
<td headers="V5" class="gt_row gt_right">11.0</td>
<td headers="V6" class="gt_row gt_right">11.9</td>
<td headers="V7" class="gt_row gt_right">9.8</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">12.3</td>
<td headers="V2" class="gt_row gt_right">11.5</td>
<td headers="V3" class="gt_row gt_right">12.6</td>
<td headers="V4" class="gt_row gt_right">11.5</td>
<td headers="V5" class="gt_row gt_right">10.7</td>
<td headers="V6" class="gt_row gt_right">9.7</td>
<td headers="V7" class="gt_row gt_right" style="font-weight: bold;">8.7</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">9.2</td>
<td headers="V2" class="gt_row gt_right">12.0</td>
<td headers="V3" class="gt_row gt_right">12.7</td>
<td headers="V4" class="gt_row gt_right">12.2</td>
<td headers="V5" class="gt_row gt_right">10.3</td>
<td headers="V6" class="gt_row gt_right">13.2</td>
<td headers="V7" class="gt_row gt_right">13.2</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">12.0</td>
<td headers="V2" class="gt_row gt_right">11.0</td>
<td headers="V3" class="gt_row gt_right">12.4</td>
<td headers="V4" class="gt_row gt_right">12.7</td>
<td headers="V5" class="gt_row gt_right">12.8</td>
<td headers="V6" class="gt_row gt_right">12.1</td>
<td headers="V7" class="gt_row gt_right">11.8</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">11.8</td>
<td headers="V2" class="gt_row gt_right">13.3</td>
<td headers="V3" class="gt_row gt_right">11.3</td>
<td headers="V4" class="gt_row gt_right">10.7</td>
<td headers="V5" class="gt_row gt_right">13.3</td>
<td headers="V6" class="gt_row gt_right">11.5</td>
<td headers="V7" class="gt_row gt_right">13.4</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">12.9</td>
<td headers="V2" class="gt_row gt_right">13.4</td>
<td headers="V3" class="gt_row gt_right">14.4</td>
<td headers="V4" class="gt_row gt_right">14.8</td>
<td headers="V5" class="gt_row gt_right">10.6</td>
<td headers="V6" class="gt_row gt_right">9.4</td>
<td headers="V7" class="gt_row gt_right">13.4</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">10.8</td>
<td headers="V2" class="gt_row gt_right">11.3</td>
<td headers="V3" class="gt_row gt_right">11.3</td>
<td headers="V4" class="gt_row gt_right">11.6</td>
<td headers="V5" class="gt_row gt_right">12.0</td>
<td headers="V6" class="gt_row gt_right">12.1</td>
<td headers="V7" class="gt_row gt_right">14.4</td></tr>
    <tr><td headers="V1" class="gt_row gt_right">13.8</td>
<td headers="V2" class="gt_row gt_right">11.8</td>
<td headers="V3" class="gt_row gt_right">14.2</td>
<td headers="V4" class="gt_row gt_right">13.7</td>
<td headers="V5" class="gt_row gt_right">14.1</td>
<td headers="V6" class="gt_row gt_right">10.6</td>
<td headers="V7" class="gt_row gt_right">13.3</td></tr>
  </tbody>
  
  
</table>
</div><!--/html_preserve-->

How would we describe this dataset? 

:::::::::::::::::::::::: solution

A reasonable place to start would be reporting the minimum: 8.7 and 
maximum: 14.8, and, by implication, the range: 8.7, 14.8

Those are easy to find in this table, using the `min()`, `max()´, and `range()`
functions respectively.

The mean, or average would also be relevant. In this case it is 12.

Similarly the median: 12

It would also be relevant to calculate a measure of how spread out the data 
is. Do the observations cluster close to the mean, or are they more equally 
distributed between the minimum and the maximum?

The standard deviataion: 1.3965767 and variance: 1.9504265 describes this,
and can be found using the functions  `sd()` and `var()` respectively.

::::::::::::::::::::::::


## referenceintervaller

You are given the following values, originating from the measured speed of 
bikes in a bikelane, measured in km/h.
Assuming the speed is normally distributed, calculate an interval that contains
95% of the observed values.

``` output
     mean       sd
1 24.7839 8.509639
```
Mean +/- 1.96 gange sd.

``` r
c(24.7839 - 1.96*8.509639, 24.7839 + 1.96*8.509639)
```

``` output
[1]  8.105008 41.462792
```
eller mere elegant:

``` r
24.7839 + c(-1,1)*1.96*8.509639
```

``` output
[1]  8.105008 41.462792
```
95% af hastighederne målt på cykelstien ligger mellem 8.1 og 41.5 km/t. Og - 
vi kan antage, at denne fordeling også gælder i baggrundspopulationen, dvs alle
cykler på cykelstien, ikke kun dem vi har målt.


## interval på haem

Vi fandt tidligere at middelværdien af hæmoglobin var 12.0028571 og
standardafvigelsen var 1.3965767. Antallet af observationer i stikprøven
var 70. Beregn "standard error of the mean, SEM", for og
95% konfidensintervallet for det sande gennemsnit i baggrundspopulationen.

NB erstat de beregnede tal her, med selve tallene. 

Løsning:

``` r
SEM <- sd(unlist(haem))/sqrt(length(unlist(haem)))
mean(unlist(haem)) + c(-1,1)*1.96*SEM
```

``` output
[1] 11.67569 12.33003
```
Dette interval indeholder med 95% sandsynlighed gennemsnittet $\mu$ i 
baggrundspopulationen. Eller, lidt mere upræcist, der er 95%
sandsynlighed for at baggrundspopulationens gennemsnit $\mu$ er indehold i
intervallet.


## SEM og hypotesetest

Vi fortsætter med haem dataene. 
:::::::::::::::::::::::: challenge
Kan vi med rimelighed antage at baggrundsværdien, den "sande" middelværdi for 
alle kvinder, er 12. Eller, Hvad er sandsynligheden for at et gennemsnit på
12.0028571 er trukket fra en population med et gennemsnit på 12,
og en stikprøvespredning på SEM = [hvad den nu er]?

:::::::::::::::::::::::: solution

1 sample t-test: t = (xbar - mu)/sem.
Vi forestiller os at vi trækker fra en fordeling med mu = 12, og at spredningen
af vores stikprøvegennemsnit xbar er SEM. så beregner vi hvor mange 
SEM vi skal gå ud af x-aksen, for tilfældigt at få vores stikprøve gennemsnit.
Skal man for langt ud er t/Z stor, og derfor er det usandsynligt.

-> normalfordelingsemnet - hvis middelværdien er det her, og standardafvigelsen
er det her, hvad er så sandsynligheden for at se denne værdi?

:::::::::::::::::::::::: 

## endnu en hypotesetest øvelse

i [] kan vi med fordel ændre ting.
:::::::::::::::::::::::: challenge
For en given population ved vi, at fordelingen af [hæmoglobinniveauet] er normalfordelt
med middelværdi $\mu$ = [13.3] g/100ml og en spredning på $\sigma$ = 1.12 g/100 ml.

Nu udtages der stikprøver af størrelse n fra populationen, og for hver af dem
beregnes stikprøvegennemsnittet. Fordelingen af disse gennemsnit - hvis der udtages
uendeligt mange stikprøver - er normalfordelt med middelværdien $\mu$.

a- hvad er spredningen i fordelingen af stikprøvegennemsnittene
b - Hvis vi sætter n til [15] - beregn da proportionen af stikprøver hvis gennemsnit 
vil ligge mellem [13.0] og [13.6] g/100 ml
c - hvor stor skal n være, hvis 95% af de udtagne stikprøver skal have et gennemsnit
der ligger mellem $\mu$ - 0.2 og $\mu$+0.2

:::::::::::::::::::::::: solution
a - det er også kendt som "standard error of the mean, SEM" eller standardfejlen.
Den finder vi ved at dividere $\sigma$ med kvadratroden af stikprøve størrelsen, n.
b - nu sætter vi n = 15, og kan beregne SEM. 
så beregner vi z-værdien for 13.0 - det er 13.0 - 13.3 divideret med SEM = ca -1.04
Og for 13.6 det er 13.6 - 13.3 divideret med SEM = cirka 1.04 (bemærk symmetrien).
Nu skal vi så finde sandsynligheden for at se en Z der ligger mellem disse to værdier.
P(Z≤1.04)≈0.8508
P(Z≤−1.04)≈0.1492
0.8508−0.1492=0.7016
Så proportionen af stikprøver hvis gennemsnit ligger mellem 13.0 og 13.6 er ca
70.16%

c. Hvis stikprøve gennemsnittet med 95% sandsynlighed ligger mellem +/- 0.2,
er grænserne 13.1 og 13.5. 
95% z-værdien er 1.96. Derfor skal standardfejlen have en størrelse hvor
intervallet \mu +/- 0.2 svarer til +/- 1.96*SEM.
dvs 0.2 = 1.96 = sigma/sqrt(n). Løs for n. 
:::::::::::::::::::::::: 

## en eksamensopgave 
Reformuleret så vi må bruge den.
:::::::::::::::::::::::: challenge
Vi antaer at fødselsvægten for børn født indenfor termine, med gestationsalder 40 uger, er approximativt _normalfordelt_ med
middelværdi 3400 gram og spredning 420 gram. Vi kan antage at 
disse værdier er populationsværdier. Der ønskes udført et studie for
at afgøre om fødselsvægten for børn født indenfor termin af mødre,´
der røg gennem hele graviditete, har samme middelværdi ($\mu$).

a. Antag at der indsamles n observationer af fødselsvægten som 
beskrevet ovenfor. Hvilken test ville du anvende, hvis det ønskes 
undersøgt om $\mu$ = 3400? Angiv envidere den konkrete teststørrelse
som du ville beregne baseret på de n observationer, hvor du kan bruge
passende notation.
:::::::::::::::::::::::: solution 
svar. Vi kan udføre en one-sample t-test. Test-størrelsen er 
(Xbar - 3500)/SEM.

Vi tester hyootesen at fødselsvægten er trukket fra en fordeling med 
$\mu$ = 3400, dvs hvor sandsynligt er det at trække gennemsnittet \mu, når vi kender fordelingen af stikprøve gennemsnittet.
::::::::::::::::::::::::



## Parret t-test - eksamensopgave
Lettere omformuleret

patienter med diverticulitis kan have glæde af fiberrig kost. Vi ser her
på et studie af transittiden gennem fordøjelseskanalen ved to mulige
diæter (behandlinger). En stikprøve af [60] patienter med diverticulitis
i alderen [20-44] år blev tilfældigt udvalgt, og fik begge behandlinger
A og B, over to perioder, med en behandling i en given periode. For hver patient
under hver behandling, blev transittiden gennem fordøjelseskanalen målt.
Disse tider er angivet nednefor for de første 6 patienter for hver af 
de to behandlinger. Kolonnen Diff indeholder differencerne. Der er yderligere
angivet nogle summariske størrelser. 

Undersøg om der er signifikant forskel på behandling A og B hvad angår 
transittiden?

A B Diff
92.0  63.90 
92.4  8.81
57.3  87.8
58.5 92.40
69.9 98.7
63.8 109.00


mean(A) 68.59
mean(B) 81.18
mean(diff) -12.59
sd(A) 13.81
sd(B) 15.39
sd(diff) 14.16

Her er der tale om en parret situation - stikprøverne er ikke uafhængige.
Så vi laver en parret t-test - vi brug diff kolonnen til det.

t = 12.59/(14.16/sqrt(60)) = 6.9

Og det er klart signifikant på et 5% niveau. Så signifikant lavere transittid
under behandling A sammenlignet med behandling B.

## spørgsmål til responsvariabel og forklarende variabel.

Et scattetplot mellem højde (x) og vægt (y). Hvad er forklarende variabel?
hvad er responsvariablen? Er den forklarende variabel kategorisk eller kontinuert?

## eksamensopgave om lin reg

i forbindelse med en undersgøesle af vitamin D i Europa har man i fire 
europæiske lande (Danmark, Polen, Finland og irland) foretaget må¨linger på en 
række personer, både mænd og kvinder, som unge piger. Vi skal her beskæftige
os med et udpluk af data vedrørende kvinderne fra Danmark og Polen, og undersøge
hvor stor forskel der er mellem de to lande, samt om en 
evt forskel helt eller delvsi kan forklares udfra forskelligheder i andre variable,
såsom body mass index. Der indgrå 65 danske kvinder og 53 polske kvinder i studiet.
Der er følgedne variable:

dk - indikator for at kvinden er dansk (1 dansk, 0 ikke dansk. )
vitd: vitamin D i en blodprøve nmol/l
bmi: body mass index

her følger de første 6 dataalinier i datasættet samt nogle seskriptive størrelser:


dk vitd mbi
1 28.5 26.177
1 32.9 25.155
1 60.3 23.081
1 50.5 25.200
1 15.0 25.310
1 47.8 23.904

sd(bmi[dk==0]) 4.20162
sd(bmi[dk==1]) 4.308396

mean(bmi[dk==0]) 26.53475
mean(bmi[dk==1]) 28.94008

model0 = lm(vitd~bmi, data=sol_data)
summary(model0)
Coefficients
estimate std. error t value Pr(>|t|)
(intercept) 67.5714 11.1160  6.079  1.59e-08 ***
bmi  -1.0212  0.3942  -2.591  0.0108 *

Fortolk parameterestimaterne fra model0 og konkluder på baggrund af analysen
(husk også angivelse af statistisk model samt responsvariabel og forklarende 
variable)?

svar - simpel lineær regression. Responsvariabel er vitamin d og BMI som forklarende
kontinuært variabel.
vitd = \alpha + \beta*BMI + \epsilon

med estimeret hældningskoefficient -1.02, se = 0.39, p = 0.01, dvs signifikant.
vitamin d falder i gennemsnit med 1 pr BMI.

## Endnu en eksamensopgave

Den R-kode er spørges til i (d) giver nedenstående resultat, hvor dele af 
udskriften er redigeret bort.

Coefficients:
Estimate Std. Erro t value Pr(>|t|)
(Intercept) 50.3309  11.4228  4.406  2.37e-05 ***
factor(dk)1 13.1276  3.4108
bmi  -0.6140  0.3873

Konkluder på baggrund af den sidst udførte analyse ssamt eventuelle
supplerende beregninger. Herunder ønskes betydningen af de to
forklarende variable belyst og en sammenligning med de tidligere udførte
analyser ønskes også foretaget.

Svar:
Dette er en multipel lineær regression, da vi har flere variable.
OBS factor() betyder at variablen er kategorisk, dvs enten 0 eller 1.
-> ikke vigtigt i denne kontekst.

Vi skal kunne udregne de mangledne tal.

factor(dk):  13.1276/3.4 = 3.86, p = 0.0001
factor(BMI): -0.6140/0.3873 = -1.56, p =0.11

## Og endnu en eksamensopgave

Du får nedenståenede model. Modellen er multipel lineær regression, derfor
introduceres 2 nye regler til prædiktion.
1. hvis variable er factor() indikerer dette ekse om patienten har fået 
halothane eller ej, dvs den er kategorisk og iondgår i prædiktion
som enten 1 eller 0 gange estimatet
2. I multipel lineær regression adderes hvert led og dens værdi på i 
regnestykket, dvs. intercept + leg*0.79 + factor(drug)*7.41 = prædikteret værdi.

model2 = lm(arm~leg+ factor(drug))
summary(model2)
coefficients:
estimate std. error t value Pr(>|t|)
(intercept) -0,02109 9,83373  -0,002  0,9983
leg 0,79064 0,09010 8,775  3,84e-10 ***
factor(drug)halothane 7,40890 3,78385 1,958 0,0587  .

Prædikter bloddtrykket i armen for en patient der har et blodtryk i benet på
110, og som har fået anæstesitypen Halothane. Lav en tilsvarende beregning,
men nu hvor blodtrykket i benet er stat til 100. Beregn forskellen på disse
to prædiktioner, og angiv et dertil hørende 95% konfidensinterval.

Prediktioner:
-0.021 + 0.791*110 + 7.41 = 94.4
og
-0.021 + 0.791*100 + 7.41 = 86.49

Forskel = 0.791*10 = 7.91

95% KI = 10.(0.791 +/- 1.96*0.08) = 6.1 9.7

Hvorfor skal usikkerheden også med? Det må vi godt have en pædagogisk forklaring
på.

## Nu er vi nået til modul 3

## Eksamensopgave

Vi skal se på data vedrørende lungefunktion og eksponering for rygning.
I data er der information for 654 børn vedørende:
idnr: løbenummer for barnet
gender: Barnets køn (D: dreng, P: pige)
Alder: Barnets alder (år)
Hoejde: Barnets højde (cm)
expo: Barnets eksponering for rygning i hjemmet (0 nej, 1 ja)
lungefkt. Lungefunktionsmål (liter)

[expo==0] vælger de børn ud, hvor expo er lig med nul og tilsvarende med
[expo==1].

a) Undersøg om der er en sammenhæng mellem lungefunktion og eksponering for
rygning, når der ikke usteres for øvrige forhold. Udfør relevant analyse og 
konkluder på baggrund af denne. Overrasker resultaterne af analysen dig?

Her følger de første 6 datalinier i datasætet, samt nogle summariske
regnestørrelser

mean(lungefkt[expo==0]) 2.566143
mean(lungefkt[expo==1]) 3.276862
sd(lungefkt[expo==0]) 0.8505215
sd(lungefkt[expo==1]) 0.7499863
table(expo)
0  1
589  65

svar:
2-sample t-test, for vi sammenligner mellem to samples
a) lvar den approximative t-test: SEM_1 = 0.741/sqrt(65) og sem_0 = 0.850/sqrt(589
og:
semdiff = sqrt(sem_^2 + sem_0^2) = 0.0984

dermed:
t_app = (3.28-2.57)/0.0984 = 7.23.
Som er klart signifikatnt. p< 0.001. Overraskende at der er højest
lungefunktion i den eksponerede gruppe.


## eksamensopgave fortsat
Vi skal se på data vedrørende lungefunktion og eksponering for rygning.
I data er der information for 654 børn vedørende:
idnr: løbenummer for barnet
gender: Barnets køn (D: dreng, P: pige)
Alder: Barnets alder (år)
Hoejde: Barnets højde (cm)
expo: Barnets eksponering for rygning i hjemmet (0 nej, 1 ja)
lungefkt. Lungefunktionsmål (liter)

Her følger de første 6 datalinier samt nogle summariske størrelser:

og 
mean(lungefkt[expo==0]) 2.566143
mean(lungefkt[expo==1]) 3.276862
sd(lungefkt[expo==0]) 0.8505215
sd(lungefkt[expo==1]) 0.7499863
table(expo)
0  1
589  65

Følgende analysei  R udførtes

model1 <- lm(lungefkt~factor(expo)+alder+factor(gender))
summary(model2)
coefficients:
Estimate std error t value  Pr(>|t|)
(Intercept)  0,553044  0,082225  6,726  3,83e-11 ***
factor(expo)1 -0,153974  0,077977  -1,975  0,0487  *
alder 0,226794  0,007844  28,765 < 2e-16 ***
facotr(gender)P -0,315273  0,042710  -7,384  4.80e-13 ***

Hvilken analyse er blevet udført i model2 (husk angivelse af responsvariabel
og forklarende variable). fortolk parameterestimaterne fra model2 og konkluder
på baggrund af analysen (herunder ønskes også angivesle af 95% konfidensintervaller)

svar:
Multipel lineær regressions analyse med lungefunktion som respons og 
med expo (kategorisk), alder (kontinuært) og gender (kategorisk) som
forklarende variable. Når alder og gender fastholdes ser vi, at expo er lige
akkurat signifikant og nu med lavere estimeret lungefunktion i den eksponerede
gruppe end i den ueksponerede gruppe. 0.15 l med 95% KI på 
-0.15 +/- 1.96*+0.078 = (-0.30, 0.002). Piger har lavere estimeret
lungefunktion end drengene, -0.32 liter med 95% KI = -0.32 +/- 1.96*0.043 =
(-0,40, -0.24) når alder og eksponering fastholdes. Lungefunktionen stiger
i gennemsnit: 0.23 l pr år (for børn det alderssegment vi har her9, med
95% KI på 0.22 +/- 1.96 *0.0079 =  (0.205,0.235) når gender og expio 
er fastholdt.

## Eksamensopgave Relativ risiko

nedenstående tabel viser tal fra et studie, der havde til formål at undersøge
effekten af to behandlinger (calcium vs calcitriol) i behandlingen af 
postmenopausal osteoporosis. I studiet indgik lidt over 400 patienter og disse
blev randomiseret til en af de to behandlinger. En del patienter fik bivirkninger
(tørst, hudproblemer og neurologiske symptomer) mens studiet stod på, som
opsummeret i nedenstående tabel.

behandling  bivirkninger ja  bivirkninger nej
calcitriol    18     191
Calcium     13    192

a) estimer risikoen for bivirkninger under de to behandlinger. Angiv endvidere
forskellen mellem disse og angiv et dertil hørende 95% sikkerhedsinterval
b) Beregn den relative risiko (RR) og lav et dertil hørende 95% sikkerhedsinterval.
Fortolk RR og det beregnede sikkerhedsinterval.

Svar:
p, sandsynlighed for bivirkning
a) Calcitriol: p_cl = 18/209 )  8.6%
calcium: p_cm = 13/205 = 6.3%  (tjek lige at 205 opg 209 er korrekt summeret.)
der skal i øvrigt hat på alle p'erne.
95% SI:
p_cl +/- 1.96sqrt(p_cl(1-p_cl)/209) = 4,8% 12,4%
p_cm +/- 1.96sqrt(p_cm(1-p_cm)/205) = 4.6% 8.0%

b)
RR = p_cl/p_cm = 1.36, logRR = 0.307
se(log(RR)) = sqrt(1/18 - 1/209 + 1/13-1/205) = 0.35

95% SI for log RR 0.307 +/- 1.96*0.35 = -0.38, 0.99
95% SI for RR e^-0.35, e^0.99 = 0.68, 2.77 indeholder med 95% ssh pop RR

## Eksamensopgave i prediktion


lbwt er fødselsvægt, >2500g (nok snarere mindre end...)
Der blev udført nedenstående analyse (udskriften er redigeret, så en del af 
den mangler):

analyse <- glm(lbwt ~ factor(smoke) + age, family = binomial)
summary(analyse)
Coefficients:
Estimate  Std. Error  z value Pr(>|z|)
(Intercept) 0.06091 0.75732  0.080  0.9359
factor(smoke)1 0.69185 0.32181 2.150 0.0316 *
age -0.04978 0.03197 -1.557

Hvilken analyse er der tale om (angiv også her hvad der er responsvariabel,
og hvordan eventuelle risikofaktorer er inkluderet i analysen)

svar: Der er tale om en logistisk regressionsanalyse. Respons er den binære
lbwt, og risikofaktorer i analysen er age og smoke. Variablen age er kontinuert,
og inkluderet således i analysen. Variablen smoke er kategorisk og inkludereet 
som sådan i analysen.


## Eksamensopgave i prediktion fortsat

Samme output som ovenfor.

2b) beregn odds ratioer (OR), der belyser betydningen af de inkluderede 
risikofaktor(er). For hver OR ønskes angivet et dertil hørende 95% 
sikkerhedsinterval. Fortolk intervallet. Hvad kan du konkludere baseret på den
udførte analyse og dine egne beregninger.

svar: 
OR'er beregnes ved at tage exp() til koefficienterne angivet i Estimate
kolonnen. 

Smoke: exp(0.692 = 2
age: exp(-0.0498) = 0.95

Rygning under graviditeten øger risikoen for at føde et barn med lav fødselsvægt
kvantificeret ved et OR på 2. Alder er her holdt fast. Øget alder sænker risikoen.
For hvert år falder risikoen givet ved en OR = 0.95. Rygestatus er her holdt fast.

Nu beregnes 95% KI

Smoke;: exp(0.692 +/- 1.96*0.322) = (1.06, 3.76)
Age: exp(-0.0498+/- 1.96*0.032) = (0.89, 1.01)

Vi ser at alderseffekten ikke er signifikant, mens effekten af rygning er signifikant
på et 5% signifikansniveau. OR svarende til rygning er estimeret til 2, men værdier fra 
1.06 til 3.76 kan ikke udelukkes (igen ved test på et 5% signifikansniveau)

## Eksamensopgave i prediktion fortsat igen
Samme udskrift som ovenfor

2c() Hvis man vælger at beholde alle risikofaktorer i modellen, angiv da den 
prædikterede sandsynligehd for at en kvnide på 20 år, der ikke har røget
under graviditeten, føder et barn med fødselsvægt over 2500 gram (så det er nok
lbwt > 2500g alligevel)

svar:
Sandsynligheden:
P(lbwt = 1 | smoke = 0, age = 20)
estimeres til:
e^(0.061-0.0498*20)/(1+e^(0.061-0.0498*20)) = 0.28

Den efterspurgte sandsynlighed er derfor 1-0.28 ) 0.72
Og da vi trækker den fra 1, er det sgu noko lbwt < 2500 gram når det kommer til
stykket.


## repetitionsopgave

for i alt 120 kvinder måltes arealet af en bestemt del af hjernen (forreste del
af corpus callosum), idet det ønskedes undersøgt om denne del har relation
til, om kvinderne var højrehåndede (HH) eller venstrehåndede (VH). 
Nedenstående tabel viser for de to grupper af kvinder: antallet (n), det
gennemsnitlige areal af den pågældende del af hjernen (Xbar), og 
stikprøvespredningen for gruppen (sd).

Gruppe  n  xbar  sd
VH  60 377 63
HH  60 345  43

a) Beregn 'standard error of the mean' (SEM) og lav 95% sikkerhedsintervaller fo
middelværdierne i de to grupper. Fortolk resultatet.
VH 
SEM = 63/sqrt(60) = 8.13
95%-si: 377+/- 1.96*8.13 = (361,393)
HH
SEM = 43/sqrt(60) = 5.56
95% SI 345 +/- 1.96*5.56 = (334,356)

Disse indeholder populationsstørrelserne med 95% ssh - og overlapper ikke...


b) Undersøg om der er en sammenhæng mellem arealet af denne del af hjernen
og om kvinderne er højre- eller venstrehåndede.

svar
b) 
$$\overline{X}_{VH} - \overline{X}_{HH} = 377 - 345 = 32 \\
SE(\overline{X}_{VH} - \overline{X}_{HH}) = \sqrt{8.13^2 + 5.56^2} = 9.85 $$

95%-SI: 32 +/- 1.96*9.85 = (12.7, 51.3)

SI indeholder populationsdifferensen med 95% sandsynlighed. Vi ser at 0 ikke er 
indeholdt i intervallet, og der er derfor en signifikant forskel på et
5%-signifikans-niveau.


# Og endnu en eksamensopgave.

Vi definerer en dikotom variabel (en 0-1-variabel), der angiver, hvorvidt
en person har feber eller ej (1 for feber). Vi sætter grænsen for dette til
37 grader. Variablen hedder feber i datasættet. Følgende blev udført i R:

table(gender, feber)
feber
gender 0 1 
K 40 25
M 51 14

a) Angiv estimat for sandsynligheden for feber for hvert køn, med 95% 
konfidensgrænser
b) Undersøg om der er evidens for forskel på sandsynligheden for feber
blandt mænd og kvinder, og udtryk en ev.t effekt i form af en odds ratio.
Formuler dine konklusioner i ord.

PhatK = 25/65 =
PhatMN = 14/65

SE(P-k) = sqrt(Phatk(1-phatk)/65) = 0.06
SE(P_M) = sqrt(phatm(1-phatm)/65) = 0.051

95% ki for P_k:
PhatK +/- 1.96*SEPK = (0.32, 0.44)
95% ki for Pm PhatM +/- 1.96*sepm = (0.164,0.265)

b) vi ser at konfidensintervallerne ikke overlapper, så der er signifikant
forskel. Odds for feber:
OR_{K:M} = 25 51 / 14 40 = 2.28 (uklart om der skal ganges eller minusses. Tjek.)
95%KI (1.05, 4.94).
Dvs odds for feber er ca. dobbetl så stor for kvinder sammenlignet med mænd.

## sidste eksamensopgave

I denne opgave ser vi på data vedrørende krigsveteraner og deres helbredsforhold.
I alt er der data fra 299 veteraner. Vi bruger følgende betegnelser.
pbright: systolisk blodtryk på højre arm (mmHg)
pbleft: Systolisk blodtryk på venstre arm (mmHg)
alk.kat: 1_ Antal genstande pr. uge er 0
alk.kat: 2: antal genstande pr. uge er mellem 1 og 20
alk.kat: 3: antal genstande pr. uge er mere end 20.
delta.bp forskel mellem bpright og bpleft.
delta.bp.bin: 1: hvis den absolutte værdi af delta.bp er større end 10, 0 ellers.
Nedenfor er angivet observationerne for de 6 første veteraner i datasættet, samt
et par regnestørrelser.
bpright bpleft alk.kat delta.bp delta.bp.bin
111 113 2 -2 0
127 218 2 -1 0
113 111 2 2 0
120 127 2 -7 0
135 135 2 0 0 
115 103 1 12 1
c(mean(bpright), mean(bpleft), mean(delta.bp))
[1] 122.448161 121.066890 1.381271
c(sd(bpright), sd(bpleft), sd(delta.bp))
[1] 11.564228 11.993939 6.936562

a) Kvantificer forskellen i blodtryk på højre og venstre arm, med konfidensinterval.
Er der signifikant forskel? kan vi udelukke en middelforskel på 10 mmHg på de to
sider?

b) I ambulatoriet har vi en veteran, der har et blodtryk på 135 mmHg på højre side, men
kun 122 mmHg på venstre side. Er denne forskel i blodtryk så usædvanlig, at der må 
laves en  nærmere undersøgelse af dette individ?

svar:
a) Lad \delta betegne populationsmiddelforskellen. Da er \delta = 1.38, og 
SEM 6.937/sqrt(299) = 0.40, så 95%-KI er
\delta +/- 1.96SEM ) (0.59, 2.17)
Der ses at være signifikant forskel, da 0 ikke er inkluderet i 95%-KI.
Tilsvarende er en middelforskel på 10 mm usandsynlig.

b) Forskel for person er 13. Vi beregner et 95%-RI
1.38+/-1.96SD = (-12.33, 14.98)
Så en forskel på 13 er ikke usædvanlig.


## et forsøg på at få output der matcher hvad der optræder i opgaverne

``` r
model <- lm(mpg ~ wt, data = mtcars)
summary_model <- summary(model)

# Udtræk koefficienterne
coefficients <- summary_model$coefficients

# Formater og print outputtet som ønsket
cat("Coefficients:\n")
```

``` output
Coefficients:
```

``` r
cat("            Estimate Std. Error t value Pr(>|t|)\n")
```

``` output
            Estimate Std. Error t value Pr(>|t|)
```

``` r
cat(sprintf("(Intercept)  %8.4f %10.4f %7.3f %9.2e ***\n",
            coefficients[1, 1], coefficients[1, 2], coefficients[1, 3], coefficients[1, 4]))
```

``` output
(Intercept)   37.2851     1.8776  19.858  8.24e-19 ***
```

``` r
cat(sprintf("wt           %8.4f %10.4f %7.3f %9.2e ***\n",
            coefficients[2, 1], coefficients[2, 2], coefficients[2, 3], coefficients[2, 4]))
```

``` output
wt            -5.3445     0.5591  -9.559  1.29e-10 ***
```

::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

