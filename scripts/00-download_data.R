#### Preamble ####
# Purpose: Scrape Australian PM Data from  from https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Australia
# Authors: Francesca Ye
# Date: 27 February 2024
# Pre-requisites: None

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

#### Read and Write Raw Data ####
# All code referenced from "https://tellingstorieswithdata.com/07-gather.html#prime-ministers-of-the-united-kingdom"

raw_apm_data <-
  read_html("https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Australia")

write_html(raw_apm_data, "~/aus_pm_lifespan/inputs/data/raw_apms.html")

# Set saved version to the variable
raw_apm_data <- read_html("raw_apms.html")
