---
title: 'Different pipes'
teaching: 10
exercises: 2
---

::: questions
-   What are the differences between the two pipes?
:::

::: objectives
-   Explain how to use markdown with the new lesson template
:::

<https://stackoverflow.com/questions/67633022/what-are-the-differences-between-rs-native-pipe-and-the-magrittr-pipe>

der er også et billede

magrittr pipen blev introduceret november 2014.

Vi bruger den massivt i vores undervisning, for den er super nyttig.

18. maj 2021 kom R version 4.1. Og den havde en indbygget pipe, der gør næsten, men ikke fuldstændigt, det samme som magrittr pipen.

KUB datalab fortsætter indtil videre med at bruge magrittr pipen. Det er tanken at vi fortsætter indtil den native pipe er default for tastaturgenvejen for indsættelse er pipe operatoren i Rstudio ( Ctrl+Shift+M Cmd+Shift+M).

Man kan ændre pipeoperatoren i Rstudio til at være

genvejene kan findes i Tools → Keyboard Shortcuts Help. alt-shift-k (Option+Shift+K på mac)

Tools → Modify Keyboard Shortcuts.

Vil man ændre den så er det Tools → Global Options (eller Project Options) → Code og hak af i "Use native pipe operator, \|\>"

| Topic          | Magrittr 2.0.3                     | Base 4.3.0 |
|----------------|------------------------------------|------------|
| Operator       | `%>%` \``%<>%` `%$%` `%!>%` `%T>%` | `|>`       |
| Function calls | `1:2 %>% sum()`                           |  `1:2 |> sum()`          |
|                |       `1:2 %>% sum`                              | Needs the parentheses           |
||`1:3 %>% `+` 4`| Not every function is supported|


::: keypoints
-   Use `.md` files for episodes when you want static content
-   Use `.Rmd` files for episodes when you need to generate output
-   Run `sandpaper::check_lesson()` to identify any issues with your lesson
-   Run `sandpaper::build_lesson()` to preview your lesson locally
:::
