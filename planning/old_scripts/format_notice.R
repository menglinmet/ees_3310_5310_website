make_notice <- function(notice_entries) {
  notice_entries <- notice_entries %>%
    dplyr::filter(! is.na(notice), stringr::str_length(notice) > 0)
  if (nrow(notice_entries) > 1) {
    output <- stringr::str_c("## Notices:", "",
                             stringr::str_c("*", notice_entries$notice,
                                            sep = "  ", collapse = "\n"), "", "",
                             sep = "\n")
  } else   if (nrow(notice_entries) > 0) {
    output <- stringr::str_c("## Notice:", "",
                             notice_entries$notice, "",
                             sep = "\n")
  } else  {
    output <- character(0)

  }
  output %>% escape_dollar()
}
