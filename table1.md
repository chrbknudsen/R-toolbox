---
title: 'Table One'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you make a Table One?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain what a Table One is
- Know how to make a Tabel One and adjust key parameters

::::::::::::::::::::::::::::::::::::::::::::::::

## What is a "Table One"?

Primarily used in medical and epidemiological research,
a Table One is typically the first table in any publication
using data.

It presents the baseline characteristics of the participants
in a study, and provides a concise overview of the relevant
demographic and clinical variables.

It typically compares different groups (male~female, treatment~control), to highlight similarities and differences.




It can look like this:

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class="grouplabel"></th>
<th colspan="2" class="grouplabel"><div>control</div></th>
<th colspan="2" class="grouplabel"><div>case</div></th>
<th colspan="2" class="grouplabel"><div>Overall</div></th>
</tr>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=298)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=48)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=135)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=29)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=433)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=77)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>Age<span class='varunits'> (years)</span></span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>61.3 (4.75)</td>
<td>58.9 (5.68)</td>
<td>61.5 (4.85)</td>
<td>58.1 (5.32)</td>
<td>61.4 (4.78)</td>
<td>58.6 (5.53)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Median [Min, Max]</td>
<td class='lastrow'>62.0 [46.0, 69.0]</td>
<td class='lastrow'>59.0 [46.0, 68.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>58.0 [49.0, 68.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>58.0 [46.0, 68.0]</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>testost</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>25.3 (13.2)</td>
<td>22.2 (10.7)</td>
<td>27.6 (16.1)</td>
<td>28.2 (15.6)</td>
<td>26.0 (14.2)</td>
<td>24.4 (13.0)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>23.0 [4.00, 111]</td>
<td>21.5 [8.00, 63.0]</td>
<td>25.0 [6.00, 144]</td>
<td>24.0 [10.0, 69.0]</td>
<td>23.0 [4.00, 144]</td>
<td>22.0 [8.00, 69.0]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>6 (2.0%)</td>
<td class='lastrow'>2 (4.2%)</td>
<td class='lastrow'>3 (2.2%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>9 (2.1%)</td>
<td class='lastrow'>3 (3.9%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>prolactn</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>9.60 (5.10)</td>
<td>13.7 (12.3)</td>
<td>10.8 (6.79)</td>
<td>9.57 (3.29)</td>
<td>9.99 (5.70)</td>
<td>12.2 (10.1)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>8.16 [1.96, 37.3]</td>
<td>8.81 [3.87, 55.8]</td>
<td>9.30 [2.66, 59.9]</td>
<td>8.88 [4.49, 17.6]</td>
<td>8.64 [1.96, 59.9]</td>
<td>8.84 [3.87, 55.8]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>14 (4.7%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>6 (4.4%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>20 (4.6%)</td>
<td class='lastrow'>1 (1.3%)</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->
Please note that the automatic styling of this site results in a table-one
that is not very nice looking.

We have 510 participants in a study, split into control and case groups, and
further subdivided into two groups based on PostMenopausal Hormone use.
It describes the distribution of sex and concentration of 
testosterone and prolactin in a blood sample.

## How do we make that?


### Structuring the data

Most things in R are simple to do (but rarely simple to understand) when the 
data has the correct structure.

If we follow the general rules of thumb for tidy data, we are off to a good 
start. This is the structure of the data set we are working with here - after 
we have made some modifications regarding labels, levels and units.


``` r
head(blood)
```

``` output
# A tibble: 6 × 8
      ID matchid case    curpmh ageblood estradol testost prolactn
   <dbl>   <dbl> <fct>   <fct>     <dbl>    <dbl>   <dbl>    <dbl>
1 100013  164594 control yes          46       57      25     11.1
2 100241  107261 control no           65       11      NA      2.8
3 100696  110294 control yes          66        3       8     38  
4 101266  101266 case    no           57        4       6      8.9
5 101600  101600 case    no           66        6      25      6.9
6 102228  155717 control yes          57       10      31     13.9
```

The important thing to note is that when we stratify the summary statistics by
some variable, this variable have to be a categorical variable. The variables 
we want to do summary statistics _on_ also have to have the correct type.
Are the values categorical, the column in the dataframe have to actually be
categorical. Are they numeric, the data type have to be numeric.


### And having the data - how do we actually do it?

A number of packages making it easy to make a Table One exists. Here we look
at the package `table1`.

The specific way of doing it depends on the data available. If we do not have
data on the weight of the participants, we are not able to describe the distribution
of their weight.

Let us begin by looking at the data. We begin by loading the two packages `tidyverse`
and `table1`. We then read in the data from the csv-file "BLOOD.csv", which
we have [downloaded from this link](https://raw.githubusercontent.com/KUBDatalab/R-toolbox/main/episodes/data/BLOOD.csv).


``` r
library(tidyverse)
library(table1)
blood <- read_csv("data/BLOOD.csv")
head(blood)
```

``` output
# A tibble: 6 × 9
      ID matchid  case curpmh ageblood estradol estrone testost prolactn
   <dbl>   <dbl> <dbl>  <dbl>    <dbl>    <dbl>   <dbl>   <dbl>    <dbl>
1 100013  164594     0      1       46       57      65      25     11.1
2 100241  107261     0      0       65       11      26     999      2.8
3 100696  110294     0      1       66        3     999       8     38  
4 101266  101266     1      0       57        4      18       6      8.9
5 101600  101600     1      0       66        6      18      25      6.9
6 102228  155717     0      1       57       10     999      31     13.9
```
510 rows. Its a case-control study, where the ID represents one individual, and 
matchid gives us the link between cases and controls. Ageblood is the age of the
individual at the time when the blood sample was drawn, and we then have levels 
of four different hormones. 

The data contains missing values, coded as "999.0" for estrone and testost, and
99.99 for prolactin.

Let us fix that:


``` r
blood <- blood |> 
  mutate(estrone = na_if(estrone, 999.0)) |> 
  mutate(testost = na_if(testost, 999.0)) |> 
  mutate(prolactn = na_if(prolactn, 99.99)) 
```


We then ensure that categorical values are stored as categorical values, and
adjust the labels of those categorical values:


``` r
blood <- blood |> 
  mutate(case = factor(case, labels = c("control", "case"))) |> 
  mutate(curpmh = factor(curpmh, labels = c("no", "yes")))
```

And now we can make our table one like this. Note that we only include testosterone
and prolactin, in order to get a more manageble table 1:



``` r
table1(~ageblood + testost + prolactn|case + curpmh, data = blood)
```

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class="grouplabel"></th>
<th colspan="2" class="grouplabel"><div>control</div></th>
<th colspan="2" class="grouplabel"><div>case</div></th>
<th colspan="2" class="grouplabel"><div>Overall</div></th>
</tr>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=298)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=48)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=135)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=29)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=433)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=77)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>ageblood</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>61.3 (4.75)</td>
<td>58.9 (5.68)</td>
<td>61.5 (4.85)</td>
<td>58.1 (5.32)</td>
<td>61.4 (4.78)</td>
<td>58.6 (5.53)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Median [Min, Max]</td>
<td class='lastrow'>62.0 [46.0, 69.0]</td>
<td class='lastrow'>59.0 [46.0, 68.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>58.0 [49.0, 68.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>58.0 [46.0, 68.0]</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>testost</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>25.3 (13.2)</td>
<td>22.2 (10.7)</td>
<td>27.6 (16.1)</td>
<td>28.2 (15.6)</td>
<td>26.0 (14.2)</td>
<td>24.4 (13.0)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>23.0 [4.00, 111]</td>
<td>21.5 [8.00, 63.0]</td>
<td>25.0 [6.00, 144]</td>
<td>24.0 [10.0, 69.0]</td>
<td>23.0 [4.00, 144]</td>
<td>22.0 [8.00, 69.0]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>6 (2.0%)</td>
<td class='lastrow'>2 (4.2%)</td>
<td class='lastrow'>3 (2.2%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>9 (2.1%)</td>
<td class='lastrow'>3 (3.9%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>prolactn</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>9.60 (5.10)</td>
<td>13.7 (12.3)</td>
<td>10.8 (6.79)</td>
<td>9.57 (3.29)</td>
<td>9.99 (5.70)</td>
<td>12.2 (10.1)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>8.16 [1.96, 37.3]</td>
<td>8.81 [3.87, 55.8]</td>
<td>9.30 [2.66, 59.9]</td>
<td>8.88 [4.49, 17.6]</td>
<td>8.64 [1.96, 59.9]</td>
<td>8.84 [3.87, 55.8]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>14 (4.7%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>6 (4.4%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>20 (4.6%)</td>
<td class='lastrow'>1 (1.3%)</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->

It is a good idea, and increases readability, to add labels and units to
the variables. The `table1` package provides functions for that:


``` r
label(blood$curpmh) <- "current_pmh"
label(blood$case) <- "case_control"
label(blood$ageblood) <- "Age"
units(blood$ageblood) <- "years"
```

This will add labels to the plot, and allow us to give the data more meaningful
names and units without changing the date it self. This looks nicer, and is 
easier to read:



``` r
table1(~ageblood + testost + prolactn|case + curpmh, data = blood)
```

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class="grouplabel"></th>
<th colspan="2" class="grouplabel"><div>control</div></th>
<th colspan="2" class="grouplabel"><div>case</div></th>
<th colspan="2" class="grouplabel"><div>Overall</div></th>
</tr>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=298)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=48)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=135)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=29)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=433)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=77)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>Age<span class='varunits'> (years)</span></span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>61.3 (4.75)</td>
<td>58.9 (5.68)</td>
<td>61.5 (4.85)</td>
<td>58.1 (5.32)</td>
<td>61.4 (4.78)</td>
<td>58.6 (5.53)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Median [Min, Max]</td>
<td class='lastrow'>62.0 [46.0, 69.0]</td>
<td class='lastrow'>59.0 [46.0, 68.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>58.0 [49.0, 68.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>58.0 [46.0, 68.0]</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>testost</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>25.3 (13.2)</td>
<td>22.2 (10.7)</td>
<td>27.6 (16.1)</td>
<td>28.2 (15.6)</td>
<td>26.0 (14.2)</td>
<td>24.4 (13.0)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>23.0 [4.00, 111]</td>
<td>21.5 [8.00, 63.0]</td>
<td>25.0 [6.00, 144]</td>
<td>24.0 [10.0, 69.0]</td>
<td>23.0 [4.00, 144]</td>
<td>22.0 [8.00, 69.0]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>6 (2.0%)</td>
<td class='lastrow'>2 (4.2%)</td>
<td class='lastrow'>3 (2.2%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>9 (2.1%)</td>
<td class='lastrow'>3 (3.9%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>prolactn</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>9.60 (5.10)</td>
<td>13.7 (12.3)</td>
<td>10.8 (6.79)</td>
<td>9.57 (3.29)</td>
<td>9.99 (5.70)</td>
<td>12.2 (10.1)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>8.16 [1.96, 37.3]</td>
<td>8.81 [3.87, 55.8]</td>
<td>9.30 [2.66, 59.9]</td>
<td>8.88 [4.49, 17.6]</td>
<td>8.64 [1.96, 59.9]</td>
<td>8.84 [3.87, 55.8]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>14 (4.7%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>6 (4.4%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>20 (4.6%)</td>
<td class='lastrow'>1 (1.3%)</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->


## More advanced stuff

We might want to be able to precisely control the summary
statistics presented in the table. 

We can do that by specifying input to the arguments
`render.continuous` and `render.categorical` that
control how continuous and categorical data respectively,
is shown in the table.

The simple way of doing that is by using abbrevieated
function names. We only include testosterone and prolactin in the the table
to save space:



``` r
table1(~ageblood + testost + prolactn|case + curpmh, data = blood,
        render.continuous=c(.="Mean (SD%)", .="Median [Min, Max]",
                           "Geom. mean (Geo. SD%)"="GMEAN (GSD%)"))
```

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class="grouplabel"></th>
<th colspan="2" class="grouplabel"><div>control</div></th>
<th colspan="2" class="grouplabel"><div>case</div></th>
<th colspan="2" class="grouplabel"><div>Overall</div></th>
</tr>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=298)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=48)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=135)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=29)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=433)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=77)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>Age<span class='varunits'> (years)</span></span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD%)</td>
<td>61.3 (4.75%)</td>
<td>58.9 (5.68%)</td>
<td>61.5 (4.85%)</td>
<td>58.1 (5.32%)</td>
<td>61.4 (4.78%)</td>
<td>58.6 (5.53%)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>62.0 [46.0, 69.0]</td>
<td>59.0 [46.0, 68.0]</td>
<td>62.0 [45.0, 69.0]</td>
<td>58.0 [49.0, 68.0]</td>
<td>62.0 [45.0, 69.0]</td>
<td>58.0 [46.0, 68.0]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Geom. mean (Geo. SD%)</td>
<td class='lastrow'>61.1 (1.08%)</td>
<td class='lastrow'>58.7 (1.10%)</td>
<td class='lastrow'>61.3 (1.08%)</td>
<td class='lastrow'>57.9 (1.10%)</td>
<td class='lastrow'>61.2 (1.08%)</td>
<td class='lastrow'>58.4 (1.10%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>testost</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD%)</td>
<td>25.3 (13.2%)</td>
<td>22.2 (10.7%)</td>
<td>27.6 (16.1%)</td>
<td>28.2 (15.6%)</td>
<td>26.0 (14.2%)</td>
<td>24.4 (13.0%)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>23.0 [4.00, 111]</td>
<td>21.5 [8.00, 63.0]</td>
<td>25.0 [6.00, 144]</td>
<td>24.0 [10.0, 69.0]</td>
<td>23.0 [4.00, 144]</td>
<td>22.0 [8.00, 69.0]</td>
</tr>
<tr>
<td class='rowlabel'>Geom. mean (Geo. SD%)</td>
<td>22.4 (1.65%)</td>
<td>20.0 (1.58%)</td>
<td>24.6 (1.60%)</td>
<td>24.6 (1.69%)</td>
<td>23.1 (1.64%)</td>
<td>21.6 (1.63%)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>6 (2.0%)</td>
<td class='lastrow'>2 (4.2%)</td>
<td class='lastrow'>3 (2.2%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>9 (2.1%)</td>
<td class='lastrow'>3 (3.9%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>prolactn</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD%)</td>
<td>9.60 (5.10%)</td>
<td>13.7 (12.3%)</td>
<td>10.8 (6.79%)</td>
<td>9.57 (3.29%)</td>
<td>9.99 (5.70%)</td>
<td>12.2 (10.1%)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>8.16 [1.96, 37.3]</td>
<td>8.81 [3.87, 55.8]</td>
<td>9.30 [2.66, 59.9]</td>
<td>8.88 [4.49, 17.6]</td>
<td>8.64 [1.96, 59.9]</td>
<td>8.84 [3.87, 55.8]</td>
</tr>
<tr>
<td class='rowlabel'>Geom. mean (Geo. SD%)</td>
<td>8.59 (1.58%)</td>
<td>10.7 (1.89%)</td>
<td>9.63 (1.58%)</td>
<td>9.05 (1.41%)</td>
<td>8.90 (1.59%)</td>
<td>10.1 (1.73%)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>14 (4.7%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>6 (4.4%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>20 (4.6%)</td>
<td class='lastrow'>1 (1.3%)</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->

`table1` recognizes the following summary statisticis:
N, NMISS, MEAN, SD, CV, GMEAN, GCV, MEDIAN, MIN, MAX, IQR, 
Q1, Q2, Q3, T1, T2, FREQ, PCT

Details can be found in the help to the function `stats.default()` 

Note that they are case-insensitive, and we can write Median or mediAn instead
of median. 

Also note that we write `.="Mean (SD%)"` which will be recognized
as the functions `mean()` and `sd()`, but also that the label shown should be
"Mean (SD%)".

If we want to specify the label, we can write `"Geom. mean (Geo. SD%)"="GMEAN (GSD%)"`


:::: challenge
## Change the labels 

We have two unusual values in this table - geometric mean and geometric 
standard deviation. Change the code to write out "Geom." and "geo." as 
geometric.


:::: solution

``` r
table1(~ageblood + testost + prolactn |case + curpmh, data = blood,
        render.continuous=c(.="Mean (SD%)", .="Median [Min, Max]",
                           "Geometric mean (Geometric SD%)"="GMEAN (GSD%)"))
```


The geometric mean of two numbers is the squareroot of the product of the two
numbers. If we have three numbers, we take the cube root of the product. In general:

$$\left( \prod_{i=1}^{n} x_i \right)^{\frac{1}{n}}$$

The geometric standard deviation is defined by:
$$ \exp\left(\sqrt{\frac{1}{n} \sum_{i=1}^{n} \left( \log x_i - \frac{1}{n} \sum_{j=1}^{n} \log x_j \right)^2}\right)$$


::::

::::




## Very advanced stuff

If we want to specify the summary statistics very precisely, we have to 
define a function ourself:


``` r
my_summary <- function(x){
  c("","Median" = sprintf("%.3f", median(x, na.rm = TRUE)),
"Variance" = sprintf("%.1f", var(x, na.rm=TRUE)))
}
table1(~ageblood + testost + prolactn|case + curpmh, data = blood,
render.continuous = my_summary)
```

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class="grouplabel"></th>
<th colspan="2" class="grouplabel"><div>control</div></th>
<th colspan="2" class="grouplabel"><div>case</div></th>
<th colspan="2" class="grouplabel"><div>Overall</div></th>
</tr>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=298)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=48)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=135)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=29)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>no<br/><span class='stratn'>(N=433)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>yes<br/><span class='stratn'>(N=77)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>Age<span class='varunits'> (years)</span></span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Median</td>
<td>62.000</td>
<td>59.000</td>
<td>62.000</td>
<td>58.000</td>
<td>62.000</td>
<td>58.000</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Variance</td>
<td class='lastrow'>22.6</td>
<td class='lastrow'>32.3</td>
<td class='lastrow'>23.5</td>
<td class='lastrow'>28.3</td>
<td class='lastrow'>22.8</td>
<td class='lastrow'>30.6</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>testost</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Median</td>
<td>23.000</td>
<td>21.500</td>
<td>25.000</td>
<td>24.000</td>
<td>23.000</td>
<td>22.000</td>
</tr>
<tr>
<td class='rowlabel'>Variance</td>
<td>173.6</td>
<td>115.0</td>
<td>257.7</td>
<td>241.9</td>
<td>200.4</td>
<td>169.0</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>6 (2.0%)</td>
<td class='lastrow'>2 (4.2%)</td>
<td class='lastrow'>3 (2.2%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>9 (2.1%)</td>
<td class='lastrow'>3 (3.9%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'><span class='varlabel'>prolactn</span></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Median</td>
<td>8.155</td>
<td>8.805</td>
<td>9.300</td>
<td>8.880</td>
<td>8.640</td>
<td>8.835</td>
</tr>
<tr>
<td class='rowlabel'>Variance</td>
<td>26.1</td>
<td>151.3</td>
<td>46.1</td>
<td>10.8</td>
<td>32.5</td>
<td>102.8</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>14 (4.7%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>6 (4.4%)</td>
<td class='lastrow'>1 (3.4%)</td>
<td class='lastrow'>20 (4.6%)</td>
<td class='lastrow'>1 (1.3%)</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->
We do not _need_ to use the `sprintf()` function, but it is a very neat way of 
combining text with numeric variables because it allows us to format 
them directly.

Summary statistics for categorical data can be adjusted similarly, by specifying
`render.categorical`.

:::: challenge
## What does %.3f actually do?

Can you guess what the formatting in ´sprintf´ does? 

Try to change "%.3f" in the function to "%.2f".

:::: solution


``` r
my_summary <- function(x){
  c("","Median" = sprintf("%.3f", median(x, na.rm = TRUE)),
"Variance" = sprintf("%.1f", var(x, na.rm=TRUE)))
}
```

`sprintf` uses a bit of an arcane way of specifying the way numbers should be
formatted when we combine them with text. The "%"-sign specifies that "this is
where we place the number in the function". ".3f" specifies that we are treating
the number as a floating point number (which is just a fancy way of saying that
it is a decimal number), and that we would like three digits after the decimal point.

::::



::::


:::: challenge

## Whats up with that blank line?

Note that in the function, we define a vector as output, with three elements:

``` r
my_summary <- function(x){
  c("",
"Median" = sprintf("%.3f", median(x, na.rm = TRUE)),
"Variance" = sprintf("%.1f", var(x, na.rm=TRUE)))
}
```

Calculating and formatting the median and the varianse is pretty straightforward.

But the first element is an empty string. Whats up with that?

:::: solution

Try to remove the empty string from the function, and use it is a table one 
as previously shown:


``` r
my_summary <- function(x){
  c("Median" = sprintf("%.3f", median(x, na.rm = TRUE)),
"Variance" = sprintf("%.1f", var(x, na.rm=TRUE)))
}
table1(~ageblood + testost + prolactn|case + curpmh, data = blood,
render.continuous = my_summary)
```
The line beginning with "Median" does not show up, but the median value is 
shown next to the "Age" and "Weight" lines. 

::::

::::





:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Primarily of use if there are medical students on the course

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- A Table One provides a compact describtion of the data we are working with
- With a little bit of work we can control the content of the table.

::::::::::::::::::::::::::::::::::::::::::::::::

