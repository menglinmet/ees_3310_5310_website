rebuild <- function() {
  home <- rprojroot::find_root(".semestr.here")
  source(file.path(home, 'planning/init.R'),
         chdir = TRUE, verbose = FALSE)
  semester <<- load_semester_db(file.path("planning", db_file))
  generate_assignments(semester)
  blogdownDigest::update_site()
  update_pdfs()
}
