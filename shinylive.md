---
title: 'Shiny without the server'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can I distribute my Shiny app without a shinyserver?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to use ShinyLive to distribute a shiny app


::::::::::::::::::::::::::::::::::::::::::::::::

We have written a shiny app. And we can run it on our own computer using 
RStudio. But now we want to send it to someone else, that might not have
R and RStudio installed. 

That someone else might also want to - or have the technical skills to do that.

One way would be to aquire a server in the cloud, install R and a Shiny server on
it, add a webserver pointing to the correct place and then place the app on it.

That is not simple, but step by step guides for that exists.

A simpler way exists. But we still need a webserver. We can get that on 
github. So what to do?

We are going to assume that you have an app already. What we want is to be
able to run that in a browser. Shiny draws on a lot of R, access to packages
and an installation of R.

The library `shinylive` handles exporting everything your app need to a 
separate folder, html-files and other assets, making it possible to run the
app on a simple webserver.

## Export your app

We need the library `shinylive`

``` r
library(shinylive)
```

illustration af projektmappen

We can now export the app:

``` r
shinylive::export(appdir = "myapp", destdir = "site")
```

Change "myapp" to match the directory containing your app. The destination
directory "site" can be changed to whatever you like, but the standard is to
choose either "site" or "docs".

That takes a little while.

## Test your app

We need a webserver to run the app - just a simple webserver, nothing fancy,
and we can do that using the library `httpuv`: 


``` r
library(httpuv)
```

We need to specify where the exported app is located

``` r
httpuv::runStaticServer("site/")
```

So change "site" to your destination directory from the export.

Now you should see your app in a browser. Make sure that it is actually working.

:::: caution
## There are limitations

`shinylive` is a relatively new package, and is dependent on other packages,
primarily `webr` that allow us to run R in a browser. 

`webr` is not able to install packages from source. And some packages it does not
support. 

::::

:::: spoiler
## Additional troubleshooting

When `shinylive` exports your app, it automatically scans your code to discover
which packages should be included in the export.

If, for some reason this fails, you can place an explicit call to library in your code:

``` r
if (FALSE) {
  library(UNDISCOVERED_PACKAGE)
}
```


::::

## Now we need to get it on GitHub

kan vi også få det på codeberg?

få den på github

Flere apps på samme repo

https://posit-dev.github.io/r-shinylive/

Denne beskriver i detaljer hvordan
https://hbctraining.github.io/Training-modules/RShiny/lessons/shinylive.html




::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

