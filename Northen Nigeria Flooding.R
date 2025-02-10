# Set working directory
setwd('E:/Nigeria')
dir()

# Load the libraries
library(raster)
library(rgdal)
library(sf)
library(osmdata) # For accessing OSM data

# Load the DEM file
dem <- raster("NorthernNigeria_DEM.tif")

# Load the flood map TIFF files
flood_2022_6 <- raster("FloodMap_2022_6-0000000000-0000000000.tif")
flood_2022_7 <- raster("FloodMap_2022_7-0000000000-0000000000.tif")
flood_2022_8 <- raster("FloodMap_2022_8-0000000000-0000000000.tif")
flood_2022_9 <- raster("FloodMap_2022_9-0000000000-0000000000.tif")

# Align the extent of DEM to the flood maps
aligned_dem <- crop(dem, extent(flood_2022_6)) # Crop DEM to the extent of the flood map
aligned_dem <- resample(aligned_dem, flood_2022_6, method = "bilinear") # Resample DEM to match the resolution of the flood maps

# Align the extents of all flood maps to be uniform with the first flood map (2022_6)
flood_2022_7_aligned <- crop(flood_2022_7, extent(flood_2022_6))
flood_2022_8_aligned <- crop(flood_2022_8, extent(flood_2022_6))
flood_2022_9_aligned <- crop(flood_2022_9, extent(flood_2022_6))

# Now all layers have the same extent and resolution
# Calculate the water depth (Flood map - aligned DEM)
water_depth_6 <- flood_2022_6 - aligned_dem
water_depth_7 <- flood_2022_7_aligned - aligned_dem
water_depth_8 <- flood_2022_8_aligned - aligned_dem
water_depth_9 <- flood_2022_9_aligned - aligned_dem

# Download OSM data for infrastructure (e.g., buildings, roads)
# Define the bounding box based on the extent of the aligned DEM
bbox <- st_bbox(aligned_dem)

# Query OSM for buildings
osm_buildings <- opq(bbox = bbox) %>%
  add_osm_feature(key = "building") %>%
  osmdata_sf()

# Extract buildings as simple features (sf)
buildings <- osm_buildings$osm_polygons

# Extract flood intensity for each building
flood_intensity_6 <- extract(flood_2022_6, buildings, fun = mean, na.rm = TRUE)
flood_intensity_7 <- extract(flood_2022_7_aligned, buildings, fun = mean, na.rm = TRUE)
flood_intensity_8 <- extract(flood_2022_8_aligned, buildings, fun = mean, na.rm = TRUE)
flood_intensity_9 <- extract(flood_2022_9_aligned, buildings, fun = mean, na.rm = TRUE)

# Combine the flood intensity data into a data frame
infrastructure_damage <- data.frame(
  Building_ID = buildings$osm_id,
  Flood_Intensity_June = flood_intensity_6,
  Flood_Intensity_July = flood_intensity_7,
  Flood_Intensity_August = flood_intensity_8,
  Flood_Intensity_September = flood_intensity_9
)

# Calculate the difference in flood intensity across months
flood_difference_june_july <- flood_2022_7_aligned - flood_2022_6
flood_difference_july_august <- flood_2022_8_aligned - flood_2022_7_aligned
flood_difference_august_september <- flood_2022_9_aligned - flood_2022_8_aligned

# Plot graphs showing flood intensity differences
par(mfrow = c(3, 1))
plot(flood_difference_june_july, main = "Flood Intensity Difference: June - July", col = terrain.colors(10))
plot(flood_difference_july_august, main = "Flood Intensity Difference: July - August", col = terrain.colors(10))
plot(flood_difference_august_september, main = "Flood Intensity Difference: August - September", col = terrain.colors(10))

# Create the flood inundation map by combining all aligned flood maps
flood_inundation_map <- flood_2022_6 + flood_2022_7_aligned + flood_2022_8_aligned + flood_2022_9_aligned
plot(flood_inundation_map, main = "Flood Inundation Map", col = terrain.colors(10))
