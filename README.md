# AFM_Nanobubble_Mapping

This repository contains all the code necessary to detect and map nanobubbles on lubricant-infused surfaces. All scripts were developed in the IDE Spyder and so are designed to be run in an environment where editing and running are easy. 

The main script ForceMapAnalysisNanobubble.py has a header where the user can input the relevant information to run the script on their files. The required input information is: 
* path to folder containing force curves from a force map in ASCII format (as output by Asylum software)
* path to folder where you want the analysed data 
* sensitivity of cantilever used
* resolution of force map
* side length of force map

Once this information has been provided, the script is ready to run and will output a csv file with the calculated metrics (height of topography, lubricant thickness, gas, thickness) for each force curve. 

Additional options include:
* an ability to keep only every Nth data point (in case your force curves have too much resolution and so there aren't big jumps in derivative
* options to plot each force curve in the console (useful for checking the script is working but will make analysis very slow)
* options to save each plot (say for publishing)
* and an opptional suffix to add to the save file,

The sensitivity of a cantilever should be calculated with included script CalcSensitivity.py as this ensure that the units and form of sensititivy are what are expected by the script. Usage is simple: point the script to a folder containing ASCII force curves recorded on a hard surface (e.g. silicon wafer) and it will find the most linear region of the contact region to calculate the sensitivity. 

Processed data can be plotted using PlottingNanobubble.py. Point the script to a csv file output by ForceMapAnalysisNanobubble.py and run the script. It will plot the data with three panels (topogrpahy, lubricant thickness and air thickness):
![TWwat10_summary_2020-11-21Nanobubble_nanobubble](https://user-images.githubusercontent.com/87315528/137575587-ad0f8a18-0497-44df-af74-4045e91337bf.png)

Also included are instructions to hack Asylum AFM software to automatically output multiple ARDF files to Ascii to speed up analysis.

If you want to use an AFM other than an Asylum you can either get it to output a force map in the same format (LineXXXXPointXXXX.txt) or modify the functions 'LoadDataX()' and 'LoadDataY()' in ForceMapAnalysisNanobubble.py to work with the files outuput by your AFM software. 
