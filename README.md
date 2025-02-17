# Nigeria Flood Mapping Project

## Overview
The Nigeria Flood Mapping Project focuses on analyzing flood extent and water levels across Nigeria using remote sensing data. The project utilizes Sentinel-2 imagery and Digital Elevation Model (DEM) data to identify flood-prone areas and map flood intensity over different time periods. The objective is to provide a detailed analysis of flooding events, helping stakeholders understand the impacts on infrastructure, agriculture, and communities.

## Project Objective
- **Monitor flood extent and intensity** across Nigeria using satellite imagery.
- **Identify affected areas** based on water detection algorithms.
- **Analyze the effects of flooding** on land, infrastructure, and livelihoods.
- **Create actionable insights** for policymakers and humanitarian organizations.

## Data Sources
- **Sentinel-2 Imagery**: High-resolution satellite imagery to monitor flood events and water extent.
- **Digital Elevation Model (DEM)**: To assess topography and identify areas at risk of flooding.
- **Nigeria National Flood Data**: Historical flood event data for comparison.
- **Use the following links to download the data that was used.**
  1. https://code.earthengine.google.com/0283ce4f7b86044e31c486c66283afc2.
  2. https://code.earthengine.google.com/beb087624809d796a0440352834090af.

## Key Features
1. **Flood Detection Algorithms**: NDWI (Normalized Difference Water Index), MNDWI (Modified NDWI) to classify flood and non-flood areas.
2. **Flood Analysis**: Temporal analysis of flooding events and seasonal variations.
3. **Impact Assessment**: Evaluation of flood-prone regions, with a focus on agricultural zones and urban infrastructure.
4. **Visualization**: Static maps of flood areas, land, and water extent, designed for easy interpretation and decision-making.
5. **Extent Alignment**: Align flood maps with DEM to ensure consistency in spatial resolution and map extent.

## Installation
To run this project, you will need the following dependencies:

1. Python 3.x
2. Libraries: `geopandas`, `matplotlib`, `rasterio`, `numpy`, `sentinelsat`, `gdal`, `folium`
3. Google Earth Engine (GEE) API access for analyzing satellite data.
   
Clone the repository and install the required dependencies:

```bash
git clone <repository_url>
cd nigeria-flood-mapping
pip install -r requirements.txt
```

## Usage
1. Download or access Sentinel-2 data for the region and time period of interest.
2. Import the dataset into the project environment.
3. Use the provided scripts to process the data, including flood detection and analysis functions.
4. Generate static maps showing flood areas overlaid with DEM and other environmental features.
5. Visualize the data using the `matplotlib` library for analysis and interpretation.

## Example Workflow
- Load flood map images.
- Apply water detection indices (NDWI, MNDWI).
- Clip flood maps to a specific region in Nigeria.
- Generate a time series graph of flood events.
- Export maps and graphs for further analysis and reporting.

## Results
- Visualizations of flooded areas over different time periods.
- Insights into flood-prone areas and regions requiring urgent intervention.
- Potential flood intensity analysis based on topographic features (e.g., low-lying areas).

## Conclusion
This project provides an efficient, data-driven approach to mapping flood events in Nigeria. By leveraging satellite data, it can assist in making informed decisions regarding disaster preparedness, land use planning, and response efforts.

## Future Work
- Incorporate additional data sources for a more comprehensive flood assessment (e.g., climate data, rainfall data).
- Develop interactive tools for real-time monitoring and reporting of flood events.
- Improve accuracy of flood modeling through machine learning techniques.

## Contributing
Feel free to fork this project and contribute to the development of flood mapping techniques. Submit issues and pull requests with suggestions, bug fixes, or new features.

## License
This project is licensed under the MIT License.
