# grattex
This is the repository containing the configuration files for reports in the style of the [Grattan Institute, Melbourne](https://grattan.edu.au/).

See https://github.com/grattan/grattex/blob/master/doc/grattexDocumentation.pdf for the documentation.

## Starting a new report
Staff starting a new report need to "clone the `grattex` repository on Github" (copy the report template) and "import the repository to edit in Overleaf" (open the template in Overleaf). This can be done using the following steps.

### [Once only]: Create your Github and Overleaf accounts
If **you do not have a Github account** that is connected to the Grattan organisation:

  * Create a Github account at [github.com](https://github.com) using your @grattaninstitute email address and a username that makes it easy to identify yourself (and remember). *[Skip if you already have a Github account]*
  * Ask Will to add you to the Grattan Github organisation.

If **you do not have an Overleaf account**:

  * Create an Overleaf account at [overleaf.com](https://overleaf.com) using your `@grattaninstitute` email address. 
  * Ask Will to add you to the Grattan Institute premium account.
  * Under 'Account Settings', ensure your account is linked to both Dropbox and Github.


### Part 1: Copy the template using Github
  1. Logged into your github account, go to `https://github.com/grattan/grattex`
  2. Click on `Use this template` (the green button on the top-right of the panel)
  3. Change the Owner to `grattan`. Give your new repository a name that will clearly identify the project now and in the future. A **good** example is `Energy-2018-stranded-assets`. A **bad** example is `health-report`.
  5. Select `Private`, and make sure the `Include all branches` is **unchecked**.
  6. Click `Create repository from template`. This will take a minute to copy.
  7. Once it has finished, you have successfully cloned the `grattex` repository (copied the report template). You can find it at `https://github.com/grattan/[your-repository-name]`. Now it's time to open and edit it in Overleaf.

### Part 2: Open the template in Overleaf
  8. Log into your account at at [overleaf.com](https://overleaf.com). 
  9. Click `New Project > Import from GitHub`.
  10. Locate the repository you just created, and click `Import to Overleaf`.
  11. Once imported the document will open and attempt to compile.
  12. At the top right, click `Share` and:
       + add collaborators via their email address. *Please add all the LaTeXnicians (Will, Owain and Ingrid)*, as well as the members of your team, plus Paul and Kat.
       + copy the `Anyone with this link can edit the project` link and paste it just under `\documentclass{grattan}` as a comment, *i.e.:*
    
```latex
    \documentclass{grattan}
    % Anyone with this link can edit the project:
    % https://www.overleaf.com/abcdefghi12345
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;so that your coauthors can also invite people to edit the document in your absence
    
  13. And that's it. You've now created a new report on Github and Overleaf. 

***
## Working with LaTeX
You can get a long way in Latex using Overleaf's 'Rich Text' editor. When you open an Overleaf project and select a file ending in `.tex` from the left sidebar, code will appear in the centre panel of the screen. At the top left of the code is a toggle button, allowing you to see the file as 'Source' code (which looks code-ish) or 'Rich Text' (which looks a bit more like Microsoft Word, including buttons you can click for section heading or bold text).

Now you can write almost as easily as you would in more user-friendly text editors like Word.

For anything more advanced (footnotes, referencing, tables, figures and other miscellaneous troubleshooting), there are three resources that might help.

  1. __*Using LaTeX in reports at Grattan*__ is a more-than-one-hundred page document that should contain the answer. It lives in the Grattan Dropbox under `Grattan Team > Templates > LaTeX > grattexDocumentation.pdf`. While super helpful and comprehensive, the document is very long -- the best strategy is to `ctrl+F` for whatever you need assistance with.
  2. The __latexShowcase__ project in Overleaf contains many examples of code that you might find useful, including how to use boxes and complex tables. Ask Will Mackey to invite you to this project if you didn't already receive the invite during your induction.
  3. Your colleagues have probably encountered any issues you might have. Breaking a Latex document can be unnerving and frustrating, but the fix usually takes only a few seconds. Ask around! __Will, James and Kate__ are the designated 'Latexnicians' as of November 2019, and are more than happy to help.

***
## Publishing a Grattan report: what to do in the final week
The purpose of using LaTeX is to improve the quality of our final publications. One of the main ways this happens is by running the document through a series of checks. Here's how it works:

  1. A week before publication, an associate will need to download the Overleaf project and run some R code (details below) that checks the project.
      + These checks will make sure we have all the punctuation, capital letters, cross-references and many, many other features that make a document clean and precise.
      + The bibliography will also be scoured, identifying duplicate entries and some other errors.
  2. The process is very stop-start. Each time R finds an error, it must be manually corrected for the process to continue. R will __not__ give you a list of errors to fix. The associate will fix the error in the offline version of the project that they downloaded, then run the check again.
  3. The rest of the team __must not__ be working on the Overleaf project when this process is carried out. That's because the final step is...
  4. ... the associate will copy their offline version of the project into the Dropbox folder where the online Overleaf project lives, replacing all duplicate files. That means any changes made to the Overleaf project will be overwritten.
  5. To release a report, there are a few additional steps (also outlined below).

### One week out
For associates, _once you've told your team that you're going to check the report_ (so that they stop editing it), the process of checking the document is as follows:

  1. Ensure that your computer has both R and RStudio installed. Details on how to do this [can be found here](https://grattan.github.io/R_at_Grattan/introduction-to-r.html). This guide will also explain how to run code in R.
  2. Install the `grattanReporter` package by running the following code:
  ```R
  install.packages('devtools') # Only if you don't already have the devtools package
  devtools::install_github('grattan/grattanReporter')
  library(grattanReporter)
  ```
  3. Download your project from Overleaf. Head to `https://www.overleaf.com/project`, find your project in the list, and click on the download button on the right side of the screen.
  4. Most likely, a `.zip` file will appear in your `Downloads` folder. Open the file (it will unzip into a folder).
  5. There are multiple ways of telling R where to look for files. You can start an R project, remember the path to your file, or set your 'working directory' to the folder you just downloaded. For now, we'll stick to the latter: `setwd('/Users/myusername/Downloads/MyUnzippedOverleafProject')`. On a PC, your path may look different.
  6. Now you can start running checks. The command is `checkGrattanReport()`. This will kick off a series of tests and will run until it encounters an error. The checks include:
      + The report's authors match the recommended citation
      + Dashes are used correctly
      + Quote marks are used correctly
      + Footnotes end in full stops
      + Sentences ending in a capital letter (_e.g._ I went to the USA.) include `\@.` in LaTeX (_i.e._ `I went to the USA\@.`)
      + There aren't any obviously missing parentheses
      + The bibliography looks healthy and doesn't contain obvious duplicates
      + There aren't obvious typos -- words that fail the spellcheck can be added to a custom dictionary in `Report.tex`
      + Figures, tables and boxes have labels
      + All figures and tables have a cross-reference in the text (this can be manually overwritten by including the following command on a new line after the dictionary: `% may_be_left_unreferenced: fig:label_of_thing_i_dont_want_referenced`)
  7. Expect to get an error. This means that `checkGrattanReport()` has found something for you to fix. It should say what the error is, the file where it occurred, the line where it happened, and possibly even what you should do to fix it. In the folder you downloaded, make the necessary change, save it, and run the check again. If you're not sure how to resolve an error, consult `grattexDocumentation.pdf` or chat to a Latexnician.
  8. Repeat until there's no further issues. Then run `checkGrattanReport(compile = TRUE)` until there are no further issues (this performs some additional checks, like making sure your references aren't broken/missing).
  9. Copy the contents of the downloaded folder into the Overleaf project folder in Dropbox (assuming you've linked Overleaf and Dropbox; if not, see a Latexnician). Replace all of the duplicated files.
  10. Wait a minute, open Overleaf, compile the document and check that everything looks as it should. If not, now is the perfect time to seek out a Latexnician.
  
### To release a report
Releasing a report involves adding the front cover, updating the logos/affiliates on page 2, adding the ISBN and report number, and running the report through `checkGrattanReport` again -- but this time with some extra checks.

  1. To add the front cover, ensure that there is a folder in the Overleaf project called `FrontPage`, which must contain the front cover as a PDF with the name `FrontPage.pdf`. In `Report.tex`, change the first line of code from `\documentclass[embargoed]{grattan}` to  `\documentclass[FrontPage]{grattan}`.
  2. Check with Central Services what ISBN and report number your report should have. Replace whatever ISBN/report number is currently in `Report.tex` with the correct one.
  3. Now download your Overleaf project again -- just as you did one week ago, it's time to run `checkGrattanReport()`, ensuring that your team is not trying to make any final changes to the document.
  4. This time, however, we're going to add some extra arguments to `checkGrattanReport()`. These extra arguments will check that `\CenturyFootnote` is used correctly (see `grattexDocumentation.pdf`), and will build the final PDF for us. 
  ```R
  # To update affiliates/logos, you need to update the 'classfile'. Here's how:
  checkGrattanReport(update_grattan.cls = TRUE)
  
  # Final release checks are included with the following argument
  checkGrattanReport(compile = TRUE, pre_release = TRUE)
  
  # And a publication-ready pdf will be built with the following:
  checkGrattanReport(compile = TRUE, pre_release = TRUE, release = TRUE)
  ```
  5. A new folder will be created called `RELEASE`, and inside will be a PDF of your report. This is what you will send to Central Services so that they can upload it to the Grattan website in time for its 9pm publication.
  6. Copy the offline files back into the Overleaf folder on Dropbox to update them.
  7. Breathe a small sigh of relief. It's almost over! But inevitably, on a final read-through, you or a team member will pick up on something you need changed (hopefully just typographical at this stage). If so, you'll need to make the change and repeat this process, sending a new, updated PDF to Central Services in time for release.

And if something goes badly wrong -- you can't get `checkGrattanReport()` to make you a PDF, and no Latexnician is available -- rest assured that you can always use the PDF that Overleaf compiles as a workaround. However, it may not have the updated affiliates, and there's a greater risk of bugs in the document if it hasn't passed `checkGrattanReport()`. But at least you'll have a usable document, and you can talk to a Latexnician on Monday to fix anything outstanding.

***
## Changelog

### 2018-09-07
* Penalties for hyphenation increased

### 2018-02-26
* Fix issue #102 which manifested on TeX Live distributions (like Travis-CI) where `Ibid. (<page ref>)`
  resulted in the `p` being uppercase (PR #114). Thanks to JD for filing.

### 2017-09-01
* Increase hyphenation penalties. Closes #85

### 2017-08-22
* Add `\note(s)withsource(s)` permutations. Closes #81

### 2017-08-20
* Add `centredsmallbox`.

### 2017-08-18 v1.3.0
* Enable the detection of page-straddling cross-references via additional entries in `.log`

### 2017-07-18
* Appendix chapter titles are named 'Appendix A' etc.

### 2017-01-17
* New option 'submission'.

### 2017-01-06
* Add `\Chapref` and friends for neater hyperlinks to chapters
* Add `\ie` `\eg` `\etc` macros.

### 2016-12-19
* Allow long URLs in bibliography, line-breaking at width #36
* Box footnotes are now non-italic #43
* New command, `\doublecolumnfigure` now used #46
* Documentation moved to `./doc/`

### 2016-11-19

New features:
* New option `embargoed` enables a command `\EmbargoDate` which prints an Embargo mark on the title page and in the headers #32

* Patched bug in `cleveref` where `varioref`'s phrase ``on the previous page'' is never used. #39
* `[t]` floats have captions aligned with the baseline. 076df622e7fec025382b804e1b809319aef2fe11
* KOMA-warnings' advice about `footheight`, `headheight` etc has been accepted. #40
* Glue component of space between footnote area and text has been reduced to 14pt (which is closer to the current leading). aec03a693b0aad85daa03ceef16316ef855b5b4a
* Manual specification of `\textfloatsep` has now been dropped in favour of the default
* Allow citations in acknowledgements #37
