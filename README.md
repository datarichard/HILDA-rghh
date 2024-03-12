# HILDA-rghh
Convenience functions and wrappers for working with the HILDA dataset in R and python  

A suggested workflow is:  

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

For a better HILDA package option see:  

https://github.com/asiripanich/hildar  


