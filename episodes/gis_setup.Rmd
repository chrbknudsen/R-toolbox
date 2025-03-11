---
title: "Setup for GIS"
teaching: 42
exercises: 42
---

::: questions
-   How do I get ready for working with geospatial data in R?
:::

::: objectives
-   Get your R-environment prepared for working with geospatial data
:::


This workshop is designed to be run on your local machine. First, you will need 
to download the data we use in the workshop. Then, you need to set up your 
machine to analyse and process geospatial data. We provide instructions below 
to install all components manually.

## Data

For a full description of the data used in this workshop see the [data page](learners/data.md).

Note that the page includes a lot of other datasets, not just GIS-related.

## Local Installation

### Software

| Software | Install | Manual | Available for | Description |
|-------------|-------------|-------------|-------------|-------------------|
| [R](https://www.r-project.org) | [Link](https://cloud.r-project.org) | [Link](https://cloud.r-project.org) | Linux, MacOS | Software environment for statistical and scientific computing |
| [RStudio](https://www.rstudio.com) | [Link](https://www.rstudio.com/products/rstudio/download/#download) |  | Linux, MacOS | GUI for R |

We provide quick instructions below for installing the various software needed for this workshop. At points, they assume familiarity with the command line and with installation in general. As there are different operating systems and many different versions of operating systems and environments, these may not work on your computer. If an installation doesn't work for you, please refer to the installation instructions for that software listed in the table above.


::: group-tab

### Windows

To install the geospatial libraries, install the latest version [RTools](https://cran.r-project.org/bin/windows/Rtools/)

### macOS - one-click

The simplest way to install these geospatial libraries is to install the latest version of [Kyng Chaos's pre-built package](https://www.kyngchaos.com/software/frameworks) for GDAL Complete. Be aware that several other libraries are also installed, including the UnixImageIO, SQLite3, and `NumPy`.

After downloading the package in the link above, you will need to double-click the cardbord box icon to complete the installation. Depending on your security settings, you may get an error message about "unidentified developers". You can enable the installation by following [these instructions](https://kb.wisc.edu/page.php?id=25443) for installing programs from unidentified developers.

### macOS - 3 commands

Alternatively, participants who are comfortable with the command line can install the geospatial libraries individually using [homebrew](https://brew.sh):

``` bash
$ brew install proj
$ brew install geos
$ brew install gdal
```

### Linux

Steps for installing the geospatial libraries will vary based on which form of Linux you are using. These instructions are adapted from the [`sf` package's `README`](https://github.com/r-spatial/sf).

For **Ubuntu**:

``` bash
$ sudo add-apt-repository ppa:ubuntugis
$ sudo apt-get update
$ sudo apt-get install libgdal-dev libgeos-dev libproj-dev
```

For **Fedora**:

``` bash
$ sudo dnf install gdal-devel proj-devel geos-devel
```

For **Arch**:

``` bash
$ pacman -S gdal proj geos
```

For **Debian**: The [rocker geospatial](https://github.com/rocker-org/geospatial) Dockerfiles may be helpful. Ubuntu Dockerfiles are found [here](https://github.com/r-spatial/sf/tree/master/inst/docker). These may be helpful to get an idea of the commands needed to install the necessary dependencies.

:::







### UDUNITS

Linux users will have to install UDUNITS separately. Like the geospatial libraries discussed above, this is a dependency for the `R` package `sf`. Due to conflicts, it does not install properly on Linux machines when installed as part of the `sf` installation process. It is therefore necessary to install it using the command line ahead of time.

::: spoiler
## Linux

Steps for installing the geospatial will vary based on which form of Linux you are using. These instructions are adapted from the [`sf` package's `README`](https://github.com/r-spatial/sf).

For **Ubuntu**:

``` bash
$ sudo apt-get install libudunits2-dev
```

For **Fedora**:

``` bash
$ sudo dnf install udunits2-devel
```

For **Arch**:

``` bash
$ pacaur/yaourt/whatever -S udunits
```

For **Debian**:

``` bash
$ sudo apt-get install -y libudunits2-dev
```
:::


### R Packages

The following `R` packages are used in the various geospatial lessons. If you
have taken other of our cources, you probably have a number of them installed
already.

-   [`dplyr`](https://cran.r-project.org/package=dplyr)
-   [`ggplot2`](https://cran.r-project.org/package=ggplot2)
-   [`raster`](https://cran.r-project.org/package=raster)
-   [`rasterVis`](https://cran.r-project.org/package=rasterVis)
-   [`RColorBrewer`](https://CRAN.R-project.org/package=RColorBrewer)
-   [`remotes`](https://cran.r-project.org/package=remotes)
-   [`reshape`](https://CRAN.R-project.org/package=reshape)
-   [`scales`](https://cran.r-project.org/package=scales)
-   [`sf`](https://cran.r-project.org/package=sf)
-   [`terra`](https://cran.r-project.org/package=terra)
-   [`tidyr`](https://CRAN.R-project.org/package=tidyr)
-   [`maps`](https://CRAN.R-project.org/package=maps)

To install these packages in RStudio, copy the following into the console and hit enter.

``` r
install.packages(c("dplyr", "ggplot2", "raster", "rasterVis", "RColorBrewer", "remotes", "reshape", "scales", "sf", "terra", "tidyr", "maps"))
```

You should see a status message starting with:

``` output
trying URL 'https://cran.rstudio.com/bin/macosx/el-capitan/contrib/3.5/dplyr_0.7.6.tgz'
Content type 'application/x-gzip' length 5686536 bytes (5.4 MB)
==================================================
downloaded 5.4 MB

trying URL 'https://cran.rstudio.com/bin/macosx/el-capitan/contrib/3.5/ggplot2_3.0.0.tgz'
Content type 'application/x-gzip' length 3577658 bytes (3.4 MB)
==================================================
downloaded 3.4 MB
```

When the installation is complete, you will see a status message like:

``` output
The downloaded binary packages are in
/var/folders/7g/r8_n81y534z0vy5hxc6dx1t00000gn/T//RtmpJECKXM/downloaded_packages
```

You are now ready for the workshop!


::: keypoints
-   Working with geospatial data requires additional software
:::
