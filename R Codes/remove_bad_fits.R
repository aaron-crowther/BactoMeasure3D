# ------------------------------------------------------------
# Title: Bad fit removal
#
# Description:
#   Takes IDs of objects labelled as 'BAD FIT' and removes this object from the corresponding results
#   .csv file (Geodesic Diameters and/or other morphological features).
#
# Author: Aaron Crowther, University of Oxford, UK
#
# Date: November 2025
# ------------------------------------------------------------

# Install tidyverse
library(tidyverse)

# Folder containing both the results file (_GeoDia.csv or _Results.csv) and _table.csv files output from ilastik
folder_path = "--FOLDER PATH HERE--"

# File list of results output from either geodesic_diameter_calculation_batch.ijm or additional_morpho_features_batch.ijm
results_file_list <- list.files(path = folder_path,
                                     pattern = "--FILE SUFFIX HERE--",  # "_Results.csv" or "_GeoDia.csv"
                                     full.names = TRUE)
print(results_file_list)

# File list of _table.csv files output from ilastik
fits_file_list <- list.files(path = folder_path,
                                  pattern = "_table.csv",
                                  full.names = TRUE)
print(fits_file_list)

# Sort file lists so results/fits pairs match
fits_file_list <- sort(fits_file_list)
results_file_list <- sort(results_file_list)

# Output folder path for clean results
clean_folder <- "--FOLDER PATH HERE--"

# Loop through pairs of fits and results .csv files to remove BAD FITs from results files
results_clean <- map2_df(fits_file_list, results_file_list, function(fits_file,results_file) {
  
  # Read in .csv files
  fits <- read_csv(fits_file, col_names = TRUE)
  results <- read_csv(results_file, col_names = TRUE)
  
  # Identify label IDs that are identified as BAD FIT by ilastik classifier
  bad_ids <- fits %>% 
    filter(`Predicted Class` == "BAD FIT") %>% 
    pull(labelimage_oid)
  
  # Remove BAD FITs from diam
  results_clean_fit <- results %>% 
    filter(!Label %in% bad_ids)
  
  # Save .csv file to clean folder
  clean <- file.path(clean_folder, basename(results_file))
  write_csv(results_clean_fit, clean)
  
})
