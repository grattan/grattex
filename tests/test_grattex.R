if (nzchar(Sys.which("pdftotext")) && file.exists("Report.pdf")) {
  system("pdftotext -layout Report.pdf")
  library(data.table)
  library(magrittr)
  
  Report.pdf <-
    data.table(pdf_lines = readLines("Report.txt", warn = FALSE, encoding = "UTF-8"))
  
  
  # Issue 102
  Ibid_lines <- Report.pdf[grepl("Ibid. (P", pdf_lines, fixed = TRUE)]
  if (nrow(Ibid_lines)) {
    stop("Ibid contains a page reference with uppercase P.")
  } 
  
  # Test not out of order
  if (file.exists("tests/Issue118.tex")) {
    file.rename("tests/Issue118.tex", "Issue118.tex")
    
    system("pdflatex -interaction=batchmode -halt-on-error Issue118.tex")
    system("biber -q Issue118")
    system("pdflatex -interaction=batchmode -halt-on-error Issue118.tex")
    system("pdftotext -layout Issue118.pdf")
    Issue118 <- readLines("Issue118.txt", warn = FALSE, encoding = "UTF-8")
    Issue118_bib <- Issue118[seq_along(Issue118) > grep("^Bibliography", Issue118)]
    year_labels <-
      Issue118_bib[nzchar(Issue118_bib)] %>%
      .[grepl("(2017", x = ., fixed = TRUE)] %>%
      sub("^.*2017([a-d])\\).*$", "\\1", x = ., perl = TRUE)
    
    if (!identical(year_labels, 
                   c(letters[1:3],
                     letters[1:4]))) {
      stop("Issue 118 not resolved.")
    }
    
    file.rename("Issue118.tex", "tests/Issue118.tex")
    all(vapply(dir(pattern = "Issue118"), file.remove, logical(1L)))
  }
  
  cat("OK\n")
}
