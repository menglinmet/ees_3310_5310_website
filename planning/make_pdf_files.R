build_pdf_output_format <- function(header) {
  if (has_name(header, "output") && has_name(header$output, "pdf_document")) {
    output_options <- header$output$pdf_document
  } else {
    output_options <- list()
  }
  if (! has_name(output_options, "toc"))
    output_options$toc <- FALSE
  if (! has_name(output_options, "md_extensions"))
    output_options$md_extensions <- get_md_extensions()
  doc <- eval(expr(pdf_document(!!!output_options)))
  invisible(doc)
}

strip_leading_slash <- function(s) {
  stringr::str_replace_all(s, "^[/\\\\]+", "")
}

cat_path <- function(dir, base) {
  file.path(dir, strip_leading_slash(base))
}

pdf_filename <- function(pdf_url, root_dir, static_path = "static",
                         force_dest = FALSE) {
  # message("root = ", root_dir, ", static = ", static_path,
  #         ", URL = ", pdf_url)
  dest_dir <- file.path(root_dir, static_path) %>%
    cat_path(dirname(pdf_url)) %>% normalizePath(winslash = "/")
  # message("testing for dest path ", dest_dir)
  if (! dir.exists(dest_dir))
    if (force_dest) {
      message("Creating path ", dest_dir)
      dir.create(dest_dir, recursive = TRUE)
    } else {
      warning("Destination directory does not exist: ", dest_dir)
      return(NA)
    }
  dest <- file.path(dest_dir, basename(pdf_url))
  # message("Dest file = ", dest)
  dest
}

build_pdf_from_rmd <- function(source_file, root_dir, static_path = "static",
                               force_dest = FALSE) {
  # message("building file ", source_file)
  hdr <- grab_header(source_file)
  if (has_name(hdr, "pdf_url")) {
    pdf_dest <- pdf_filename(hdr$pdf_url, root_dir, static_path, force_dest)
    if (is.na(pdf_dest)) {
      message("Invalid pdf URL in header: ", hdr$pdf_url)
      return(NA)
    }
  } else {
    # message("No pdf output declared")
    return(NA)
  }
  pdf_output <- build_pdf_output_format(hdr)

  message("building ", pdf_dest, " from ", basename(source_file))

  result <- rmarkdown::render(source_file, output_format = pdf_output,
                              output_file = pdf_dest)
  result
}

build_pdf_files <- function(semester, content_dir = "content",
                            static_path = "static", force_dest = TRUE) {
  root_dir <- semester$root_dir
  if (! dir.exists(content_dir)) {
    content_dir = cat_path(root_dir, content_dir)
  }
  source_paths <- c("labs", "lab_docs", "assignment", "reading",
                    "homework_solutions", "lab_solutions")
  files <- list.files(file.path(content_dir, source_paths), pattern = "*.Rmd",
                      full.names = TRUE)
  for (f in files) {
    build_pdf_from_rmd(f, root_dir, static_path, force_dest)
  }

}
