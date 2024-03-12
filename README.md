# HILDA-rghh
Convenience functions and wrappers for working with the HILDA dataset in R and python  

A suggested workflow for R is:  

Import the HILDA data and store it in a list  

```
library(tidyverse)
library(haven)
source("gather_hilda.R") # Helper function


# Find the STATA files (.dta)
path_to_hilda_files <- "~/Documents/HILDA/data"

path_to_hilda <- list.files(
  path = path_to_hilda_files,
  pattern = '^Combined.*.dta$',
  full.names = TRUE
)

# Load the data
hilda <- list() # initialise a list to store waves

for (pathtofile in path_to_hilda) {
  df <- read_dta(pathtofile)
  hilda <- append(hilda, list(df))
  cat('.')
}
```



  
Then use `gather_hilda` to extract the variables you need. The .codes argument takes a character vector of HILDA codes available at the [online data dictionary](https://hildaodd.app.unimelb.edu.au/srchVarnameUsingCategoriesCrossWave.aspx)  
```
# Gather the sex and MHI-5 scores for each person for each year in a long dataframe
mhi5 <- gather_hilda(.datalist = hilda, .codes = c("hgsex", "ghmh"))) %>%
  spread(code, val)
```

```
> mhi5
# A tibble: 116,404 × 4
   xwaveid wave   ghmh hgsex
   <chr>   <chr> <dbl> <dbl>
 1 0100003 p        -8     1
 2 0100003 q        -8     1
 3 0100003 r        76     1
 4 0100003 s        84     1
 5 0100003 t        72     1
 6 0100005 p        -8     2
 7 0100005 q        -8     2
 8 0100005 r        -8     2
 9 0100005 s        80     2
10 0100005 t        80     2
# ℹ 116,394 more rows
```
  

Recode the wave as a numeric year variable
```
rowwise(mhi5) %>%
  mutate(year = which(letters == wave) + 2000) %>%
  ungroup()

# A tibble: 116,404 × 5
   xwaveid wave   ghmh hgsex  year
   <chr>   <chr> <dbl> <dbl> <dbl>
 1 0100003 p        -8     1  2016
 2 0100003 q        -8     1  2017
 3 0100003 r        76     1  2018
 4 0100003 s        84     1  2019
 5 0100003 t        72     1  2020
 6 0100005 p        -8     2  2016
 7 0100005 q        -8     2  2017
 8 0100005 r        -8     2  2018
 9 0100005 s        80     2  2019
10 0100005 t        80     2  2020
# ℹ 116,394 more rows
```



For a better HILDA package option see:  

https://github.com/asiripanich/hildar  


