import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import scipy.linalg
import os.path
from mpl_toolkits.axes_grid1.axes_divider import make_axes_locatable
from mpl_toolkits.axes_grid1.colorbar import colorbar
import matplotlib.ticker as ticker
from matplotlib import rcParams
rcParams['font.family'] = 'serif'

########## Variable declaration ##########

path = r"F:\Dropbox (Sydney Uni)\PhD\Analysed Data\AFM\Asylum Force Processing\20190725 - Underwater TW PDMS CVD Tip\CVDTipUW07_summary_2021-03-14Nanobubble.csv"

DPI = 300

figure_size = (6,2)


########## Functions ##########

def get_z(mat, x, y):
    ind = (mat[:,(0,1)] == (x,y)).all(axis=1)
    row = mat[ind,:]
    return row[0,2]

def LineFit(data4Fit,x): #function to fit a line to each scan line
    XforFit = x 
    Fit = data4Fit
    #fit a line to each line
    for i in range(0,len(data4Fit[0,:])):
        coef=np.polyfit(XforFit,data4Fit[:,i],1)
        fit = coef[0]*XforFit+coef[1]
        Fit[:,i] = data4Fit[:,i] - fit
        
    return(Fit)
    
def PlaneFit(data4Fit,X,Y): #returns a plane that best fits the data
    A = np.c_[data4Fit[:,0], data4Fit[:,1], np.ones(data4Fit[:,2].shape[0])] 
    C,_,_,_ = scipy.linalg.lstsq(A, data4Fit[:,2])    # coefficients
    # evaluate it on grid
    Z = C[0]*X + C[1]*Y + C[2]
    
    return(Z)

def RemoveOutliers(data, n=6):
    #replace values more than n SD with average value
    AverageHeight = np.mean(data)
    STDHeight = np.std(data)
  
    #delete outliers
    for i in range(0,len(data[0,:])):
        for j in range(0,len(data[0,:])):
            if abs(data[i,j]) > AverageHeight + n*STDHeight: 
                data[i,j] = AverageHeight 
    return data

def SetZero(data):
    #normalise the fit so that the min value is zero
    Min = np.amin(data)
    MinPlane = np.full((len(data[:,0]),len(data[0,:])),Min)
    return np.subtract(data,MinPlane)


########## data manipulation ##########

print('path: ' + str(path))

if os.path.isfile(path) == True:

  dataHeight = np.genfromtxt(path, 
                             delimiter=',',
                             skip_header=1,
                             usecols=(2,3,4))
  dataThickness = np.genfromtxt(path, 
                                delimiter=',',
                                skip_header=1,
                                usecols=(2,3,5))
  dataSum = np.genfromtxt(path, 
                          delimiter=',',
                          skip_header=1,
                          usecols=(2,3,6))
  dataThicknessAir = np.genfromtxt(path, 
                                   delimiter=',',
                                   skip_header=1,
                                   usecols=(2,3,9))
  
  y = np.unique(dataHeight[:,1])
  x = np.unique(dataHeight[:,0])
  
  X,Y = np.meshgrid(x, y)
  
  height = np.array([get_z(dataHeight,x,y) for (x,y) in zip(np.ravel(X), np.ravel(Y))])
  Height = height.reshape(X.shape)
  
  thick = np.array([get_z(dataThickness,x,y) for (x,y) in zip(np.ravel(X), np.ravel(Y))])
  Thick = thick.reshape(X.shape)
  
  thickAir = np.array([get_z(dataThicknessAir,x,y) for (x,y) in zip(np.ravel(X), np.ravel(Y))])
  ThickAir = thickAir.reshape(X.shape)
  
  sum = np.array([get_z(dataSum,x,y) for (x,y) in zip(np.ravel(X), np.ravel(Y))])
  Sum = sum.reshape(X.shape)
  
  #Fit a plane to the data
  A = np.c_[dataSum[:,0], dataSum[:,1], np.ones(dataSum.shape[0])] 
  C,_,_,_ = scipy.linalg.lstsq(A, dataSum[:,2])    # coefficients
  
  HeightFit = Height
  HeightFit = HeightFit - PlaneFit(dataSum,X,Y)  

  #HeightFit = LineFit(Height,x)
  HeightFit = RemoveOutliers(HeightFit,n=10) 
  HeightFit = SetZero(HeightFit)
      
  #HeightFit = HeightFit + Thick + ThickAir
  HeightFit = RemoveOutliers(HeightFit,n=3)
  
  ########## Plotting ##########
  
  #contour levels in nm
  Levels = [0,2,4,6,8,10,12,14,16,18,20] 
  Levels2 = [0,100,150,300]
  Levels3 = [0,2,4,6,8,10,12,14,16,18,20,22,24,26]
  
  ColourSeries=['#00005b','#290964','#52136d','#7b1c76','#9c3b6b','#bd5b5f','#df7b53','#e79c38','#f0bc1c','#f8dd00']
  ColourSeries2=['#fbe955','#fbe955','#fdf4ab','#ffffff']
  ColourSeries3=['#00005b','#290964','#52136d','#7b1c76','#9c3b6b','#bd5b5f','#df7b53','#e79c38','#f0bc1c','#f8dd00','#fbe955','#fdf4ab','#ffffff']
  
  fig, (ax1,ax2,ax3) = plt.subplots(1,3, sharey='row', figsize = figure_size) 
  fig.subplots_adjust(wspace = 0.13) 
  
  #### Topography ####
  
  TranHeightFit = np.transpose(HeightFit)
  
  cb = ax1.imshow(TranHeightFit, 
                  cmap='inferno', 
                  interpolation = 'hanning',
                  extent=(0,np.amax(X),0,np.amax(Y)),
                  origin = 'lower')
  
  ax1_divider = make_axes_locatable(ax1)
  cax1 = ax1_divider.append_axes("top", size="7%", pad="2%")

  ax1.set_ylabel('$\mu$m',family='serif')
  ax1.xaxis.set_major_locator(ticker.LinearLocator(3))
  ax1.yaxis.set_major_locator(ticker.LinearLocator(3))
  cbar = colorbar(cb, cax=cax1, orientation='horizontal')
  ax1.set_aspect('equal')
  cax1.xaxis.set_ticks_position("top")
  cax1.xaxis.set_major_locator(ticker.LinearLocator(2))

  #### Lubricant Thickness ####
  Z = [[0,0],[0,0]]
  CS3 = plt.contourf(Z, Levels3, colors=ColourSeries3)
  
  ax2.contourf(Y, X, Thick, Levels2, colors=ColourSeries2)
  contplt_cb=ax2.contourf(Y, X, Thick, Levels, colors=ColourSeries)
  ax2_divider = make_axes_locatable(ax2)
  cax2 = ax2_divider.append_axes("top", size="7%", pad="2%")
  ax2.xaxis.set_major_locator(ticker.LinearLocator(3))
  CB = colorbar(CS3, cax=cax2, orientation='horizontal')
  ax2.set_aspect('equal')
  cax2.xaxis.set_ticks_position("top")
  cax2.xaxis.set_ticks(Levels3)
  cax2.xaxis.set_ticklabels(['0','','4','','8','','12','','16','','20', '150','300','>300'],
                            rotation=0,
                            family='serif')
  # Create offset transform by 5 points in x direction
  dx = 3/72.; dy = 0/72. 
  offset = matplotlib.transforms.ScaledTranslation(dx, dy, fig.dpi_scale_trans)
  
  for i, t in enumerate(cax2.get_xticklabels()):
      if i<11:
          pass
      else:
          #t.set_rotation_mode('anchor')
          t.set_horizontalalignment('left')
          t.set_rotation(90)
          t.set_transform(t.get_transform() - offset)

  
  #### Air Thickness ####
  ax3.contourf(Y, X, ThickAir, Levels2, colors=ColourSeries2)
  contplt_cb=ax3.contourf(Y, X, ThickAir, Levels, colors=ColourSeries)
  ax3_divider = make_axes_locatable(ax3)
  ax3.xaxis.set_major_locator(ticker.LinearLocator(3))
  cax3 = ax3_divider.append_axes("top", size="7%", pad="2%")
  cax3.set_position([0,0,1,1])
  CB = colorbar(CS3, cax=cax3, orientation='horizontal')
  cax3.xaxis.set_ticks_position("top")
  cax3.xaxis.set_ticks(Levels3)
  cax3.xaxis.set_ticklabels(['0','','4','','8','','12','','16','','20', '150','300','>300'])
  
  # Create offset transform by 5 points in x direction
  dx = 3/72.; dy = 0/72. 
  offset = matplotlib.transforms.ScaledTranslation(dx, dy, fig.dpi_scale_trans)
  
  for i, t in enumerate(cax3.get_xticklabels()):
      if i<11:
          pass
      else:
          #t.set_rotation_mode('anchor')
          t.set_horizontalalignment('left')
          t.set_rotation(90)
          t.set_transform(t.get_transform() - offset)

         
  ax3.set_aspect('equal')
  
  ## Add titles ##
  
  title_y = 1.22
  title_size = 10
  
  ax1.set_title('Topography', y=title_y,size=title_size)
  ax2.set_title('Lubricant\nThickness', y=title_y,size=title_size)
  ax3.set_title('Air\nThickness', y=title_y,size=title_size)
  
  plt.savefig(path.replace('.csv','_nanobubble.png'), format='png', dpi=DPI, bbox_inches="tight")
  
  plt.show()
  




