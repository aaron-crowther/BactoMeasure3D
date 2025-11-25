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
This pipeline requires the following software and packages to be installed:
- **FIJI** with ilastik plugin ([download here](https://www.ilastik.org/documentation/fiji_export/plugin)) & MorphoLibJ ([download here](https://imagej.net/plugins/morpholibj))
- **ilastik** ([download here](https://www.ilastik.org/download))
- **R** ([download here](https://cran.r-project.org/)) with the **tidyverse** installed:

```r
# R code
install.packages("tidyverse")
```
## Installation
TBC

# Usage
## Image preparation
1. step 1
2. step 2
## Image segmentation
3. step 3
4. step 4
## Calculation of morphological features
5. step 5
6. step 6

## Troubleshooting
TBC

## Citation
If you use this pipeline, please cite:

Crowther A. (2025). BactoMeasure3D. GitHub. (https://github.com/aaron-crowther/BactoMeasure3D)

Alternatively, please cite the following paper where this pipeline was first employed:

Effect of human urinary microenvironment and fluid flow on antibiotic and phage therapy efficacy against uropathogenic Escherichia coli
Ramon Garcia Maset, Aaron Crowther, Victoria Chu, Davide Di Grande, Rizka O.A. Jariah, Jenny Yoon, Dalia Blumgart, Marloes A.E Hodek, Nicholas Yuen, Benjamin O. Murray, Laia Pasquina-Lemonche, Sara N.H Alghamd, Andrew D. Millard, Gareth LuTheryn, Melissa E.K. Haines, Martha R.J. Clokie, Eleanor Stride, Dario Carugo, Jennifer L. Rohn
bioRxiv 2025.11.12.688052; doi: https://doi.org/10.1101/2025.11.12.688052

## Useful links
- Cloning: It is recommended that you clone the whole GitHub folder to work with this space, so you can easily access all files. Find out more [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).

- Go to **Releases** (on the right hand side of the repository) for the latest version of the program, click on the release and download the .zip folder to work on it from your computer.

- The paper explaining how ilastik works: https://www.nature.com/articles/s41592-019-0582-9
