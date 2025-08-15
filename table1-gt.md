---
title: 'Table One'
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


``` r
1+1
```

``` output
[1] 2
```


``` error
Error: 'episodes/data/BLOOD.csv' does not exist in current working directory ('/home/runner/work/R-toolbox/R-toolbox/site/built').
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

``` error
Error: object 'blood' not found
```

It can look like this:


``` error
Error: object 'blood' not found
```



``` r
blood |> 
  tbl_strata2(
    strata = case,
    .tbl_fun = ~ .x |> 
      tbl_summary(include = c(ageblood, estradol, testost),
    type = all_continuous() ~"continuous2",
      statistic = all_continuous() ~c(
             "{N_nonmiss}",
        "{median} ({p25}, {p75})",
        "{min}, {max}"
         )
      ) |> 
      add_n() 
      
  )  |> as_gtsummary()
```





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

``` error
Error in add_overall(tbl_summary(blood, by = case, type = all_continuous() ~ : could not find function "add_overall"
```

Og det gør vi så med gt i stedet.
er der lettere måder? Ja, det er der. Link til lettere måde. 
Men! det her giver os ret omfattende muligheder for at tilpasse tabellen.


Herunder er vi ikke helt i mål endnu. Men vi er ret tæt.


``` r
library(dplyr)
library(gtsummary)

# grunddata
base <- blood |>
  select(age, grade, stage, trt) |>
  mutate(grade = paste("Grade", grade))

# rækkefølge på paneler: Overall først, derefter Grade I/II/III
lvl <- c("Overall", paste("Grade", levels(trial$grade)))

# lav et samlet datasæt med et ekstra "Overall"-panel
df <- bind_rows(
  base |> mutate(.panel = "Overall"),
  base |> mutate(.panel = grade)
) |>
  mutate(.panel = factor(.panel, levels = lvl))

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

tbl
```

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Primarily of use if there are medical students on the course

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- A Table One provides a compact describtion of the data we are working with
- With a little bit of work we can control the content of the table.

::::::::::::::::::::::::::::::::::::::::::::::::

