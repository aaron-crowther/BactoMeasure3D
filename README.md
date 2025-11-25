# BactoMeasure3D
A high-throughput 3D image-analysis pipeline combining FIJI, ilastik, and R to segment bacteria from fluorescence microscopy images and compute morphological features (e.g., cell length). Optimised for batch processing, reproducible analysis, and adaptable to diverse bacterial shapes.

## Features
- High-throughput batch processing
- 3D fluorescence image support
- FIJI + ilastik + R integrated workflow
- Automated bacterial segmentation
- Cell morphology extraction (e.g., length)
- Configurable and reproducible
- Adaptable to different bacterial species

## Requirements
This pipeline requires the following software and packages:
- **FIJI** with ilastik plugin ([download here](https://www.ilastik.org/documentation/fiji_export/plugin)) & MorphoLibJ ([download here](https://imagej.net/plugins/morpholibj))
- **ilastik** ([download here](https://www.ilastik.org/download))
- **R** ([download here](https://cran.r-project.org/)) with the **tidyverse** installed:

```r
# R code
install.packages("tidyverse")
