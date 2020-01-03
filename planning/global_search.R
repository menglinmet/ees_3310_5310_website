global_search <- function(df_lst, pattern) {
  hit_list <- list()
  for (nm in names(df_lst)) {
    df = df_lst[[nm]]
    if (is.data.frame(df)) {
      hits <- df %>%
        dplyr::filter_if(is.character,
                         dplyr::any_vars(stringr::str_detect(., pattern)))
      if (nrow(hits) > 0) {
        hit_list[[nm]] <- hits
      }
    }
  }
  hit_list
}

col_search <- function(df, pattern) {
  df %>% mutate_if(is.character, ~ifelse(str_detect(., pattern), "HIT", ""))
}



col_search_sum <- function(df, pattern) {
  df %>% summarize_if(is.character, ~sum(str_detect(., pattern)))
}


global_col_search <- function(df_lst, pattern) {
  global_search(df_lst, pattern) %>%
    purrr::map(~col_search(.x, pattern))
}

global_col_search_sum <- function(df_lst, pattern) {
  global_search(df_lst, pattern) %>%
    purrr::map(~col_search_sum(.x, pattern))
}


global_replace <- function(df_lst, pattern, replacement) {
  for (nm in names(df_lst)) {
    df = df_lst[[nm]]
    if (is.data.frame(df)) {
      df <- df %>%
        dplyr::mutate_if(is.character,
                         funs(stringr::str_replace_all(., pattern,
                                                       replacement)))
      hit_list[[nm]] <- df
    }
  }
  hit_list
}
