---
title: 'Table One - gt'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you make a Table One?
- How do you make a Table One that is easy to configure?

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
<th class='rowlabel firstrow lastrow'></th>
<th class='firstrow lastrow'><span class='stratlabel'>control<br><span class='stratn'>(N=346)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>case<br><span class='stratn'>(N=164)</span></span></th>
<th class='firstrow lastrow'><span class='stratlabel'>Overall<br><span class='stratn'>(N=510)</span></span></th>
</tr>
</thead>
<tbody>
<tr>
<td class='rowlabel firstrow'>Age (years)</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>61.0 (4.95)</td>
<td>60.9 (5.09)</td>
<td>61.0 (4.99)</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Median [Min, Max]</td>
<td class='lastrow'>62.0 [46.0, 69.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
<td class='lastrow'>62.0 [45.0, 69.0]</td>
</tr>
<tr>
<td class='rowlabel firstrow'>testost</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>24.9 (12.9)</td>
<td>27.7 (15.9)</td>
<td>25.8 (14.0)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>22.0 [4.00, 111]</td>
<td>25.0 [6.00, 144]</td>
<td>23.0 [4.00, 144]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>8 (2.3%)</td>
<td class='lastrow'>4 (2.4%)</td>
<td class='lastrow'>12 (2.4%)</td>
</tr>
<tr>
<td class='rowlabel firstrow'>prolactn</td>
<td class='firstrow'></td>
<td class='firstrow'></td>
<td class='firstrow'></td>
</tr>
<tr>
<td class='rowlabel'>Mean (SD)</td>
<td>10.2 (6.77)</td>
<td>10.6 (6.32)</td>
<td>10.3 (6.63)</td>
</tr>
<tr>
<td class='rowlabel'>Median [Min, Max]</td>
<td>8.27 [1.96, 55.8]</td>
<td>9.18 [2.66, 59.9]</td>
<td>8.67 [1.96, 59.9]</td>
</tr>
<tr>
<td class='rowlabel lastrow'>Missing</td>
<td class='lastrow'>14 (4.0%)</td>
<td class='lastrow'>7 (4.3%)</td>
<td class='lastrow'>21 (4.1%)</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->




``` r
tbl_summary(blood, 
            by = case, 
              type = all_continuous() ~ "continuous2", # for at få multilinie summary stats
            include = c(ageblood, testost, curpmh),
                statistic = all_continuous() ~ c(
      "{mean} ({min}, {max})",
      "{median} ({p25}, {p75})"
    )
            ) |>
    add_overall(last = TRUE)
```

<!--html_preserve--><div id="uasbeuviqb" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#uasbeuviqb table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#uasbeuviqb thead, #uasbeuviqb tbody, #uasbeuviqb tfoot, #uasbeuviqb tr, #uasbeuviqb td, #uasbeuviqb th {
  border-style: none;
}

#uasbeuviqb p {
  margin: 0;
  padding: 0;
}

#uasbeuviqb .gt_table {
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

#uasbeuviqb .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#uasbeuviqb .gt_title {
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

#uasbeuviqb .gt_subtitle {
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

#uasbeuviqb .gt_heading {
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

#uasbeuviqb .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uasbeuviqb .gt_col_headings {
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

#uasbeuviqb .gt_col_heading {
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

#uasbeuviqb .gt_column_spanner_outer {
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

#uasbeuviqb .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#uasbeuviqb .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#uasbeuviqb .gt_column_spanner {
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

#uasbeuviqb .gt_spanner_row {
  border-bottom-style: hidden;
}

#uasbeuviqb .gt_group_heading {
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

#uasbeuviqb .gt_empty_group_heading {
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

#uasbeuviqb .gt_from_md > :first-child {
  margin-top: 0;
}

#uasbeuviqb .gt_from_md > :last-child {
  margin-bottom: 0;
}

#uasbeuviqb .gt_row {
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

#uasbeuviqb .gt_stub {
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

#uasbeuviqb .gt_stub_row_group {
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

#uasbeuviqb .gt_row_group_first td {
  border-top-width: 2px;
}

#uasbeuviqb .gt_row_group_first th {
  border-top-width: 2px;
}

#uasbeuviqb .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#uasbeuviqb .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#uasbeuviqb .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#uasbeuviqb .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uasbeuviqb .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#uasbeuviqb .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#uasbeuviqb .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#uasbeuviqb .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#uasbeuviqb .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uasbeuviqb .gt_footnotes {
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

#uasbeuviqb .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#uasbeuviqb .gt_sourcenotes {
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

#uasbeuviqb .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#uasbeuviqb .gt_left {
  text-align: left;
}

#uasbeuviqb .gt_center {
  text-align: center;
}

#uasbeuviqb .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#uasbeuviqb .gt_font_normal {
  font-weight: normal;
}

#uasbeuviqb .gt_font_bold {
  font-weight: bold;
}

#uasbeuviqb .gt_font_italic {
  font-style: italic;
}

#uasbeuviqb .gt_super {
  font-size: 65%;
}

#uasbeuviqb .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#uasbeuviqb .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#uasbeuviqb .gt_indent_1 {
  text-indent: 5px;
}

#uasbeuviqb .gt_indent_2 {
  text-indent: 10px;
}

#uasbeuviqb .gt_indent_3 {
  text-indent: 15px;
}

#uasbeuviqb .gt_indent_4 {
  text-indent: 20px;
}

#uasbeuviqb .gt_indent_5 {
  text-indent: 25px;
}

#uasbeuviqb .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#uasbeuviqb div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="label"><span class='gt_from_md'><strong>Characteristic</strong></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_1"><span class='gt_from_md'><strong>control</strong><br />
N = 346</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_2"><span class='gt_from_md'><strong>case</strong><br />
N = 164</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="stat_0"><span class='gt_from_md'><strong>Overall</strong><br />
N = 510</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left">Age</td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Mean (Min, Max)</td>
<td headers="stat_1" class="gt_row gt_center">61.0 (46.0, 69.0)</td>
<td headers="stat_2" class="gt_row gt_center">60.9 (45.0, 69.0)</td>
<td headers="stat_0" class="gt_row gt_center">61.0 (45.0, 69.0)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Median (Q1, Q3)</td>
<td headers="stat_1" class="gt_row gt_center">62.0 (57.0, 65.0)</td>
<td headers="stat_2" class="gt_row gt_center">62.0 (57.0, 65.0)</td>
<td headers="stat_0" class="gt_row gt_center">62.0 (57.0, 65.0)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">testost</td>
<td headers="stat_1" class="gt_row gt_center"><br /></td>
<td headers="stat_2" class="gt_row gt_center"><br /></td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Mean (Min, Max)</td>
<td headers="stat_1" class="gt_row gt_center">25 (4, 111)</td>
<td headers="stat_2" class="gt_row gt_center">28 (6, 144)</td>
<td headers="stat_0" class="gt_row gt_center">26 (4, 144)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Median (Q1, Q3)</td>
<td headers="stat_1" class="gt_row gt_center">22 (16, 31)</td>
<td headers="stat_2" class="gt_row gt_center">25 (19, 33)</td>
<td headers="stat_0" class="gt_row gt_center">23 (17, 31)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_1" class="gt_row gt_center">8</td>
<td headers="stat_2" class="gt_row gt_center">4</td>
<td headers="stat_0" class="gt_row gt_center">12</td></tr>
    <tr><td headers="label" class="gt_row gt_left">current_pmh</td>
<td headers="stat_1" class="gt_row gt_center">48 (14%)</td>
<td headers="stat_2" class="gt_row gt_center">29 (18%)</td>
<td headers="stat_0" class="gt_row gt_center">77 (15%)</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> <span class='gt_from_md'>n (%)</span></td>
    </tr>
  </tfoot>
</table>
</div><!--/html_preserve-->

Og det gør vi så med gt i stedet.
er der lettere måder? Ja, det er der. Link til lettere måde. 
Men! det her giver os ret omfattende muligheder for at tilpasse tabellen.


Herunder er vi ikke helt i mål endnu. Men vi er ret tæt.


``` r
library(dplyr)
library(gtsummary)
names(blood)
```

``` output
[1] "ID"       "matchid"  "case"     "curpmh"   "ageblood" "estradol" "testost" 
[8] "prolactn"
```

``` r
# grunddata
base <- blood |>
  select(ageblood, grade, stage, trt) |>
  mutate(grade = paste("Grade", grade))
```

``` error
Error in `select()` at dplyr/R/mutate.R:146:3:
! Can't select columns that don't exist.
✖ Column `grade` doesn't exist.
```

``` r
# rækkefølge på paneler: Overall først, derefter Grade I/II/III
lvl <- c("Overall", paste("Grade", levels(trial$grade)))

# lav et samlet datasæt med et ekstra "Overall"-panel
df <- bind_rows(
  base |> mutate(.panel = "Overall"),
  base |> mutate(.panel = grade)
) |>
  mutate(.panel = factor(.panel, levels = lvl))
```

``` error
Error: object 'base' not found
```

``` r
# tabel: tre strata + et overall-stratum
tbl <- df |>
  tbl_strata(
    strata = .panel,
    .tbl_fun = ~ .x |>
      select(-grade) |> 
      tbl_summary(by = trt, missing = "no") |>
      add_n(),
    .header = "**{strata}**, N = {n}"
  )
```

``` error
Error in `tbl_strata()`:
! The `data` argument must be class <data.frame/survey.design>, not a
  function.
```

``` r
tbl
```

``` output
function(src, ...) {
  UseMethod("tbl")
}
<bytecode: 0x55b32e21d4a0>
<environment: namespace:dplyr>
```

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Primarily of use if there are medical students on the course

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- A Table One provides a compact describtion of the data we are working with
- With a little bit of work we can control the content of the table.

::::::::::::::::::::::::::::::::::::::::::::::::

