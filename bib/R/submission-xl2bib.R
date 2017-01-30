library(readxl)
library(dplyr)
library(magrittr)

submission_data <-
  read_excel("~/../Downloads/Key Metrics New Data.xlsx", sheet = "Submissions Data", 
             col_types = c("text", "text", "date", "numeric", "numeric", "numeric", "text", "text", "text"))

submission_data %>%
  mutate(Date = if_else(is.na(Date),
                         as.Date(paste(Year, Month, "01", sep = "-")),
                         as.Date(Date)))
