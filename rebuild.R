rebuild <- function() {
  source('D:/JG_Documents/teaching/Classes_by_Semester/2019-2020/Spring/EES_3310/EES_3310_website/planning/init.R',
         chdir = TRUE, verbose = FALSE)
  semester <<- load_semester_db(file.path("planning", db_file))
  generate_assignments(semester)
  blogdownDigest::update_site()
  update_pdfs()
}
