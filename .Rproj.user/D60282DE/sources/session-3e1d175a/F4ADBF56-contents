#### Preamble ####
# Purpose: Clean Australian PM Data from "raw_apms.html"
# Authors: Francesca Ye
# Date: 27 February 2024
# Pre-requisites: Access to "raw_apms.html"

#### Work space set-up ####

# Load packages
library(rvest)
library(xml2)
library(dplyr)
library(janitor)
library(tidyr)
library(stringr)
library(knitr)
library(ggplot2)
library(retroharmonize)

#### Clean data ####
# All code referenced from "https://tellingstorieswithdata.com/07-gather.html#prime-ministers-of-the-united-kingdom"

# Select table and clean column names
parse_data_selector_gadget <-
  raw_apm_data |>
  html_element(".wikitable") |>
  html_table() |>
  clean_names()

# Select specific column
parsed_data <-
  parse_data_selector_gadget |> 
  rename(raw_text = name_birth_death_constituency) |> 
  select(raw_text) |> 
  filter(raw_text != "Name(Birth–Death)Constituency") |> 
  distinct() 

#### Clean data ####

# Separate names and lifespan dates
initial_clean <-
  parsed_data |>
  separate(
    raw_text, into = c("name", "not_name"), sep = "\\(", extra = "merge",
  ) |> 
  mutate(date = str_extract(not_name, "[[:digit:]]{4}–[[:digit:]]{4}"),
         born = str_extract(not_name, "b.[[:space:]][[:digit:]]{4}")
  ) |>
  select(name, date, born)

# Clean columns to provide all information

cleaned_data <-
  initial_clean |>
  separate(date, into = c("birth", "died"), 
           sep = "–") |>
  mutate(
    born = str_remove_all(born, "b."),
    birth = if_else(!is.na(born), born, birth)
  ) |> # Alive PMs format
  select(-born) |>
  rename(born = birth) |> 
  mutate(across(c(born, died), as.integer)) |> 
  mutate(Age_at_Death = died - born) |> 
  distinct() # Remove PMs with multiple terms

write.csv(
  x = cleaned_data,
  file = "~/aus_pm_lifespan/outputs/data/00-cleaned_aus_pm_data.csv"
)
