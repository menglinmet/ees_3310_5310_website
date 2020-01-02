old_wd = getwd()
setwd(rprojroot::find_root(".semestr.here"))

gen_dirs <- c("assignment", "homework_solutions", "lab_docs", "lab_solutions",
              "labs", "reading")
for (d in gen_dirs) {
  files <- list.files(file.path("content", d), pattern = ".*\\.Rmd$", full.names = TRUE)
  file.remove(files)
}

static_pdf_dirs <- c("lab_docs", "lab_doocs")

for (d in static_dirs) {
  files <- list.files(file.path("static", "files", d), pattern = "\\.pdf$",
                      full.names = TRUE)
  file.remove("files")
}

static_img_dirs <- c("lab_docs")

for (d in static_dirs) {
  files <- list.files(file.path("static", d),
                      pattern = "\\.(png|jpg|jpeg|svg|gif|pdf)$",
                      full.names = TRUE)
  file.remove("files")
}



setwd(old_wd)
