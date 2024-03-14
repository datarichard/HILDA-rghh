#### Life events and mental health ####
# Author: R Morris
# Date updated: 14/03/24
# 
# This script imports the HILDA data and then gathers the life events for each 
# person (xwaveid) for each year (wave) in a long dataframe.  
# 
# MHI-5 scores are also gathered, and then the average level of mental health is
# plotted over the peri-stimulus time (PST) for each event.  

#### Setup ####
library(tidyverse)
library(haven)
library(patchwork)

path_to_hilda_files <- "~/Dropbox (Sydney Uni)/HILDA/data"

# Helper functions
source("gather_hilda.R")
source("gather_event.R")




#### Load data ####
path_to_hilda <- list.files(
  path = path_to_hilda_files,
  pattern = '^Combined.*.dta$',
  full.names = TRUE
)


hilda <- list()
for (pathtofile in path_to_hilda[1:20]) { # [16:20] for testing
  df <- read_dta(pathtofile)
  hilda <- append(hilda, list(df))
  cat('.')
}






#### Preprocessing ####

# Select the worst events (death of spouse, bankruptcy, divorce)
worst_events = c("ledsc", "lefnw", "lesep")
names(worst_events) = c("ledsc", "lefnw", "lesep") # add names for indexing

# Extract the timing of each event for each person in each year, in a list of 
# dataframes, with one event per dataframe
event_years <- map(.x = worst_events,
                   .f = ~gather_event(.x)) 


# Gather the MHI-5 scores for each person for each year in a long dataframe
mhi5 <- gather_hilda(hilda, c("ghmh")) %>% 
  select(xwaveid, wave, mhi5 = val) %>%
  rowwise() %>%
  mutate(year = which(letters == wave) + 2000) %>%
  ungroup()

join_pst <- function(.x, .df) {
  
  # > .df
  # A tibble: 116,404 × 4
  #    xwaveid wave   mhi5  year
  #    <chr>   <chr> <dbl> <dbl>
  # 1  0100003 p        -8  2016
  # 2  0100005 p        -8  2016
  # 3  0100006 p        68  2016
  # 4  0100010 p        88  2016
  # 5  0100014 p        76  2016
  # 6  0100015 p        40  2016
  # 7  0100016 p        72  2016
  # 8  0100018 p        56  2016
  # 9  0100019 p        80  2016
  # 10 0100020 p        32  2016
  # # ℹ 116,394 more rows
  
  rowwise(.x) %>%
    mutate(eventyear = which(letters == wave) + 2000) %>%
    ungroup() %>%
    right_join(.df, by = join_by(xwaveid, wave)) %>%
    arrange(xwaveid, wave) %>%
    group_by(xwaveid) %>%
    filter(!all(is.na(month))) %>%
    mutate(
      total = sum(!is.na(month)),
      cumul = cumsum(!is.na(month)),
      year_before = eventyear,
      year_after = eventyear
    ) %>%
    fill(year_before, .direction = "up") %>%
    fill(year_after, .direction = "down") %>%
    ungroup() %>%
    mutate(
      year_before = year - year_before,
      year_after = year - year_after,
      pst = case_when(
        year_after == 0 ~ month,         # paste0(month),
        year_after > 0  ~ year_after*12, # paste0("+", year_after*12, " mo"),
        TRUE            ~ year_before*12 # paste(year_before*12, "mo")
    )) %>%
    filter(between(pst, -24, 24)) %>%
    select(-month, -eventyear, -year_before, -year_after)
  
}

# Join MHI5 scores with the life events
event_pst <- map(.x = event_years,
    .f = ~join_pst(.x, .df = mhi5)) 

  
# Count the sample stratified by event, timepoint and total events
map(event_pst, 
    .f = ~{.x %>%
        count(total, pst) %>%
        spread(pst, n, fill = 0)}) 




#### Results ####

map2(.x = event_pst, .y = names(event_pst),
    .f = ~{
      .x %>%
        filter(mhi5 > 0) %>%
         mutate(total = case_when(
          total == 1 ~ "1",
          total == 2 ~ "2",
          total > 2  ~ "3+"
        )) %>%
        ggplot(aes(x = pst, y = mhi5)) +
          geom_smooth(method = "loess", formula = 'y ~ x') +
          facet_wrap(~total, ncol = 1, scales = "free_y") +
          labs(subtitle = .y, y = "")
      }) %>%
  wrap_plots()




#### Appendix (Not run) ####

lefnw <- event_years$lefnw %>%
  rowwise() %>%
  mutate(eventyear = which(letters == wave) + 2000) %>%
  ungroup()


right_join(lefnw, mhi5) %>%
  arrange(xwaveid, wave) %>%
  group_by(xwaveid) %>%
  filter(!all(is.na(month))) %>%
  mutate(
    total = sum(!is.na(month)),
    cumul = cumsum(!is.na(month)),
    year_before = eventyear,
    year_after = eventyear
    ) %>%
  fill(year_before, .direction = "up") %>%
  fill(year_after, .direction = "down") %>%
  ungroup() %>%
  mutate(
    year_before = year - year_before,
    year_after = year - year_after) %>%
  mutate(
    pst = case_when(
      year_after == 0 ~ month,         # paste0(month),
      year_after > 0  ~ year_after*12, # paste0("+", year_after*12, " mo"),
      TRUE            ~ year_before*12 # paste(year_before*12, "mo")
    )
  ) %>%
  select(-month, -eventyear, -year_before, -year_after) %>%
  count(pst) %>%
  filter(between( pst, -36, 36))



