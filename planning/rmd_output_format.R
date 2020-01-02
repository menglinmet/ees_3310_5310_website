make_rmd_output_format <- function(toc = FALSE) {
  output <- list(
    list(
      "blogdown::html_page" =
        list(md_extensions = get_md_extensions(),
             toc = toc),

      pdf_document =
        list(md_extensions = get_md_extensions(),
             toc = toc,
             includes =
               list(
                 in_header = "ees3310.sty"
               )
        )
    )
  )
  output
}
