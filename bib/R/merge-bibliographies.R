library(data.table)
library(RefManageR)
library(dtplyr)
library(dplyr)
library(magrittr)
library(lubridate)

AP_2016 <- ReadBib("./bib/2016-AP-bibliography.bib", check = FALSE)
HE_2016 <- ReadBib("./bib/2016-HE-Bib.bib", check = FALSE)

AP_2016 %>%
  as.data.frame %>%
  as.data.table %>%
  mutate(Year = coalesce(year, year(date))) %>%
  select(author, title)
  .[duplicated(.)]
