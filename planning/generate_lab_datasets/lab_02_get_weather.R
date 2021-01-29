library(tidyverse)
library(lubridate)
library(rnoaa)

data_path <- "data"

read_year <- function(station, year) {
  limit = 1000L
  offset = 1L
  start <- str_c(year, "-01-01")
  end <- str_c(year,"-12-31")
  foo <- ncdc(stationid = station, dataset = "GHCND", startdate = start, enddate = end,
              limit = limit, offset = offset)
  n_rec <- foo$meta$totalCount
  data <- foo$data
  index <- nrow(data)
  while(index < n_rec) {
    bar <- ncdc(stationid = station, dataset = "GHCND", startdate = start, enddate = end,
                limit = limit, offset = 1 + index)
    data <- bind_rows(data, bar$data)
    index <- nrow(data)
    message("Index = ", index)
  }
  invisible(data)
}

read_years <- function(station, start_year, end_year) {
  data <- tibble()
  for (year in seq(start_year, end_year)) {
    message("Getting data for ", year)
    tmp <- read_year(station, year)
    data <- bind_rows(data, tmp)
  }
  invisible(data)
}

chicago_fips <- fipscodes %>% filter(state == "Illinois", county == "Cook") %>%
  pull(fips)

chicago_stations <- ncdc_stations(datasetid = "GHCND", datacategoryid = "TEMP",
                                  locationid= str_c("FIPS:", chicago_fips))
chi_midway <- chicago_stations$data %>%
  mutate(rec_len = ymd(maxdate) - ymd(mindate)) %>%
  arrange(desc(rec_len)) %>%
  filter(maxdate > "2021-01-01") %>%
  head(1)
chi_id <- chi_midway$id

nashville_fips <- fipscodes %>%
  filter(state == "Tennessee", county == "Davidson") %>%
  pull(fips)

nashville_stations <- ncdc_stations(datasetid = "GHCND", datacategoryid = "TEMP",
                                  locationid= str_c("FIPS:", nashville_fips))
nash_bna <- nashville_stations$data %>%
  mutate(rec_len = ymd(maxdate) - ymd(mindate)) %>%
  arrange(desc(rec_len)) %>%
  filter(maxdate > "2021-01-01") %>%
  head(1)
nash_id <- nash_bna$id

if (! dir.exists(data_path)) {
  dir.create(data_path, recursive = TRUE)
  file.create(file.path(data_path, ".gitkeep"))
}

nashville_weather <- read_years(nash_id, 1950, 2020)
chicago_weather <- read_years(chi_id, 1950, 2020)

nash_wx <- nashville_weather %>%
  mutate(date = as_date(ymd_hms(date)),
         id = str_replace(station, "^GHCND:", ""), location = "Nashville, TN",
         datatype = str_to_lower(datatype)) %>%
  filter(datatype %in% c("prcp", "tmax", "tmin")) %>%
  select(id, date, datatype, value, location) %>%
  pivot_wider(names_from = "datatype", values_from = "value") %>%
  relocate(prcp, tmin, tmax, .before = location)

chi_wx <- chicago_weather %>%
  mutate(date = as_date(ymd_hms(date)),
         id = str_replace(station, "^GHCND:", ""), location = "Chicago IL",
         datatype = str_to_lower(datatype)) %>%
  filter(datatype %in% c("prcp", "tmax", "tmin")) %>%
  select(id, date, datatype, value, location) %>%
  pivot_wider(names_from = "datatype", values_from = "value") %>%
  relocate(prcp, tmin, tmax, .before = location)

write_rds(nash_wx, file.path(data_path, "nashville_weather.Rds"))
write_rds(chi_wx, file.path(data_path, "chicago_weather.Rds"))

download.file("https://data.giss.nasa.gov/gistemp/tabledata_v4/ZonAnn.Ts+dSST.csv",
              file.path(data_dir, "ZonAnn.Ts+dSST.csv"))
giss_zonal = read_csv(file.path(data_path, "ZonAnn.Ts+dSST.csv")) %>%
  janitor::clean_names() %>%
  mutate(year = as.integer(year)) %>%
  select(year, x64n_90n, x44n_64n, x24n_44n, equ_24n,
               x24s_equ, x44s_24s, x64s_44s, x90s_64s)
write_rds(giss_zonal, file.path(data_path, "giss_zonal.Rds"))

