
if (!file.exists("grattexDocumentationMD5") ||
    tools::md5sum("grattexDocumentation.Rnw") != readLines("grattexDocumentationMD5")[[1]]) {
  if (requireNamespace("knitr", quietly = TRUE)) install.packages("knitr")
  if (requireNamespace("kableExtra", quietly = TRUE)) install.packages("kableExtra")

  knitr::knit("grattexDocumentation.Rnw")
  res <- 
    if (toupper(.Platform$OS.type) == "WINDOWS") {
      shell("pdflatex -halt-on-error grattexDocumentation.tex")
    } else {
      system("pdflatex -halt-on-error grattexDocumentation.tex")
    }
  
  if (!res) {
    stop("Nonzero exit status from pdflatex.")
  }
  
  if (requireNamespace("crayon", quietly = TRUE)) {
    cat(crayon::green(as.character(tools::md5sum("grattexDocumentation.Rnw"))), "\n")
  } else {
    cat(as.character(tools::md5sum("grattexDocumentation.Rnw")), "\n")
  }
  
  writeLines(as.character(tools::md5sum("grattexDocumentation.Rnw")), 
             "grattexDocumentationMD5")
}




