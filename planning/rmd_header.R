strip_year <- function(x) {
  stringr::str_replace_all(x, ",? +[0-9]{4}","")
}

grab_header <- function(f, buflines = 20) {
  started <- FALSE
  finished <- FALSE
  index <- 0
  buffer <- c()
  while(! finished) {
    buffer <- c(buffer, readLines(f, n = buflines))
    matches <- stringr::str_detect(buffer, '^---')
    if (! started) {
      if (any(matches)) {
        i_start <- min(which(matches))
        started <- TRUE
      } else {
        next
      }
    }
    if (started) {
      if (any(matches[-(1:i_start)])) {
        i_finish <- i_start + min(which(matches[-(1:i_start)]))
        finished <- TRUE
      }
    }
  }
  buffer <- buffer[(i_start + 1):(i_finish - 1)]
  yaml::yaml.load(stringr::str_c(buffer, collapse='\n'))
}
