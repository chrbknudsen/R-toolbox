---
title: 'A deeper dive into pipes'
teaching: 10
exercises: 2
---

::: questions
-   What are the differences between the two pipes?
:::

::: objectives
-   Explain some of the differences between the two families of pipes
:::

<https://stackoverflow.com/questions/67633022/what-are-the-differences-between-rs-native-pipe-and-the-magrittr-pipe>

magrittr pipen blev introduceret november 2014.

Vi bruger den massivt i vores undervisning, for den er super nyttig.

18. maj 2021 kom R version 4.1. Og den havde en indbygget pipe, der gør næsten, men ikke fuldstændigt, det samme som magrittr pipen.

KUB datalab fortsætter indtil videre med at bruge magrittr pipen. Det er tanken at vi fortsætter indtil den native pipe er default for tastaturgenvejen for indsættelse er pipe operatoren i Rstudio ( Ctrl+Shift+M Cmd+Shift+M).

Man kan ændre pipeoperatoren i Rstudio til at være

genvejene kan findes i Tools → Keyboard Shortcuts Help. alt-shift-k (Option+Shift+K på mac)

Tools → Modify Keyboard Shortcuts.

Vil man ændre den så er det Tools → Global Options (eller Project Options) → Code og hak af i "Use native pipe operator, \|\>"

| Topic | Magrittr 2.0.3 | Base 4.3.0 | note |
|----|----|----|----|
| Operator | `%\>%      %\<\>% %$%       %!>%  %T>%` | `|>`       | 1 |
| Function calls | `1:2 %>% sum()`                           |  `1:2 |> sum()`          |  |
|                |       **`1:2 %>% sum`  **               | Needs the parentheses           |  |
| |`1:3 %>% `+` 4`| Not every function is supported| |
|Insert on first empty place| `mtcars %>% lm(formula=mpg ~ disp)` |  `mtcars |> lm(formula = mpg ~ disp)` |  |
|placeholder| . | _ | |
| |`mtcars %>% lm(mpg~disp, data = .)` | `mtcars |> lm(mpg ~ disp, data = _)` | |
| |`mtcars %>% lm(mpg~disp, .)`| Needs named argument | |
| | `1:3 %>% setNames(., .)`   | Can only appear once | |
| |`1:3 %>% {sum(sqrt(.))}`| Nested calls not allowed||
|Extraction call | `mtcars %>% .$cyl mtcars %>% {.$cyl[[3]]} mtcars %$% cyl[[3]]` | `mtcars |> _$cyl` `mtcars |> _$cyl` |  |


<!-- | environment | %\>% has additional function environment "x" %!\>% assign(1) | "x" | \> assign(1) | -->

<!-- | Create function | top6 \<- . %\>% sort() %\>% tail() | not possible |  | -->

<!-- | Speed | Slow - overhead of function call | Faster because syntax transformation |  | -->

1.  Unless we explicitly import the `magrittr` package, we typically only have access to the simple pipe, `%>%` which is included in many packages. This however is only one of several pipes available from the magrittr package.

%\<\>% %\$% %!\>% %T\>%

Og hvad betyder de forskellige ting?

Den sidste - magrittr pipen er et separat funktions kald hver gang.

Eksempelvis:


``` r
data %>% 
  filteR(x > 0) %>% 
  summarise(mean = mean(y))
```

bliver til:


``` r
`%>%`(`%>%`(data, filter(x > 0)), summarize(mean = mean(y)))
```

Mens


``` r
data |>
  filter(x > 0) |>
  summarize(mean = mean(y))
```

bliver til:


``` r
summarize(filter(data, x > 0), mean = mean(y))
```

Og pointen med lm eksemplerne i "insert on first empty place" er at det ikke er på første position der indsættes fra pipen, men på den første position der er ledig. Og når vi specificerer navnet på det første argument, er det ikke ledigt længere.

::: keypoints
-   Use `.md` files for episodes when you want static content
-   Use `.Rmd` files for episodes when you need to generate output
-   Run `sandpaper::check_lesson()` to identify any issues with your lesson
-   Run `sandpaper::build_lesson()` to preview your lesson locally
:::
