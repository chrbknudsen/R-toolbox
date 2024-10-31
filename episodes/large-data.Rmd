---
title: 'large-data'
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

Generelle tips.

Optimer datatyper - eg. brug faktorer i stedet for tekst (hvis der er gengangere
i tekterne...) og integer i stedet for numeric.


library(tidyverse)
vanilla <- nycflights13::flights


int_1 <- vanilla %>% 
  mutate(dep_delay = as.integer(dep_delay))
  



int_all <- vanilla %>% 
  mutate(across(c(dep_delay, arr_delay, air_time, flight, distance, hour, minute), as.integer))

fct_1 <- vanilla %>% 
  mutate(carrier = fct(carrier))

fct_all <- vanilla %>% 
  mutate(across(c(carrier, tailnum, origin, dest), as.factor))


all_conv <- vanilla %>% 
  mutate(across(c(carrier, tailnum, origin, dest), as.factor)) %>% 
  mutate(across(c(dep_delay, arr_delay, air_time, flight, distance, hour, minute), as.integer))


object.size(vanilla)
object.size(int_1)
object.size(int_all)
object.size(fct_1)
object.size(fct_all)
object.size(all_conv)


27213880/40650040 

Eller, i dette specifikke tilfælde kan vi reducere størrelsen med 1/3
duckdb.

data.table


tbl(con, "flights") %>%
group_by(origin) %>%
count(dest, sort = TRUE, name = "N") %>%
slice_max(order_by = N, n = 3) %>%
select(origin, dest)

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

