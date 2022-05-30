'''
Sam Peppou-Chapman
#School of Chemistry, The University of Sydney
#2022

This script is used to calculate detect the pressence of a lubricant layer and 
an air layer in AFM force-distance curves.

The script is set up to use force curves exported from force maps from an 
Asylum AFM, but could be easily adapted for other brands of AFM (through 
modification of the ImportDataX/Y functions). The script needs the sensitivity
(in units of m (displacement) /V (deflection)) of the cantilever for 
converstion of raw displacement data separation. This is easily calculated by 
taking some force curves on a hard substrate (e.g. silicon or sapphire) and 
using the accompanying 'SensitivityCalc' script.  

Usage is simple: input the required variable in the variable declaration below 
and run the script. The script will save a summary file that give the thickness
of any lubricant or air found at each pixel. Use accompaying script to plot the
data.

The script will output 'NaN' whenever it cannot find anything, and these can be
removed through interpolation using the accmopanying 'RemoveNAN' script.

The scipt can plot each force curve to help visually 
analyse performance either inline in the python console or save them to file.
This will signinificantly slow down analysis, however. The script will plot
every 50th force curve.

'''

import numpy as np
import csv
import matplotlib.pyplot as plt
import os.path
from scipy import stats
import datetime
from scipy.signal import savgol_filter
from scipy.signal import find_peaks

########### Variables that need to be changed ###########

DataPath = [
        r'F:\Path\to\folder1',
        r'F:\Path\to\folder2',
        r'F:\Path\to\folder3',
        
            ]
                        
            
            #DataPath is the folder that contains the Ascii force curves 
            #(from Asylum)   NB: Don't remove the 'r' at the front

ExportDir = r'F:\Export\folder'  
            #path for the summaries to be saved
        
Sensitivity =  4.44E-08 #m/V

Resolution = [64, 64]      #Resolution is the number of pixels in 
                       #the image (must be less than 1000)                 

SideLength = [4, 8]           #scan size in micrometers

SpringConstant = 3.22   #N/m

LinearFitBubble = True   #Fit a line to the detected gas region

LinearFitR2 = 0.9     #cut off value for linear fit to be accepted
  
KeepN = 1   #delete all but every Nth data point. 
            #Set to 1 if you dont want to delete anything

Plot = False  #plot each force curve as it is analysed

PlotRetract = False   #add retract to the curve

RemoveDwell = False    #Some Force Maps have long dwells that can slow down or crash analysis. Set to 'True' to remove them

SavePlot = False     #save all analysed plots

SaveNameSuffix = '_Nanobubble' #optional string that will be added to the end of the summary files save name 

########### End varaibles that need to be changed ###########


def main(DataPath, Sensitivity, Resolution, SideLength):
       
    BaseName = os.path.basename(DataPath)
    
    date = datetime.datetime.today().strftime('%Y-%m-%d')
    
    #build the save name
    SavePath = os.path.join(ExportDir, 
                            f'{BaseName}_summary_{date}{SaveNameSuffix}.csv') 
    
    print(SavePath)
    
    InitialiseSaveFile(SavePath)
    
    #initialise variables that will store the data before the save
    x_ind_save = []  
    y_ind_save = []
    x_loc_save = []
    y_loc_save = []
    thick_lub_save = []
    thick_air_save = []
    btm_out_save = []
    grads_save = []
    grads_R2_save = []

    tic = datetime.datetime.now() #start a timer
    
    for i in range(0, Resolution):
        for j in range(0, Resolution):
            
            ### import data ###
            CurrentFileX = ImportDataX(i, j, DataPath)                
            CurrentFileY = ImportDataY(i, j, DataPath)
            
            PlotThisOne = False
            
            if RemoveDwell:
                CurrentFileX, CurrentFileY = DeleteDwell(CurrentFileX, CurrentFileY)
            
            if KeepN > 1:
              CurrentFileX = KeepEveryN(CurrentFileX, KeepN)
              CurrentFileY = KeepEveryN(CurrentFileY, KeepN)
             
            ExtendXNoOffset, ExtendYNoOffset = ExtractExtend(CurrentFileX,
                                                             CurrentFileY)
            RetractXNoOffset, RetractYNoOffset = ExtractRetract(CurrentFileX,
                                                                CurrentFileY)
            
            ### manipulate data ready for analysis ###
            #offset y-axis
            ExtendY = RemoveBaseline(ExtendXNoOffset,
                                     ExtendYNoOffset)
            RetractY = RemoveBaselineRetract(ExtendXNoOffset, ExtendYNoOffset,
                                             RetractXNoOffset, RetractYNoOffset)
            
            #offset x-axis
            XOffset = np.full(len(ExtendXNoOffset), 
                              ExtendXNoOffset[np.argmin(ExtendYNoOffset)])
            ExtendX = ExtendXNoOffset - XOffset
            
            XOffset = np.full(len(RetractXNoOffset), 
                              ExtendXNoOffset[np.argmin(ExtendYNoOffset)])
            RetractX = RetractXNoOffset - XOffset
            
            #convert x to separation
            XSep = ConvertToSep(ExtendX, ExtendY, Sensitivity) 
            XSepRetract = ConvertToSep(RetractX, RetractY, Sensitivity)
            
            #offset x-axis
            XOffset = np.full(len(XSep), 
                              XSep[np.argmin(ExtendYNoOffset)])
            XSep = XSep - XOffset 

            #convert y axis to force 
            ExtendY = ExtendY * Sensitivity * SpringConstant 
            RetractY = RetractY * Sensitivity * SpringConstant
            
            ### Find thickness ###           
            BottomIndex = FindBottomUnderwater(ExtendY)
            AirTopIndex, LubTopIndex = FindTopBubble(ExtendX,
                                                     ExtendY,
                                                     BottomIndex)
            
            #offset x-axis again now we know hard contact
            if np.isnan(BottomIndex):
              XOffset = np.full(len(XSep), 
                                XSep[np.argmin(ExtendYNoOffset)])
            else:
              XOffset = np.full(len(XSep), 
                                XSep[BottomIndex])
              BottomOut = ExtendXNoOffset[BottomIndex]
              
            XSep = XSep - XOffset
            
            XSepRetract = XSepRetract - np.full(len(XSepRetract),
                                                XSepRetract[0]-XSep[-1])
            
            #calculate thicknesses
            try:
                Thickness_lub = abs(XSep[BottomIndex]-XSep[LubTopIndex])
            except:
                Thickness_lub = 0
            
            try:
                if np.isnan(LubTopIndex):
                    Thickness_air = abs(XSep[BottomIndex]-XSep[AirTopIndex])
                else: 
                    Thickness_air = abs(XSep[LubTopIndex]-XSep[AirTopIndex])
            except:
                Thickness_air = 0
                
            #calculate gradient of gas region
            if LinearFitBubble and not np.isnan(AirTopIndex):
                BubbleGrad, BubbleGradR2 = LinearFit(
                        XSep[AirTopIndex:min(BottomIndex, LubTopIndex)], 
                        ExtendY[AirTopIndex:min(BottomIndex, LubTopIndex)]
                        )
            else:
                BubbleGrad, BubbleGradR2 = np.nan, np.nan
                
            
            
            ### Plot ###
            
            plt.rcParams['font.family'] = 'sans-serif'
            plt.rcParams.update({'font.size': 8.5})

            mm = 1/25.4 
            
            if int(i*resolution+j)%50 == 0:
              #plot every 50th force curve
              PlotThisOne = True
            
            if Plot or SavePlot or PlotThisOne:
                
              w = 60 # width mm  
              
              fig, ax = plt.subplots(figsize=(w*mm,(2/3)*w*mm))
                
              if PlotRetract:
                  ax.plot(XSepRetract*-1e9,RetractY*1e9, label = 'Retract')
                
              ax.plot(XSep*-1e9,ExtendY*1e9, label = 'Extend')

              ax.set_xlabel('Separation (nm)')
              ax.set_ylabel('Force (N)')
              ax.set_xlim((-20,500))
              ax.set_ylim((-5,5))
              
              plot_lines = True
              #plot lines for the detected features
              if plot_lines:
                  try:
                      ax.axvline(XSep[AirTopIndex]*-1e9, color='b', lw=0.5)
                  except:
                      pass
                  try:
                    ax.axvline(XSep[LubTopIndex]*-1e9, color='g', lw=0.5)
                  except:
                      pass
                  try:
                    ax.axvline(XSep[BottomIndex]*-1e9, color='r', lw=0.5)
                  except:
                      pass
                 
              SavePathPlot = os.path.join(
                      DataPath, 
                      f'Line{GenNum(i)}Point{GenNum(j)}.png'
                      )
              
              if SavePlot:
                SaveFolder = os.path.join(
                        ExportDir, 
                        f'{BaseName}ForceCurves{date}'
                        )
                try:
                  os.mkdir(SaveFolder)
                except OSError:
                  pass
              
                SavePathPlot = os.path.join(
                        SaveFolder, 
                        f'Line{GenNum(i)}Point{GenNum(j)}.png'
                        )
                fig.savefig(SavePathPlot,
                            dpi=200,
                            bbox_inches='tight',
                            pad_inches=0)
                
              if Plot or PlotThisOne:
                fig.show()
                
              plt.close('all')
              
            ### Progress and time estimation ###  
            #estimate time remaining and show user at regular intervals  
            if int((i/Resolution)*100)%10 == 0 and j == 0:
              print(f'\n{str(int((i/Resolution)*100))}% done ',  end='')
              if i != 0:
                toc = datetime.datetime.now()
                elapsed = toc - tic #seconds
                FinishTime = tic + elapsed*(Resolution/i)
                FinishTimeString = str(FinishTime.strftime('%H:%M'))
                print(f' Estimated completion time: {FinishTimeString} ')

                
              if i == 2 and j == 0:
                toc = datetime.datetime.now()
                elapsed = toc - tic #seconds
                FinishTime = tic + elapsed * Resolution / i
                FinishTimeString = str(FinishTime.strftime('%H:%M'))
                print(f'\nEstimated completion time: {FinishTimeString} ')
                
            ### Saving ###
            #build lists of data for saving
            xLocation = (SideLength/(Resolution-1))*i
            yLocation = (SideLength/(Resolution-1))*j
            
            x_ind_save.append(i)
            y_ind_save.append(j)
            x_loc_save.append(xLocation)
            y_loc_save.append(yLocation)
            thick_lub_save.append(Thickness_lub)
            thick_air_save.append(Thickness_air)
            btm_out_save.append(BottomOut)
            grads_save.append(BubbleGrad)
            grads_R2_save.append(BubbleGradR2)
    
    #save the data
    print('\nStarting save')
    WriteFile(SavePath, 
              x_ind_save, y_ind_save,
              thick_lub_save, btm_out_save, 
              x_loc_save, y_loc_save, 
              thick_air_save,
              grads_save, grads_R2_save)
    print('\nDone!')
    
def KeepEveryN(data ,N):
  newLen = int(round(len(data)/N))
  trimmedData = np.zeros(newLen)
  for i in range(newLen*N):
      if i%N == 0:
          trimmedData[int(i/N)] = data[i]
      
  return trimmedData    

def DeleteDwell(X, Y):
    index = np.argmax(np.diff(X,n=2))
    return X[:index], Y[:index]
 
def RemoveBaseline(X, Y):
    Partition = int(0.4*len(X))
    m, c, _, _, _ = stats.linregress(X[:Partition],Y[:Partition])
    baseline = X * m + c
    
    return Y - baseline
 
def RemoveBaselineRetract(X1, Y1, X2, Y2):
    Partition = int(0.4*len(X1))
    m, c, _, _, _  = stats.linregress(X1[:Partition],Y1[:Partition])
    baseline = X2 * m + c
    
    return Y2 - baseline  
      
def ImportDataX(Line, Point, Path):          #imports x data (z-sensor) 
  LineNum = GenNum(Line)                      #Needs to give num in the format '000X' or '00XX' etc.
  PointNum = GenNum(Point)                      #Needs to give num in the format '000X' or '00XX'  etc.    
  FileNameZsnr = os.path.join(Path,  
                              f'Line{str(LineNum)}Point{str(PointNum)}ZSnsr.txt')  #import Zsnr data
  return np.loadtxt(FileNameZsnr)                               
  
def ImportDataY(Line, Point, Path):            #imports y data (deflection)
  LineNum = GenNum(Line)             #Needs to give num in the format '000X' or '00XX' etc.
  PointNum = GenNum(Point)           #Needs to give num in the format '000X' or '00XX'  etc.
  FileNameDefl = os.path.join(Path, 
                              f'Line{str(LineNum)}Point{str(PointNum)}DeflV.txt')   #import Defl data
  return np.loadtxt(FileNameDefl)                                        #read the data into file

def GenNum(Number):                   #make a string that is the right number to be used with the file name 
                             #only works for force maps resolution less than 1000x1000
  if Number < 10:
    return '000' + str(Number)
  elif Number < 100:
    return '00' + str(Number)
  elif Number < 1000: 
    return '0' + str(Number)   

def ExtractExtend(XData, YData):             #delete the retraction portion of the curve 
  index = FindDeleteArray(YData)    #find what needs to be deleted
  OutputX = np.delete(XData, index)
  OutputY = np.delete(YData, index)
  return (OutputX, OutputY)

def ExtractRetract(XData,YData):             #delete the retraction portion of the curve 
  index = FindDeleteArrayRet(YData)    #find what needs to be deleted
  OutputX = np.delete(XData, index)
  OutputY = np.delete(YData, index)
  return (OutputX, OutputY)

def FindDeleteArrayRet(Data):
  MaxIndex = np.argmax(Data)      #find index of maximum number (i.e the turnaround point)
  return np.arange(0, MaxIndex) 

def FindDeleteArray(Data):       #returns an array of all the positions to delete (all numbers that aren't extension)
  MaxIndex = np.argmax(Data)      #find index of maximum number (i.e the turnaround point)
  MaxNum = np.count_nonzero(Data)
  
  return np.arange(MaxIndex ,MaxNum) 
    
def ConvertToSep(CurrentFileX, CurrentFileY, sensitivity):        #converts the data to separation 
  delta = CurrentFileY*sensitivity                       
  return CurrentFileX - delta  

def LinearFit(XData, YData):
    coeffs = stats.linregress(XData, YData)
    if coeffs.rvalue**2 > LinearFitR2:
        return coeffs.slope, coeffs.rvalue**2
    else:
        return np.nan, np.nan

def FindTopBubble(x, data, BottomIndex): 
    #fins the top of the top of either the lubricant or air (or both)
    #returns AirTopIndex, LubTopIndex
    AirTopIndex = np.nan
    LubTopIndex = np.nan
    x=x*-1e9
    
    #the following filtering is a bit hacky - I found that smoothing twice gave
    #the most consitent results
    window = 31  
    deriv = savgol_filter(np.gradient(savgol_filter(data, 
                                                    window_length = window, 
                                                    polyorder = 1, 
                                                    deriv = 0
                                                    )
                         ), 15, 2) #1st derivative
      
    grad = savgol_filter(np.gradient(savgol_filter(data, 
                                                   window_length = window, 
                                                   polyorder = 1, 
                                                   deriv=1)
                        ), 5, 1) #second derivative
        
    #find negative peaks in the second derivative
    threshold = np.mean(abs(grad[0:100])) + 8*np.std(abs(grad[0:100]))
    peaks, properties = find_peaks(-grad,height=threshold,distance=15)

    if len(peaks) == 0:
        LubTopIndex = np.nan
        AirTopIndex = np.nan
        #return nan if nothing is found
        
    elif len(peaks) == 1:
        if isAir(data, deriv, peaks[0], BottomIndex):
            AirTopIndex = peaks[0]
            LubTopIndex = np.nan
        else:
            AirTopIndex = np.nan
            LubTopIndex = peaks[0]
            
    elif len(peaks) > 1:
        peaks = np.append(peaks,BottomIndex)
        #check to see if first derivative is positive for section between all peaks
        for i in range(len(peaks)-1):
            if not isAir(data, deriv, peaks[i], peaks[i+1]):
                if i == 0:
                    AirTopIndex = np.nan
                    LubTopIndex = peaks[i]
                    break
                else:
                    AirTopIndex = peaks[0]
                    LubTopIndex = peaks[i]
                    break
            if i == len(peaks)-2:
                AirTopIndex = peaks[0]
                LubTopIndex = np.nan  
                
    #add an adjustment to each index to account for the effect of smoothing            
    AirTopIndex += 8
    LubTopIndex += 8
                
    plot_diagnostics = False
                
    if plot_diagnostics:
            
        plt.plot(x,data)
        plt.ylim(-2e-9,2e-9)
        plt.xlim(-200,500)
        plt.axvline(x[BottomIndex],color='g')
        plt.title('Data')
        for p in peaks:
            plt.axvline(x[p],color='r')
        if not np.isnan(AirTopIndex):    
            plt.scatter(x[AirTopIndex],
                        data[AirTopIndex],
                        marker='o',
                        color='orange',
                        s=100)    
        if not np.isnan(LubTopIndex):    
            plt.scatter(x[LubTopIndex],
                        data[LubTopIndex],
                        marker='o',
                        color='purple',
                        s=100)   
        plt.show()
        
        plt.axhline(0, color='k')
        plt.plot(x, deriv)
        plt.ylim(-2e-11, 2e-11)
        plt.xlim(-200, 500)
        plt.axvline(x[BottomIndex], color='g')
        plt.title('First Derivative')
        for p in peaks:
            plt.axvline(x[p],color='r')
        plt.show()
    
        plt.plot(x, grad)
        plt.ylim(-2e-11, 2e-11)
        plt.xlim(-200, 500)
        plt.title('Second Derivative')
        plt.axvline(x[BottomIndex], color='g')
        for p in peaks:
            plt.axvline(x[p], color='r') 
        plt.show()
    
    return (AirTopIndex, LubTopIndex)
    
def isAir(data, deriv1, index1, index2):
    #function to check if the shape of the curve is a bubble or not by comparing 
    #the amount of postive/negative gradient
    if index1 == index2:
        return False
        
    if index1 > index2:
        return False
    
    proportion = 0.4 #propotion of points that must be negative to be considered lubricant
    threshold_min = 0.5e-9
    
    pos_pts = len([x for x in deriv1[index1:index2] if x>0])
    neg_pts = len([x for x in deriv1[index1:index2] if x<0])
    
    if pos_pts == 0:
        return False  
    elif (neg_pts/pos_pts > proportion and 
          data[index1] - min(data[index1:index2]) > threshold_min):
        return False 
    else:
        return True 
          
def FindBottomUnderwater(data): 
  #returns the index of the bottom for underwater (goes backwards from the turnaround point)
  #asssumes that the data is extend only
  Threshold = FindThreshold(data, 2, 5)
  data = np.flip(data)
  
  for i in range(5, len(data)-5):
    diff = abs(data[i] - data[i+1])
    if diff < Threshold:
      BottomIndex = len(data) - i + 2
      break
    if i == len(data)-10:
      BottomIndex = np.nan

  return BottomIndex 
                        
def FindThreshold(data, nThresh, percent):            
#finds a relevant threshold based on the first 100 data points          
  counter = 0
  diff = []
  if len(data) <= 100:        #ensure there is enough data to find a threshold
    return 1e-6     #if not, set it to something large to ensure that the output is NAN
  else:
    for counter in range(int(percent*0.01*len(data))):                 
        #populate an array with the difference between adjacent data points
      counter1 = counter + 1
      diff.append(abs(data[counter1] - data[counter]))
     
    average = np.mean(diff)
    std = np.std(diff)
    
    #theshold is defined as being more than n standard deviations away from the mean
    return abs(average + nThresh*std)                               
                                                                        
def InitialiseSaveFile(path):      
#initialises the save file so that there is somewhere to save                    
  with open(path, 'w') as csvfile:
    savewriter = csv.writer(csvfile, 
                            delimiter=',',
                            quotechar='|', 
                            quoting=csv.QUOTE_MINIMAL, 
                            lineterminator='\n')
    savewriter.writerow([
            'x', 'y', 
            'x (um)', 'y (um)', 
            'height (nm)', 
            'lub thickness (nm)', 'sum (nm)', 
            ' lubthickness (m)', 'sum (m)', 
            'air thickness (nm)', 'air thickness (m)',
            'gas gradient (N/m)', 'gas gradient R2',
                         ]
                       )

def WriteFile(path, x, y, z, Bottom, xLoc, yLoc, air_thick, grad, gradR2):          
    #adds a row to the .csv save file
  with open(path, 'a') as csvfile:
    savewriter = csv.writer(csvfile, 
                            delimiter=',', 
                            quotechar='|', 
                            quoting=csv.QUOTE_MINIMAL, 
                            lineterminator='\n')
    for i in range(0,len(x)):                                                                     
         # do some conversions so that the output has both nm an m                                   
        if Bottom[i] == 'NAN' or z[i] == 'NAN':   #make sure you only add numbers
          if Bottom[i] == 'NAN':
            BottomOut = 'NAN'
          else:
            BottomOut = -Bottom[i]*1E9
        else:
          BottomOut = -Bottom[i]*1E9                #multiply by -1 to flip over
 
        savewriter.writerow([
                x[i], y[i], 
                xLoc[i], yLoc[i],
                BottomOut, 
                z[i]*1e9, BottomOut + z[i]*1e9,
                z[i], BottomOut+z[i],
                air_thick[i]*1e9, air_thick[i],
                grad[i], gradR2[i]
                ])
  

for path, resolution, side in zip(DataPath, Resolution, SideLength):  
  #loop through all the files
  print(path)
  main(path, Sensitivity, resolution, side)

