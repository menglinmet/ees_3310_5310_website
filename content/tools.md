---
title: Tools
---

# Software Tools for the Lab

## Menu {#menu}

* [Web-based tools](#web-tools "Web-Based tools")
* [Installing tools](#installing "Tools to install on your computer")
    * [Installing {{< R_LOGO >}}](#installing-r "Installing R")
    * [Installing {{< GIT_LOGO >}}](#installing-git "Installing git")
       * [Configuring {{< GIT_LOGO >}}](#configuring-git "Configuring git")
       * [Getting a GitHUB {{< GITHUB_LOGO >}} account](#github-account "Getting an account on GitHub")
    * [Installing {{< RSTUDIO_LOGO >}}](#installing-rstudio "Installing RStudio")
* [Optional tools](#optional-tools "Optional tools you may want to install")
    * [Installing the tinytex package](#installing-latex "Installing the tinytex package for making PDFs from RMarkdown")
    * [Installing {{< GIT_AHEAD >}}](#installing-gitahead "Installing the GitAhead graphical interface for git")
* [Resources for learning more](#resources "Free online reading and videos about using R, RStudio, Git, etc.")
    * [{{< R_LOGO >}} and {{< RSTUDIO_LOGO >}}](#r-resources "Learning more about R and RStudio")
    * [{{< GIT_LOGO >}} and GitHUB {{< GITHUB_LOGO >}}](#git-resources "Learning more about git")


## Web-Based Tools for Lab {#web-tools}

* [Kaya Tool for Calculating Decarbonization](https://ees3310.jgilligan.org/decarbonization/ "Explore the economics and technical challenges of decarbonizing individual nations, regions, or the entire world.")
* [Worksheet for Emissions-Trading Lab](https://ees3310.jgilligan.org/emissions_trading/ "Worksheet for the lab exercise role-playing emissions regulation, carbon taxes, and tradeable permits")

## Installing Tools {#installing}

### Installing {{< R_LOGO >}} {#installing-r}

* Download R from [https://cran.rstudio.com/](https://cran.rstudio.com/)
    * **Windows:** 
        * Download and install the ["base distribution" of R 4.0.3](https://cran.rstudio.com/bin/windows/base/).
    * **MacOS:**
        * Download and install [R version 4.0.3](https://cran.rstudio.com/bin/macosx/)
    * **Linux:**
        * You should be able to install R from your Linux distribution's package manager:
            * `sudo apt-get install r-base r-base-dev` for Debian or Ubuntu
            * `sudo yum install R` or `sudo dnf install git` for Fedora, 
              Red Hat, and related distributions.

### Installing {{<GIT_LOGO>}} {#installing-git}

If you have a Mac or Linux you may already have git installed. Test it by 
opening up a terminal window and typing `which git`. If you get a response
like `/usr/bin/git` then it's installed. If there is no response, then you
need to install git.
  
* **Windows:**
    * Download and install git from [https://git-scm.com](https://git-scm.com)
        * Choose the default options for the installer.
    * Optionally, you might want to also install Tortoise Git, which integrates
      git into the Windows explorer, so you can execute git commands from the 
      context menu when you right-click on files or directories in the explorer.
      You can download Tortoise Git from [https://tortoisegit.org/](https://tortoisegit.org/)
* **MacOS:**
    * If git is not already installed on your computer, you can download and
      install it from [https://git-scm.com](https://git-scm.com)
* **Linux:**
    * If git is not already installed, you can install it from your 
      distribution's package manager:
            * `sudo apt-get install git` for Debian or Ubuntu
            * `sudo yum install git` or `sudo dnf install git` for Fedora, 
              Red Hat, and related distributions.

#### Introducing Youself to {{< GIT_LOGO >}} {#configuring-git}
              
**_Whichever operating system you're using,_** after you install git you will 
need to introduce yourself to git (you only need to do this once).
It is important for git to knows your name and email address so it can 
keep track of who is editing files when you are working collaboratively and
so it gives you credit for the files you have authored and edited.
  
1. Open a terminal prompt:
   * On Windows, open a "git bash" window (git will give you the option to 
     do this when it finishes installing) or you can do so from the Windows 
     Start menu, under "Git".
   * On MacOS or Linux, open a regular terminal window (on MacOS, you can
     find the terminal in the "applications" with Finder)
2. Type the following at the terminal prompt:

     ```
     git config --global user.name "Your Name"
     git config --global user.email your.name@vanderbilt.edu
     ```
     
     using your real name and email.
       
You only need to introduce yourself to git one time after you install it.
Then it will remember who you are every time you use it.

#### Getting an account on GitHUB {{< GITHUB_LOGO >}} {#github-account}

* Go to [https://github.com](https://github.com "GitHub") and register for a free account
* After you have set up your account, go to 
  [https://education.github.com/students](https://education.github.com/students "GitHub Student Accounts") 
  and register your account for the free extras you can get as a student.
* Send an email to Prof. Gilligan and {{< TA_FORMAL_NAME >}} to let us know 
  your GitHUB account name.
  You can send the email from 
  {{< mailto-prof-and-ta subj="EES 3310/5310 GitHub account" >}}this link{{< /mailto-prof-and-ta >}}



### Installing {{< RSTUDIO_LOGO >}} {#installing-rstudio}

* Go to the download page for the free desktop edition of {{< RSTUDIO >}} at 
  [https://www.rstudio.com/products/rstudio/download/#download](https://www.rstudio.com/products/rstudio/download/#download "Download RStudio") and
  download the installer for your operating system. Windows, MacOS, 
  and the Debian, Ubuntu, Fedora, RedHat, and openSUSE editions of
  Linux are all supported.
  
    There are other versions of {{< RSTUDIO >}} (an expensive professional edition and a server edition). You
    want the **free desktop edition**.
    Be sure you get versoin 1.4 (the latest version, as of January 2021).
    Version 1.4 has important new features that previous versions did not have.
* Run the installer. 
* After the installer finishes running, run {{< RSTUDIO >}}.
    * When {{< RSTUDIO >}} starts up, the lower left part of the screen should have
      a window that displays the R version, saying something like this:
      
      ```
      R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out"
      Copyright (C) 2020 The R Foundation for Statistical Computing
      Platform: x86_64-w64-mingw32/x64 (64-bit)
      
      R is free software and comes with ABSOLUTELY NO WARRANTY.
      You are welcome to redistribute it under certain conditions.
      Type 'license()' or 'licence()' for distribution details.
      
        Natural language support but running in an English locale
      
      R is a collaborative project with many contributors.
      Type 'contributors()' for more information and
      'citation()' on how to cite R or R packages in publications.
      
      Type 'demo()' for some demos, 'help()' for on-line help, or
      'help.start()' for an HTML browser interface to help.
      Type 'q()' to quit R.
      ```
      The details will be different depending on your operating system, but
      if you see something like this, {{< RSTUDIO >}} correctly found R on your 
      computer.
    * Open the "Tools" menu,   and click on the "Global Options" choice.
        * Go to the "Git/SVN" tab and click "enable version control interface 
          for {{< RSTUDIO >}} projects". If {{< RSTUDIO >}} can find the git program on your
          computer, it will appear in the "git executable" field. If {{< RSTUDIO >}}
          can't find it, you can help it by browsing to the git program.
        * If you have installed {{< LATEX_LOGO >}} on your computer (remember that this is
          optional), click on the SWeave tab, and select "knitr" for weaving
          `.Rnw` files, and choose `pdfLaTeX` for typesetting {{< LATEX_LOGO >}} files into
          PDF.

## Optional Tools: {#optional-tools}
  
### Installing the tinytex package {#installing-latex}

**It is optional to install the `tinytex` package.** 
You will be able to do all the work for the labs without it, but if you do 
install it, it will give you the option to produce nicely formatted PDF 
output from your RMarkdown files (for lab reports, presentations, etc.).

The R `tinytex` package installs a sophisticated typesetting system 
called {{< LATEX >}} on your computer. RMarkdown uses this system to 
generate PDF output.

The `tinytex` package needs to download a lot of files from the internet, 
and it can take 10 minutes or more to do so, even on a fast connection.
So it's a good idea to wait until you can let your computer run for a while,
and until you're connected to a good fast internet connection, preferably
one that doesn't charge you for data.

To install `tinytex`, go to the {{< RSTUDIO >}} console, and
you type the following:
  
```
install.packages('tinytex')
tinytex::install_tinytex()
```

If you want to uninstall `tinytex` later, you can just type this
command at the {{< RSTUDIO >}} console:

```
tinytex::uninstall_tinytex()`
```

### Installing {{< GIT_AHEAD >}} {#installing-gitahead}

**It is optional to install GitAhead.** You will be able to do everything you
need for the lab using regular {{< GIT_LOGO >}} and {{< RSTUDIO >}}, but
you may find it useful to install the {{< GIT_AHEAD >}} software on your 
computer. {{< GIT_AHEAD >}} is a free graphical interface that works with 
{{< GIT >}} and allows you to do almost everything you might want to do
using a simple point-and-click interface.

{{< GIT_AHEAD >}} can also make it easier to understand what {{< GIT >}} is 
doing and when you need to commit files and push your commits to 
{{< GITHUB >}} {{< GITHUB_LOGO >}}.

{{< GIT_AHEAD >}} is available for Windows, MacOS, and Linux, and you can 
get it from <https://gitahead.github.io/gitahead.com/>.


## Resources for Learning More {#resources}

### {{< R_LOGO >}} and {{< RSTUDIO_LOGO >}} Resources {#r-resources}

* Our principal resource will be the book, 
  _[R for Data Science](https://r4ds.had.co.nz/ "Read R for Data Science online")_. 
  You can buy
  a printed copy or use the free web version at 
  [https://r4ds.had.co.nz](https://r4ds.had.co.nz/ "Read R for Data Science online")
* {{< RSTUDIO >}} also has very useful "Cheat Sheets" that you can access from the
  help menu. These are two-page PDF files that explain the basics of things
  you may want to do with R:
  * Manipulating tibbles and data frames with 
    [`dplyr`](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf "Cheatsheet on data transformation with dplyr")
  * Visualizing data (making graphs and charts) with 
    [`ggplot2`](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf "Cheatsheet on data visualization with ggplot2")
  * Reading data from files and organizing it into tidy tibbles using 
    [`readr` and `tidyr`](https://github.com/rstudio/cheatsheets/raw/master/data-import.pdf "Cheatsheet on importing and organizing data with readr and tidyr")
  * Manipulating lists and vectors with 
    [`purrr`](https://github.com/rstudio/cheatsheets/raw/master/purrr.pdf "Cheatsheet on manipulating lists and vectors with purrr")
  * Using 
    [RMarkdown](https://github.com/rstudio/cheatsheets/raw/master/rmarkdown-2.0.pdf "Cheatsheet on the basics of RMarkdown")
  * There is also a cheatsheet for the 
    [{{< RSTUDIO >}} IDE](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf "Cheatsheet on working with RStudio") 
    (Integrated Development Environment), which explains how to do things with 
    {{< RSTUDIO >}}, with a list of keyboard shortcuts for many common tasks.
  * There are several additional cheatsheets that aren't listed on the 
    Help menu, but you can see them if you click on 
    "[Browse Cheatsheets...](https://www.rstudio.com/resources/cheatsheets/ "Browse cheat sheets for common R packages")"
    at the bottom of the Cheatsheet menu or visit 
    [https://www.rstudio.com/resources/cheatsheets/](https://www.rstudio.com/resources/cheatsheets/ "Get cheatsheets for common R packages")
* The {{< RSTUDIO_LOGO >}} team also has a large selection of free
    [video tutorials and webinars](https://resources.rstudio.com/webinars "Watch webinars and presentations about using R and RStudio")
    about using R and {{< RSTUDIO >}}. These range from 
    [basics of R and RStudio for beginners](https://resources.rstudio.com/wistia-rstudio-essentials-2/rstudioessentialsprogrammingpart1-2 "Video tutorials on the basics of using R and RStudio") 
    and 
    [simple introductions to the basics of data science with R](https://resources.rstudio.com/the-essentials-of-data-science/the-grammar-and-graphics-of-data-science-58-51 "Video tutorials on the basics of data science with R and RStudio")
    to very advanced topics about specialized topics.

### {{< GIT_LOGO >}} and GitHUB {{< GITHUB_LOGO >}} Resources {#git-resources}

* There is a lot of free documentation about git at the 
  [git-scm](https://git-scm.com "Download git for your computer") website, including a full 
  [Git reference manual](https://git-scm.com/docs "Read about git") and
  a free online book, 
  _[Pro Git](https://git-scm.com/book "Read the Pro Git book online")_
* Professor Jenny Bryan at the University of British
  Columbia, has written a lot of helpful tutorial material specifically about
  using git and {{< GITHUB >}} with {{< RSTUDIO >}} at 
  [Happy Git and {{< GITHUB >}} for the useR](http://happygitwithr.com/ "Learn about using Git and GitHub with R and RStudio").
  
    Professor Bryan has also posted a detailed 
    [video tutorial](https://resources.rstudio.com/wistia-rstudio-conf-2017/happy-git-and-gihub-for-the-user-tutorial-jenny-bryan "Watch the video tutorial on using Git and GitHub with R and RStudio")
    at the 
    [{{< RSTUDIO >}} Webinars and Videos page](https://resources.rstudio.com/webinars "Watch more webinars and presentations about using R and RStudio"). 
    This tutorial walks you through all the steps of setting up git with {{< RSTUDIO >}}
    and how to use it to keep track of your edits and revisions, and synchronize
    your work with {{< GITHUB >}} (this serves three functions: backing up your data to 
    the cloud, sharing your data with other people, and collaborating on writing
    code or documents with other people).
