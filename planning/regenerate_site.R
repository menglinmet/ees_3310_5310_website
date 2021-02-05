library(rprojroot)
library(tidyverse)
library(blogdownDigest)
library(semestr)

regenerate_site <- function(root = NULL) {
  if (is.null(root)) {
    root = find_root(criterion = has_file(".semestr.here"))
  }
  oldwd = setwd(root)
  on.exit(setwd(oldwd))
  semester <- load_semester_db("planning/EES-3310-5310.sqlite3")
  generate_assignments(semester)
  update_site()
  update_pdfs()
}
