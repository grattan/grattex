[![Travis-CI Build Status](https://travis-ci.org/HughParsonage/grattex.svg?branch=master)](https://travis-ci.org/HughParsonage/grattex)

# grattex
This is the repository containing the configuration files for reports in the style of the [Grattan Institute, Melbourne](https://grattan.edu.au/).

See https://github.com/HughParsonage/grattex/blob/master/doc/grattexDocumentation.pdf for the documentation.

## Starting a new report
Staff starting a new report need to "clone the `grattex` repository on Github" (copy the report template) and "import the repository to edit in Overleaf" (open the template in Overleaf). This can be done using the following steps.

### [Once only]: Create your Github and Overleaf accounts
If **you do not have a Github account** that is connected to the Grattan organisation:

  * Create a Github account at [github.com](https://github.com) using your @grattaninstitute email address and a username that makes it easy to identify yourself (and remember). *[Skip if you already have a Github account]*
  * Ask a LaTeXnician to add you to the Grattan Github organisation.

If **you do not have an Overleaf account**:

  * Create an Overleaf account at [overleaf.com](https://overleaf.com) using your `@grattaninstitute` email address.

### Part 1: Copy the template using Github
  1. Logged into your github account, go to https://github.com/new/import.
  2. Copy `https://github.com/HughParsonage/grattex` and paste under `Your old repository’s clone URL`.
  3. Under `Your new repository details` choose `grattan` as the owner.
  4. Under `Name` add a name to your project that will clearly identify the project now and in the future. A **good** example is `Energy-2018-stranded-assets`. A **bad** example is `he-report`.
  5. Select `Private`.
  6. Click `Begin Import`. This will take a few minutes to copy. Grab a cuppa' or a coffee from AO: Github will email you when it's finished. 
  7. Once it has finished, you have successfully cloned the `grattex` repository (copied the report template). Now it's time to open and edit it in Overleaf.

### Part 2: Open the template in Overleaf
  8. Log into your account at at [overleaf.com](https://overleaf.com).
  9. Click `New Project > Import from GitHub`.
  10. Locate the file you just created, and click `Import to Overleaf`.
  11. Once imported the document will open and attempt to compile. If it initially fails to compile, search for and delete `\nocite{*}` from `Report.tex`.
  12. At the top right, click `Share` and:
    a. add collaborators via their email address. *Please add all the LaTeXnicians (Carmela, Hugh, Kate, Lucy, and Will)* as well as the members of your team.
    b. copy the `Anyone with this link can edit the project` link and paste it
    just under `\documentclass{grattan}` as a comment, *i.e.*
    
```latex
    \documentclass{grattan}
    % Anyone with this link can edit the project:
    % https://www.overleaf.com/abcdefghi12345
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;so that your coauthors can also invite people to edit the document in your absence
    
  13. And that's it. You've now created a new report on Github and Overleaf. 

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
