# grattex

This is the repository containing the configuration files for reports in the style of the [Grattan Institute, Melbourne](https://grattan.edu.au/).

See <https://github.com/grattan/grattex/blob/master/doc/grattexDocumentation.pdf> for the documentation.

------------------------------------------------------------------------

## Starting a new report

Staff starting a new report need to "clone the `grattex` repository on Github" (copy the report template) and "import the repository to edit in Overleaf" (open the template in Overleaf). This can be done using the following steps.

### [Once only]: Create your Github and Overleaf accounts

If **you do not have a Github account** that is connected to the Grattan organisation:

-   Create a Github account at [github.com](https://github.com) using your @grattaninstitute email address and a username that makes it easy to identify yourself (and remember). *[Skip if you already have a Github account]*
-   Ask Mia or Alan to add you to the Grattan Github organisation.

If **you do not have an Overleaf account**:

-   Create an Overleaf account at [overleaf.com](https://overleaf.com) using your `@grattaninstitute` email address.
-   Ask Mia or Alan to add you to the Grattan Institute premium account.
-   Under 'Account Settings', ensure your account is linked to both Dropbox and Github.

### Part 1: Copy the template using Github

1.  Logged into your github account, go to `https://github.com/grattan/grattex`
2.  Click on `Use this template` (the green button on the top-right of the panel)
3.  Change the Owner to `grattan`. Give your new repository a name that will clearly identify the project now and in the future. A **good** example is `Energy-2018-stranded-assets`. A **bad** example is `health-report`.
4.  Select `Private`, and make sure the `Include all branches` is **unchecked**.
5.  Click `Create repository from template`. This will take a minute to copy.
6.  Once it has finished, you have successfully cloned the `grattex` repository (copied the report template). You can find it at `https://github.com/grattan/[your-repository-name]`. Now it's time to open and edit it in Overleaf.

### Part 2: Open the template in Overleaf

8.  Log into your account at at [overleaf.com](https://overleaf.com).
9.  Click `New Project > Import from GitHub`.
10. Locate the repository you just created, and click `Import to Overleaf`.
11. Once imported the document will open and attempt to compile.
12. At the top right, click `Share` and:
    -   add collaborators via their email address. Please add Mia, as well as the members of your team, plus Paul and Kat.
    -   copy the `Anyone with this link can edit the project` link and paste it just under `\documentclass{grattan}` as a comment, *i.e.:*

``` latex
    \documentclass{grattan}
    % Anyone with this link can edit the project:
    % https://www.overleaf.com/abcdefghi12345
```

      so that your coauthors can also invite people to edit the document in your absence

13. And that's it. You've now created a new report on Github and Overleaf.

------------------------------------------------------------------------

## Working with LaTeX

You can get a long way in Latex using Overleaf's 'Rich Text' editor. When you open an Overleaf project and select a file ending in `.tex` from the left sidebar, code will appear in the centre panel of the screen. At the top left of the code is a toggle button, allowing you to see the file as 'Source' code (which looks code-ish) or 'Rich Text' (which looks a bit more like Microsoft Word, including buttons you can click for section heading or bold text).

Now you can write almost as easily as you would in more user-friendly text editors like Word.

For anything more advanced (footnotes, referencing, tables, figures and other miscellaneous troubleshooting), there are three resources that might help.

1.  ***Using LaTeX in reports at Grattan*** is a more-than-one-hundred page document that should contain the answer. It lives in the Grattan Dropbox under `Grattan Team > Templates > LaTeX > grattexDocumentation.pdf`. While super helpful and comprehensive, the document is very long -- the best strategy is to `ctrl+F` for whatever you need assistance with.
2.  The **latexShowcase** project in Overleaf contains many examples of code that you might find useful, including how to use boxes and complex tables. Ask Mia to invite you to this project if you didn't already receive the invite during your induction.
3.  Your colleagues have probably encountered any issues you might have. Breaking a Latex document can be unnerving and frustrating, but the fix usually takes only a few seconds. Ask around! **Mia** is the designated 'Latexnician' as of January 2026, and is more than happy to help.

### To release a report

Releasing a report involves adding the front cover, updating the logos/affiliates on page 2, and adding the ISBN and report number <!-- , and running the report through `checkGrattanReport` again -- but this time with some extra checks. -->

1.  To add the front cover, ensure that there is a folder in the Overleaf project called `FrontPages`, which must contain the front cover as a PDF with the name `FrontPage.pdf`. In `Report.tex`, change the first line of code from `\documentclass[embargoed]{grattan}` to `\documentclass[FrontPage]{grattan}`.
2.  Check with Central Services what ISBN and report number your report should have, and ask for a png of the current Affiliates page. Replace whatever ISBN/report number is currently in `Report.tex` with the correct one. Save the affiliates page in the folder `Frontpages` with the file name `AffiliatesPage.png`.
3.  Check the error log in Overleaf, and work through them to either resolve them or make sure they're inconsequential. Ideally, you shouldn't have any red errors left when you release.
4.  Download the PDF and check it looks correct!

------------------------------------------------------------------------

## Changelog

## 2026-07-16

-   Changed location and layout of acknowledgements page
-   Fixed appendix referencing and report name/month/year printing bugs
-   Automated \CenturyFootnote
-   Updated colour palette to match current branding
-   Cleaned up default .bib files
-   Added varioref.sty as a local file to fix a bug with Tex Live 2026. This should be removed once the bug is fixed, see bug report here: <https://sourceforge.net/p/koma-script/tickets/109/>

## 2026-01-09

-   Updated documentation to reflect current processes, including new affiliates page process

## 2024-09-13

-   Changed affiliates page.

### 2018-09-07

-   Penalties for hyphenation increased

### 2018-02-26

-   Fix issue #102 which manifested on TeX Live distributions (like Travis-CI) where `Ibid. (<page ref>)` resulted in the `p` being uppercase (PR #114). Thanks to JD for filing.

### 2017-09-01

-   Increase hyphenation penalties. Closes #85

### 2017-08-22

-   Add `\note(s)withsource(s)` permutations. Closes #81

### 2017-08-20

-   Add `centredsmallbox`.

### 2017-08-18 v1.3.0

-   Enable the detection of page-straddling cross-references via additional entries in `.log`

### 2017-07-18

-   Appendix chapter titles are named 'Appendix A' etc.

### 2017-01-17

-   New option 'submission'.

### 2017-01-06

-   Add `\Chapref` and friends for neater hyperlinks to chapters
-   Add `\ie` `\eg` `\etc` macros.

### 2016-12-19

-   Allow long URLs in bibliography, line-breaking at width #36
-   Box footnotes are now non-italic #43
-   New command, `\doublecolumnfigure` now used #46
-   Documentation moved to `./doc/`

### 2016-11-19

New features: \* New option `embargoed` enables a command `\EmbargoDate` which prints an Embargo mark on the title page and in the headers #32

-   Patched bug in `cleveref` where `varioref`'s phrase \`\`on the previous page'' is never used. #39
-   `[t]` floats have captions aligned with the baseline. 076df622e7fec025382b804e1b809319aef2fe11
-   KOMA-warnings' advice about `footheight`, `headheight` etc has been accepted. #40
-   Glue component of space between footnote area and text has been reduced to 14pt (which is closer to the current leading). aec03a693b0aad85daa03ceef16316ef855b5b4a
-   Manual specification of `\textfloatsep` has now been dropped in favour of the default
-   Allow citations in acknowledgements #37
