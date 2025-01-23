# ============================================================================================
# FGV Cidades: CEUs
# ============================================================================================
# @Goal: Create configuration file for setup of packages and functions used in the project
# 
# @Description: This script sets up the necessary environment by checking and installing 
# required packages and defining utility functions for all "plot_table" scripts.
# 
# @Date: Nov 2024
# @author: Marcos Paulo
# ============================================================================================

# List of necessary packages
packages <- c(
  "dplyr",
  "ggplot2",
  "ggspatial",
  "here",
  "readr",
  "sf",
  "tidyr")

# Define the default source library for packages installation - may have problems otherwise
options(repos=c(CRAN="https://cran.rstudio.com/"))

# Check if each package is installed; if not, install it and Then load them
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    renv::install(pkg, configure.args = c("--with-gdal",
                                          "--with-proj",
                                          "--with-geos",
                                          "--with-data-copy=true")
    )
  }
  library(pkg, character.only = TRUE)
}

# Clear objects on environment
rm(list = ls())

# ############################################################################################
# Functions
# ############################################################################################

# Function --------------------------------------------------------------------
# @Arg       : shapefile  is an 'sf' object representing the city boundary
# @Arg       : nc_file    is a string containing the path to a single .nc4 file
#              from the MERRA-2 dataset
# @Arg       : city_name  is a string with the name of the city
# @Output    : A ggplot object representing the map of the city boundary and 
#              MERRA-2 grid cells
# @Purpose   : Creates a spatial plot showing the city's boundary and the overlayed
#              MERRA-2 grid cells from the specified nc_file. This visualization helps 
#              in understanding the spatial extent of the MERRA-2 data relative to 
#              the city's area.
# @Written_on: 10/12/2024
# @Written_by: Marcos Paulo