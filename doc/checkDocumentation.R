
if (!file.exists("grattexDocumentationMD5") ||
    tools::md5sum("grattexDocumentation.Rnw") != readLines("grattexDocumentationMD5")[[1]]) {
  knitr::knit("grattexDocumentation.Rnw")
  res <- 
    if (toupper(.Platform$OS.type) == "WINDOWS") {
      shell("pdflatex grattexDocumentation.tex")
    } else {
      system("pdflatex grattexDocumentation.tex")
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




