library(DBI)
library(RSQLite)
library(dbplyr)
library(tidyverse)
library(magrittr)
library(lubridate)
library(janitor)

export_tables <- function(dest_dir, db_file = NULL){
  if (is.null(db_file)) {
    db_file <- here::here("planning") %>% file.path("EES_3310_5310.sqlite3")
  }
  db <- DBI::dbConnect(RSQLite::SQLite(), db_file, flags = RSQLite::SQLITE_RO)
  on.exit(if (DBI::dbIsValid(db)) DBI::dbDisconnect(db))

  if (!dir.exists(dest_dir)) {
    dir.create(dest_dir, recursive = TRUE)
  }
  tables <- db_list_tables(db)
  for(t in tables) {
    df <- tbl(db, t) %>% collect()
    write_csv(df, file.path(dest_dir, str_c(t, ".csv")))
  }
  dbDisconnect(db)
}
