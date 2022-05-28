Follow these instructions to modify your Asylum Research Software to output ARDF force curves to Ascii.

NOTE: This is very hacky and will stop you from being able to use macros for editing images in the Asylum software. 
This has only been tested on v16 of the software and Asylum research staff expressed surprise when I explained this hack to them so use at your own risk. 

Put the modified XCalculated.ipf file in your Code3D file (probably somewhere like C:\Program Files (x86)\WaveMetrics\Igor Pro Folder\AsylumResearch\Code3D).

It is a good idea to make a back up of this whole folder before attempting anything. Resoring the original files should fix any issues should they arise. 
It is definitely **NOT** a good idea to modify Code3D on the computer running your AFM - you don't want to mess with the files that control an instrument worth as much as a small house. Installiation on another computer is quick and easy keeps your analysis out of the lab.

The file modifies the behaviour of the Image Loop in the macro builder. For each image when you run Image Loop, it will run the ExportARDF routine (exporting DeflV) and then move onto the next one.
This will export to the same directory as the image so be sure its where you want tens of thousands of text files (Hint: Do not export into DropBox - it will slow it down and ruin your computer; upload zip files of the exported curves instead).



