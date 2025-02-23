append_newline_if_needed <- function(txt, start_par = FALSE, extra_lines = 0,
                                     collapse = NULL, trim = FALSE) {
  if (trim) {
    txt <- stringr::str_trim(txt)
  }
  txt[stringr::str_detect(txt, '[^\n]$')] <- stringr::str_c(txt, '\n')
  if (length(start_par) > 1) {
    assertthat::assert_that(length(txt) == length(start_par),
                            msg = stringr::str_c("txt has length ", length(txt),
                                                 " and start_par has length ",
                                                 length(start_par)))
    txt <- stringr::str_c(ifelse(start_par, "\n", ""), txt)

  } else if (start_par) {
    txt <- stringr::str_c("\n", txt)
  }
  if(length(extra_lines) > 1) {
    assertthat::assert_that(length(txt) == length(extra_lines),
                            msg = stringr::str_c("txt has length ", length(txt),
                                                 " and extra_lines has length ",
                                                 length(extra_lines)))
    txt <- stringr::str_c(txt,
                          map_chr(extra_lines,
                                  ~stringr::str_c(ifelse(.x > 0,
                                                         rep("\n", .x), ""),
                                                  collapse = "")))
  } else if (extra_lines > 0) {
    txt <- stringr::str_c(txt, stringr::str_c(rep('\n', extra_lines),
                                              collapse = ''))
  }
  if (! is.null(collapse)) {
    if (isTRUE(collapse)) {
      collapse <- ""
    }
    txt <- stringr::str_c(txt, collapse = collapse)
  }
  txt
}

adj_nl <- append_newline_if_needed

concat_with_nl <- function(s, ..., start_par = FALSE, extra_lines = 0,
                           collapse = TRUE) {
  dots <- list(...)
  s <- append_newline_if_needed(s, FALSE, 0, TRUE)
  s2 <- append_newline_if_needed(as.character(unlist(dots)),
                                 start_par, extra_lines, collapse)
  if (stringr::str_starts(s2, stringr::fixed("\n")) &&
      stringr::str_ends(s, stringr::fixed("\n\n"))) {
    s <- s %>% stringr::str_replace_all("\n+$", "\n")
  }
  stringr::str_c(s, s2)
}

cat_nl <- concat_with_nl

escape_dollar <- function(txt) {
  stringr::str_replace_all(txt, c("([^\\\\])\\\\\\$" = "\\1\\\\\\\\$",
                                  "^\\\\\\$" = "\\\\\\\\$"))
}

format_month <- function(d, abbr = TRUE) {
  m <- lubridate::month(d, label = TRUE, abbr = abbr)
  if (abbr) m <- stringr::str_c(m, '.')
  m
}

format_wday <- function(d, abbr = TRUE) {
  wd <- lubridate::wday(d, label = TRUE, abbr = abbr)
  if (abbr) wd <- stringr::str_c(wd, '.')
  wd
}

format_class_date <- function(d, abbr = TRUE) {
  stringr::str_c(format_month(d, abbr = abbr), " ", lubridate::day(d))
}

format_class_day_date <- function(d, abbr_month = TRUE, abbr_wday = TRUE) {
  stringr::str_c(format_wday(d, abbr_wday), ", ",
                 format_month(d, abbr_month), " ", lubridate::day(d))
}

format_date_range <- function(dates, abbr = TRUE) {
  date_range <- sanitize_date_range(dates)
  start <- date_range$start
  stop <- date_range$stop

  output <- format_class_date(start, abbr)
  if (start != stop) {
    output <- stringr::str_c(output, '--',
                             ifelse(lubridate::month(stop) ==
                                      lubridate::month(start),
                                    lubridate::day(stop),
                                    format_class_date(stop, abbr)))
  }
  output

}

format_day_date_range<- function(dates, abbr_month = TRUE, abbr_wday = TRUE) {
  date_range <- sanitize_date_range(dates)
  start <- date_range$start
  stop <- date_range$stop

  output <- format_class_day_date(start, abbr_month, abbr_wday)
  if (start != stop) {
    output <- stringr::str_c(output, '--',
                             format_class_day_date(stop, abbr_month,
                                                   abbr_wday))
  }
  output
}

get_date_by_cal_id <- function(calendar, id, abbr = TRUE) {
  d <- calendar %>% dplyr::filter(cal_id == id) %$% date
  assertthat::assert_that(length(d) > 0,
                          msg = stringr::str_c("Couldn't find a class with id ", id, "."))
  assertthat::assert_that(length(d) == 1,
                          msg = stringr::str_c("Found multiple classes with id ", id, "."))
  d
}

get_date_by_class_num <- function(calendar, num) {
  d <- calendar %>% dplyr::filter(cal_type == "class", class_num == num)
  assertthat::assert_that(length(d) > 0,
                          msg = stringr::str_c("Couldn't find class #", num, "."))
  assertthat::assert_that(length(d) == 1,
                          msg = stringr::str_c("Found multiple classes with #", num, "."))
  d
}

get_date_by_key <- function(calendar, key,
                            type = c("class", "reading", "lab", "homework",
                                     "exam", "holiday", "event", "due date",
                                     "raw"),
                            abbr = TRUE) {
  type <- match.arg(type)

  if (type == "reading") type <- "class"
  if (type != "raw") {
    key <- add_key_prefix(key, type)
  }

  d <- calendar %>% dplyr::filter(cal_key == key)  %$% date
  assertthat::assert_that(length(d) > 0,
                          msg = stringr::str_c("Couldn't find a ", type, " with key ", key, "."))
  assertthat::assert_that(length(d) == 1,
                          msg = stringr::str_c("Found multiple ", type, "s with key ", key, "."))
  d
}

format_date_by_cal_id <- function(calendar, id, abbr = TRUE) {
  d <- get_date_by_cal_id(calendar, id)
  format_class_date(d, abbr)
}

format_date_by_class_num <- function(calendar, num, abbTRUE) {
  d <- calendar %>% dplyr::filter(cal_type == "class", class_num == num)
  format_class_date(d, abbr)
}

format_date_by_key <- function(calendar, key,
                               type = c("class", "reading", "lab", "homework",
                                        "exam", "holiday", "event", "due date",
                                        "raw"),
                               abbr = TRUE) {
  type <- match.arg(type)
  d <- get_date_by_key(calendar, key, type)
  format_class_date(d, abbr)
}

format_day_date_by_cal_id <- function(calendar, id, abbr_month = TRUE,
                                      abbr_wday = TRUE) {
  d <- get_date_by_cal_id(calendar, id)
  format_class_day_date(d, abbr_month, abbr_wday)
}

format_day_date_by_class_num <- function(calendar, num, abbr_month = TRUE,
                                         abbr_wday = TRUE) {
  d <- get_daye_by_class_num(calendar, num)
  format_class_day_date(d, abbr_month, abbr_wday)
}

format_day_date_by_key <- function(calendar, key,
                                   type = c("class", "reading", "lab",
                                            "homework", "exam", "holiday",
                                            "event", "due date", "raw"),
                                   abbr_month = TRUE, abbr_wday = TRUE) {
  type <- match.arg(type)
  d <- get_date_by_key(calendar, key, type)
  format_class_day_date(d, abbr_month, abbr_wday)
}


sanitize_date_range <- function(dates) {
  start <- min(dates, na.rm = TRUE)
  stop <- max(dates, na.rm = TRUE)
  list(start = start, stop = stop)
}

format_date_range_by_cal_id <- function(calendar, cal_ids, abbr = TRUE) {
  dates <- calendar %>% dplyr::filter(cal_id %in% na.omit(cal_ids)) %$% date

  format_date_range(dates, abbr)
}

format_date_range_by_class_num <- function(calendar, nums,
                                           abbr = TRUE) {
  col <- c()
  dates <- calendar %>% dplyr::filter(class_num %in% na.omit(nums)) %$% date
  format_date_range(dates, abbr)
}

format_date_range_by_key <- function(calendar, keys,
                                     type = c("class", "reading", "lab",
                                              "homework", "exam", "holiday",
                                              "event", "due date", "raw"),
                                     abbr = TRUE) {
  type <- match.arg(type)

  dbg_checkpoint(g_calendar, calendar)
  dbg_checkpoint(g_keys, keys)
  dbg_checkpoint(g_type, type)

  if (type == "reading") type <- "class"
  if (type != "raw") {
    keys <- add_key_prefix(keys, type)

  }

  dates <- calendar %>% dplyr::filter(cal_key %in% keys)  %$% date
  format_date_range(dates, abbr)
}

format_date_range_by_event_id <- function(calendar, event_ids, abbr = TRUE) {
  dates <- calendar %>% dplyr::filter(event_id %in% event_ids)  %$% date
  format_date_range(dates, abbr)
}

format_page_range <- function(pages) {
  str <- stringr::str_trim(pages) %>% stringr::str_replace_all("^p+\\. *", "")
  multiple <- stringr::str_detect(pages, "-+|,|;| and ")
  stringr::str_c(ifelse(multiple, "pp. ", "p. "), pages)
}

add_period <- function(str) {
  stringr::str_trim(str, "right") %>%
    stringr::str_replace("([^.?!])$", "\\1.")
}

item_format <- function(str, item_text, pad_len) {
  lines <- stringr::str_split(str, "\n") %>% purrr::simplify()
  pad_text <- stringr::str_dup(" ", stringr::str_length(item_text))
  left_pad <- c(item_text, rep(pad_text, length(lines) - 1))
  output <- stringr::str_c(stringr::str_dup(" ", pad_len),
                           left_pad, " ", lines) %>%
    stringr::str_trim("right") %>% stringr::str_c(collapse = "\n") %>%
    stringr::str_trim("right")
  if (stringr::str_detect(output, "\n\n")) {
    output <- stringr::str_c(output, "\n")
  }
  output
}

add_level <- function(pad_len = 0,
                      list_type = c("itemize", "enumerate", "definition"),
                      enum_type = "#.") {
  list_type = match.arg(list_type)
  if (list_type == "itemize") {
    pad_len <- pad_len + 2
  } else if (list_type == "enumerate") {
    pad_len <- pad_len + stringr::str_length(enum_type) + 1
  } else if (list_type == "definition") {
    pad_len <- pad_len + 4
  } else {
    stop("Illegal list type: ", list_type)
  }
  pad_len
}

itemize <- function(text, pad_len = 0) {
  purrr::map_chr(text, ~item_format(.x, "*", pad_len)) %>%
    stringr::str_c(collapse = "\n")
}


enumerate <- function(text, pad_len = 0, enum_type = "#.") {
  purrr::map_chr(text, ~item_format(.x, enum_type, pad_len)) %>%
    stringr::str_c(collapse = "\n")
}

