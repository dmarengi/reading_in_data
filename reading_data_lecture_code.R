# ############################################################################ #
# COURSE:  ID 529 
# LECTURE: Reading in data using R - case studies
# INPUTS:  newstudy.txt; exercise.xlsx
# AUTHORS: Dean A. Marengi, Jr.
# CREATED: 01/08/2024
# LATEST:  01/09/2024
# NOTES:   
# ############################################################################ #

# SET UP ------------------------------------------------------------------
# Install packages (if you have not already installed them)
# library(tidyverse) # Includes 'readr' package
# library(readxl)    # For importing excel files (xlsx, xls)
# library(haven)     # For importing statistical software files (.dta, .sas7bdat, etc.)    

# Load packages 
library(tidyverse)
library(readxl)
library(haven)

# CASE STUDY 1 ------------------------------------------------------------
# Read in the fixed with data file without providing any additional details
data <- read_fwf("data/newstudy.txt")

# Print the data in your console
data 

# Another way to print/view data in your console
glimpse(data) 

# Step 1: Create a vector of column widths (from left to right; ncol = 9)
col_widths <- c(5, 2, 2, 1, 2, 5, 5, 3, 3)

# Step 2: Create a vector of column names (as in step 1, from left to right; ncol = 9)
col_names <- c("id", "age", "edu", "smoke", "cigs", "sbp", "dbp", "chol", "glucose")

# Step 3: Read in the data, specifying column names and widths
data <- read_fwf("data/newstudy.txt", fwf_widths(widths = col_widths, col_names = col_names))

# Print the data
data 

# CASE STUDY 2 ------------------------------------------------------------
# Read in the xlsx file
data <- read_xlsx("data/exercise.xlsx")

# Look at the data
data
glimpse(data)

# Read in the data
# skip = 3 skips the first 3 rows (start reading on 4th row, which includes column names)
# [-1,] drops the first row of data which, here, are text describing units for the column
data <- read_xlsx("data/exercise.xlsx", skip = 3)[-1,]

# Look at the data
data
glimpse(data)

# Coerce all but the time column to a numeric data type
data[2:11] <- sapply(data[2:11], as.numeric)

# Standardize the column names (all lower case)
colnames(data) <- tolower(colnames(data))

# Print the data
data
