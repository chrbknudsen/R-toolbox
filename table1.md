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

::::::::::::::::::::::::::::::::::::::::::::::::

## What is a "Table One"?

Primarily used in medical and epidemiological research,
a Table One is typically the first table in any publication
using data.

It presents the baseline characteristics of the participants
in a study, and provides a concise overview of the relevant
demographic and clinical variables. 

It typically compares different groups (male~female, treatment~control), to highlight similarities and differences.



``` output

Attaching package: 'table1'
```

``` output
The following objects are masked from 'package:base':

    units, units<-
```

It can look like this:
<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>Treated<br><span class='stratn'>(N=20)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Placebo<br><span class='stratn'>(N=20)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Overall<br><span class='stratn'>(N=40)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'>Sex</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Male</td>
<td>10 (50.0%)</td>
<td>10 (50.0%)</td>
<td>20 (50.0%)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Female</td>
<td class='lastrow'>10 (50.0%)</td>
<td class='lastrow'>10 (50.0%)</td>
<td class='lastrow'>20 (50.0%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>Age (years)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>27.1 (11.4)</td>
<td>30.6 (12.0)</td>
<td>28.9 (11.7)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>24.8 [11.1, 46.6]</td>
<td>31.2 [10.4, 49.3]</td>
<td>28.5 [10.4, 49.3]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>1 (5.0%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>1 (2.5%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>Weight (kg)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>74.3 (11.1)</td>
<td>70.7 (13.5)</td>
<td>72.5 (12.3)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Median [Min, Max]</td>
<td class='lastrow'>73.0 [57.4, 99.9]</td>
<td class='lastrow'>71.8 [43.5, 103]</td>
<td class='lastrow'>72.8 [43.5, 103]</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->
We have 40 participants in a study, split into equal control and treatment groups,
and describe the distribution of Sex, Age and Weight in both the two groups, and overall.

A number of packages making it easy to make a Table One exists. Here we look
at the package `table1`.

The specific way of doing it depends on the data available. If we do not have
data on the weight of the participants, we are not able to describe the distribution
of their weight.

But the table above was made in this way:


``` r
library(table1)
table1(~sex + age + weight|treatment, data = dat)
```
We specify that we would like a table that is a function of `sex`, `age` and
`wt`, and we would like it split into groups based on the values in the `treatment`

It might be instructive to take a look at how the data was prepared.
First the data it self:

``` r
dat <- expand.grid(id=1:10, sex=c("Male", "Female"), treatment=c("Treated", "Placebo"))
dat$age <- runif(nrow(dat), 10, 50)
dat$age[3] <- NA  # Add a missing value
dat$weight <- exp(rnorm(nrow(dat), log(70), 0.2))
```

The interesting part occurs here, where we add labels to the data. That
allows us to control the headings in the table:

``` r
label(dat$sex) <- "Sex"
label(dat$age) <- "Age"
label(dat$treatment) <- "Treatment Group"
label(dat$weight) <- "Weight"
```

It can be beneficial to add information about units of the data:

``` r
units(dat$age) <- "years"
units(dat$weight) <- "kg"
```


## More advanced stuff

FLYTTES TIL SEPARAT SIDE?

We might want to be able to precisely control the summary
statistics presented in the table. 

We can do that by specifying input to the arguments
`render.continuous` and `render.categorical` that
control how continuous and categorical data respecetively,
is shown in the table.

The simple way of doing that is by using abbrevieated
function names:


``` r
table1(~sex + age + weight|treatment, data = dat,
        render.continuous=c(.="Mean (SD%)", .="Median [Min, Max]",
                           "Geom. mean (Geo. SD%)"="GMEAN (GSD%)"))
```

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>Treated<br><span class='stratn'>(N=20)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Placebo<br><span class='stratn'>(N=20)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Overall<br><span class='stratn'>(N=40)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'>Sex</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Male</td>
<td>10 (50.0%)</td>
<td>10 (50.0%)</td>
<td>20 (50.0%)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Female</td>
<td class='lastrow'>10 (50.0%)</td>
<td class='lastrow'>10 (50.0%)</td>
<td class='lastrow'>20 (50.0%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>Age (years)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD%)</td>
<td>27.1 (11.4%)</td>
<td>30.6 (12.0%)</td>
<td>28.9 (11.7%)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>24.8 [11.1, 46.6]</td>
<td>31.2 [10.4, 49.3]</td>
<td>28.5 [10.4, 49.3]</td>
</tr>
<tr>
<td class='rowlabel'>Geom. mean (Geo. SD%)</td>
<td>24.7 (1.57%)</td>
<td>27.9 (1.60%)</td>
<td>26.3 (1.58%)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>1 (5.0%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>1 (2.5%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>Weight (kg)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD%)</td>
<td>74.3 (11.1%)</td>
<td>70.7 (13.5%)</td>
<td>72.5 (12.3%)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>73.0 [57.4, 99.9]</td>
<td>71.8 [43.5, 103]</td>
<td>72.8 [43.5, 103]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Geom. mean (Geo. SD%)</td>
<td class='lastrow'>73.5 (1.16%)</td>
<td class='lastrow'>69.4 (1.22%)</td>
<td class='lastrow'>71.5 (1.19%)</td>
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

ØVELSE - ÆNDRE PÅ LABEL ETC.

## Very advanced stuff

If we want to specify the summary statistics very precisely, we have to 
define a function ourself:


``` r
my_summary <- function(x){
  c("","Median" = sprintf("%.3f", median(x, na.rm = TRUE)),
"Variance" = sprintf("%.1f", var(x, na.rm=TRUE))
)
}
table1(~sex + age + weight|treatment, data = dat,
render.continuous = my_summary)
```

<!--html_preserve--><div class="Rtable1"><table class="Rtable1">
<thead>
<tr>
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>Treated<br><span class='stratn'>(N=20)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Placebo<br><span class='stratn'>(N=20)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Overall<br><span class='stratn'>(N=40)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'>Sex</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Male</td>
<td>10 (50.0%)</td>
<td>10 (50.0%)</td>
<td>20 (50.0%)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Female</td>
<td class='lastrow'>10 (50.0%)</td>
<td class='lastrow'>10 (50.0%)</td>
<td class='lastrow'>20 (50.0%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>Age (years)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Median</td>
<td>24.820</td>
<td>31.184</td>
<td>28.548</td>
</tr>
<tr>
<td class='rowlabel'>Variance</td>
<td>129.1</td>
<td>144.9</td>
<td>136.8</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>1 (5.0%)</td>
<td class='lastrow'>0 (0%)</td>
<td class='lastrow'>1 (2.5%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>Weight (kg)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Median</td>
<td>72.988</td>
<td>71.771</td>
<td>72.752</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Variance</td>
<td class='lastrow'>124.2</td>
<td class='lastrow'>181.9</td>
<td class='lastrow'>152.5</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->
We do not _need_ to use the `sprintf()` function, but it is a very neat way of 
combining text with numeric variables. 

ØVELSE - HVAD MON .3f GØR?

What we absolutely need to do is adding the empty string in the beginning.

ØVELSE -  HVAD SKER DER HVIS MAN LADER VÆRE?


Summary statistics for categorical data can be adjusted similarly, by specifying
`render.categorical`.


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Primarily of use if there are medical students on the course

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content

::::::::::::::::::::::::::::::::::::::::::::::::

