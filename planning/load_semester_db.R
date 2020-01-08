
# Package-level globals (idea copied from rmarkdown::render.R)
.globals <- new.env(parent = emptyenv())

check_cal_for_duplicates <- function(calendar) {
  purrr::keep(calendar$cal_id, duplicated)
}

missing_entries <- function(calendar, due_dates, type) {
    dplyr::filter(calendar, cal_type == type) %$% cal_id %>%
    setdiff(due_dates$cal_id)
}

validate_missing <- function(missing_entries, descr) {
  msg <- stringr::str_c("Missing ", descr, ": (",
                        stringr::str_c(missing_entries, collapse = ", "),
                        ").")
  assertthat::validate_that(is_empty(missing_entries), msg = msg)
}

check_for_missing <- function(calendar, items, type, descr, assertion = FALSE) {
  missing <- missing_entries(calendar, items, type)
  valid <- validate_missing(missing, descr)
  if (! isTRUE(valid)) {
    if (isTRUE(assertion)) {
      stop(valid)
    } else {
      warning(valid)
    }
  }
  valid
}

#' Load schedule for semester from database
#'
#' Loads schedule for class meetings, reading and homework assignments,
#' lab sessions, exams, holidays, etc. from a database.
#'
#' @param db_file An SQLite database file.
#'
#' @return A list containing a tibbles with the calendar for the semester and
#'   tibbles with details on reading assignments, homework assignments,
#'   labs, exams, holidays, and other events.
#'
#'   THe list contains the following tibbles:
#'   `calendar`, `due_dates`, `due_links`, `rd_items`, `rd_src`, `rd_links`,
#'   `class_topics`, `hw_asgt`, `hw_items`, `hw_sol`, `hw_links`, `hw_topics`,
#'   `lab_asgt`, `lab_items`, `lab_sol`, `lab_links`, `exams`, `exam_links`,
#'   `holidays`, `holiday_links`, `events`, `event_links`, `notices`,
#'   `text_codes`
#'
#'   and a named list `metadata` containing named character vectors of
#'   metadata that are used to decode and manipulate calendar entries.
#'
load_semester_db <- function(db_file, root_crit = NULL) {
  root_dir <- find_root_dir(dirname(db_file), root_crit, FALSE)
  slide_dir <- file.path(root_dir, "static", "slides")
  tz <- get_semestr_tz()

  db <- DBI::dbConnect(RSQLite::SQLite(), db_file, flags = RSQLite::SQLITE_RO)

  md_1 <- dplyr::tbl(db, "metadata") %>% dplyr::collect()
  md_2 <- dplyr::tbl(db, "base_mods") %>% dplyr::collect()

  type2idx_tbl <- purrr::set_names(md_1$idx, md_1$type)
  idx2type_tbl <- purrr::set_names(md_1$type, md_1$idx)
  type2col_tbl <- purrr::set_names(md_1$col, md_1$type)
  col2type_tbl <- purrr::set_names(md_1$type, md_1$col)
  idx2col_tbl  <- purrr::set_names(md_1$col, md_1$idx)
  col2idx_tbl  <- purrr::set_names(md_1$idx, md_1$col)
  prefixes_tbl <- purrr::set_names(md_1$prefix, md_1$type)

  bases_tbl    <- as.integer(md_1$base) %>% purrr::set_names(md_1$type)
  rev_base_tbl <- purrr::set_names(names(bases_tbl), as.character(bases_tbl))


  mods_tbl     <- as.integer(md_2$mod) %>% purrr::set_names(md_2$key)
  rev_mods_tbl <- purrr::set_names(names(mods_tbl), as.character(mods_tbl))

  metadata <- list(type2idx_tbl = type2idx_tbl, type2col_tbl = type2col_tbl,
                   idx2type_tbl = idx2type_tbl, col2type_tbl = col2type_tbl,
                   idx2col_tbl  = idx2col_tbl,  col2idx_tbl  = col2idx_tbl,
                   prefixes_tbl = prefixes_tbl,
                   bases_tbl    = bases_tbl,   rev_base_tbl  = rev_base_tbl,
                   mods_tbl     = mods_tbl,    rev_mods_tbl  = rev_mods_tbl)
  assign("metadata", metadata, envir = .globals)

  for (t in c("calendar",
              "due_links",     "due_dates",
              "rd_links",                   "rd_items",  "rd_src",  "class_topics",
              "hw_links",      "hw_asgt",   "hw_items",  "hw_sol",  "hw_topics",
              "lab_links",     "lab_asgt",  "lab_items", "lab_sol", # "lab_topics",
              "exam_links",    "exams",
              "holiday_links", "holidays",
              "event_links",   "events",
              "notices",
              "text_codes")) {
    df <- dplyr::tbl(db, t) %>% dplyr::collect()
    assign(t, df)
  }

  DBI::dbDisconnect(db)

  calendar <- calendar %>%
    dplyr::mutate(date = lubridate::as_datetime(date, tz = tz))

  bare_dates <- calendar %>% dplyr::select(cal_id, date)

  duplicates <- check_cal_for_duplicates(calendar)
  msg <- stringr::str_c("Duplicated cal_ids: (",
                        stringr::str_c(duplicates, collapse = ", "),
                        ").")
  assertthat::assert_that(is_empty(duplicates), msg = msg)

  due_dates <- due_links %>% dplyr::left_join(due_dates, by = "due_key")

  check_for_missing(calendar, due_dates, "due date", "due dates", FALSE)

  calendar <- calendar %>%
    dplyr::left_join( dplyr::select(due_dates, cal_id, due_type = type,
                                    due_action = action), by = "cal_id")

  hw_asgt <- hw_asgt %>% dplyr::inner_join(hw_links, by = "hw_key") %>%
    dplyr::left_join(hw_topics, by = "hw_key") %>%
    dplyr::left_join(
      dplyr::select(due_dates, due_key, due_cal_id = cal_id),
      by = "due_key") %>%
    dplyr::mutate_at(dplyr::vars(is_numbered),
                     ~as.logical(.) %>% tidyr::replace_na(FALSE))
  hw_items <- hw_items %>% dplyr::inner_join(hw_links, by = "hw_key") %>%
    dplyr::mutate_at(dplyr::vars(undergraduate_only, graduate_only,
                                 break_before, prologue, epilogue),
                     ~as.logical(.) %>% tidyr::replace_na(FALSE))
  hw_sol <- hw_sol %>% dplyr::inner_join(hw_links, by = "hw_key") %>%
    dplyr::inner_join( dplyr::select(due_dates, sol_pub_key = due_key,
                                     sol_pub_cal_id  = cal_id),
                       by = "sol_pub_key")

  check_for_missing(calendar, hw_asgt, "homework", "homework assignments",
                    FALSE)

  rd_items <- rd_items %>% dplyr::inner_join(rd_links, by = "rd_key") %>%
    dplyr::left_join(rd_src, by = "src_key") %>%
    dplyr::mutate_at(dplyr::vars(undergraduate_only, graduate_only, optional,
                                 prologue, epilogue, textbook, handout),
                     ~as.logical(.) %>% tidyr::replace_na(FALSE))

  check_for_missing(calendar, rd_items, "class", "reading assignments", FALSE)


  lab_asgt <- lab_asgt %>% dplyr::inner_join(lab_links, by = "lab_key") %>%
    dplyr::left_join( dplyr::select(due_dates, report_due_key = due_key,
                                    report_cal_id = cal_id),
                      by = "report_due_key") %>%
    dplyr::left_join( dplyr::select(due_dates, presentation_key = due_key,
                                    pres_cal_id = cal_id),
                      by = "presentation_key")

  check_for_missing(calendar, lab_asgt, "lab", "lab assignments", FALSE)

  lab_items <- lab_items %>% dplyr::inner_join(lab_links, by = "lab_key")
  lab_sol <- lab_sol %>% dplyr::inner_join(lab_links, by = "lab_key") %>%
    dplyr::inner_join( dplyr::select(due_dates, sol_pub_key = due_key,
                                     sol_pub_cal_id  = cal_id),
                       by = "sol_pub_key")

  events <- events %>% dplyr::inner_join(event_links, by = "event_key")
  check_for_missing(calendar, events, "event", "events", FALSE)

  exams <- exams %>% dplyr::inner_join(exam_links, by = "exam_key")
  check_for_missing(calendar, exams, "exam", "exams", FALSE)

  holidays <- holidays %>% dplyr::inner_join(holiday_links, by = "holiday_key")
  check_for_missing(calendar, holidays, "holiday", "holidays", FALSE)

  notices <- notices %>% dplyr::group_by(type) %>%
    dplyr::mutate(cal_key = add_key_prefix(cal_key, type[1])) %>%
    dplyr::ungroup() %>%
    dplyr::inner_join( dplyr::select(calendar, cal_id, cal_key),
                       by = "cal_key")

  bad_codes <- text_codes %>% dplyr::filter(is.na(code_value))
  if (nrow(bad_codes) > 0) {
    warning("Text codes with missing values: [",
            str_c(bad_codes$code_name, collapse = ", "), "]")
    text_codes <- text_codes %>%
      dplyr::mutate(code_value = ifelse(is.na(code_value), "", code_value))
  }
  text_codes <- list(
    md = text_codes %>% { set_names(.$code_value, .$code_name) },
    latex = text_codes %>% { set_names(.$latex_value, .$code_name) }
  )

  # Add dates to items
  rd_items <- rd_items %>% dplyr::left_join(bare_dates, by = "cal_id")
  hw_asgt <- hw_asgt %>% dplyr::left_join(bare_dates, by = "cal_id") %>%
    dplyr::left_join( dplyr::rename(bare_dates, due_cal_id = cal_id,
                                   due_date = date), by = "due_cal_id")
  hw_items <- hw_items %>% dplyr::left_join(bare_dates, by = "cal_id")
  lab_asgt <- lab_asgt %>% dplyr::left_join(bare_dates, by = "cal_id") %>%
    dplyr::left_join( dplyr::rename(bare_dates, report_cal_id = cal_id,
                                    report_date = date), by = "report_cal_id") %>%
    dplyr::left_join( dplyr::rename(bare_dates, pres_cal_id = cal_id,
                                    pres_date = date), by = "pres_cal_id")
  lab_items <- lab_items %>% dplyr::left_join(bare_dates, by = "cal_id")

  hw_sol <- hw_sol %>% dplyr::left_join(bare_dates, by = "cal_id") %>%
    dplyr::left_join( dplyr::select(bare_dates, sol_pub_cal_id = cal_id,
                                    sol_pub_date = date), by = "sol_pub_cal_id")
  lab_sol <- lab_sol %>% dplyr::left_join(bare_dates, by = "cal_id") %>%
    dplyr::left_join( dplyr::select(bare_dates, sol_pub_cal_id = cal_id,
                                    sol_pub_date = date), by = "sol_pub_cal_id")

  holidays <- holidays  %>% dplyr::left_join(bare_dates, by = "cal_id")
  exams <- exams  %>% dplyr::left_join(bare_dates, by = "cal_id")
  events <- events  %>% dplyr::left_join(bare_dates, by = "cal_id")

  rd_items <- rd_items %>% dplyr::mutate(cal_key = add_key_prefix(rd_key, "class"))
  rd_links <- rd_links %>% dplyr::mutate(cal_key = add_key_prefix(rd_key, "class"))

  hw_asgt <- hw_asgt %>% dplyr::mutate(cal_key = add_key_prefix(hw_key, "homework"))
  hw_items <- hw_items %>% dplyr::mutate(cal_key = add_key_prefix(hw_key, "homework"))
  hw_sol <- hw_sol %>% dplyr::mutate(cal_key = add_key_prefix(hw_key, "homework"),
                                     pub_cal_key = add_key_prefix(sol_pub_key, "due date"))
  hw_links <- hw_links %>% dplyr::mutate(cal_key = add_key_prefix(hw_key, "homework"))

  lab_asgt <- lab_asgt %>% dplyr::mutate(cal_key = add_key_prefix(lab_key, "lab"))
  lab_items <- lab_items %>% dplyr::mutate(cal_key = add_key_prefix(lab_key, "lab"))
  lab_sol <- lab_sol %>% dplyr::mutate(cal_key = add_key_prefix(lab_key, "lab"),
                                     pub_cal_key = add_key_prefix(sol_pub_key, "due date"))
  lab_links <- lab_links %>% dplyr::mutate(cal_key = add_key_prefix(lab_key, "lab"))

  holidays <- holidays %>% dplyr::mutate(cal_key = add_key_prefix(holiday_key, "holiday"))
  exams <- exams %>% dplyr::mutate(cal_key = add_key_prefix(exam_key, "exam"))
  events <- events %>% dplyr::mutate(cal_key = add_key_prefix(event_key, "event"))

  first_class <- 1
  last_class <- NA

  if(is.na(first_class)) first_class <- min(calendar$class_num, na.rm = T)
  if (is.na(last_class)) last_class <- max(calendar$class_num, na.rm = T)

  first_date <- calendar %>%
    dplyr::filter(class_num == first_class) %$% date
  last_date <- calendar %>%
    dplyr::filter(class_num == last_class) %$% date

  year_taught <- lubridate::year(first_date)

  # Pub date should be last day of previous month.
  pub_date <- make_pub_date(first_date, tz)

  semester_dates <- list(
    first_class = first_class, last_class = last_class,
    first_date = first_date, last_date = last_date,
    year_taught = year_taught, pub_date = pub_date
  )

  semester <- list(
    calendar = calendar, due_dates = due_dates, due_links = due_links,
    rd_items = rd_items, rd_src = rd_src, rd_links = rd_links,
    class_topics = class_topics,
    hw_asgt = hw_asgt, hw_items = hw_items, hw_sol = hw_sol,
    hw_links = hw_links, hw_topics = hw_topics,
    lab_asgt = lab_asgt, lab_items = lab_items, lab_sol = lab_sol,
    lab_links = lab_links,
    exams = exams, exam_links = exam_links,
    holidays = holidays, holiday_links = holiday_links,
    events = events, event_links = event_links,
    notices = notices, text_codes = text_codes,
    metadata = metadata, semester_dates = semester_dates,
    tz = tz, root_dir = root_dir, slide_dir = slide_dir
  )

  assign("metadata", metadata, envir = .globals)
  assign("semester_dates", semester_dates, envir = .globals)
  assign("semester_data", semester, envir = .globals)
  assign("root_dir", root_dir, envir = .globals)
  assign("slide_dir", slide_dir, envir = .globals)
  assign("tz", tz, envir = .globals)

  invisible(semester)
}
