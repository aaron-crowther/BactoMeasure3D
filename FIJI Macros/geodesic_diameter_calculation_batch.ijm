	/*
	 * Program to open segmented Object Identities.tif files (obtained from geodesic_diameter_calculation_batch.ijm) in FIJI, 
	 * calculate morphological features (e.g., volume and surface area), and output a Results table (_Results.csv).
	 * 
	 * Author: Aaron Crowther, University of Oxford, UK (cc)
	 * 
	 * Date: November 2025
	 */

// Choose the input folder containing .h5 files
inputFolder = getDirectory("Choose input folder");

// Set output directory
outputDir = getDirectory("Choose output folder");

// Get list of all .h5 files in the input folder
fileList = getFileList(inputFolder);

// Loop through all files in folder
for (i = 0; i < fileList.length; i++) {
    file = fileList[i];
    
    // --- PROCESS OBJECT IDENTITIES FILES ---
    if (endsWith(file, "Object Identities.tif")) {
        
        filePath = inputFolder + file;
        filePath = replace(filePath, "\\", "/");
        print("Importing (Identities): " + filePath);
        open(filePath);

        wait(1000); // wait for image to load
        
        // Set scale
        run("Set Scale...", "distance=2048 known=231.13 unit=microns");     
        
        // Measure geodesic diameter using MorphoLibJ - change morphological features of interest
        run("Analyze Regions 3D", "voxel_count volume surface_area mean_breadth sphericity surface_area_method=[Crofton (13 dirs.)] euler_connectivity=6");
        
        // Save results as _Results.csv
        baseName = replace(file, ".tif", "");
        saveAs("Results", outputDir + baseName + "_Results.csv");

        // Cleanup
        close("*");
        close("Results");
    }
}
