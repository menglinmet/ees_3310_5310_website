library(magrittr)
library(rlang)

db_file <- "EES_3310_5310.sqlite3"

r_dir <- rprojroot::find_root(".semestr.here") %>% file.path("planning")

semestr.debug <- TRUE

source(file.path(r_dir, "assignment_utils.R"), chdir = TRUE)
source(file.path(r_dir, "name_conversions.R"), chdir = TRUE)
source(file.path(r_dir, "key_prefixes.R"), chdir = TRUE)
source(file.path(r_dir, "date_manipulation.R"), chdir = TRUE)
source(file.path(r_dir, "text_formatting.R"), chdir = TRUE)
source(file.path(r_dir, "contexts.R"), chdir = TRUE)
source(file.path(r_dir, "code_expansion.R"), chdir = TRUE)
source(file.path(r_dir, "rmd_output_format.R"), chdir = TRUE)
source(file.path(r_dir, "rmd_header.R"), chdir = TRUE)
source(file.path(r_dir, "load_semester_db.R"), chdir = TRUE)
source(file.path(r_dir, "format_notice.R"), chdir = TRUE)
source(file.path(r_dir, "format_reading.R"), chdir = TRUE)
source(file.path(r_dir, "format_homework.R"), chdir = TRUE)
source(file.path(r_dir, "format_lab.R"), chdir = TRUE)
source(file.path(r_dir, "generate_assignments.R"), chdir = TRUE)
source(file.path(r_dir, "make_pdf_files.R"), chdir = TRUE)
source(file.path(r_dir, "pdf_digests.R"), chdir = TRUE)
source(file.path(r_dir, "clean_assignments.R"), chdir = TRUE)

