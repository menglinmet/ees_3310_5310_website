validate_semester_db <- function() {

}

prefix_col <- function(name, type, reading = FALSE) {
  prefix <- type2col(type, reading = reading)
  col <- stringr::str_c(prefix, name, sep = "_")
  col
}

make_qpcol <- function(name, type, reading = FALSE) {
  col <- prefix_col(name, type, reading)
  col <- ensym(col)
  col <- enquo(col)
  col
}

subcal <- function(calendar, type) {
  idx_col <- make_qpcol("num", type, FALSE)
  cal_sub <- calendar %>%
    dplyr::filter(cal_type == type) %>%
    dplyr::arrange(date, cal_id, cal_key) %>%
    dplyr::mutate( !!idx_col := seq_along(cal_id)) %>%
    strip_key_prefix(type)
  cal_sub
}

extract_bare_dates <- function(calendar) {
  dplyr::select(calendar, cal_id, date)
}

extract_cal_key <- function(calendar) {
  dplyr::select(calendar, cal_key, date)
}

check_links_cal <- function(cal, links, type, assertion = FALSE) {
  link_key_col <- prefix_col("key", type, TRUE)
  t_name <- ifelse(type == "class", "reading", type)
  cal_keys <- cal$cal_key %>% purrr::discard(is.na)
  cal_ids <- cal$cal_id %>% purrr::discard(is.na)
  link_keys <- links[[link_key_col]] %>% purrr::discard(is.na)
  link_ids <- links$cal_id %>% purrr::discard(is.na)

  cal_only_keys <- setdiff(cal_keys, link_keys)
  links_only_keys <- setdiff(link_keys, cal_keys)
  cal_only_ids <- setdiff(cal_ids, link_ids)
  links_only_ids <- setdiff(link_ids, cal_ids)

  msg <- character(0)

  if (length(cal_only_keys) > 0) {
    this_msg <- stringr::str_c("Missing ", t_name, " links for cal keys: (",
                               stringr::str_c(cal_only_keys, collapse = ", "),
                               ")")
    msg <- c(msg, this_msg)
  }

  if (length(cal_only_ids) > 0) {
    this_msg <- stringr::str_c("Missing ", t_name, " links for cal_ids: (",
                               stringr::str_c(cal_only_ids, collapse = ", "),
                               ")")
    msg <- c(msg, this_msg)
  }

  if (length(links_only_ids) > 0) {
    this_msg <- stringr::str_c("Links for ", t_name,
                               " without cal entries for cal_ids: (",
                               stringr::str_c(links_only_ids, collapse = ", "),
                               ")")
    msg <- c(msg, this_msg)
  }

  if (length(msg > 0)) {
    msg <- stringr::str_c(msg, collapse = "; ")
    if (assertion) {
      stop(msg)
    } else {
      warning(msg)
    }
  }

  purrr::map_lgl(list(cal_only_ids = cal_only_ids,
                      cal_only_keys = cal_only_keys,
                      links_only_ids = links_only_ids,
                      links_only_keys = links_only_keys),
                 ~length(.x) > 0)
}

check_links_asgt <- function(links, asgt, type, assertion = FALSE) {
  key_col <- prefix_col("key", type, TRUE)
  t_name <- ifelse(type == "class", "reading", type)
  asgt_keys <- asgt[[key_col]] %>% purrr::discard(is.na)
  link_keys <- links[[key_col]] %>% purrr::discard(is.na)

  asgt_only <- setdiff(asgt_keys, link_keys)
  links_only <- setdiff(link_keys, asgt_keys)

  msg <- character(0)

  if (length(links_only) > 0) {
    this_msg <- stringr::str_c("Links for ", t_name, " without assignments: (",
                               stringr::str_c(links_only, collapse = ", "),
                               ")")
    msg <- c(msg, this_msg)
  }

  if (length(msg > 0)) {
    msg <- stringr::str_c(msg, collapse = "; ")
    if (assertion) {
      stop(msg)
    } else {
      warning(msg)
    }
  }

  purrr::map_lgl(list(asgt_only = asgt_only, links_only = links_only),
                 ~length(.x) > 0)
}

check_asgt <- function(asgt, items, type, assertion = FALSE) {
  key_col <- prefix_col("key", type, TRUE)
  t_name <- ifelse(type == "class", "reading", type)
  asgt_keys <- asgt[[key_col]] %>% purrr::discard(is.na)
  item_keys <- items[[key_col]] %>% purrr::discard(is.na)

  asgt_only <- setdiff(asgt_keys, item_keys)
  items_only <- setdiff(item_keys, asgt_keys)

  msg <- character(0)

  if (length(asgt_only) > 0) {
    this_msg <- stringr::str_c("Assignments for ", t_name, " without items: (",
                               stringr::str_c(asgt_only, collapse = ", "), ")")
    msg <- c(msg, this_msg)
  }

  if (length(msg > 0)) {
    msg <- stringr::str_c(msg, collapse = "; ")
    if (assertion) {
      stop(msg)
    } else {
      warning(msg)
    }
  }

  purrr::map_lgl(list(asgt_only = asgt_only, items_only = items_only),
                 ~length(.x) > 0)
}

renumber_cal <- function(cal, type) {
  metadata <- get_semestr_metadata()
  qnum_col <- make_qpcol("num", type, FALSE)
  base <- type2base(type)
  mod_cancelled <- metadata$mods_tbl['cancelled']
  mod_make_up   <- metadata$mots_tbl['make_up']

  cal <- cal %>%
    dplyr::arrange(date, cal_type, cal_id, cancelled, desc(make_up)) %>%
    dplyr::mutate(
      !!qnum_col := seq_along(cal_id),
      cal_id = base + !!qnum_col + ifelse(cancelled, mod_cancelled,
                                         ifelse(make_up, mod_make_up, 0))
    ) %>%
    dplyr::distinct()
  cal
}

renumber_links <- function(links, cal, type) {
  qnum_col  <- make_qpcol("num", type, FALSE)
  qkey_col <- make_qpcol("key", type, TRUE)
  key_col  <- as_label(qkey_col)

  bare_cal <- dplyr::select(cal, cal_id, !!qkey_col := cal_key, !!qnum_col)

  links <- dplyr::select(links, key_col) %>%
    dplyr::left_join(bare_cal, by = key_col) %>%
    dplyr::select(cal_id, !!qkey_col, !!qnum_col) %>%
    dplyr::distinct()
  links
}

calc_link_levels <- function(items, links, type) {
  qnum_col  <- make_qpcol("num", type, FALSE)
  qkey_col  <- make_qpcol("key", type, TRUE)
  key_col   <- as_label(qkey_col)

  link_levels <- unique(links[[key_col]])
  item_levels <- unique(items[[key_col]])

  all_levels <- unique( c(link_levels, item_levels) )
  n_levels <- length(all_levels)

  df <- links %>% dplyr::arrange(!!qnum_col) %>%
    dplyr::transmute(!!qkey_col, idx = !!qnum_col * 100L)

  extra_levels <- setdiff(item_levels, link_levels)
  df_extra <- tibble::tibble(!!qkey_col := extra_levels,
                             idx = seq_along(extra_levels) * 100L + 10000L)

  df <- dplyr::bind_rows(df, df_extra)
  levels <- purrr::set_names(df$idx, df[[key_col]])
  levels
}

renumber_items <- function(items, links, type) {
  qitem_col <- make_qpcol("item_id", type, TRUE)
  qkey_col  <- make_qpcol("key", type, TRUE)

  levels <- calc_link_levels(items, links, type)

  items <- items %>%
    dplyr::mutate( item_order_ = !!qitem_col %% 100L,
                  !!qitem_col := item_order_ + levels[!!qkey_col] ) %>%
    dplyr::select( - item_order_ ) %>%
    dplyr::distinct() %>%
    dplyr::arrange(!!qitem_col)

  items
}

renumber_asgt <- function(asgt, items, links, type) {
  qid_col  <- make_qpcol("id", type, TRUE)
  qkey_col  <- make_qpcol("key", type, TRUE)
  key_col   <- as_label(qkey_col)

  levels <- calc_link_levels(items, links, type)

  asgt_keys <- unique(asgt[[key_col]])

  unmatched <- setdiff(asgt_keys, names(levels))
  msg <- stringr::str_c("Assignments for ", type,
                        " have keys that don't match links or items: (",
                        stringr::str_c(unmatched, collapse = ", "),
                        ").")

  if (! is_empty(unmatched)) {
    warning(msg)
    unmatched_levels <- purrr::set_names( seq_along(unmatched) + 100L,
                                          unmatched )
    levels <- c(levels, unmatched_levels)
  }

  asgt <- asgt %>%
    dplyr::mutate( !!qid_col := (levels[!!qkey_col]) %% 100 ) %>%
    dplyr::distinct() %>%
    dplyr::arrange(!!qid_col)

  asgt
}

reconcile_semester_db <- function(db_file, backup = TRUE, overwrite = FALSE,
                                  new_db_name = NULL, backup_db_name = NULL,
                                  dry_run = FALSE) {
  tz <- get_semestr_tz()

    if (is.null(new_db_name)) {
      new_db_name <- db_file
    }

    if (! overwrite && ! dry_run) {
      assertthat::assert_that(! file.exists(new_db_name),
                              msg = stringr::str_c("New database file ",
                                                   new_db_name,
                                                   " exists and overwrite is FALSE"))
    }

  if (backup && ! dry_run) {
    if (is.null(backup_db_name)) {
      db_dir <- dirname(db_file)
      db_base <- basename(db_file)
      db_ext <- stringr::str_extract(db_base, "\\.[A-Za-z0-9_\\-]+$")
      db_base <- stringr::str_replace(db_base, "\\.[A-Za-z0-9_\\-]+$", "")
      idx <- 0
      repeat {
        tmp <- stringr::str_c(db_base, "_bak")
        if (idx > 0) {
          tmp <- stringr::str_c(tmp, sprintf("%03d", idx))
        }
        tmp <- stringr::str_c(tmp, db_ext)
        backup_db_name <- file.path(db_dir, tmp)
        if (! file.exists(backup_db_name)) {
          break
        }
        idx <- idx + 1
      }
    }
    file.copy(db_file, backup_db_name, overwrite = TRUE,
              copy.mode = TRUE, copy.date = TRUE)
  }

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

  table_lst <- c("calendar",
                 "due_links",     "due_dates",
                 "rd_links",                   "rd_items",  "rd_src",  "class_topics",
                 "hw_links",      "hw_asgt",   "hw_items",  "hw_sol",  "hw_topics",
                 "lab_links",     "lab_asgt",  "lab_items", "lab_sol", # "lab_topics",
                 "exam_links",    "exams",
                 "holiday_links", "holidays",
                 "event_links",   "events",
                 "notices",
                 "text_codes")

  for (t in table_lst) {
    df <- dplyr::tbl(db, t) %>% dplyr::collect() %>% dplyr::distinct()
    assign(t, df)
  }

  DBI::dbDisconnect(db)

  calendar <- calendar %>%
    dplyr::select(cal_id, date, cal_key, cal_type, cancelled, make_up) %>%
    dplyr::mutate(date = lubridate::as_datetime(date, tz = tz),
                  cal_id = as.integer(cal_id))

  for (df_n in c("rd_links", "hw_links", "lab_links", "due_links",
                 "exam_links", "holiday_links", "event_links")) {
    df <- get(df_n)
    df <- dplyr::mutate(df, cal_id = as.integer(cal_id))
    assign(df_n, df)
  }

  bare_dates <- calendar %>% dplyr::select(cal_id, date)

  cal_class   <- calendar %>% subcal("class")
  cal_hw      <- calendar %>% subcal("homework")
  cal_lab     <- calendar %>% subcal("lab")
  cal_due     <- calendar %>% subcal("due date")
  cal_exam    <- calendar %>% subcal("exam")
  cal_holiday <- calendar %>% subcal("holiday")
  cal_event   <- calendar %>% subcal("event")

  check_links_cal(cal_class,   rd_links,      "class",    FALSE)
  check_links_cal(cal_hw,      hw_links,      "homework", TRUE)
  check_links_cal(cal_lab,     lab_links,     "lab",      TRUE)
  check_links_cal(cal_due,     due_links,     "due date", TRUE)
  check_links_cal(cal_exam,    exam_links,    "exam",     TRUE)
  check_links_cal(cal_holiday, holiday_links, "holiday",  TRUE)
  check_links_cal(cal_event,   event_links,   "event",    TRUE)

  check_links_asgt(hw_links,      hw_asgt,  "homework", TRUE)
  check_links_asgt(lab_links,     lab_asgt, "lab",      TRUE)
  check_links_asgt(exam_links,    exams,    "exam",     TRUE)
  check_links_asgt(holiday_links, holidays, "holiday",  TRUE)
  check_links_asgt(event_links,   events,   "event",    TRUE)

  check_asgt(rd_links, rd_items,            "class",    FALSE)
  check_asgt(hw_asgt, hw_items,             "homework", TRUE)
  check_asgt(lab_asgt, lab_items,           "lab",      FALSE)

  cal_class <- renumber_cal(  cal_class,                       "class")
  rd_links  <- renumber_links(rd_links,  cal_class,            "class")
  rd_items  <- renumber_items(rd_items,  rd_links,             "class")

  cal_hw    <- renumber_cal(  cal_hw,                          "homework")
  hw_links  <- renumber_links(hw_links,  cal_hw,               "homework")
  hw_items  <- renumber_items(hw_items,  hw_links,             "homework")
  hw_asgt   <- renumber_asgt( hw_asgt,   hw_items,  hw_links,  "homework")

  cal_lab   <- renumber_cal(  cal_lab,                         "lab")
  lab_links <- renumber_links(lab_links, cal_lab,              "lab")
  lab_items <- renumber_items(lab_items, lab_links,            "lab")
  lab_asgt  <- renumber_asgt( lab_asgt,  lab_items, lab_links, "lab")

  cal_due       <- renumber_cal(  cal_due,                     "due date")
  due_links     <- renumber_links(due_links,     cal_due,      "due date")

  cal_exam      <- renumber_cal(  cal_exam,                    "exam")
  exam_links    <- renumber_links(exam_links,    cal_exam,     "exam")

  cal_holiday   <- renumber_cal(  cal_holiday,                 "holiday")
  holiday_links <- renumber_links(holiday_links, cal_holiday,  "holiday")

  cal_event     <- renumber_cal(  cal_event,                   "event")
  event_links   <- renumber_links(event_links,   cal_event,    "event")

  cal_class   <- cal_class   %>% add_key_prefix("class")
  cal_hw      <- cal_hw      %>% add_key_prefix("homework")
  cal_lab     <- cal_lab     %>% add_key_prefix("lab")
  cal_due     <- cal_due     %>% add_key_prefix("due date")
  cal_exam    <- cal_exam    %>% add_key_prefix("exam")
  cal_holiday <- cal_holiday %>% add_key_prefix("holiday")
  cal_event   <- cal_event   %>% add_key_prefix("event")

  calendar <- dplyr::bind_rows(cal_class, cal_hw, cal_lab, cal_due, cal_exam,
                          cal_holiday, cal_event) %>%
    dplyr::arrange(date, cal_id) %>%
    dplyr::mutate(week = 1 + (class_num - 1) %/% 3) %>%
    dplyr::select(cal_id, date, cal_key, cal_type, class_num, week,
                  cancelled, make_up, dplyr::everything())


  metadata <- md_1
  base_mods <- md_2
  frames <- c(table_lst, "metadata", "base_mods")

  ret_vals <- list()
  for (df_n in frames) {
    df <- get(df_n)
    ret_vals[[df_n]] <- df
  }


  if (! dry_run) {
    db <- DBI::dbConnect(RSQLite::SQLite(), new_db_name,
                         flags = RSQLite::SQLITE_RWC)
    on.exit(if (DBI::dbIsValid(db)) DBI::dbDisconnect(db))

    for (df_n in frames) {
      df <- get(df_n)
      dplyr::copy_to(db, df = df, name = df_n,
                     overwrite = TRUE, temporary = FALSE)
    }

    DBI::dbDisconnect(db)
  }

  invisible(ret_vals)
}
