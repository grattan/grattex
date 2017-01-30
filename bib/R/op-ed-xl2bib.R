library(readxl)

op_eds <- read_excel("/path/to/Metrics-workbook", sheet = "Op-eds Data")


for (row in 1:nrow(op_eds)){
  the_row <- op_eds[row, ]
  title <- the_row[["Name of piece"]]
  author <- gsub("((, )|([&]))", " and ", the_row[["Author"]])
  journal <- if_else(grepl("^The\\s.*\\s", the_row[["Publisher"]], perl = TRUE),
                     gsub("^The\\s+", "", the_row[["Publisher"]], perl = TRUE),
                     the_row[["Publisher"]])
  journal_key <- switch(journal, 
                        "The Australian" = "theOz",
                        "Weekend Australian" = "theOz",
                        "West Australian" = "theWAOz",
                        "The Conversation" = "theConvo",
                        "Australian Financial Review" = "AFR", 
                        "Sydney Morning Herald" = "SMH",
                        "The Age" = "theAge",
                        "The Guardian" = "Guardian", 
                        "Herald Sun" = "HeraldSun",
                        "Daily Telegraph" = "DailyTele",
                        "The Drum" = "Drum", 
                        "Huffington Post" = "HuffPo", 
                        journal)
  journal_key <- gsub("\\s+", "", trimws(journal_key), perl = TRUE)
  date <- the_row[["Date"]]
  key <- paste0("@Article{", 
                gsub(" ", "-", gsub("\\s.*$", "", author)), 
                "-", 
                lubridate::year(date), 
                "-", 
                journal_key, 
                "-",
                gsub("[^A-Za-z0-9]+", "-", title), 
                ",")
  write(key, "Op-eds.bib", append = TRUE)
  write(paste0("author = {", author, "},"), "Op-eds.bib", append = TRUE)
  write(paste0("title = {", title, "},"), "Op-eds.bib", append = TRUE)
  write(paste0("journal = {", journal, "},"), "Op-eds.bib", append = TRUE)
  write(paste0("date = {", as.character(date), "},"), "Op-eds.bib", append = TRUE)
  write("}\n\n", "Op-eds.bib", append = TRUE)
}
