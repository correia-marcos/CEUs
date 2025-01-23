# ============================================================================================
# FGV Cidades: CEUs
# ============================================================================================
# @Goal: Download the IBGE Malha de Distritos file for São Paulo
#
# @Description: This script downloads the GPKG file containing district boundaries
# (Malha de Distritos) from the IBGE FTP server and stores it in the project's 
# data/raw/malhas_distritos folder for further spatial analysis.
#
# @Summary: This program performs the following steps:
#   I.   Set up environment (libraries, directories)
#   II.  Download the GPKG file from the specified URL
#   III. Verify and finalize the downloaded file
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
output_dir <- here::here("data", "raw", "malhas_distritos")
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# ============================================================================================
# II: Process and save data
# ============================================================================================
# Define the URL for the IBGE Malha de Distritos file
url_malha_distritos <- paste0(
  "https://geoftp.ibge.gov.br/organizacao_do_territorio/",
  "malhas_territoriais/malhas_de_setores_censitarios__divisoes_intramunicipais/",
  "censo_2022/distritos/gpkg/UF/SP/SP_distritos_CD2022.gpkg"
)

# Define the local file path where the GPKG will be saved
local_file <- file.path(output_dir, "SP_distritos_CD2022.gpkg")

# Download the file
download.file(
  url      = url_malha_distritos,
  destfile = local_file,
  mode     = "wb"  # 'wb' is important for binary files (like GPKG)
)