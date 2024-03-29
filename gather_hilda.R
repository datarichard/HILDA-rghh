gather_hilda <- function(.data, .codes) {
  
  # This function takes a list of hilda dataframes (1 for each wave) and hilda
  # variable codes, and returns a tibble in long format of all records, with the 
  # hilda code, xwaveid, waveid, and variable value. 
  
  require(dplyr)
  require(haven)
  
  for (df in .data) { # for every wave
    waveid <- substr(colnames(df)[2],1,1) # get the waveid (a, b, c, ..p)
    wave.codes <- paste0(waveid, .codes) # update the variable codes
    wave.codes <- c('xwaveid', wave.codes) # add xwaveid to track individuals
    
    
    col.index <- which(colnames(df) %in% wave.codes) # find the column number
    df.vars <- df[, col.index] # get the columns

    df.vars %<>% # remove attributes to avoid a warning
      mutate(across(everything(), as.vector)) %>% # remove attributes 
      gather(code, val, -xwaveid) %>% 
      mutate(wave = waveid) 
      
    
    if (exists('df.long')) {
      df.long <- suppressWarnings(bind_rows(df.long, df.vars))
      
    } else {
      df.long <- df.vars
      
    }
      
  }
  
  
  # remove waveid from codes
  df.long %<>%
    filter(!is.na(code)) %>%
    mutate_at('code', list(~substring(code, 2, nchar(code)))) 

  
  return(df.long)
  
}