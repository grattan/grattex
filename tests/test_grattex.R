if (nzchar(Sys.which("pdftotext")) && file.exists("Report.pdf")) {
  system("pdftotext -layout Report.pdf")
  library(data.table)
  
  Report.pdf <-
    data.table(pdf_lines = readLines("Report.txt", warn = FALSE, encoding = "UTF-8"))
  
  
  # Issue 102
  Ibid_lines <- Report.pdf[grepl("Ibid. (P", pdf_lines, fixed = TRUE)]
  if (nrow(Ibid_lines)) {
    stop("Ibid contains a page reference with uppercase P.")
  }
}
