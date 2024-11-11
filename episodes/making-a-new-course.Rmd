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

## How to make a new course-page based on this toolbox

This page is defined as a template-repo at GitHub. That means, that you
can easily initialize a new repository based on this page.

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
currently reading, took 6 minutes. The scripts only rebuild 
Hvis du fremadrettet laver tilretninger i kurset, går det noget hurtigere. Systemet
genbygger kun de sider hvor der sker ændringer.

Gå herefter til "Settings" og "Pages". Under "Build and deployment", står der 
under "Source", at siden der skal vises skal tages fra en bestemt "branch".

lige under, kan du vælge hvilken. Når Actions er færdige, vælger du her "gh-pages",
og klikker på save.

Nu går GitHub actions igang igen. Dont worry - this step is quite fast!

:::: callout

## Med fordel!

Kan du slette de dokumenter under episodes som du ikke bruger. De indeholder
store mængder kode der trækker på alskens biblioteker. Alle disse biblioteker
skal installeres i GitHub processen for at siden kan genereres. Og det 
tager tid.

::::

Når GitHub actions er færdig, har du siden, og repoet kan forkes, og hentes ned
på din computer, så du kan lave evt. rettelser og tilpasninger.

Husk! Sker der rettelser i master-udgaven, altså R-toolbox, så slår de ikke 
igennem på den nye side. Og omvendt. 

Vi kunne formentlig godt lave et eller andet der automatisk opdaterede stavefejl.
Men så ville dine tilpasninger af det nye kursus også forsvinde.




::::::::::::::::::::::::::::::::::::: keypoints 

- Det er ret let at lave en ny side
- Men det kræver tålmodighed!


::::::::::::::::::::::::::::::::::::::::::::::::

