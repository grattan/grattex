if (nzchar(Sys.which("pdftotext")) && file.exists("Report.pdf")) {
  system("pdftotext -layout Report.pdf")
  
  Report.pdf <- readLines("Report.txt", warn = FALSE)
  cat(head(Report.pdf), sep = "\n")
  file.remove("Report.txt")
}
