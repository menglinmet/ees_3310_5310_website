library(rprojroot)
library(tidyverse)
library(blogdownDigest)
library(semestr)

regenerate_site <- function(root = NULL, force = FALSE) {
  if (is.null(root)) {
    root = find_root(criterion = has_file(".semestr.here"))
  }
  oldwd = setwd(root)
  on.exit(setwd(oldwd))
  message("Setting working directory to ", getwd())
  semester <- load_semester_db("planning/EES-3310-5310.sqlite3")
  generate_assignments(semester)
  update_site(force = force)
  out_opts = list(md_extensions = semestr:::get_md_extensions(), toc = TRUE,
                  includes = list(in_header = "ees3310.sty"))
  update_pdfs(force_dest = TRUE, force = force, output_options = out_opts)
}
