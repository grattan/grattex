
if (!file.exists("grattexDocumentationMD5") ||
    tools::md5sum("grattexDocumentation.Rnw") != readLines("grattexDocumentationMD5")[[1]]) {
  if (!requireNamespace("hutils", quietly = TRUE)) {
    install.packages("hutils")
  }
  library(hutils)
  RQ(knitr, install.packages("knitr"))
  RQ(kableExtra, install.packages("kableExtra"))

  knitr::knit("grattexDocumentation.Rnw")
  res <- 
    if (toupper(.Platform$OS.type) == "WINDOWS") {
      shell("pdflatex -halt-on-error grattexDocumentation.tex")
    } else {
      system("pdflatex -halt-on-error -interaction=scrollmode grattexDocumentation.tex")
    }
  
  if (res) {
    stop("Nonzero exit status from pdflatex.")
  }
  
  overfull_hboxes <-
    grep("Overfull \\hbox (", readLines("grattexDocumentation.log"), value = TRUE, fixed = TRUE)
  
  # Just choose 100pts for ease of regex -- seems about right anyway
  if (any(grepl("[0-9]{3}\\.[0-9]+pt too wide", overfull_hboxes))) {
    cat(utils::head(grep("[0-9]{3}\\.[0-9]+pt too wide", overfull_hboxes, value = TRUE)), sep = "\n")
    stop("Overfull hboxes exceeded allowed threshold. Ensure that the paragraphs do not overflow the page.")
  }
  
  
  
  
  if (requireNamespace("crayon", quietly = TRUE)) {
    cat(crayon::green(as.character(tools::md5sum("grattexDocumentation.Rnw"))), "\n")
  } else {
    cat(as.character(tools::md5sum("grattexDocumentation.Rnw")), "\n")
  }
  
  writeLines(as.character(tools::md5sum("grattexDocumentation.Rnw")), 
             "grattexDocumentationMD5")
}




