	/*
	 * Program to convert z-stack .nd2 images and output z-stack .tif images for segmentation in ilastik.
	 * 
	 * Author: Aaron Crowther, University of Oxford, UK (cc)
	 * 
	 * Date: November 2025
	 */

// Choose the input folder containing .nd2 files
inputFolder = getDirectory("Choose input folder");

// Set output directory
outputDir = getDirectory("Choose output folder");

// Get list of all .nd2 files in the input folder
fileList = getFileList(inputFolder);

// Loop through all files in the folder
for (i = 0; i < fileList.length; i++) {
    file = fileList[i];
    
    // Process only .nd2 files
    if (endsWith(file, ".nd2")) {
        
        // Open the .nd2 file
        nd2File = inputFolder + file;
        run("Bio-Formats Importer", "open=[" + nd2File + "] autoscale color_mode=Grayscale open_all_series stack_order=XYCZT");
        
        // Extract base name (no path, no extension)
        slashIndex = lastIndexOf(nd2File, File.separator);
        dotIndex = lastIndexOf(nd2File, ".");
        baseName = substring(nd2File, slashIndex + 1, dotIndex);

        // Get list of open images
        imageList = getList("image.titles");

        // Loop through each image in the .nd2 file
        for (j = 0; j < imageList.length; j++) {
            selectImage(imageList[j]);
            title = getTitle();

            // Clean the title by removing unwanted parts
            cleanTitle = title;
            cleanTitle = replace(cleanTitle, baseName + ".nd2 - ", ""); // Remove base name + ".nd2 - "
            cleanTitle = replace(cleanTitle, baseName, "");              // Remove base name entirely from the middle
            cleanTitle = replace(cleanTitle, ".nd2", "");                // Remove any remaining .nd2 extension
            cleanTitle = replace(cleanTitle, " ", "_");                  // Replace spaces with underscores for safe filenames
            cleanTitle = replace(cleanTitle, ":", "-");                  // Replace colons with hyphens (invalid in filenames)
            cleanTitle = replace(cleanTitle, "(", "");                   // Remove parentheses
            cleanTitle = replace(cleanTitle, ")", "");                   // Remove closing parentheses
            cleanTitle = trim(cleanTitle);                               // Remove leading/trailing spaces

            // Final filename: base name + clean title
            finalName = baseName + "_" + cleanTitle;

            // Save as .tif
            saveAs("Tiff", outputDir + finalName + ".tif");
            close();
        }
    }
}