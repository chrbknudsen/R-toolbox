---
title: 'When install.packages fail'
teaching: 10
exercises: 2
---


:::::::::::::::::::::::::::::::::::::: questions 

- What to do when `install.packages` tells me the package is not available?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Provide explanations for this problem
- Provide solutions

::::::::::::::::::::::::::::::::::::::::::::::::


![](fig/package-not-avail.png)

Installing packages can fail in many ways. The error above, is clearly caused
by looking for at package name that does not exist. 

The message points us in the direction of the [R documentation](https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages), which is very information dense. But not very readable.

## What does install.packages() do?

In order to understand what can go wrong, it is informative to understand
what is happening when everything works as it should.

Running `install.packages("package-name")` will access one or more repositories.

These repositories are where the packages live, and the most commonly used 
repository is CRAN, the Comprehensive R Archive Network, which is part of
the basic R-infrastructure. But other repositories exist, and we can specify
them either in general settings in R, or by specifying them in `install.packages` 
using the `repos` argument. 

In order to share the load, CRAN, and some other repositories, have "mirrors",
sites that have the same packages stored, but located in different countries.
The internet is fast, but it is quicker to download large amounts of data from
a location close to you, rather than on the other side of the globe.

From each repository, `install.packages` will retrieve a list, actually a 
matrix, of available packages. In the matrix there will be meta data on
dependencies (other packages the package need in order to work), licens,
etc.

It will then search for the name of the package you provided in `install.packages`,
check if you have the depencies installed, and download the package from
the specified location to your computer.

Packages comes in many forms, but a major difference is wether they are compiled
or not. It can come in "source code" - code that is basically text that we can 
read. Sometimes this is R-code, but often it is written in C or Fortran. Your 
computer is not able to run this directly. 

If the package comes compiled, your computer _can_ run it directly. And `install.packages`
will download a compiled version that matches your computer. Something compiled
for MacOS will not be able to run on a Windows computer and vice-versa.

If the package is not compiled, or a version for your operating system does
not exist, `install.packages` will initiate a compilation on your computer.

The package, either precompiled, or recently compiled will then be placed on
your computer. By default in the first entry in your `.libPaths()` variable.
We do not usually bother tinkering with that. 

You have now downloaded and installed a package in R.

But how can this go wrong, and what can we do to fix it?


## 1. You can't spell
Well, you probably can. But if you made a typo, install.packages will not
find the correct package name. Also, package names are case sensitive.
This is an annoying mistake to make, and in our experience surprisingly difficult
to locate.

2. You did not look in the right repository.
CRAN is default. But sometimes we need packages that lives in other
repositories.

``` r
setRepositories()
```
![](fig/setRepositories.png)

3. The package is not in the repositories you have selected:

``` r
ap <- available.packages()
```

This is a matrix of all the packages available. In our case 22308 of them.

Rather than viewing all of them, it is better to test:

``` r
"tidyverse" %in% ap
```

``` output
[1] TRUE
```
But remember point 1.

If you get ths message: 

`Warning: unable to access index for repository` 
This is probably due to the selected CRAN repo to be currently unavailable.
Run `chooseCRANmirror()` to chose another, and try again.

4. maybe it is not a package you want. 
But a dataset. 
A package is a standardized collection of material extending R, e.g. providing code, data, or documentation. A library is a place (directory) where R knows to find packages it can use

5. R is out of date.
The package you want might depend on a more recent version of R. Or another package.

Take a look at the list of available packages we got earlier:

``` r
ap["baguette", "Depends"]
```

``` output
[1] "parsnip (>= 1.0.0), R (>= 3.6)"
```
If `install.packages("baguette")` fails, begin ensuring that you have a version
for `parsnip` at least as new as 1.0.0, and a version of R at least as good as
3.6.

Depending on your setup, the easy way to update R is:

``` r
library(installr)
updateR()
```

6. the package might be out of date
For example it could be archived. I a package is no longer maintained, and do no
longer pass R CMD check tests, it will be archived. We can still access it:


``` r
library(remotes)
install_version("tidyverse", "1.2.3")
```

An archived package may still be found on github (or another version control system)


``` r
library(remotes)
install_github("vqv/ggbiplot")
```

9? A binary for your os may not exist

It might require additional software not available to CRAN. This is mostly
a problem for windows because CRAN have access to linux, and MacOS is at its root
a linux (ok bsd) distribution.

Some packages are not available as binaries at all.
You can try to locate a version in the CRAN (extras) repository.

If a package requires compiling on Windows you will need RTools (http://cran.r-project.org/bin/windows/Rtools/) or Xcode (https://stackoverflow.com/q/9329243/324364) on macos. On a "true" linux machine
most of what you need is already available.¨

You can now run:

``` r
install.packages("dplyr", type = "source")
```


If you need additional software, it will be mentinend under "NeedsCompilation"
on cran.r-project.org for the specific package.

8. The package is on GitHub. Or another location.

This requires the remotes package:

``` r
library(remotes)
install_github("vqv/ggbiplot")
```

Other similar services exist, like bitbucket (install_bitbucket) and gitoriuous (install_gitorious)


9. There is no source version of the package

A binary version may be available, but a source version is not. This can cause problems. or so
we're told. 
run `options(install.packages.check.source = "no")` 

10. The package is in a non-standard repository.
If the repository is reasonably compliant with CRAN, 
`install.packages("Rbbg", repos = "http://r.findata.org")`
will work. Otherwise you will have to read the documentation of the non-standard repo.

11. the repo is down or does not exist. 
you will typically get something like `Warning: unable to access index for repository` 
install.packages("quux", repos = "https://does.not.exist/CRAN")

In this case it fails because does.not.exist does not exist. 

12. The repo is blocking you
installing from github can cause problems, if a lot of people try to install
at the same time from the same location. Wait.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

