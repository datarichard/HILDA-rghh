#### Gather Events ####
#
# A function to gather the year and quarter of each life event for each person
# in each wave. The life events are collected in the SCQ, which is given to 
# every person who completes a PQ. 
gather_event <- function(eventcode) {
  
  codeq <- paste0(eventcode, 'q', seq(4))
  
  df <- gather_hilda(hilda, c(eventcode, codeq)) %>%
    spread(key = code, value = val) %>%
    
    # remove missing values
    mutate_at(eventcode, list(~case_when(. < 0 ~ NA_real_, 
                                         TRUE ~ as.numeric(.)))) %>%
    mutate_at(eventcode, list(~ . - 1)) %>%
    mutate_at(codeq, list(~case_when(. < 0 ~ NA_real_,
                                     TRUE ~ as.numeric(.)))) %>% 
    
    # select the people who experienced the event at least once
    mutate(rowsums = rowSums(.[3:7], na.rm = TRUE)) %>%
    filter(rowsums > 0) %>% 
    select(-rowsums)
  
  # rename the columns for legibility
  colnames(df) <- c("xwaveid", "wave", "annual", "post03",
                    "post06", "post09", "post12", "event_year")
  
  month_key <- c(
    post03 = 0, # "+00 mo", # "+00-3 mo",
    post06 = 4, # "+04 mo", # "+04-6 mo",
    post09 = 7, # "+07 mo", # "+07-9 mo",
    post12 = 10 # "+10 mo"  # "+10-12 mo"
  )
  
  # create a long data frame
  df %>%
    mutate(post12 = ifelse(rowSums(.[4:7]) == 0, 1, post12)) %>%
    select(-annual) %>%
    gather(month, val, post03:post12) %>%
    filter(val > 0) %>%
    select(-val) %>%
    mutate(month = recode(month, !!!month_key)) -> df
  
  return(df)
}

# For reference, the date of the PQ is `hhidate` and the date the SCQ is 
# completed is `scdate` (Wave 9 onwards only).