old_wd = getwd()
setwd(rprojroot::find_root(".semestr.here"))

gen_dirs <- c("assignment", "homework_solutions", "lab_docs", "lab_solutions",
              "labs", "reading")
for (d in gen_dirs) {
  files <- list.files(file.path("content", d), pattern = "*.Rmd", full.names = TRUE)
  file.remove(files)
}

setwd(old_wd)
