library(tidyverse)
library(lubridate)
library(DBI)
library(RSQLite)


d0 <- ymd('2020-01-06') # first day of classes

database <- 'EES_3310_5310.sqlite3'

driver <- RSQLite::SQLite()

db <- dbConnect(driver, database, flags = SQLITE_RW)
calendar <- tbl(db, 'calendar')

mwf_fall <- function(cal_id) {
  ((cal_id %% 3) * 2 + 5) %% 7 +
    7 * ((cal_id - 1) %/% 3)
}

mwf_spring <- function(cal_id) {
  (((cal_id - 1) %% 3) * 2) %% 7 +
    7 * ((cal_id - 1) %/% 3)
}

new_calendar <- calendar %>% collect() %>%
  mutate(date = d0 + days( mwf_spring(cal_id) )) %>%
  mutate(date = as.character(date)) %>%
  arrange(cal_id)

dbWriteTable(db, "calendar", new_calendar, overwrite = TRUE)
