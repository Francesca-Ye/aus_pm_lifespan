## Overview

This repository scrapes data from Wikipedia on the lifespan of all Australian Prime Ministers. It creates a table outlining each Prime Minister's birth year, death year, and age at death in addition to a timeline graph.

## File Structure

This repo is structured by:

-   `input/data` which contains the raw data scraped from Wikipedia used to create the table and graph.
-   `outputs/data` which contains the cleaned data set used to generate the table and graph.
-   `outputs/paper` which contains the files used to generate the paper, including the Quarto document, reference bibliography file and PDF of the paper.
-   `scripts` which contain the R scripts used to download and clean data.

## How to Run

1.  Run `scripts/00-download_data.R` to download the raw data sets
2.  Run `scripts/01-clean_data.R` to generate the cleaned data sets
3.  Run `outputs/paper.qmd` to generate the PDF of the paper

## Statement on LLM Usage

No aspects of the code or text utilized LLMs in their creation. Code references are cited in the paper or commented above inspired lines with a link. 
