# ============================================================================================
# FGV Cidades: CEUs
# ============================================================================================
# @Goal: Download the schools data (CSV) for the city of São Paulo
#
# @Description: This script downloads a CSV file from the Prefeitura de São Paulo’s open data
# portal, containing information about schools in the city, and stores it in the project's 
# data/raw/schools folder for further analysis.
#
# @Summary: This program performs the following steps:
#   I.   Set up environment (libraries, directories)
#   II.  Download the CSV file from the specified URL
#   III. Verify and finalize (optional read to confirm structure)
#
# @Date: Jan 2025
# @Author: Marcos Paulo
# ============================================================================================

# ============================================================================================
# I: Import data and set up environment
# ============================================================================================
# Get all libraries and functions
source(here::here("src", "config", "config_utils.R"))

# Create the output directory if it doesn't already exist
output_dir <- here::here("data", "raw", "schools")
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# ============================================================================================
# II: Download the CSV file
# ============================================================================================
# Define the URL for the schools data
url_schools_data <- paste0(
  "http://dados.prefeitura.sp.gov.br/dataset/8da55b0e-b385-4b54-9296-d0000014ddd5/",
  "resource/533188c6-1949-4976-ac4e-acd313415cd1/download/escolas122024.csv"
)

# Define the local file path where the CSV will be saved
local_file <- file.path(output_dir, "schools_2024.csv")

# Download the file
download.file(
  url      = url_schools_data,
  destfile = local_file,
  mode     = "wb"  # 'wb' is generally safer for all file types
)
