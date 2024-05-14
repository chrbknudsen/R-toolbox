---
title: 'reading_files'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you read in data from files??

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to read in data from a selection of different data files. 

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Den væsenligste pointe er egentlig at der med meget stor sandsynlighed
eksisterer mindst en pakke der er designet til at indlæse lige netop din
underlige filtype. Google er din ven!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

## CSV-files

The most basic file type for storing and transferring data. A "simple" textfile,
containing tabular data. One line of text for each row of data, each cell in
that row, corresponding to a column, separated with a separator, typically a 
comma.

Many languages use commas as decimal separators. That neccesitates an option 
for using something else than a comma. Typically a semicolon.

### Truly commaseparated files

Use `read.csv()` (from base-R) or `read_csv()` (from `readr`, included in `tidyverse`)

We recommend using `read_csv()`.

### Semicolon separated files

Use `read.csv2()` (from base-R) or `read_csv2()` (from `readr`, included in `tidyverse`)

We recommend `read_csv2()`

Especially `read_csv` and `read_csv2` take a lot of arguments that can control 
datatypes, handling of headers etc. For most use, the default options are 
enough, but if you need to adjust something, there are plenty of options for that.

## Excel-files

Use the `readxl` package. Excel comes in two variants, `xls` and `xlsx`. `read_excel()`
makes a qualified quess of the actual type your excel-file is. Should we need to
specify, we can use `read_xls()` or `read_xlsx()`.

Workbooks often contains more than one sheet. We can specify which we want to 
read in:

`read_excel(path = "filename", sheet = 2`

Which will read in sheet number 2 from the workbook "filename".

Read the documentation for details on how to read in specific cells or ranges.


## SPSS

Use the package `haven` to read in spss files:


```r
library(haven)
read_spss("filename")
```


## Stata

Use the package `haven` to read in stata files:


```r
library(haven)
read_stata("filename")
```


## SAS

Use the package `haven` to read in spss files:


```r
library(haven)
read_sas("filename")
```


## Other formats

In general if a piece of software is in widespread enough use that you encounter
the weird file-format it uses, someone will have written a package for reading
it. Google is your friend here!

Also, if you encounter a really weird dataformat, please send us an example so
we can expand our knowledge.




::::::::::::::::::::::::::::::::::::: keypoints 

- The `readr` version of `read_csv()` is preferred
- Remember that csv is not always actually separated with commas.
- The `haven` package contians a _lot_ of functions for handling weird datatypes
- In general a package will exist for reading strange datatypes. Google is your friend!

::::::::::::::::::::::::::::::::::::::::::::::::

