---
title: 'R på ucloud'
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


All students at UCPH have access to a High Performance Computing (HPC) facility;
ucloud. It can be acessed at cloud.sdu.dk using the normal UCPH login and 
password.


Depending on the user allowances, it will look something like this.

![](fig/ucloud_front.png)

Ucloud provides access to a multitude of different applications organized in the
application store:

![](fig/ucloud_store.png)

Amongst the more popular picks from the store is RStudio:


![](fig/ucloud_picks.png)

This allow us to start a session of RStudio, accessible in the browser. 


![](fig/ucloud_rstudio.png)


Note that we can chose different machine types. Parallel processing is not 
the solution to every problem, but sometimes it is, and here we get access to a
_lot_ of cores.


## This is not a computer as such

What we can start is not a computer. It is a virtual machine. If we need to
save our results, we need to save them to files, on our user drive.

If we do not save the results, or for that matter the scripts we write,
all is lost when the virtual machine closes. Either because we close it,
or because the time ran out.

Another issue brought up by this, is that whenever we install a library,
we install it in the virtual machine. Those installed libraries also
dissappear when the machine closes.

One way to get around that is to run the virtual machine indefinitely. That is
expensive. Another is to have a prepared script we can every time we
start a new session.

Below you will find one such, rather complex, script setting up the 
machine for running Keras (a module for advanced machine learning), using
tensorflow. It can be downloaded here INDSÆT LINK.


``` r
# Run shell commands from R
system2("sudo", args = c("add-apt-repository", "-y", "ppa:deadsnakes/ppa"))
system2("sudo", args = c("apt-get", "update"))
system2("sudo", args = c("apt-get", "install", "-y", "python3.9", "python3.9-venv", "python3.9-dev"))

# Python setup
system2("python3.9", args = c("-m", "ensurepip", "--upgrade"))
system2("python3.9", args = c("-m", "pip", "install", "--upgrade", "pip"))
system2("python3.9", args = c("-m", "pip", "install", "numpy"))

# Create and activate environment
system2("python3.9", args = c("-m", "venv", "~/r-tensorflow"))

# Activate virtual environment and install packages
system2("bash", args = c("-c", "source ~/r-tensorflow/bin/activate && pip install numpy tensorflow keras spacy && python -m spacy download en_core_web_sm && deactivate"))

# R packages and setup
Sys.unsetenv('RETICULATE_PYTHON')
library(reticulate)
use_virtualenv('~/r-tensorflow', required = TRUE)

install.packages('remotes')
remotes::install_github('rstudio/tensorflow', upgrade = 'always')
library(tensorflow)
install_tensorflow(envname = '~/r-tensorflow', restart_session = FALSE)

remotes::install_github('rstudio/keras')
library(keras3)
install_keras(envname = '~/r-tensorflow')
```

One downside to this, is that this takes quite some time, and will have to
be repeated _every_ single time we start the virtual machine.

## Another approach

Data analysis is not worth much, if we are not able to reproduce our results.
A significant amount of work have therefore gone into providing infrastructure
for exactly that. One issue is the question of which libraries are used for
the analysis.

Enter `renv`. `renv` is a library that establishes scaffolding for installing
libraries in a specific location in an R-project, making it self contained and
easy to distribute. Normally we would distribute a "lock file" that describes 
exactly which versions of which packages are used in a project. 

And project is an important word here. This works best if we are working in an
R-project. So begin by making a project.

Give it a name, make sure it is saved somewhere easy to find in your files.
And tick the box about renv!

You will see a lot of stuff in the "files" tab. A folder called "renv", a file
"renv.lock", and probably a file ".Rprofile".

Looking into that, we will find a line of code "source("renv/activate.R")"

When ever we start the project, what ever we have written to 
.Rprofile will be run. What will be run in this case is the script "activate.R"
which does a lot of interesting stuff. The important thing is, that 
the renv-library is started. And whenever we now install a package, it 
will be installed in the renv folder. Do not delve too deep into that, leave it
to the machine.

One issue with this is, that there are still installed packages weird places 
on the machine. Caches of the packages are stored outside our project. The idea
is that other projects might use these cached packages, and cut down on install
time. 

In our case, that is not helpful. This cache will disappear when the virtual
machine is stopped.

In order to handle this, we can specify where the cache should be stored.
We can do that manually. Or, and this is the preffered solution, make a file
.Renviron where we specify where renv should place the cache. Having done that
we need to restart R, and now we can install packages to our hearts delight,
and renv will place both the libraries and the cache in our local project.

An example of a script that sets the environemt file, and installs a selection
of usefull pacakges can be found below. Note that this takes a very long time.
The alternative to this taking a very long time once, is for it to take a very
long time every time we open our project. 


``` r
# write environment variable to file
writeLines('RENV_PATHS_CACHE = "renv/cache"', ".Renviron")
# restart R in order to set the environment variable
.rs.restart()
library(renv)
# install useful packages
# install.packages() works just as well as install() which comes from
# the renv package. But it is slightly shorter to type.
install("tidyverse")
install("reticulate")
install("devtools")
```

Note that this will need to be done for every project you initialize. 
Also note - this takes a looong time...


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

