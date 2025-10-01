# CLEANING THE RDS DATA FROM IENROL & OUR TRAINING SPREADSHEET

# Function to load or install packages
load_or_install <- function(packages) {
  for (package in packages) {
    if (!require(package, character.only = TRUE)) {
      install.packages(package, dependencies = TRUE)
      library(package, character.only = TRUE)
    }
  }
}

# Required packages 
packages <- c("here"
              , "tidyverse"
              , "readxl"
              , "janitor"
)

# Load or install the packages
load_or_install(packages)


# load data from training spreadsheet

df_sp <- read_xlsx(
  here::here("data",
             "RDS",
             "2025_spreadsheet_data.xlsx"),
  sheet = '2025 Program',
  skip = 5, #start at the header row
  n_max = 94,  #last session was DP EOI
  .name_repair = "unique",
  trim_ws = TRUE)

# load data from ienrol (this contains names of Flinders attendees & includes college/portfolio info)

df_ienrol <- read_csv(here::here("data", "RDS", "2025_ienrol_data.csv"), lazy = FALSE) %>% 
  clean_names()
