update_latex_styles <- function(root_dir = NULL, content_path = "content",
                                planning_path = "planning") {
  if (is.null(root_dir)) {
    root_dir <- find_root_dir(use_globals = TRUE)
  }
  root_dir <- normalizePath(root_dir, winslash = "/")
  src_files <- list.files(file.path(root_dir, planning_path, "latex_includes"),
                          pattern = "\\.(tex|sty)$", full.names = TRUE) %>%
    normalizePath(winslash = "/")
  if (length(src_files) == 0)
    return()

  content_dirs <- assignment_source_dirs(root_dir, content_path)

  base_pat <- stringr::fixed(root_dir)

  for (src in src_files) {
    for (dest in content_dirs) {
      message("Copying ", stringr::str_replace(src, base_pat, ""),
              " to ", stringr::str_replace(dest, base_pat, ""))
      file.copy(src, dest, overwrite = TRUE, recursive = FALSE,
                copy.mode = TRUE, copy.date = TRUE)
    }
  }
}
