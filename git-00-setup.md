---
title: 'Setup for Git'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- What software is needed?
- Do I have a GitHub account?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Install git and other needed software
- Connect RStudio to GitHub

::::::::::::::::::::::::::::::::::::::::::::::::

## RStudio

We are going to assume that you already have an installation of R and RStudio
on your computer. Otherwise, follow the [instructions on the main setup page](setup.md)

::::instructor
Bruges disse sider til et separat git(hub) kursus, kan setup instrukserne med
fordel samles i en side.
::::


## Create a GitHub account

Visit [github.com](https://github.com/) if you do not already have a 
GitHub account. It is relatively straight forward, but if you encounter any problems,
GitHub provides a [detailed page with further instructions](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github) about creating an 
account

If you already have a GitHub account, please verify that you can sign in, and take note of the email(s) associated with the account.

We highly recommend that you set up two-factor-authentification for your GitHub 
account, use a secure password, and a password manager.


## Git
You must have Git installed on your local computer. Typically, Mac and Linux 
computers come pre-installed with git, while Windows users must install 
[GitBash (Git for Windows)](https://gitforwindows.org/). 
Before doing that, you should check if Git is already installed on your computer:

* Open RStudio, and in the console panel, click "Terminal".
* Type `git version` and enter.

If you get an error message stating that git is an unknown command, you will 
need to install git. GitHub provides a [detailed guide on how to install git](https://github.com/git-guides/install-git)
on (almost) any operating system. You may have to restart RStudio after installing
Git.

## Connect RStudio to GitHub

Getting RStudio to communicate with Git and GitHub can be tricky. Fortunately it is 
tricky for everyone, and kind people have made an R package that makes it easier:


``` r
install.packages("usethis")
library(usethis)
```

Begin by introducing yourself to Git. Go to the terminal ![](../fig/the-rstudio-terminal.png)

and run these three commands:


``` bash
git config --global user.name "Jane Doe"
git config --global user.email "jane@example.com"
git config --global --list
```

Remember to change the username and email. It is highly recommended that you
use the same email as the one that is associated with your GitHub account. 

## Personal Access Tokens for GitHub

When we interact with the GitHub server, it is nessecary to authenticate ourselves.
Before GitHub allow us to make changes (we'll get to that later), they would like
to make sure that we are actually allowed to do that. 

Several ways of doing this exists. Hardcore programmers will probably tell you
to set up SSH-keys, but Personal Access Tokens (PATs) are simpler and just as
good. You can think of a PAT as a password for communicating with GitHub.

Go to the console panel and run this line of code:


``` r
usethis::create_github_token()
```

This will open a browser, where you will be asked to login to GitHub. Do that,
and an form for creating a new PAT will open. Write a note in the "Note" field
to describe what you are using this token or password for. 

You also have to chose an expiration date. It is tempting to set "No expiration"
but we recommend that you chose 30 days. Not only will this protect your 
GitHub account in case of theft, but it will also force you to repeat this proces
regularly. That might be annoying, but it will help you to remember how to do it.

Everything else is preselected, and if you need to change anything here, you are
probably so knowledgeable about Git that you do not need this course.

Click "Generate token", and copy the token:
![](../fig/github-token.png)


Now run this line of code in R to set your github credentials:


``` r
gitcreds::gitcreds_set()
```

It will present you with your current credentials if you have any, and ask
you what you would like to do:

![](../fig/gitcreds-set.png)

Enter the number corresponding to "Replace these credentials",
and paste in the PAT you copied from GitHub.

Congratulations, Rstudio now nows how to communicate with GitHub, and GitHub
knows how to make sure you are who you claim to be.

::::::::::::::::::::::::::::::::::::: keypoints 

- RStudio, Git and a GitHub account are needed for this lesson

::::::::::::::::::::::::::::::::::::::::::::::::

*This episode is partially adapted from "[Intro to Git & GitHub (Speedrun edition)](https://jennajordan.me/git-novice-speedrun)", by Jenna Jordan.*
