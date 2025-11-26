# BactoMeasure3D
A high-throughput 3D image analysis pipeline combining FIJI, ilastik, and R to segment bacteria from fluorescence microscopy images and compute morphological features (e.g., cell length). Optimised for batch processing, reproducible analysis, and adaptable to diverse bacterial shapes.

## Features
- High-throughput batch processing
- 3D fluorescence image support
- FIJI + ilastik + R integrated workflow
- Automated bacterial segmentation
- Cell morphology extraction (e.g., length)
- Configurable and reproducible
- Adaptable to different bacterial species

## Requirements
This pipeline requires the following software and packages to be installed:
- **FIJI** with ilastik plugin ([download here](https://www.ilastik.org/documentation/fiji_export/plugin)) & MorphoLibJ ([download here](https://imagej.net/plugins/morpholibj))
- **ilastik** ([download here](https://www.ilastik.org/download))
- **R** ([download here](https://cran.r-project.org/)) with the **tidyverse** installed:

```r
# R code
install.packages("tidyverse")
```

# Usage
To use this pipeline, follow the below steps:
## Image preparation (FIJI)
Images should contain a single channel and be saved as .tif for compatibility with ilastik.
1. If microscopy images are saved as .nd2, run image_preparation_nd2_tif.ijm to convert files to .tif.
## Image segmentation (ilastik)
### Training
2. Use one image (representative of that sample group) for training both "Pixel Classification" (i.e., "_Probabilites.h5") and "Object Classification [Inputs: Raw Data, Pixel Prediction Map]" (i.e., "_Object Identities.h5" and "_Object_Predictions.h5") in ilastik.
### Batch processing
4. Using the "_probabilities.h5" of the training image, batch process "_probabilities.h5" files (i.e., probability maps) for all remaining images in the dataset.
5. Using the newly generated probability maps, batch process "_Object Identities.h5", "_Object Predictions.h5", and results tables (i.e., "_table.csv").
## Calculation of morphological features (FIJI)
5. Use geodesic_diameter_calculation_batch.ijm to calculate geodesic diameters in batch.
6. Optionally, using the .tif files generated in Step 5, use additional_morpho_features_batch.ijm to calculate additional morphological features of the bacteria (e.g., surface area and volume).
## Data cleaning (R)
7. Use remove_badfits_results.R to remove objects classified as "BAD FIT" from results .csv files (either "_GeoDia.csv" or "_Results.csv" files).
## Plotting and statistical analysis (R)

A more detailed protocol can be found at _______.

## Citation
If you use this pipeline, please cite:

Crowther A., Garcia-Maset R. (2025). BactoMeasure3D. GitHub. (https://github.com/aaron-crowther/BactoMeasure3D)

Alternatively, please cite the following paper where this pipeline was first employed:

Effect of human urinary microenvironment and fluid flow on antibiotic and phage therapy efficacy against uropathogenic Escherichia coli
Ramon Garcia Maset, Aaron Crowther, Victoria Chu, Davide Di Grande, Rizka O.A. Jariah, Jenny Yoon, Dalia Blumgart, Marloes A.E Hodek, Nicholas Yuen, Benjamin O. Murray, Laia Pasquina-Lemonche, Sara N.H Alghamd, Andrew D. Millard, Gareth LuTheryn, Melissa E.K. Haines, Martha R.J. Clokie, Eleanor Stride, Dario Carugo, Jennifer L. Rohn
bioRxiv 2025.11.12.688052; doi: https://doi.org/10.1101/2025.11.12.688052

## Useful links
- Cloning: It is recommended that you clone the whole GitHub folder to work with this space, so you can easily access all files. Find out more [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).

- Go to **Releases** (on the right hand side of the repository) for the latest version of the program, click on the release and download the .zip folder to work on it from your computer.

- The paper explaining how ilastik works: https://www.nature.com/articles/s41592-019-0582-9
