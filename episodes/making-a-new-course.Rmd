---
title: 'Make a new course'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do I make a new course-page based on this??

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to make a new lesson based on this template
- Provide a checklist for doing so

::::::::::::::::::::::::::::::::::::::::::::::::

This page is defined as a template-repo at GitHub. That means, that you
can easily initialize a new repository based on this page.

:::: spoiler
### How do you make a template-repo?

Go to the main page of the repo you want to make a template.

Click "settings", and, just under the box where you can change the 
repository name, you will find a tick-box called "Template repository". Tick it.

::::

Go to the [github-repo](https://github.com/KUBDatalab/R-toolbox), and click on 
the green button "Use this template". Choose "Create a new repository".

Giv the new repository a name. We prefer to let our R-courses begin with "R-".

Make sure the repository is placed under "KUBDatalab", if you want it to be part
of our eco-system. Otherwise, place it wherever you want.

Also make sure that the repository is "Public".

After GitHub have initialized the new repository based on this template, you
need to edit the "config.yaml" file. 

* title - selfexplanatory
* created - the date you did all this.
* source - change it to the url of the new github-repo. This makes it easier to edit the page in the future.
* episodes - remove all episodes not to be included in your new course. Change the order if necessary.

Either do this directly on GitHub, or follow the usual process of forking to
your own GitHub account, and cloning the repo to your computer.

:::: callout
## Consider deleting stuff

When the page is generated, the scripts identifies all libraries used in all
episodes. Even if these episodes will not be shown on the page. 

This requires the scripts to download and install all these libraries. And that
takes time! 

If you delete all unused episodes, you will speed up the following step considerably.

::::

After you have committed your changes to config.yaml, actions begins building 
the site. Have patience! The first build of the R-PUFF site took 54 minutes.

Don't worry, future changes are a lot faster. An update of the page you are 
currently reading, took 6 minutes. The scripts only rebuild the pages that are
changed.

You can follow the process under "Actions" on the repo.

When all actions have run - look for the green checkmarks, go to "Settings",
choose "Pages".

Under "Build and deployment", we are told that the page is "deployed from a branch",
and below that, you can choose which branch. Chose "gh-pages".

Click "Save". GitHub actions begins again, but do not worry, this step is very 
fast (depending on a lot of things, we are not paying GitHub, so we depend on
shared ressources).


:::: callout

## Changes are local

You have made a new repo based on the master-version of the toolbox. Any changes
made to R-toolbox, will _not_ affect your new page. 

Changes made on your new page are similarly not affecting R-toolbox.

::::



::::::::::::::::::::::::::::::::::::: keypoints 

- It is fairly easy to make a new course page
- Have patience!


::::::::::::::::::::::::::::::::::::::::::::::::

