# ============================================================================================
# FGV Cidades: CEUs
# ============================================================================================
# @Goal: Plot CEU locations in São Paulo over district grids
# 
# @Description: This script imports spatial data for São Paulo's district boundaries (downloaded
# previously) and a CSV containing CEU school locations. It then creates a ggplot map showing
# district boundaries and CEU points.
# 
# @Summary: This program performs the following steps:
#   I.   Import data and set up environment
#   II. Generate and save plot
# 
# @Date: Jan 2025
# @author: Marcos Paulo
# ============================================================================================

# ============================================================================================
# I: Import data and set up environment
# ============================================================================================
# Get all libraries and functions
source(here::here("src", "config", "config_utils.R"))

# Open spatial data of São Paulo districts (downloaded in a previous script)
distritos     <- sf::st_read(here::here("data",
                                        "raw",
                                        "malhas_distritos",
                                        "SP_distritos_CD2022.gpkg"))

# Open csv data of CEUs location
ceus_fgv      <- read.csv(here::here("data",
                                     "raw",
                                     "CEUs",
                                     "ENDERECOS_CEUS_GEOLOC.csv"),
                          sep = ",")

# Open csv of all registered schools in Sao Paulo - 2024 (downloaded in a previous script)
schools       <- read.csv(here::here("data",
                                     "raw",
                                     "schools",
                                     "schools_2024.csv"),
                          sep = ";")
# ============================================================================================
# II: Process data
# ============================================================================================
# Subset 'distritos' to keep necessary rows - the city of Sao Paulo
distritos <- distritos %>%
  filter(CD_MUN == 3550308)

# Filter the schools dataset to necessary rows - "CEUs" schools
ceus_all <- schools %>%
  filter(!is.na(CEU) & CEU != "") %>%
  mutate(
    LATITUDE  = LATITUDE / 1e6,
    LONGITUDE = LONGITUDE / 1e6)

ceus     <- schools %>% 
  filter(TIPOESC == "CEU") %>%
  mutate(
    LATITUDE  = LATITUDE / 1e6,
    LONGITUDE = LONGITUDE / 1e6
  )

# Convert dataframe to an sf object 
ceus_all_sf <- st_as_sf(
  ceus_all,
  coords = c("LONGITUDE", "LATITUDE"),  
  crs = 4326)

ceus_sf <- st_as_sf(
  ceus,
  coords = c("LONGITUDE", "LATITUDE"),  
  crs = 4326)

# Convert data to the same CRS
distritos <- sf::st_transform(distritos, 4326)


# Create a simple ggplot map
map_ceus <- ggplot() +
  geom_sf(data = distritos, fill = "white", color = "gray60") +
  geom_sf(data = ceus_sf, color = "darkgreen", size = 0.5) +
  theme_minimal()


map_ceus_all <- ggplot() +
  geom_sf(data = distritos, fill = "white", color = "gray60") +
  geom_sf(
    data = ceus_all_sf,
    aes(color = TIPOESC),
    size = 0.5
  ) +
  labs(color = "Tipo de Escola") +  # sets the legend title
  theme_minimal()

map_ceus
map_ceus_all
# ============================================================================================
# III: Save data
# ============================================================================================
ggsave(
  filename = here::here("results", "figures", "map_ceus.pdf"),
  plot     = map_ceus,
  device   = "pdf",
  width    = 8,
  height   = 6,
  dpi      = 300)


ggsave(
  filename = here::here("results", "figures", "map_ceus_all.pdf"),
  plot     = map_ceus_all,
  device   = "pdf",
  width    = 8,
  height   = 6,
  dpi      = 300)
