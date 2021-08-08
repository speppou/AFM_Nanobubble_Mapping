 # -*- coding: utf-8 -*-
"""
Created on Thu Jan 24 09:50:36 2019

@author: Sam Peppou-Chapman
"""

#Script to automatically calculate sensitivity from force curves on 
#some incompressible substrate 
#force curves must be in their own folder

#Takes in deflection data (in volts) and zsensor data (in nm) to give sensitivity in nm/V

import numpy as np
import scipy.stats
import os.path
import glob
import csv

def main():

##### Variables that need to be changed ######


    DataPath = r'F:\Temp for export\BareSi00\BareSi00'                
        #DataPath is the folder that contains the Ascii 
        #force curves (from Asylum)     
        #Don't remove the 'r' at the front
  

##### End varaibles that need to be changed ######
        
    DataPath.replace('\\', '/') #sanatise path if it is on windows
    DataPath = DataPath + '/'
    
    SavePath = DataPath + 'Sensitivity.csv'
    
    InitialiseSaveFile(SavePath)
    
    ExtendSens = [] #initialise an array to store the sensitivity data
    RetractSens = []

    for Xfilename in glob.glob(os.path.join(DataPath, '*ZSnsr.txt')):  
      #load the x-data for the first file
        
        #find the unique part of the filename
        currentFileName = os.path.basename(Xfilename)
        currentFileName = currentFileName.replace('ZSnsr.txt','')
        print(currentFileName)      
        
        #build the file path for the Y data
        Yfilename = DataPath + currentFileName + 'DeflV.txt'
        
        #load the data
        currentFileX = np.loadtxt(Xfilename)
        currentFileY = np.loadtxt(Yfilename)
        
        #find the contact region for both extend and retract by first separating
        #extend and retract and then deleteing everything that isnt contact region
        maxIndex = np.argmax(currentFileY)
        retractDeleteArray = np.arange(maxIndex,len(currentFileY)) #all indexes after the max
        extendDeleteArray = np.arange(0,maxIndex)  #all indexes before the max
        
        #separate out extend and retract
        ExtendX = np.delete(currentFileX, extendDeleteArray)   
        ExtendY = np.delete(currentFileY, extendDeleteArray)
        RetractX = np.delete(currentFileX, retractDeleteArray)
        RetractY = np.delete(currentFileY, retractDeleteArray)
        
        ExtendMin = np.argmin(ExtendY)
        RetractMin = np.argmin(RetractY)
        
        #generagete the array to delete everything that isnt the contact region
        ContactExtendDeleteArray = np.arange(ExtendMin,len(ExtendY)) 
        ContactRetractDeleteArray = np.arange(0,RetractMin)
        
        #extract the contact region
        ContactExtendX = np.delete(ExtendX, ContactExtendDeleteArray)  
        ContactExtendY = np.delete(ExtendY, ContactExtendDeleteArray)
        ContactRetractX = np.delete(RetractX, ContactRetractDeleteArray)
        ContactRetractY = np.delete(RetractY, ContactRetractDeleteArray)
        
        #fit a line to the contact regions, moving closer and closer to the middle 
        #until the residual is small enough
        
        ExtendCoeffs = scipy.stats.linregress(ContactExtendX, ContactExtendY)
        RetractCoeffs = scipy.stats.linregress(ContactRetractX, ContactRetractY)
        
        while ExtendCoeffs[2]**2 < 0.99: 
            #20190227 Commented out these deletions so that all deletions are from  
            #turnaround point toward the contact point to get rid of non-linear effects
            #ContactExtendX = np.delete(ContactExtendX,[len(ContactExtendX)-1])        
            ContactExtendX = np.delete(ContactExtendX,[0])                            
            #ContactExtendY = np.delete(ContactExtendY,[len(ContactExtendY)-1])
            ContactExtendY = np.delete(ContactExtendY,[0])
            
            ExtendCoeffs = scipy.stats.linregress(ContactExtendX, ContactExtendY)
            
        while RetractCoeffs[2]**2 < 0.9:
            ContactRetractX = np.delete(ContactRetractX,[len(ContactRetractX)-1])
            #ContactRetractX = np.delete(ContactRetractX,[0])
            ContactRetractY = np.delete(ContactRetractY,[len(ContactRetractY)-1])
            #ContactRetractY = np.delete(ContactRetractY,[0]) 
            
            RetractCoeffs = scipy.stats.linregress(ContactRetractX, ContactRetractY)
            
        ExtendSens.append(1/ExtendCoeffs[0])
        RetractSens.append(1/RetractCoeffs[0])
        
        WriteFile(SavePath, currentFileName, 1/ExtendCoeffs[0], 1/RetractCoeffs[0])
        
    AvExSens = np.mean(ExtendSens)
    AvRetSens = np.mean(RetractSens)
    
    WriteFile(SavePath, '', '', '')
    WriteFile(SavePath, 'Average:', AvExSens, AvRetSens)
    
    print("")
    print("Extend Sensitivity: " + str(AvExSens) + " m/V")
    print("Retract Sensitivity: " + str(AvRetSens) + " m/V")
                
       
def InitialiseSaveFile(path):
  #initialises the save file so that there is somewhere to save                          
    with open(path, 'w') as csvfile:
        savewriter = csv.writer(csvfile, delimiter=',', 
                                quotechar='|', quoting=csv.QUOTE_MINIMAL, lineterminator='\n')
        savewriter.writerow(['File', 'Extend Sensitivity (m/V)', 'Retract Sensitivity (m/V)'])
  
  
    return()
  

def WriteFile(path,filename,ExtendSens,RetractSens):          
  #adds a row to the .csv save file                                                                    
    with open(path,'a') as csvfile:
        savewriter = csv.writer(csvfile, delimiter=',', quotechar=' ',
                                quoting=csv.QUOTE_MINIMAL, lineterminator='\n')
        savewriter.writerow([filename, ExtendSens, RetractSens])
    return()

 
main()        