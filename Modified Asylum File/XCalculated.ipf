#Ifdef ARrtGlobals
#pragma rtGlobals=1        // Use modern global access method.
#else
#pragma rtGlobals=3        // Use strict wave reference mode
#endif 

#pragma ModuleName=xCalculated


////////////////////////////////////////////////////////////////////////
//All your functions go in the ipf in UserCalculated
//None of your functions should go in this ipf, we will overwrite this one
//with the installer
//but will never overwrite UserCalculated.ipf


Function CalcPhaseFromIQ(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = ""
	
	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
	
	DataFolder = GetDF("Variables")
//	Wave MVW = $DataFolder+"MasterVariablesWave"
//	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave FVW = $DataFolder+"ForceVariablesWave"
//	Wave NVW = $DataFolder+"NapVariablesWave"
//	Wave CVW = $DataFolder+"ChannelVariablesWave"
//	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
	
	//to pull out a specific value, you need to do things the hard way
	//the easy wave (with GV), is too slow.
	//Here is how you would do it.
	//from the command line type:
	//Print GWNS("MyParmName")
	//For this example, lets use SpringConstant
	//Print GWNS("SpringConstant")
	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
	//Now we know this parameter is in the masterVariablesWave
	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
	//Then we accress the wave directly:
	//Variable MyParmName = MVW[%MyParmName][%Value]
	//or in our example:
	//Variable SpringConstant = MVW[%SpringConstant][%Value]
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	String SavedDataFolder = GetDataFolder(1)
	SetDataFolder(DataFolder)
	
	
	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
	//our exmaple only needs inputI and InputQ
	//I guess it is a good idea to mention that it is up to you to make sure that 
	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
	//the data in those waves is unreliable.
	
	if (IsImage)		//Images
//		Wave Height = HeightWave
//		Wave Amplitude = AmplitudeWave
//		Wave Deflection = DeflectionWave
//		Wave Phase = PhaseWave
//		Wave UserIn1 = $FindUserName("UserIn1","Name")+"Wave"
//		Wave UserIn0 = $FindUserName("UserIn0","Name")+"Wave"
//		Wave UserIn2 = $FindUserName("UserIn2","Name")+"Wave"
		Wave Inputi = InputiWave
		Wave Inputq = InputqWave
//		Wave Lateral = LateralWave
//		Wave ZSensor = ZSensorWave
//		Wave Frequency = FrequencyWave
//		Wave Current = CurrentWave
	else
//		Wave UserCalc = $FindUserName("UserCalc","Name")
//		Wave UserCalcB = $FindUserName("UserCalcB","Name")
	//you probably should not address the UserCalc wave directly
	//the function that calls this function will be filling in the values into this wave
	//based on this functions output.
//		Wave DeflVolts = DeflVolts
//		Wave Deflection = Deflection
//		Wave Force = Force
//		Wave ZSensorVolts = ZSensorVolts
//		Wave RawZSensor = RawZSensor
//		Wave DriveVolts = DriveVolts
//		Wave Amplitude = Amplitude
//		Wave AmpVolts = AmpVolts
//		Wave Phase = Phase
//		Wave UserIn0 = $FindUserName("UserIn0","Name")
//		Wave UserIn1 = $FindUserName("UserIn1","Name")
//		Wave UserIn2 = $FindUserName("UserIn2","Name")
//		Wave Lateral = Lateral
//		Wave Frequency = Frequency
//		Wave Current = Current
//		Wave Count = Count
//		Wave Count2 = Count2
//		Wave/T CTFCParms = CTFCParms
		Wave InputI = InputI
		Wave InputQ = InputQ
	endif
	
	//here is the wave that will be popuplated with the results of this function.
	//you probably should not put values in here directly.
	
	//Wave CalculatedWave = CalculatedWave
	
	
	SetDataFolder(SavedDataFolder)
	
	Variable/C PolarCoord = r2polar(cmplx(InputI[RowIndex][ColIndex],InputQ[RowIndex][ColIndex]))
	Variable output = imag(PolarCoord)*180/pi
	return(output)
	
	//return(0)
End //CalcPhaseFromIQ


Function CalcAmpFromIQ(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = ""
	
	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
	
	DataFolder = GetDF("Variables")
	Wave MVW = $DataFolder+"MasterVariablesWave"
	
//	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave FVW = $DataFolder+"ForceVariablesWave"
//	Wave NVW = $DataFolder+"NapVariablesWave"
//	Wave CVW = $DataFolder+"ChannelVariablesWave"
//	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
	
	//to pull out a specific value, you need to do things the hard way
	//the easy wave (with GV), is too slow.
	//Here is how you would do it.
	//from the command line type:
	//Print GWNS("MyParmName")
	//For this example, lets use SpringConstant
	//Print GWNS("SpringConstant")
	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
	//Now we know this parameter is in the masterVariablesWave
	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
	//Then we accress the wave directly:
	//Variable MyParmName = MVW[%MyParmName][%Value]
	//or in our example:
	//Variable SpringConstant = MVW[%SpringConstant][%Value]
	

	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	String SavedDataFolder = GetDataFolder(1)
	SetDataFolder(DataFolder)
	
	
	
	
	
	
	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
	//our exmaple only needs inputI and InputQ
	//I guess it is a good idea to mention that it is up to you to make sure that 
	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
	//the data in those waves is unreliable.
	
	if (IsImage)		//Images
//		Wave Height = HeightWave
//		Wave Amplitude = AmplitudeWave
//		Wave Deflection = DeflectionWave
//		Wave Phase = PhaseWave
//		Wave UserIn1 = $FindUserName("UserIn1","Name")+"Wave"
//		Wave UserIn0 = $FindUserName("UserIn0","Name")+"Wave"
//		Wave UserIn2 = $FindUserName("UserIn2","Name")+"Wave"
		Wave Inputi = InputiWave
		Wave Inputq = InputqWave
//		Wave Lateral = LateralWave
//		Wave ZSensor = ZSensorWave
//		Wave Frequency = FrequencyWave
//		Wave Current = CurrentWave
	else
//		Wave UserCalc = $FindUserName("UserCalc","Name")
//		Wave UserCalcB = $FindUserName("UserCalcB","Name")
	//you probably should not address the UserCalc wave directly
	//the function that calls this function will be filling in the values into this wave
	//based on this functions output.
//		Wave DeflVolts = DeflVolts
//		Wave Deflection = Deflection
//		Wave Force = Force
//		Wave ZSensorVolts = ZSensorVolts
//		Wave RawZSensor = RawZSensor
//		Wave DriveVolts = DriveVolts
//		Wave Amplitude = Amplitude
//		Wave AmpVolts = AmpVolts
//		Wave Phase = Phase
//		Wave UserIn0 = $FindUserName("UserIn0","Name")
//		Wave UserIn1 = $FindUserName("UserIn1","Name")
//		Wave UserIn2 = $FindUserName("UserIn2","Name")
//		Wave Lateral = Lateral
//		Wave Frequency = Frequency
//		Wave Current = Current
//		Wave Count = Count
//		Wave Count2 = Count2
//		Wave/T CTFCParms = CTFCParms
		Wave InputI = InputI
		Wave InputQ = InputQ
	endif
	
	//here is the wave that will be popuplated with the results of this function.
	//you probably should not put values in here directly.
	
	//Wave CalculatedWave = CalculatedWave
	
	
	SetDataFolder(SavedDataFolder)
	
	Variable/C PolarCoord = r2polar(cmplx(InputI[RowIndex][ColIndex],InputQ[RowIndex][ColIndex]))
	Variable Invols = MVW[%AmpInvols][0]
	Variable output = Real(PolarCoord)*Invols
	return(output)
	
	//return(0)
End //CalcAmpFromIQ


Function CalcIFromAmpPhase(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = ""
	
	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
	
	DataFolder = GetDF("Variables")
//	Wave MVW = $DataFolder+"MasterVariablesWave"
	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave FVW = $DataFolder+"ForceVariablesWave"
//	Wave NVW = $DataFolder+"NapVariablesWave"
//	Wave CVW = $DataFolder+"ChannelVariablesWave"
//	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
	
	//to pull out a specific value, you need to do things the hard way
	//the easy wave (with GV), is too slow.
	//Here is how you would do it.
	//from the command line type:
	//Print GWNS("MyParmName")
	//For this example, lets use SpringConstant
	//Print GWNS("SpringConstant")
	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
	//Now we know this parameter is in the masterVariablesWave
	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
	//Then we accress the wave directly:
	//Variable MyParmName = MVW[%MyParmName][%Value]
	//or in our example:
	//Variable SpringConstant = MVW[%SpringConstant][%Value]
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	String SavedDataFolder = GetDataFolder(1)
	SetDataFolder(DataFolder)
	
	
	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
	//our exmaple only needs inputI and InputQ
	//I guess it is a good idea to mention that it is up to you to make sure that 
	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
	//the data in those waves is unreliable.
	String WaveNameStr = ""
	if (TVW[%DualACMode][0])
		if (TVW[%SecondFrequency][0])
			WaveNameStr = "2"
		else
			WaveNameStr = "1"
		endif
	endif
	
	
	if (IsImage)		//Images
		Wave Amp = $"Amplitude"+WaveNameStr+"Wave"
		Wave Phase = $"Phase"+WaveNameStr+"Wave"
	else
		Wave Amp = $"Amp"+WaveNameStr+"Volts"
		Wave Phase = $"Phase"+WaveNameStr
	endif
	
	//here is the wave that will be popuplated with the results of this function.
	//you probably should not put values in here directly.
	
	//Wave CalculatedWave = CalculatedWave
	
	
	SetDataFolder(SavedDataFolder)
	
	Variable/C PolarCoord = p2rect(cmplx(Amp[RowIndex][ColIndex],Phase[RowIndex][ColIndex]*pi*2/360))
	Variable output = Real(PolarCoord)
	return(output)
	
	//return(0)
End //CalcIFromAmpPhase


Function CalcQFromAmpPhase(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = ""
	
	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
	
	DataFolder = GetDF("Variables")
//	Wave MVW = $DataFolder+"MasterVariablesWave"
	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave FVW = $DataFolder+"ForceVariablesWave"
//	Wave NVW = $DataFolder+"NapVariablesWave"
//	Wave CVW = $DataFolder+"ChannelVariablesWave"
//	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
	
	//to pull out a specific value, you need to do things the hard way
	//the easy wave (with GV), is too slow.
	//Here is how you would do it.
	//from the command line type:
	//Print GWNS("MyParmName")
	//For this example, lets use SpringConstant
	//Print GWNS("SpringConstant")
	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
	//Now we know this parameter is in the masterVariablesWave
	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
	//Then we accress the wave directly:
	//Variable MyParmName = MVW[%MyParmName][%Value]
	//or in our example:
	//Variable SpringConstant = MVW[%SpringConstant][%Value]
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	String SavedDataFolder = GetDataFolder(1)
	SetDataFolder(DataFolder)
	
	
	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
	//our exmaple only needs inputI and InputQ
	//I guess it is a good idea to mention that it is up to you to make sure that 
	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
	//the data in those waves is unreliable.
	String WaveNameStr = ""
	if (TVW[%DualACMode][0])
		if (TVW[%SecondFrequency][0])
			WaveNameStr = "2"
		else
			WaveNameStr = "1"
		endif
	endif
	
	if (IsImage)		//Images
		Wave Amp = $"Amplitude"+WaveNameStr+"Wave"
		Wave Phase = $"Phase"+WaveNameStr+"Wave"
	else
		Wave Amp = $"Amp"+WaveNameStr+"Volts"
		Wave Phase = $"Phase"+WaveNameStr
	endif
	
	//here is the wave that will be popuplated with the results of this function.
	//you probably should not put values in here directly.
	
	//Wave CalculatedWave = CalculatedWave
	
	
	SetDataFolder(SavedDataFolder)
	
	Variable/C PolarCoord = p2rect(cmplx(Amp[RowIndex][ColIndex],Phase[RowIndex][ColIndex]*pi*2/360))
	Variable output = Imag(PolarCoord)
	return(output)
	
	//return(0)
End //CalcQFromAmpPhase



Function Chan1RetraceMinusTrace(RowIndex,ColIndex)	//This is actually subtract the other direction from the displayed one.
	Variable RowIndex, ColIndex								//If you display Retrace, you are getting Retrace - Trace
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = "", VarFolder = ""
	
	
	VarFolder = GetDF("Variables")
	wave RVW = $VarFolder+"RealVariablesWave"			//use this wave for variables that can be changed but not applied during a scan, such as ScanPoints
	Wave/T CVD = $VarFolder+"ChannelVariablesDescription"
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	
	String UserName = FindUserName(CVD[%Channel1DataType][%Title],"Name")
	if (IsImage)		//Images
		Wave InputWave = $DataFolder+UserName+"Wave"
	else
		return 0			//This function doesn't really make sense as a force curve.
	endif
	
	//if you display Trace you get Trace-Retrace, if you display Retrace you get Retrace - Trace
	variable points = RVW[%ScanPoints][0]*2.5
	variable output
	output = InputWave[RowIndex][ColIndex]-InputWave[points-rowIndex-1][colIndex]
	Variable Scale, Offset
	if (StringMatch(UserName,"Lateral"))
		Wave MVW = $VarFolder+"MasterVariablesWave"			//use this wave for variables that can be changed but not applied during a scan, such as ScanPoints
		output /= 2
		Scale = MVW[%LateralGain][0]
		Offset = -MVW[%LateralOffset][0]/Scale
		Output = (output-Offset)*Scale
	endif
	return(output)
	
	//return(0)
End //Chan1RetraceMinusTrace


Function Chan2RetraceMinusTrace(RowIndex,ColIndex)	//This is actually subtract the other direction from the displayed one.
	Variable RowIndex, ColIndex								//If you display Retrace, you are getting Retrace - Trace
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = "", VarFolder = ""
	
	
	VarFolder = GetDF("Variables")
	wave RVW = $VarFolder+"RealVariablesWave"			//use this wave for variables that can be changed but not applied during a scan, such as ScanPoints
	Wave/T CVD = $VarFolder+"ChannelVariablesDescription"
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	
	String UserName = FindUserName(CVD[%Channel2DataType][%Title],"Name")
	if (IsImage)		//Images
		Wave InputWave = $DataFolder+UserName+"Wave"
	else
		return 0			//This function doesn't really make sense as a force curve.
	endif
	
	//if you display Trace you get Trace-Retrace, if you display Retrace you get Retrace - Trace
	variable points = RVW[%ScanPoints][0]*2.5
	variable output
	output = InputWave[RowIndex][ColIndex]-InputWave[points-rowIndex-1][colIndex]
	Variable Scale, Offset
	if (StringMatch(UserName,"Lateral"))
		Wave MVW = $VarFolder+"MasterVariablesWave"			//use this wave for variables that can be changed but not applied during a scan, such as ScanPoints
		output /= 2
		Scale = MVW[%LateralGain][0]
		Offset = -MVW[%LateralOffset][0]/Scale
		Output = (output-Offset)*Scale
	endif
	return(output)
	
	//return(0)
End //Chan2RetraceMinusTrace

#if 1
Function CalcLossTan1(RowIndex,ColIndex)
	Variable RowIndex
	Variable ColIndex
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"LossTangent1",RowIndex=RowIndex,ColIndex=ColIndex)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
	return(sAMFMCalc.PointOutput)
End //CalcLossTan1
	
//Function CalcLossTan1old(RowIndex,ColIndex)
//	Variable RowIndex, ColIndex
//	
//	Variable IsImage = ColIndex >= 0
//	String DataFolder = ""
//	
//	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
//	
//	DataFolder = GetDF("Variables")
////	Wave MVW = $DataFolder+"MasterVariablesWave"
//	Wave TVW = $DataFolder+"ThermalVariablesWave"
////	Wave FVW = $DataFolder+"ForceVariablesWave"
////	Wave NVW = $DataFolder+"NapVariablesWave"
////	Wave CVW = $DataFolder+"ChannelVariablesWave"
////	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
//	
//	//to pull out a specific value, you need to do things the hard way
//	//the easy wave (with GV), is too slow.
//	//Here is how you would do it.
//	//from the command line type:
//	//Print GWNS("MyParmName")
//	//For this example, lets use SpringConstant
//	//Print GWNS("SpringConstant")
//	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
//	//Now we know this parameter is in the masterVariablesWave
//	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
//	//Then we accress the wave directly:
//	//Variable MyParmName = MVW[%MyParmName][%Value]
//	//or in our example:
//	//Variable SpringConstant = MVW[%SpringConstant][%Value]
//	
//	if (IsImage)
//		DataFolder = "root:Packages:MFP3D:Main:"
//	else
//		DataFolder = "root:Packages:MFP3D:Force:"
//		ColIndex = 0
//	endif
//	String SavedDataFolder = GetDataFolder(1)
//	SetDataFolder(DataFolder)
//	
//	
//	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
//	//our exmaple only needs inputI and InputQ
//	//I guess it is a good idea to mention that it is up to you to make sure that 
//	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
//	//the data in those waves is unreliable.
//	
//	if (IsImage)		//Images
//		if (TVW[%DualACMode][0])
//			Wave Amplitude = Amplitude1Wave
//			Wave Phase = Phase1Wave
//		else
//			Wave Amplitude = AmplitudeWave
//			Wave Phase = PhaseWave
//		endif
//	else		//force plots
//		if (TVW[%DualACMode][0])
//			Wave Amplitude = Amplitude1
//			Wave Phase = Phase1
//		else
//			Wave Amplitude = Amplitude
//			Wave Phase = Phase
//		endif
//	endif
//
//	
//	//here is the wave that will be popuplated with the results of this function.
//	//you probably should not put values in here directly.
//	
//	//Wave CalculatedWave = CalculatedWave
//	
//	if (IsImage && ((ColIndex >= DimSize(Amplitude,1)) || (ColIndex >= DimSize(Phase,1))))
//		return(0)
//	elseif ((RowIndex >= DimSize(Amplitude,0)) || (RowIndex >= DimSize(Phase,0)))
//		return(0)
//	endif
//
//	SetDataFolder(SavedDataFolder)
//	
//	Variable PhaseRadians = Phase[RowIndex][ColIndex]*pi/180
//	Variable MaxAmplitude = TVW[%LossTanAmp1][0]
//	Variable output = (sin(PhaseRadians)-Amplitude[RowIndex][ColIndex]/MaxAmplitude)/cos(PhaseRadians)
//	
//	return(output)
//	
//	//return(0)
//End //CalcLossTan1


Function CalcLossTan2(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = ""
	
	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
	
	DataFolder = GetDF("Variables")
//	Wave MVW = $DataFolder+"MasterVariablesWave"
	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave FVW = $DataFolder+"ForceVariablesWave"
//	Wave NVW = $DataFolder+"NapVariablesWave"
//	Wave CVW = $DataFolder+"ChannelVariablesWave"
//	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
	
	//to pull out a specific value, you need to do things the hard way
	//the easy wave (with GV), is too slow.
	//Here is how you would do it.
	//from the command line type:
	//Print GWNS("MyParmName")
	//For this example, lets use SpringConstant
	//Print GWNS("SpringConstant")
	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
	//Now we know this parameter is in the masterVariablesWave
	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
	//Then we accress the wave directly:
	//Variable MyParmName = MVW[%MyParmName][%Value]
	//or in our example:
	//Variable SpringConstant = MVW[%SpringConstant][%Value]
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	String SavedDataFolder = GetDataFolder(1)
	SetDataFolder(DataFolder)
	
	
	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
	//our exmaple only needs inputI and InputQ
	//I guess it is a good idea to mention that it is up to you to make sure that 
	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
	//the data in those waves is unreliable.
	
	if (IsImage)		//Images
		if (TVW[%DualACMode][0])
			Wave Amplitude = Amplitude2Wave
			Wave Phase = Phase2Wave
		else
			SetDataFolder(SavedDataFolder)
			return(0)
			Wave Amplitude = AmplitudeWave
			Wave Phase = PhaseWave
		endif
	else		//force plots
		if (TVW[%DualACMode][0])
			Wave Amplitude = Amplitude2
			Wave Phase = Phase2
		else
			SetDataFolder(SavedDataFolder)
			return(0)
			Wave Amplitude = Amplitude
			Wave Phase = Phase
		endif
	endif
	
	//here is the wave that will be popuplated with the results of this function.
	//you probably should not put values in here directly.
	
	//Wave CalculatedWave = CalculatedWave
	
	SetDataFolder(SavedDataFolder)
	if (IsImage && ((ColIndex >= DimSize(Amplitude,1)) || (ColIndex >= DimSize(Phase,1))))
		return(0)
	elseif ((RowIndex >= DimSize(Amplitude,0)) || (RowIndex >= DimSize(Phase,0)))
		return(0)
	endif
	
	Variable PhaseRadians = Phase[RowIndex][ColIndex]*pi/180
	Variable MaxAmplitude = TVW[%LossTanAmp2][0]
	Variable output = (sin(PhaseRadians)-Amplitude[RowIndex][ColIndex]/MaxAmplitude)/cos(PhaseRadians)
	
	return(output)
	
	//return(0)
End //CalcLossTan2


Function NapCalcLossTan1(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	Variable IsImage = ColIndex >= 0
	String DataFolder = ""
	
	//DONT USE GV IN THESE FUNCTIONS, READ BELOW:
	
	DataFolder = GetDF("Variables")
//	Wave MVW = $DataFolder+"MasterVariablesWave"
	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave FVW = $DataFolder+"ForceVariablesWave"
//	Wave NVW = $DataFolder+"NapVariablesWave"
	Wave/T CVD = $DataFolder+"ChannelVariablesDescription"
	Wave ParmSwap = root:Packages:MFP3D:Main:ParmSwap
	//	Wave NCVW = $DataFolder+"NapChannelVariablesWave"
	
	//to pull out a specific value, you need to do things the hard way
	//the easy wave (with GV), is too slow.
	//Here is how you would do it.
	//from the command line type:
	//Print GWNS("MyParmName")
	//For this example, lets use SpringConstant
	//Print GWNS("SpringConstant")
	//root:Packages:MFP3D:Main:Variables:MasterVariablesWave
	//Now we know this parameter is in the masterVariablesWave
	//So we uncomment the MVW = $DataFolder+"MasterVariablesWave line above
	//Then we accress the wave directly:
	//Variable MyParmName = MVW[%MyParmName][%Value]
	//or in our example:
	//Variable SpringConstant = MVW[%SpringConstant][%Value]
	
	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
		ColIndex = 0
	endif
	String SavedDataFolder = GetDataFolder(1)
	SetDataFolder(DataFolder)
	
	
	//Here is a list of all the RT images, uncomment the ones you need and comment out the ones you don't
	//our exmaple only needs inputI and InputQ
	//I guess it is a good idea to mention that it is up to you to make sure that 
	//Both I and Q are turned on when you use CalcPhaseFromIQ, otherwise
	//the data in those waves is unreliable.
	
	if (IsImage)		//Images
		if (TVW[%DualACMode][0])
			Wave Amplitude = Amplitude1Wave
			Wave Phase = Phase1Wave
		else
			Wave Amplitude = AmplitudeWave
			Wave Phase = PhaseWave
		endif
		Wave Freq = FrequencyWave
		if ((DimSize(Freq,1) < 16) || (DimSize(Amplitude,1) < 16) || (DimSize(Phase,1) < 16))
			return(0)
		endif
	else		//force plots
		if (TVW[%DualACMode][0])
			Wave Amplitude = Amplitude1
			Wave Phase = Phase1
		else
			Wave Amplitude = Amplitude
			Wave Phase = Phase
		endif
		if ((DimSize(Amplitude,1) < 16) || (DimSize(Phase,1) < 16))
			return(0)
		endif
		//Wave Freq = Frequency
	endif

	
	//here is the wave that will be popuplated with the results of this function.
	//you probably should not put values in here directly.
	
	//Wave CalculatedWave = CalculatedWave
	
	if (IsImage && ((ColIndex >= DimSize(Amplitude,1)) || (ColIndex >= DimSize(Phase,1)) || (ColIndex >= DimSize(Freq,1))))
		return(0)
	elseif ((RowIndex >= DimSize(Amplitude,0)) || (RowIndex >= DimSize(Phase,0)))
		return(0)
	endif

	SetDataFolder(SavedDataFolder)
	
	Variable PhaseRadians
	Variable MaxAmplitude = TVW[%LossTanAmp1][0]
	Variable MaxFreq = TVW[%LossTanFreq1][0]
	Variable QFactor = TVW[%LossTanQ1][0]
	Variable FrequencyOffset = 0
	if (1)//!StringMatch(CVD[%Channel1DataType][%Title],"Frequency"))
		if (FindDimLabel(ParmSwap,0,"DDSFrequency0") >= 0)
			FrequencyOffset = ParmSwap[%DDSFrequency0][0]
		else
			FrequencyOffset = MaxFreq
		endif
	endif
	Variable AmpRatio
	Variable output = 0
	if (mod(ColIndex,2))		//Nap pass
		AmpRatio = Amplitude[RowIndex][ColIndex-1]/Amplitude[RowIndex][ColIndex]
//print AmpRatio		
//print MaxFreq/(Freq[RowIndex][ColIndex]+FrequencyOffset)
		PhaseRadians = (Phase[RowIndex][ColIndex-1])*pi/180
		output = (sin(PhaseRadians)-AmpRatio*MaxFreq/(Freq[RowIndex][ColIndex]+FrequencyOffset))/(-QFactor*AmpRatio*(1-MaxFreq^2/(Freq[RowIndex][ColIndex]+FrequencyOffset)^2)+cos(PhaseRadians))
		//output = Freq[RowIndex][ColIndex]+FrequencyOffset
	else
		PhaseRadians = Phase[RowIndex][ColIndex]*pi/180
		AmpRatio = Amplitude[RowIndex][ColIndex]/MaxAmplitude
		output = (sin(PhaseRadians)-AmpRatio)/cos(PhaseRadians)
	endif
	
	return(output)
	
	//return(0)
End //NapCalcLossTan1


#endif



Function ARDoIVTriangle(OutputWave,Amp,Freq,Var0,Var1)
	Wave OutputWave
	Variable Amp		//amplitude
	Variable Freq	//Frequency
	Variable Var0	//Phase (fraction, 1 means 360°)
	Variable Var1	//Offset
	
	
	//pull the ScanTime out of the X axis data (since the other function wants that)
	Variable ScanTime = DimDelta(outputWave,0)*(DimSize(outputWave,0)-1)
	
	ARTriangleWave(Amp*2,Freq,.25+Var0,Var1-Amp,ScanTime,outputWave)
	//and then offset the output of the other function, so that it is the way we want it here.


End //ARDoIVTriangle


Function ARDoIVTriangleSquare(OutputWave,Amp,Freq,Var0,Var1,ParmWave)
	Wave OutputWave
	Variable Amp		//amplitude
	Variable Freq	//Frequency
	Variable Var0	//Phase (fraction, 1 means 360°)
	Variable Var1	//Pulse Time
	Wave ParmWave
	


	Var0 = Max(Var0,0)		//can't go negative
	Variable DutyCycle = .5
	Variable Offset = 0
	Variable ParmIndex
	
	if (WaveExists(ParmWave))
		if (DimSize(ParmWave,0) == 1)
			if (StringMatch(GetDimLabel(ParmWave,0,0),"DutyCycle") == 1)
				DutyCycle = ParmWave[%DutyCycle]
			elseif (StringMatch(GetDimLabel(ParmWave,0,0),"Offset") == 1)
				Offset = ParmWave[%offset]
			else
				DutyCycle = ParmWave[0]
			endif
		elseif (DimSize(ParmWave,0) >= 2)
			ParmIndex = FindDimLabel(ParmWave,0,"DutyCycle")
			if (ParmIndex >= 0)
				DutyCycle = ParmWave[ParmIndex]
				Offset = ParmWave[!ParmIndex]
			else
				ParmIndex = FindDimLabel(ParmWave,0,"Offset")
				if (ParmIndex >= 0)
					Offset = ParmWave[ParmIndex]
					DutyCycle = ParmWave[!ParmIndex]
				else
					DutyCycle = ParmWave[0]
					Offset = ParmWave[1]
				endif
			endif
		endif
		
	endif
	
	
	
	
	//pull the ScanTime out of the X axis data (since the other function wants that)
	Variable dx = DimDelta(outputWave,0)
	Variable ScanTime = dX*(DimSize(outputWave,0)-1)
	

	Variable Phase = .25+Var0

	DutyCycle = 1-DutyCycle
//
//	Outputwave = mod(X/Var1,1) > DutyCycle ? Ceil(X/Var1) : 0
//	OutputWave = mod(X*freq+Phase,1) > .5 ? 1 : 0
//	
//	OutputWave = mod(X/Var1,1) > DutyCycle ? (mod(X*freq+Phase,1) > .5 ? 1-mod(X*Freq+Phase,1) : mod(X*Freq+Phase,1)) : 0
//
//	OutputWave = mod(X*Freq+Phase,1) > .5 ? 1-mod(X*Freq+Phase,1) : mod(X*Freq+Phase,1)
//	OutputWave = mod(X*Freq+Phase,1) > .5 ? 1-mod(X*Freq+Phase,1) : mod(X*Freq+Phase,1)


	//I know you might want to use X in here, but X can get large
	//and when there is a high sample rate, rounding errors can be a problem on the large numbers
	//first observed on 1.2 Hz wave, 100 kHz sample rate, 2e-5 pulseWidth
	//so now we use P*(dX/Var1) instead of X/Var1
	
	MultiThreadFixer()
	MultiThread OutputWave = mod(P*(dX/Var1),1) >= DutyCycle ? (mod((floor(P*(dX/Var1))*Var1)*freq+Phase,1) >= .5 ? 1-mod((floor(P*(dX/Var1))*Var1)*Freq+Phase,1) : mod((floor(P*(dX/Var1))*Var1)*Freq+Phase,1)) : .25
//	FastOp OutputWave = OutputWave+(-.25)
	FastOp OutputWave = (Amp*4)*OutputWave+(-Amp+Offset)


	
//	OutputWave = mod(X*freq+Phase,1)
//	Outputwave = mod(X/Var1,1) > DutyCycle ? Ceil(X/Var1) : 0
	
	
	//and then offset the output of the other function, so that it is the way we want it here.
//	FastOp outputWave = OutputWave+(-Amp)


End //ARDoIVTriangleSquare


Function ARDoIVSquare(OutputWave,Amp,Freq,Var0,Var1)
	Wave OutputWave
	Variable Amp		//amplitude of the wave
	Variable Freq	//frequency
	Variable Var0	//Fraction of the Square pulse that is high
	Variable Var1	//Offset
	
	
	//pull the ScanTime out of the X axis data (since the other function wants that)
	Variable ScanTime = DimDelta(outputWave,0)*(DimSize(outputWave,0)-1)
	
	ARSquareWaveFunc(Amp,Freq,Var0,-Amp,ScanTime,OutputWave)
	FastOp OutputWave = OutputWave+(Var1)
	


End //ARDoIVSquare


Function ARDoIVSine(OutputWave,Amp,Freq,Phase,Offset)
	Wave OutputWave
	Variable Amp		//amplitude of the wave
	Variable Freq	//frequency
	Variable Phase	//Phase of the sine wave in degrees
	Variable Offset	//Y offset
	
	//This is an example of a function that directly calculates the waveform,
	//So this would be a good example of a function to use as a template	
	
//	OutputWave = Amp*sin(X*Freq*2*pi+Phase/180*pi)+Offset
//	OutputWave[] = limit(OutputWave[P],-10,10)		//show that we only have a -10 to +10 volt range.
	MultiThreadFixer()
	MultiThread OutputWave[] = Amp*sin(X*Freq*2*pi+Phase/180*pi)+Offset

End //ARDoIVSine

//
//Function KeithPulse(outputWave,Amp,Freq,Phase,Offset,ParmWave)
//	Wave OutPutWave
//	Variable Amp		//amplitude of the wave
//	Variable Freq	//frequency
//	Variable Phase	//Phase of the sine wave in degrees
//	Variable Offset	//Y offset
//	Wave ParmWave
//	
//	
//	if (DimSize(ParmWave,0) < 4)
//		Print "ParmWave Not correct size for "+GetFuncName()
//		DoWindow/H
//		return(0)
//	endif
//	
//	Variable Amp1 = ParmWave[0]
//	Variable Wait = ParmWave[1]
//	Variable PulseWidth0 = ParmWave[2]
//	Variable PulseWidth1 = ParmWave[3]
//	
//	
//	if (Wait+PulseWidth0+PulseWidth1 > 1/Freq)
//		Print "Your total time is greater than the cycle time"
//		Print "See "+GetFuncName()
//		DoWindow/H
//		//return(0)
//	endif
//	
//	
//	FastOp OutPutWave = 0
//	
//	Variable Start, Stop, Cycles, A
//	Cycles = DimSize(OutputWave,0)*DimDelta(outputWave,0)/Freq
////Print Cycles
//	
//	
//	for (A = 0;A < Cycles;A += 1)
//		Start = x2pnt(OutputWave,Wait+A/Freq)
//		Stop = x2Pnt(OutputWave,Wait+PulseWidth0+A/Freq)
//		if ((Start > DimSize(outputWave,0)) || (Stop > DimSize(OutputWave,0)))
//			Continue
//		endif
//		OutputWave[Start,Stop] = Amp
//		Start = Stop+1
//		Stop = x2Pnt(OutputWave,Wait+PulseWidth0+PulseWidth1+A/Freq)
//		if ((Start > DimSize(outputWave,0)) || (Stop > DimSize(OutputWave,0)))
//			Continue
//		endif
//		OutputWave[Start,Stop] = Amp1
//	endfor
//	
//	
//End //KeithPulse	
//



////////////////////////////////////////////////////////////////////////
//All your functions go in the ipf in UserCalculated
//None of your functions should go in this ipf, we will overwrite this one
//with the installer
//but will never overwrite UserCalculated.ipf


Function/S ARIndentTriangle(OutputWave,ParmWave)
	Wave/Z OutputWave
	Wave/Z ParmWave
	
	
	
	String output = ""
	String TitleList = "*;*;Not Used;Not Used;"
	String UnitsList = "*;*;;;"
	String MinUnitsList = "*;*;*;*;"
	String LowList = "*;*;*;*;"
	String HighList = "*;*;*;*;"
	String FormatList = "*;*;*;*;"
	output = "TitleList:"+TitleList+","+"UnitsList:"+UnitsList+","
	Output += "MinUnitsList:"+MinUnitsList+","
	Output += "LowList:"+LowList+","
	Output += "HighList:"+HighList+","
	Output += "FormatList:"+FormatList+","
	if (WaveExists(outputWave)*WaveExists(ParmWave) == 0)
		return(output)
	endif

	Variable Amp	= ParmWave[1][%Value]	//amplitude
	
	Variable ScanTime = 2*Abs(Amp)/Abs(ParmWave[0][%Value])	//Time
	
	
	Variable Var0 = 0	//Phase (fraction, 1 means 360°)
	Variable Var1 = 0	//not used
	//It is our job to redimension the wave
	Variable PPS = 1/DimDelta(OutputWave,0)
	Variable nop = ScanTime*PPS+1
	if (nop < 87000)
		Redimension/N=(nop) OutPutWave
	else
		FastOp OutputWave = (Nan)
		DoAlert 0,"Too many points requested, lower the sampling rate on the force panel, or decrease the indent time"
		return(output)
	endif
	Variable Freq = .5/ScanTime		//frequency


	
	ARTriangleWave(Amp*2,Freq,.25+Var0,Var1-Amp,ScanTime,OutputWave)
	MultiThreadFixer()
	MultiThread OutputWave[] = limit(OutputWave[P],-20,20)		//These values are relative, so we can go full range.
	
	return(output)

End //ARIndentTriangle


Function/S ARIndentTriangle2(OutputWave,ParmWave)
	Wave/Z OutputWave
	Wave/Z ParmWave



	String output = ""
	String TitleList = "*;*;Return Rate;Not Used;"
	String UnitsList = "*;*;*;;"
	String MinUnitsList = "*;*;*;*;"
	String LowList = "*;*;*;*;"
	String HighList = "*;*;*;*;"
	String FormatList = "*;*;*;*;"
	output = "TitleList:"+TitleList+","+"UnitsList:"+UnitsList+","
	Output += "MinUnitsList:"+MinUnitsList+","
	Output += "LowList:"+LowList+","
	Output += "HighList:"+HighList+","
	Output += "FormatList:"+FormatList+","
	if (WaveExists(outputWave)*WaveExists(ParmWave) == 0)
		return(output)
	endif


	Variable Amp	= ParmWave[1][%Value]	//amplitude
	Variable ScanTime0 = abs(Amp)/abs(ParmWave[0][%Value])	//Time
	Variable ScanTime1 = abs(Amp)/abs(ParmWave[2][%Value])	//Time
	Variable ScanTime = ScanTime0+ScanTime1
	//It is our job to redimension the wave
	Variable PPS = 1/DimDelta(OutputWave,0)
	Variable nop = ScanTime*PPS+1
	if (nop < 87000)
		Redimension/N=(nop) OutPutWave
	else
		FastOp OutputWave = (Nan)
		DoAlert 0,"Too many points requested, lower the sampling rate on the force panel, or decrease the indent time"
		return(output)
	endif

//OutputWave = NaN
//	OutputWave[0,Index-1] = mod(P/Index*ScanTime*Freq+Phase,1)
	MultiThreadFixer()
	MultiThread OutputWave = x < ScanTime0 ? X/ScanTime0 : 1-(X-ScanTime0)/ScanTime1
	FastOp OutputWave = (Amp)*OutputWave
	return(output)
End //ARIndentTriangle2


Function/S ARIndentTriangleDwell(OutputWave,ParmWave)
	Wave/Z OutputWave
	Wave/Z ParmWave
	
	//This is the standard Indent User function
	//Its format is fairly tricky
	//Input
	//2 numerical waves which have the /Z flag (important)
	//output
	//String
	//Specifically the string should be a string key of the format shown below.
	//These values are used by the panel to label / display the values correctly.
	//the lists are orded, each one with 4 elements, which correspond to the 4 setvars
	//put a * in a list element for the controls to do their own thing (such as get its units from the units popup menu)
	//So all the functions you write should have the same basic begining
	//just edit the values of the strings to match your specific parameters.
	//you can add more values to these lists (as of this writing only the first 4 will be used, but there is no error if there are more elements)
	//There will be errors if you have fewer than 4 elements to your lists.
	
	
	

	String output = ""
	String TitleList = "*;*;Return Rate;Dwell Time;"
	String UnitsList = "*;*;*; s;"
	String MinUnitsList = "*;*;*;1;"
	String LowList = "*;*;*;0;"
	String HighList = "*;*;*;20;"
	String FormatList = "*;*;*;%.2g;"
	Output = "TitleList:"+TitleList+","+"UnitsList:"+UnitsList+","
	Output += "MinUnitsList:"+MinUnitsList+","
	Output += "LowList:"+LowList+","
	Output += "HighList:"+HighList+","
	Output += "FormatList:"+FormatList+","
	if (WaveExists(outputWave)*WaveExists(ParmWave) == 0)
		return(output)
	endif
//	OK, the rest of the code is fair game, but make sure return(output) is there before leaving this function.


	Variable Amp	= ParmWave[1][%Value]	//amplitude
	Variable Rate0 = ParmWave[0][%Value]
	Variable Rate1 = ParmWave[2][%Value]
	Variable DwellTime = ParmWave[3][%Value]
	
	Variable ScanTime0 = abs(amp)/abs(Rate0)
	Variable ScanTime1 = Abs(Amp)/Abs(Rate1)
	Variable ScanTime = ScanTime0+ScanTime1+DwellTime
	
	
	
	
	Variable PPS = 1/DimDelta(OutputWave,0)
	Variable nop = ScanTime*PPS+1
	if (nop < 87000)
		Redimension/N=(nop) OutPutWave
	else
		FastOp OutputWave = (Nan)
		DoAlert 0,"Too many points requested, lower the sampling rate on the force panel, or decrease the indent time"
		return(output)
	endif

	MultiThreadFixer()
	MultiThread OutputWave = x < ScanTime0+DwellTime ? X/ScanTime0 : 1-(X-ScanTime0-DwellTime)/ScanTime1
	MultiThread OutputWave[] = Min(OutputWave[P],1)
	FastOp OutputWave = (Amp)*OutputWave
	return(output)
	

End //ARIndentTriangleDwell


Function FMapCalcAdhesion(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
	WaveStats/Q/R=[DimSize(Data,0)-10,DimSize(Data,0)-1]/M=1 Data
	Variable Output = WaveMin(Data)-V_Avg
	return(-output)
End //FMapCalcAdhesion


Function/S FMapCalcAdhesionInfo()
	String Output = "DataType:Force;Section:Ret;DataTypeB:None;ParmWave:None;CalcType:Adhesion;"
	return(output)
End //FMapCalcAdhesionInfo


Function FMapCalcMaxForce(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
	WaveStats/Q/R=[DimSize(Data,0)-10,DimSize(Data,0)-1]/M=1 Data
	Variable Output = WaveMax(Data)-V_Avg
	return(output)
End //FMapCalcMaxForce


Function/S FMapCalcMaxForceInfo()
	String Output = "DataType:Force;Section:Ret;DataTypeB:None;ParmWave:None;CalcType:Force;"
	return(output)
End //FMapCalcMaxForceInfo


Function FMapCalcHeight(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
//	Variable Output = 0
//	String NoteStr = Note(YData)
//	Variable ZLVDTSens = NumberByKey("ZLVDTSens",NoteStr,":","\r")
//	if ((!IsNan(ZLVDTSens)) && (Sign(ZLVDTSens) < 0))
//		Output = -WaveMin(YData)
//	else
//		Output = -WaveMax(YData)
//	endif
	
	return(-WaveMax(Data))
End //FMapCalcHeight

Function/S FMapCalcHeightInfo()

	String Output = "DataType:Raw;Section:Ext;DataTypeB:None;ParmWave:None;CalcType:Height;"
	return(output)
End //FMapCalcHeightInfo


Function/S FMapCalcZSliceInfo()

	String Output = "DataType:Defl;Section:Ext;DataTypeB:Raw;ParmWave:None;CalcType:Deflection;"
	return(output)
End //FMapCalcZSliceInfo


//Function FMapCalcZSlice(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB
	Wave/Z ParmWave		//used
	
	
//	NVAR/Z gZPos = root:ZPos
//	if (!NVAR_EXISTS(gZPos))
//		return(Nan)
//	endif
	if (!WaveExists(DataB) || !WaveExists(ParmWave) || !DimSize(ParmWave,0))
		return(Nan)
	endif
	Variable ZPos = ParmWave[0]

	Variable Start, Stop, Index
	Start = 0
	Stop = DimSize(DataB,0)

	FindLevel/P/Q/R=[Start,Stop] DataB,ZPos
	Index = V_LevelX
	Variable output = 0
	if (V_Flag)
		output = Nan
	else
		output = Data[Index]
	endif

	
	return(output)
End //FMapCalcZSlice


Function FMapCalcAmplitude(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
	return(WaveMin(Data))
End //FMapCalcAmplitude

Function FMapCalcMinPhase(Data,DataB,ParmWave)		//these two functions are just something to start with for calculated AC FFM images
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	return(WaveMin(Data))
End //FMapCalcMinPhase

Function FMapCalcMaxPhase(Data,DataB,ParmWave)		//but that Roger guy seemed to think that they were actually useful
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
	return(WaveMax(Data))
End //FMapCalcMaxPhase

Function FMapCalcPhase(Data,DataB,ParmWave)		//this is something that shouldn't be used and probably shouldn't be here
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
	return(WaveMax(Data))
End //FMapCalcPhase

Function FMapCalcMaxFreq(Data,DataB,ParmWave)		//these two functions are just something to start with for calculated FM FFM images
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	return(WaveMax(Data))
End //FMapCalcMaxFreq

Function FMapCalcMinFreq(Data,DataB,ParmWave)		//these two functions are just something to start with for calculated FM FFM images
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	return(WaveMin(Data))
End //FMapCalcMinFreq

Function FMapCalcFrequency(Data,DataB,ParmWave)		//return the frequency	//hopefully this function is not used since there is a threadsafe version
	Wave Data										
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	return(WaveMax(Data))							//max is just a random guess, and there is an official max freq
End //FMapCalcFrequency

Function FMapCalcDissipation(Data,DataB,ParmWave)		//but that Roger guy seemed to think that they were actually useful
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	return(WaveMax(Data))
End //FMapCalcDissipation

Function/S FMapCalcAmplitudeInfo()

	String Output = "DataType:Amplitude;Section:Ext;DataTypeB:None;ParmWave:None;CalcType:Amplitude;"
	return(output)
End //FMapCalcAmplitudeInfo

//Function FMapCalcMax(Data,DataB,ParmWave)
//	Wave Data
//	Wave/Z DataB		//not used
//	Wave/Z ParmWave		//not used
//	
//	return(WaveMax(Data))
//	
//End //FMapCalcMax
//
//
//Function/S FMapCalcMaxInfo()
//
//	String Output = "DataType:Defl;Section:Dwell Towards;DataTypeB:None;ParmWave:None;CalcType:Deflection;"
//	return(output)
//
//End //FMapCalcMaxInfo
//
//
//Function FMapCalcMin(Data,DataB,ParmWave)
//	Wave Data
//	Wave/Z DataB		//not used
//	Wave/Z ParmWave		//not used
//	
//	
//	return(WaveMin(Data))
//	
//End //FMapCalcMax
//
//
//Function/S FMapCalcMinInfo()
//
//	String Output = "DataType:Defl;Section:Dwell Towards;DataTypeB:None;ParmWave:None;CalcType:Deflection;"
//	return(output)
//
//End //FMapCalcMinInfo


#ifdef sTDDB

Function FMapCalcTDDB(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//not used
	Wave/Z ParmWave		//not used
	
	
//	Variable Output = 0
//	String NoteStr = Note(YData)
//	Variable ZLVDTSens = NumberByKey("ZLVDTSens",NoteStr,":","\r")
//	if ((!IsNan(ZLVDTSens)) && (Sign(ZLVDTSens) < 0))
//		Output = -WaveMin(YData)
//	else
//		Output = -WaveMax(YData)
//	endif
	
	return(-WaveMax(Data))
	
End //FMapCalcTDDB


Function/S FMapCalcTDDBtInfo()

	String Output = "DataType:Raw;Section:Ext;DataTypeB:None;ParmWave:None;CalcType:Height;"
	return(output)

End //FMapCalcTDDBtInfo

#endif


//Function FMapCalcXMaxLoc(Data,DataB,ParmWave)
//	Wave Data
//	Wave/Z DataB		//used
//	Wave/Z ParmWave		//not used
//	
//	WaveStats/Q/M=1 DataB
//	Variable output = Data[x2pnt(DataB,V_MaxLoc)]
//	
//	return(output)
//	
//End //FMapCalcXMaxLoc
//
//
//Function/S FMapCalcXMaxLocInfo()
//
//	String Output = "DataType:Raw;Section:Dwell Towards;DataTypeB:Defl;ParmWave:None;CalcType:Height;"
//	return(output)
//
//End //FMapCalcXMaxLocInfo
//
//
//Function FMapCalcXMinLoc(Data,DataB,ParmWave)
//	Wave Data
//	Wave/Z DataB		//used
//	Wave/Z ParmWave		//not used
//	
//	WaveStats/Q/M=1 DataB
//	Variable output = Data[x2pnt(DataB,V_MinLoc)]
//	
//	return(output)
//	
//End //FMapCalcXMinLoc
//
//
//Function/S FMapCalcXMinLocInfo()
//
//	String Output = "DataType:Raw;Section:Dwell Towards;DataTypeB:Defl;ParmWave:None;CalcType:Height;"
//	return(output)
//
//End //FMapCalcXMaxLocInfo


Function FMapCalcTransitionMap(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//used
	Wave/Z ParmWave		//not used
	
	
	Duplicate/FREE Data,TempData
	Duplicate/FREE DataB,TempDataB
	
	Smooth 1000,TempData
	Smooth 1000,TempDataB
	
	Differentiate TempDataB
	WaveStats/Q TempDataB
	
	Variable output = TempData[x2pnt(TempDataB,V_MinLoc)]
	return(output)
	
End //FMapCalcTransitionMap


Function/S FMapCalcTransitionMapInfo()

	String Output = "DataType:TpPwW;Section:Extend;DataTypeB:Raw;ParmWave:None;CalcType:TipHeaterPower;"
	return(output)

End //FMapCalcTransitionMapInfo


Function FMapCalcBlueThermTransition(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//used
	Wave/Z ParmWave		//not used
	
	
	
	WaveStats/Q DataB
	
	Variable output = Data[V_minRowLoc]
	return(output)
	
End //FMapCalcTransitionMap


Function/S FMapCalcBlueThermTransitionInfo()

	String Output = "DataType:bTpwW;Section:Extend;DataTypeB:Raw;ParmWave:None;CalcType:TipHeaterPower;"
	return(output)

End //FMapCalcTransitionMapInfo


//Function/S FMapCalcPFMOnInfo()
//
//	//if you use the ParmWave:Output hack, then you have to work in offline only
//	//The hack is too nasty for realTime.
//	String Output = "DataType:Amp;Section:Dwell Towards;DataTypeB:None;ParmWave:Output;CalcType:VoltageCoercive;"
//	return(output)
//
//End //FMapCalcPFMOnInfo
//

Function FMapCalcPFMOn(InfoStruct)
	Struct FMapCalcStruct &InfoStruct
	return(FMapCalcPFM(InfoStruct,1))
End //FMapCalcPFMOn


Function FMapCalcPFMOff(InfoStruct)
	Struct FMapCalcStruct &InfoStruct
	return(FMapCalcPFM(InfoStruct,0))
End //FMapCalcPFMOff


Function FMapCalcPFM(CalcStruct,IsOn)
	Struct FMapCalcStruct &CalcStruct
	Variable IsOn

	Variable output = 0
	Struct ARForcePlotStruct DataStruct
	if (CalcStruct.IsInfo)
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.

		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 4
		CalcStruct.OutputNameList = "VoltageCoercive;VoltageImprint;VoltageNegative;VoltagePositive;"
		CalcStruct.NumOfChannels = 1		//inputs

		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		Wave/Z DataStruct.Data = $""
		DataStruct.Channel = "Amp"
		DataStruct.Segment = "Dwell Towards"
		DataStruct.IsFixed = 0
		CalcStruct.Data[0] = DataStruct
		
		DataStruct.Channel = "None"
		DataStruct.Segment = "Dwell Towards"
		CalcStruct.Data[1] = DataStruct
		CalcStructInfoFunc(CalcStruct)
		
		return(output)
	endif

	Wave/Z Data = CalcStruct.Data[0].Data
	
	Variable A, nop = CalcStruct.NumOfOutputs
	for (A = 0;A < nop;A += 1)
		CalcStruct.Outputs[A] = Nan
	endfor
	
	String NoteStr = Note(Data)		//read this early, wave ref will be tossed.
	if (CalcStruct.IsARDF)
		NoteStr = ARDF_GetHeader(CalcStruct.FileRef,"",-1)
		Note/K Data,NoteStr
	endif
//print WaveUnits(Data,-1)
	
	
	String FuncName = StringByKey("ARDoIVFunc",NoteStr,":","\r",0)
	if (!Stringmatch(FuncName,"ARDoIVTriangleSquare"))
		return(NaN)
	endif
	
	
	Variable Phase = NumberByKey("ARDoIVARg2",NoteStr,":","\r",0)
	Variable Cycles = NumberByKey("ARDoIVCycles",NoteStr,":","\r",0)
	
	
	FuncRef protoFuncIn2W PZTFunc=$"PZTHystGutted"
	PZTFunc(Data,$"")
	//Execute/Q "PZTHystGutted("+GetWavesDataFolder(Data,2)+",$\"\")"
	//PZTHystFunc(BaseName+Suffix+";",DataFolder+";",DoGraph=0)
	
	String PZTFolder = "Root:PZT:"
	
	Wave/Z Bias = $PZTFolder+"BiasOn"
	if (!WaveExists(Bias))
		return(NaN)
	endif
	if (IsOn)
		Wave/Z Data = $PZTFolder+"DataOn"		//we are done with the original data.
	else
		Wave/Z Data = $PZTFolder+"DataOff"		//we are done with the original data.
	endif
	if (!WaveExists(Data))		//this is different than the input wave data.
		return(NaN)
	endif
	//OK, we really need to figure out if this data is useable.
	

	Phase = Max(Phase,0)
	Phase = Mod(Phase,1)
	
	Variable IsRising = Phase >=.25 && Phase < .75 ? -1 : 1

	Variable FirstIndex = mod(.25-Phase,.5)
	if (FirstIndex <= 0)
		FirstIndex += .5
	endif
		
	//First consider the data as Phase0, data vs bias
	
	
	
	nop = DimSize(Bias,0)/Cycles
	//OK, pull out the good cycle, unwrapped.
	Wave BiasCycle = InitOrDefaultWave(PZTFolder+"BiasTemp",Nop)
	Wave DataCycle = InitOrDefaultWave(PZTFolder+"DataTemp",Nop)
	Redimension/N=(nop) BiasCycle,DataCycle
//	Wave ParmStruct.Data = DataCycle
//	Wave ParmStruct.Bias = BiasCycle
	
	
	if (IsRising)
		Rotate nop*(.5-FirstIndex),Data,Bias
	else
		//rotate backwards so first segment is really rising
		Rotate -nop*FirstIndex,Data,Bias
	endif
	Duplicate/O/R=[0,nop-1] Data,DataCycle
	Duplicate/O/R=[0,nop-1] Bias,BiasCycle
	
	for (A = 1;A < Cycles;A += 1)
		DataCycle[] += Data[P+A*nop]
	endfor
	FastOp DataCycle = (1/Cycles)*DataCycle		//average
	
	Variable Vn, Vp, Vc, Vi
	WaveStats/Q/R=[0,nop/2-1] DataCycle
	Vp = Bias[x2pnt(DataCycle,V_minloc)]
	WaveStats/Q/R=[nop/2,nop] DataCycle
	Vn = Bias[x2pnt(DataCycle,V_minloc)]
	
	Vc = (abs(Vn)+abs(Vp))/2
	Vi = (abs(Vp)-abs(Vn))/2
	
	
	CalcStruct.Outputs[0] = Vc
	CalcStruct.outputs[1] = Vi
	CalcStruct.outputs[2] = Vn
	CalcStruct.outputs[3] = Vp
	
	KillDataFolder/Z PZTFolder

	return(Vc)
End //FMapCalcPFM


#if 0
Function FMapCalcBE(InfoStruct)
	Struct FMapCalcStruct &InfoStruct
	

	Variable output = 0
	Struct ARForcePlotStruct DataStruct
	if (InfoStruct.IsInfo)
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.

		InfoStruct.IsInfo = 0
		InfoStruct.InfoStr = ""
		InfoStruct.NumOfOutputs = 3
		InfoStruct.OutputNameList = "QFactor;Amplitude;Frequency;"
		InfoStruct.NumOfChannels = 2	

		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		Wave/Z DataStruct.Data = $""
		DataStruct.Channel = "Amp"
		DataStruct.Segment = "Dwell Towards"
		InfoStruct.Data[0] = DataStruct
		
		DataStruct.Channel = "Freq"
		DataStruct.Segment = "Dwell Towards"
		InfoStruct.Data[1] = DataStruct
		
		InfoStruct.InfoStr = ReplaceStringByKey("DataType",InfoStruct.InfoStr,InfoStruct.Data[0].Channel,":",";")
		InfoStruct.InfoStr = ReplaceStringByKey("Section",InfoStruct.InfoStr,InfoStruct.Data[0].Segment,":",";")
		InfoStruct.InfoStr = ReplaceStringByKey("DataTypeB",InfoStruct.InfoStr,InfoStruct.Data[1].Channel,":",";")
		InfoStruct.InfoStr = ReplaceStringByKey("ParmWave",InfoStruct.InfoStr,"None",":",";")
		InfoStruct.InfoStr = ReplaceStringByKey("CalcType",InfoStruct.InfoStr,StringFromList(0,InfoStruct.OutputNameList,";"),":",";")
		
		return(output)
	endif

		
	Wave/Z Data = InfoStruct.Data[0].Data
	Wave/Z DataB = InfoStruct.Data[1].Data
	
	Variable A, nop = InfoStruct.NumOfOutputs
	for (A = 0;A < nop;A += 1)
		InfoStruct.Outputs[A] = Nan
	endfor
	
	
	Variable X0, dX
	String xUnits
	X0 = DimOffset(Data,0)
	dX = DimDelta(Data,0)
	xUnits = WaveUnits(Data,0)

	SetScale/P x,DataB[0],DataB[1]-DataB[0],"Hz",Data
	
	
	wave SHOparm = root:Packages:MFP3D:Tune:SHOparm
	//lets do our guessing
	variable boxSize = 5
	WaveStats/Q Data
	variable V_LevelsFound
	for (V_LevelsFound = 3;V_LevelsFound > 2;boxSize += 6)
		FindLevels/Q/B=(boxSize)/M=200 Data, (V_max+V_min)/2		//look for levels halfway between the max and min
	endfor
	wave W_FindLevels
	
	if (V_flag && (V_LevelsFound == 2))						//see if there were two
		ShoParm[%Q][0] = V_maxloc/(W_FindLevels[1]-W_FindLevels[0])
		ShoParm[%DC][0] = V_max/GV("ThermalQ")
	else
		ShoParm[%Q][0] = 1
		ShoParm[%DC][0] = V_Max/2
	endif
	ShoParm[%Frequency][0] = V_MaxLoc
	ShoParm[%WhiteNoise][0] = V_min
	
	Variable V_FitOptions = 4
	FuncFit/Q oldSHOAmpWhite SHOparm Data
	ShoParm = Abs(ShoParm)
	SetScale/P x,X0,dX,XUnits,Data
	

	InfoStruct.outputs[0] = SHOparm[%Q][0]
	InfoStruct.outputs[1] = SHOparm[%DC][0]
	InfoStruct.outputs[2] = SHOparm[%Frequency][0]
	
	return(SHOparm[%Q][0])
End //FMapCalcBE

#endif

//Function FMapCalcHeightSoft(Data,DataB,ParmWave)
//	Wave Data
//	Wave/Z DataB		//used
//	Wave/Z ParmWave
//	//This version is for soft samples, does a more complicated (problematic)
//	//calc to find the surface.
//
//
//	//Not threadSafe
//	
//	
//	Variable NoPoly = 7
//	Variable Factor = Log(Round(DimSize(Data,0)/1000))/Log(2)
//	NoPoly = Max(Round(NoPoly*Factor),NoPoly)
//	
//	if (WaveExists(ParmWave))
//		if (DimSize(ParmWave,0) > 0)
//			NoPoly = ParmWave[0]
//		endif
//	endif
//	
//	Variable SurfaceIndex = FindSurfaceIndex(Data,DataB,NoPoly)
//	
//	return(-DataB[SurfaceIndex])
//	
//End //FMapCalcHeight
//
//
//Function/S FMapCalcHeightSoftInfo()
//
//	String Output = "DataType:Defl;Section:Ext;DataTypeB:Raw;ParmWave:None;CalcType:Height;"
//	return(output)
//
//End //FMapCalcHeightInfo
//
//
//Function FMapCalcIndent(Data,DataB,ParmWave)
//	Wave Data
//	Wave/Z DataB
//	Wave/Z ParmWave
//	
//	
//	return(-WaveMin(Data)+WaveMax(Data))
//	
//End //FMapCalcIndent
//
//
//Function/S FMapCalcIndentInfo()
//
//	String Output = "DataType:Ind;Section:Dwell Towards;DataTypeB:None;ParmWave:None;CalcType:Indentation;"
//	return(output)
//
//End //FMapCalcIndentInfo


Function FMapCalcDMT(CalcStruct)
	Struct FMapCalcStruct &CalcStruct


	Struct ARForcePlotStruct DataStruct
	
	String SectionStr, SectionList
	String VarFolder = GetDF("Variables")
	Variable A
	if (CalcStruct.IsInfo)
		CalcStruct.DataRate = .2/1252		//20 mins for 200 megs
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.
		DataStruct.IsFixed = 1		//This function is smart enough to set the Variable Data Types, it has its own controls
		//DataStruct.IsFixed = 0 // Functions that share the controls for the variable data types need to set this to 0 to allow FMapCalc to set the channels
		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 1		//we just calc one thing
		CalcStruct.OutputNameList = "YoungsDMT;"
		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		Wave/Z DataStruct.Data = $""
	
		Wave/T FDD = $VarFolder+"ForceDispVariablesDescription"
		SectionList = ReplaceString("+",FDD[%DMTIndentSegmentName][%Title],";")
		SectionStr = StringFromList(0,SectionList,";")

		CalcStruct.NumOfChannels = ItemsInList(SectionList,";")*2
		for (A = 0;A < ItemsInList(SectionList,";");A += 1)
	
			DataStruct.Channel = "Force"
			DataStruct.Segment = StringFromList(A,SectionList,";")
			CalcStruct.Data[A*2] = DataStruct
			
			DataStruct.Channel = "Ind"
			DataStruct.Segment = StringFromList(A,SectionList,";")
			CalcStruct.Data[A*2+1] = DataStruct
		endfor
		if (!StringMatch(SectionList,"*Ret*"))
			CalcStruct.NumOfChannels += 1
			DataStruct.Channel = "Force"
			DataStruct.Segment = "Ret"
			CalcStruct.Data[CalcStruct.NumOfChannels-1] = DataStruct
	
			CalcStruct.NumOfChannels += 1
			DataStruct.Channel = "Ind"
			DataStruct.Segment = "Ret"
			CalcStruct.Data[CalcStruct.NumOfChannels-1] = DataStruct
		endif
		
		return(0)
	endif
	
	
	Struct ARElasticParmStruct ParmStruct
	Wave FDV = $VarFolder+"ForceDispVariablesWave"
	Wave/T FDD = $VarFolder+"ForceDispVariablesDescription"


	Wave ParmStruct.Force = CalcStruct.Data[0].Data
	Wave ParmStruct.Ind = CalcStruct.Data[1].Data
	Wave/Z ParmStruct.ForceExt = $""
	Wave/Z ParmStruct.ForceRet = $""
	Wave/Z ParmStruct.IndExt = $""
	Wave/Z ParmStruct.IndRet = $""

	ParmStruct.SectionList = ""
	Variable DoBoth = 0
	for (A = 0;A < CalcStruct.NumOfChannels;A += 1)
		StrSwitch (CalcStruct.Data[A].Channel+CalcStruct.Data[A].Segment)
			case "ForceRet":
				Wave ParmStruct.ForceRet = CalcStruct.Data[A].Data
				break
				
			case "ForceExt":
				Wave ParmStruct.ForceExt = CalcStruct.Data[A].Data
				break
				
			case "IndRet":
				ParmStruct.SectionList = Add2StrList(ParmStruct.SectionList,CalcStruct.Data[A].Segment)
				DoBoth = DoBoth | 0x2
				Wave ParmStruct.IndRet = CalcStruct.Data[A].Data
				break
				
			case "IndExt":
				ParmStruct.SectionList = Add2StrList(ParmStruct.SectionList,CalcStruct.Data[A].Segment)
				DoBoth = DoBoth | 0x1
				Wave ParmStruct.IndExt = CalcStruct.Data[A].Data
				break
				
		endswitch
				
	endfor
	ParmStruct.SectionStr = StringFromList(0,ParmStruct.SectionList,";")


	
	ParmStruct.ModelName = "DMT"
	//********************************
	//Lots of work here
	FMapElasticInitFunc(ParmStruct,CalcStruct)
	//LOOK AT ME MOTHER <EDIT>
	//IF YOU CAN't FIGURE OUT WHAT IS GOING ON, IT IS PROBABLY IN HERE>
	//********************************
	
	
	
	
	
	Variable XOffset, TipParm, ForceOffsetExt, ForceOffsetRet, Fad		//for pass by ref into fit function
	
	ParmStruct.HertzParms.TipGeometry = "Sphere"
	IsElasticLoading(ParmStruct)
	TipParm = FDV[%$"Indent"+ParmStruct.HertzParms.TipGeometry+"Parm"][0]
	ParmStruct.HertzParms.SphereRadius = TipParm




	ElasticXYOffsetFunc(ParmStruct)
	GetElasticLocks(ParmStruct)
	ElasticPreFitFunc(ParmStruct)



	//Ec = ParmStruct.Ec
	XOffset = ParmStruct.DepthOffset
	ForceOffsetExt = ParmStruct.ForceOffset
	ForceOffsetRet = ParmStruct.DMTParms.ForceOffsetRet
	Fad = Parmstruct.DMTParms.Fad

	Wave/Z ParmStruct.FitWave = $""		//create a Null ref, we need to pass to Fitting function, but it can deal with Null refs.

	Variable Value, StartIndex, StopIndex, IsFull
	
	if (Stringmatch(FDD[%DMTIndentSegmentName][%Title],"Ext"))
		Wave/Z ParmStruct.ForceRet = $""
		Wave/Z ParmStruct.IndRet = $""
		ParmStruct.SectionList = FDD[%DMTIndentSegmentName][%Title]
		DoBoth = 1
	endif


	StartIndex = Min(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	StopIndex = Max(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	if ((DoBoth & 0x3) == 0x3)
		StartIndex = Min(ParmStruct.DMTParms.LockIndexes[0],ParmStruct.DMTParms.LockIndexes[1])
		StopIndex = Max(ParmStruct.DMTParms.LockIndexes[0],ParmStruct.DMTParms.LockIndexes[1])
	elseif (DoBoth & 0x1)
		if (ParmStruct.ForceFit)
			StartIndex = 0
			IsFull = 1				//not used, but placeholder for searching
		endif
	elseif (DoBoth & 0x2)
		if (ParmStruct.DMTParms.ForceFitRet)
			StopIndex = Dimsize(ParmStruct.ForceRet,0)-1
			IsFull = 1
		endif
	endif



	String HoldStr = ""
	if (DoBoth & 0x1)
		HoldStr += num2str(!ParmStruct.ForceFit)
	else
		HoldStr += "1"
	endif
	if (DoBoth & 0x2)
		HoldStr += Num2str(!ParmStruct.DMTParms.ForceFitRet)
	else
		HoldStr += "1"
	endif
	HoldStr += "0"		//Ec
	if (0)//((DoBoth & 0x3) != 0x3)
		HoldStr += "1"
		FAd = -WaveMin(ParmStruct.ForceRet)
	else
		HoldStr += Num2str(!ParmStruct.DMTParms.FAdFit)
	endif
	HoldStr += "1"//num2str(!ParmStruct.HertzParms.TipFit)
	HoldStr += num2str(!ParmStruct.DepthFit)

	Variable DebugTheFit = 0
	//debugging
	FMapElasticDebugFunc(0,DebugTheFit,ParmStruct)//,CalcStruct)

//	if (!Ec)
//		Ec = 100e6
//	endif
	JKRDMT(ParmStruct,"DMT",HoldStr,ParmStruct.FitWave,StartIndex,StopIndex,ParmStruct.Ec)
	//DMT("Sphere",Ec,TipParm,XOffset,ForceOffsetExt,ForceOffsetRet,FAd,HoldStr,ParmStruct.IndExt,ParmStruct.ForceExt,ParmStruct.IndRet,ParmStruct.ForceRet,ParmStruct.FitWave,StartIndex,StopIndex,ParmStruct.SpringConstant,ParmStruct.VelocityRatio)

	FmapCalcElasticFinish(ParmStruct,CalcStruct)
	
	FMapElasticDebugFunc(1,DebugTheFit,ParmStruct)//,CalcStruct)
	
	return(CalcStruct.Outputs[0])
End //FMapCalcDMT


FMapCalcJKRTS
Function FMapCalcJKR(CalcStruct)
	Struct FMapCalcStruct &CalcStruct
	Variable output
	Struct ARForcePlotStruct DataStruct
	
	String SectionStr, SectionList
	String VarFolder = GetDF("Variables")
	Variable A
	if (CalcStruct.IsInfo)
		CalcStruct.DataRate = .2/1252/2		//This function is about 1/2 as fast as DMT
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.
		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 1		//we just calc one thing
		CalcStruct.OutputNameList = "YoungsJKR;"
		DataStruct.IsFixed = 1		//This function is smart enough to set the Variable Data Types, it has its own controls
		//DataStruct.IsFixed = 0 // Functions that share the controls for the variable data types need to set this to 0 to allow FMapCalc to set the channels
		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		Wave/Z DataStruct.Data = $""
	
		Wave/T FDD = $VarFolder+"ForceDispVariablesDescription"
		SectionList = ReplaceString("+",FDD[%JKRIndentSegmentName][%Title],";")
		SectionStr = StringFromList(0,SectionList,";")

		CalcStruct.NumOfChannels = ItemsInList(SectionList,";")*2
		for (A = 0;A < ItemsInList(SectionList,";");A += 1)
	
			DataStruct.Channel = "Force"
			DataStruct.Segment = StringFromList(A,SectionList,";")
			CalcStruct.Data[A*2] = DataStruct
			
			DataStruct.Channel = "Ind"
			DataStruct.Segment = StringFromList(A,SectionList,";")
			CalcStruct.Data[A*2+1] = DataStruct
		endfor
		if (!StringMatch(SectionList,"*Ret*"))
			CalcStruct.NumOfChannels += 1
			DataStruct.Channel = "Force"
			DataStruct.Segment = "Ret"
			CalcStruct.Data[CalcStruct.NumOfChannels-1] = DataStruct

			CalcStruct.NumOfChannels += 1
			DataStruct.Channel = "Ind"
			DataStruct.Segment = "Ret"
			CalcStruct.Data[CalcStruct.NumOfChannels-1] = DataStruct


		endif
		CalcStruct.SectionList = SectionList
		return(0)
	endif
	
	
	Struct ARElasticParmStruct ParmStruct
	Wave FDV = $VarFolder+"ForceDispVariablesWave"


	Wave ParmStruct.Force = CalcStruct.Data[0].Data
	Wave ParmStruct.Ind = CalcStruct.Data[1].Data
	Wave/Z ParmStruct.ForceExt = $""
	Wave/Z ParmStruct.ForceRet = $""
	Wave/Z ParmStruct.IndExt = $""
	Wave/Z ParmStruct.IndRet = $""

	ParmStruct.SectionList = CalcStruct.SectionList
	Variable DoBoth = 0
	for (A = 0;A < CalcStruct.NumOfChannels;A += 1)
		StrSwitch (CalcStruct.Data[A].Channel+CalcStruct.Data[A].Segment)
			case "ForceRet":
				Wave ParmStruct.ForceRet = CalcStruct.Data[A].Data
				break
				
			case "ForceExt":
				Wave ParmStruct.ForceExt = CalcStruct.Data[A].Data
				break
				
			case "IndRet":
//				ParmStruct.SectionList = Add2StrList(ParmStruct.SectionList,CalcStruct.Data[A].Segment)
//				DoBoth = DoBoth | 0x2
				Wave ParmStruct.IndRet = CalcStruct.Data[A].Data
				break
				
			case "IndExt":
				//ParmStruct.SectionList = Add2StrList(ParmStruct.SectionList,CalcStruct.Data[A].Segment)
				//DoBoth = DoBoth | 0x1
				Wave ParmStruct.IndExt = CalcStruct.Data[A].Data
				break
				
		endswitch
				
	endfor
	ParmStruct.SectionStr = StringFromList(0,ParmStruct.SectionList,";")
	DoBoth = StringMatch(ParmStruct.SectionList,"*Ext*") + 2*StringMatch(ParmStruct.SectionList,"*Ret*")

	
	ParmStruct.ModelName = "JKR"
	//********************************
	//Lots of work here
	FMapElasticInitFunc(ParmStruct,CalcStruct)
	//LOOK AT ME MOTHER <EDIT>
	//IF YOU CAN't FIGURE OUT WHAT IS GOING ON, IT IS PROBABLY IN HERE>
	//********************************
	
	
	
	
	
	Variable XOffset, TipParm, ForceOffsetExt, ForceOffsetRet, Fad		//for pass by ref into fit function
	
	ParmStruct.HertzParms.TipGeometry = "Sphere"
	IsElasticLoading(ParmStruct)
	TipParm = FDV[%$"Indent"+ParmStruct.HertzParms.TipGeometry+"Parm"][0]
	ParmStruct.HertzParms.SphereRadius = TipParm




	ElasticXYOffsetFunc(ParmStruct)
	GetElasticLocks(ParmStruct)
	ElasticPreFitFunc(ParmStruct)



	//Ec = ParmStruct.Ec
	XOffset = ParmStruct.DepthOffset
	ForceOffsetExt = ParmStruct.ForceOffset
	ForceOffsetRet = ParmStruct.JKRParms.ForceOffsetRet
	Fad = Parmstruct.JKRParms.Fad

	Wave/Z ParmStruct.FitWave = $""		//create a Null ref, we need to pass to Fitting function, but it can deal with Null refs.

	Variable Value, StartIndex, StopIndex, IsFull
	
	StartIndex = Min(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	StopIndex = Max(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	if ((DoBoth & 0x3) == 0x3)
		StartIndex = Min(ParmStruct.JKRParms.LockIndexes[0],ParmStruct.JKRParms.LockIndexes[1])
		StopIndex = Max(ParmStruct.JKRParms.LockIndexes[0],ParmStruct.JKRParms.LockIndexes[1])
	elseif (DoBoth & 0x1)
		if (ParmStruct.ForceFit)
			StartIndex = 0
			IsFull = 1				//not used, but placeholder for searching
		endif
	elseif (DoBoth & 0x2)
		if (ParmStruct.JKRParms.ForceFitRet)
			StopIndex = Dimsize(ParmStruct.ForceRet,0)-1
			IsFull = 1
		endif
	endif



	String HoldStr = ""
	if (DoBoth & 0x1)
		HoldStr += num2str(!ParmStruct.ForceFit)
	else
		HoldStr += "1"
	endif
	if (DoBoth & 0x2)
		HoldStr += Num2str(!ParmStruct.JKRParms.ForceFitRet)
	else
		HoldStr += "1"
	endif
	HoldStr += "0"		//Ec
	if (0)//((DoBoth & 0x3) != 0x3)
		HoldStr += "1"
		FAd = -WaveMin(ParmStruct.ForceRet)
	else
		HoldStr += Num2str(!ParmStruct.JKRParms.FAdFit)
	endif
	HoldStr += "1"//num2str(!ParmStruct.HertzParms.TipFit)
	HoldStr += num2str(!ParmStruct.DepthFit)

	Variable DebugTheFit = 0
	//debugging
	FMapElasticDebugFunc(0,DebugTheFit,ParmStruct)//,CalcStruct)

//	if (!Ec)
//		Ec = 100e6
//	endif

	JKRDMT(ParmStruct,"JKR",HoldStr,ParmStruct.FitWave,StartIndex,StopIndex,ParmStruct.Ec)
	//JKR("Sphere",Ec,TipParm,XOffset,ForceOffsetExt,ForceOffsetRet,FAd,HoldStr,ParmStruct.IndExt,ParmStruct.ForceExt,ParmStruct.IndRet,ParmStruct.ForceRet,ParmStruct.FitWave,StartIndex,StopIndex,ParmStruct.SpringConstant,ParmStruct.VelocityRatio)

	FmapCalcElasticFinish(ParmStruct,CalcStruct)
	
	FMapElasticDebugFunc(1,DebugTheFit,ParmStruct)//,CalcStruct)
	
	return(CalcStruct.Outputs[0])
End //FMapCalcJKR


Function FMapCalcOliverPharr(CalcStruct)
	Struct FMapCalcStruct &CalcStruct

	Struct ARElasticParmStruct ParmStruct
	FmapCalcOliverPharrWorker(CalcStruct,ParmStruct)
	return(CalcStruct.Outputs[0])
End // FMapCalcOliverPharr


Function FMapCalcOliverPharrWorker(CalcStruct,ParmStruct)
	Struct FMapCalcStruct &CalcStruct
	Struct ARElasticParmStruct &ParmStruct

	Variable output
	Struct ARForcePlotStruct DataStruct

	String VarFolder = GetDF("Variables")
	Wave/T FDD = $VarFolder+"ForceDispVariablesDescription"
	//Gutted version of Oliver Pharr, that can be used on a FP by FP basis (for use with map calcing).
	String SectionStr, SectionList
	if (CalcStruct.IsInfo)
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.
		DataStruct.IsFixed = 1		//This function is smart enough to set the Variable Data Types, it has its own controls
		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 1		//we just calc one thing
		CalcStruct.OutputNameList = "YoungsOP;"
		CalcStruct.NumOfChannels = 2		//we need N inputs
		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		Wave/Z DataStruct.Data = $""
		SectionList = ReplaceString("+",FDD[%IndentSegmentName][%Title],";")
		SectionStr = StringFromList(0,SectionList,";")

		DataStruct.Channel = "Force"
		DataStruct.Segment = SectionStr
		CalcStruct.Data[0] = DataStruct
		
		DataStruct.Channel = "Ind"
		DataStruct.Segment = SectionStr
		CalcStruct.Data[1] = DataStruct
		CalcStructInfoFunc(CalcStruct)
		if (!StringMatch(SectionList,"*Ext*"))
			CalcStruct.NumOfChannels += 1
			DataStruct.Channel = "Force"
			DataStruct.Segment = "Ext"
			CalcStruct.Data[CalcStruct.NumOfChannels-1] = DataStruct

			CalcStruct.NumOfChannels += 1
			DataStruct.Channel = "Ind"
			DataStruct.Segment = "Ext"
			CalcStruct.Data[CalcStruct.NumOfChannels-1] = DataStruct
		endif
		return(0)
	endif
	
	
	
	Wave YData = CalcStruct.Data[0].Data
	Wave/Z XData = CalcStruct.Data[1].Data
	Wave/Z ParmWave = CalcStruct.ParmWave
	
	Variable DebugTheFit = 0
	
	Wave FDV = Var2Desc(FDD)


	Wave ParmStruct.Force = CalcStruct.Data[0].Data
	Wave ParmStruct.Ind = CalcStruct.Data[1].Data
	Wave/Z ParmStruct.ForceExt = $""
	Wave/Z ParmStruct.ForceRet = $""
	Wave/Z ParmStruct.IndExt = $""
	Wave/Z ParmStruct.IndRet = $""

	ParmStruct.SectionList = ""
	Variable A, DoBoth = 0
	for (A = 0;A < CalcStruct.NumOfChannels;A += 1)
		StrSwitch (CalcStruct.Data[A].Channel+CalcStruct.Data[A].Segment)
			case "ForceRet":
				Wave ParmStruct.ForceRet = CalcStruct.Data[A].Data
				break
				
			case "ForceExt":
				Wave ParmStruct.ForceExt = CalcStruct.Data[A].Data
				break
				
			case "IndRet":
				ParmStruct.SectionList = Add2StrList(ParmStruct.SectionList,CalcStruct.Data[A].Segment)
				DoBoth = DoBoth | 0x2
				Wave ParmStruct.IndRet = CalcStruct.Data[A].Data
				break
				
			case "IndExt":
				ParmStruct.SectionList = Add2StrList(ParmStruct.SectionList,CalcStruct.Data[A].Segment)
				DoBoth = DoBoth | 0x1
				Wave ParmStruct.IndExt = CalcStruct.Data[A].Data
				break
				
		endswitch
				
	endfor


	ParmStruct.ModelName = "Oliver-Pharr"



	//********************************
	//Lots of work here
	FMapElasticInitFunc(ParmStruct,CalcStruct)
	//LOOK AT ME MOTHER <EDIT>
	//IF YOU CAN't FIGURE OUT WHAT IS GOING ON, IT IS PROBABLY IN HERE>
	//********************************
	
	ParmStruct.SectionStr = StringFromList(0,ReduceSectionList(FDD[%IndentSegmentName][%Title]),";")
	ParmStruct.FPName = NameOfWave(YData)		//set this temporarily for the IsLoading
	IsElasticLoading(ParmStruct)
	ParmStruct.FPName = ""
	String FitNote, FPName, FPFolder, ErrorMessage
	
	
	
	ParmStruct.OPParms.AreaMethod = FDD[%OPUserArea][%Title]
	
	ParmStruct.HertzParms.SphereRadius = FDV[%IndentSphereParm][0]
	
	ElasticXYOffsetFunc(ParmStruct)
	GetElasticLocks(ParmStruct)
	//ElasticPreFitFunc(ParmStruct)
	
	ParmStruct.OPParms.FMax = WaveMax(ParmStruct.Force)
	ParmStruct.OPParms.HMax = WaveMax(ParmStruct.Ind)

	
	Variable Ec, XOffset, TipParm, ForceOffset		//for pass by ref into fit function
	Ec = ParmStruct.Ec
	
	XOffset = ParmStruct.DepthOffset
	ForceOffset = ParmStruct.ForceOffset
	
	Wave/Z FitWave = $""		//create a Null ref, we need to pass to Hertz, but it can deal with Null refs.

	//OK, we need to get the correct section
	//but first, we need to find where the locks are.
	

	Variable Value, StartIndex, StopIndex
	String HoldStr = ""
	Variable Slope, Alpha, nop

	

	
	StartIndex = Min(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	StopIndex = Max(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	if (ParmStruct.ForceFit && ParmStruct.DepthFit && StringMatch(ParmStruct.SectionStr,"Ext"))
		StartIndex = 0
	endif

	if (abs(StopIndex-StartIndex) < 7)
		return(NaN)
	endif
	

	HoldStr += num2str(!ParmStruct.DepthFit)
	HoldStr += "0"			//slope
	HoldStr += num2str(!ParmStruct.ForceFit)
	HoldStr += "0"		//alpha

//debugging
	FMapElasticDebugFunc(0,DebugTheFit,ParmStruct)//,CalcStruct)




	Slope = ParmStruct.OpParms.M
	Alpha = 1

	OliverPharr(Slope,Alpha,XOffset,ForceOffset,HoldStr,XData,YData,ParmStruct.FitWave,CalcStruct.FitLimitWave,StartIndex,StopIndex)
	ParmStruct.OpParms.Alpha = Alpha
	ParmStruct.OPParms.M = Slope
	ParmStruct.ForceOffset = ForceOffset
	ParmStruct.DepthOffset = XOffset
	


	ParmStruct.OPParms.Stiffness = ParmStruct.OPParms.M*ParmStruct.OPParms.Alpha*(ParmStruct.OPParms.HMax-ParmStruct.DepthOffset)^(ParmStruct.OPParms.M-1)
	Parmstruct.OPParms.Hc = ParmStruct.OPParms.HMax-ParmStruct.OPParms.Epsilon*ParmStruct.OPParms.FMax/ParmStruct.OPParms.Stiffness

	ParmStruct.OPParms.Area = 0
	StrSwitch (ParmStruct.OPParms.AreaMethod)
		case "User defined":
			ParmStruct.OPParms.Area = FDV[%OPArea][0]*FDV[%OPArea][%Units]
			break
			
		case "Look Up":
			Wave ProfileWave = InitOrDefaultWave(GetDF("Tips")+"TipProfileWave",0)
			if (DimSize(ProfileWave,0) <= 1)
				ParmStruct.OPParms.Area = 24.5*ParmStruct.OPParms.Hc^2
			else
				ParmStruct.OPParms.Area = ProfileWave(Limit(ParmStruct.OPParms.Hc,DimOffset(ProfileWave,0),rightx(ProfileWave)-DimDelta(ProfileWave,0)))		//ProfileWave is in um^2, we want meters^2
			endif

			break
	
		case "Expansion":
			Wave Expansion = InitOrDefaultWave(ARGetForceFolder("Data","","")+"ExpansionSeries",0)
			nop = DimSize(Expansion,0)
			if (Nop)
				for (A = 0;A < nop;A += 1)
					ParmStruct.OPParms.Area += Expansion[A]*ParmStruct.OPParms.Hc^(2/2^A)
				endfor

				break
			else
				//don't break
			endif
			
		case "24.5 Hc^2":
			ParmStruct.OPParms.Area = 24.5*ParmStruct.OPParms.Hc^2
			break
						
		
	endswitch

	
	ParmStruct.Ec = sqrt(pi)/2/ParmStruct.OPParms.Beta*ParmStruct.OPParms.Stiffness/sqrt(ParmStruct.OPParms.Area)
	FmapCalcElasticFinish(ParmStruct,CalcStruct)

	FMapElasticDebugFunc(1,DebugTheFit,ParmStruct)//,CalcStruct)


	return(CalcStruct.Outputs[0])
End //FMapCalcOliverPharrWorker


FMapCalcHertzTS
Function FMapCalcHertz(CalcStruct)
	Struct FMapCalcStruct &CalcStruct
	Variable output
	Struct ARForcePlotStruct DataStruct


	//Gutted version of HertzCurveFunc, that can be used on a FP by FP basis (for use with map calcing).

	if (CalcStruct.IsInfo)
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.
		CalcStruct.DataRate = .5/550		//1/2 gig file in 9 Minutes
		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 1
		CalcStruct.OutputNameList = "YoungsHertz;"//Height;"
		CalcStruct.NumOfChannels = 2		//we need N inputs

		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		DataStruct.IsFixed = 0
		Wave/Z DataStruct.Data = $""

		DataStruct.Channel = "Force"
		DataStruct.Segment = "Ext"
		CalcStruct.Data[0] = DataStruct
		
		DataStruct.Channel = "Ind"
		DataStruct.Segment = "Ext"
		CalcStruct.Data[1] = DataStruct
		CalcStructInfoFunc(CalcStruct)
		
		return(0)
	endif
	
	Wave YData = CalcStruct.Data[0].Data
	Wave XData = CalcStruct.Data[1].Data
	Wave ParmWave = CalcStruct.ParmWave
		
	Variable DebugTheFit = 0
	
	Struct ARElasticParmStruct ParmStruct
	String VarFolder = GetDF("Variables")
	Wave/T FDD = $VarFolder+"ForceDispVariablesDescription"
	Wave FDV = $VarFolder+"ForceDispVariablesWave"

	Wave ParmStruct.Force = YData
	Wave ParmStruct.Ind = XData
	ParmStruct.ModelName = "Hertz"

	//********************************
	//Lots of work here
	FMapElasticInitFunc(ParmStruct,CalcStruct)
	//LOOK AT ME MOTHER <EDIT>
	//IF YOU CAN't FIGURE OUT WHAT IS GOING ON, IT IS PROBABLY IN HERE>
	//********************************
	
	ParmStruct.SectionStr = StringFromList(0,ReduceSectionList(FDD[%IndentSegmentName][%Title]),";")
	
	ParmStruct.SectionList = ParmStruct.SectionStr
	ParmStruct.HertzParms.TipGeometry = FDD[%IndentTipGeo][%Title]

//	ParmStruct.FPName = NameOfWave(ParmStruct.Force)		//set this temporarily for the IsLoading
	ParmStruct.SetLoading(ParmStruct)
//	ParmStruct.FPName = ""		//clear this
	
	ElasticXYOffsetFunc(ParmStruct)
	GetElasticLocks(ParmStruct)
	ElasticPreFitFunc(ParmStruct)
	

	
	Variable Ec, XOffset, TipParm, ForceOffset		//for pass by ref into fit function

	Ec = ParmStruct.Ec
	XOffset = ParmStruct.DepthOffset
	TipParm = FDV[%$"Indent"+ParmStruct.HertzParms.TipGeometry+"Parm"][0]
	StrSwitch (ParmStruct.HertzParms.TipGeometry)
		case "Punch":
			ParmStruct.HertzParms.PunchRadius = TipParm
			ParmStruct.HertzParms.SphereRadius = FDV[%IndentSphereParm][0]
			break
		
		case "Sphere":
			ParmStruct.HertzParms.SphereRadius = TipParm
			break
			
		case "Cone":
			ParmStruct.HertzParms.ConeAngle = TipParm
			ParmStruct.HertzParms.SphereRadius = FDV[%IndentSphereParm][0]
			break
			
	endswitch
	ForceOffset = ParmStruct.ForceOffset
	
	Wave/Z ParmStruct.FitWave = $""		//create a Null ref, we need to pass to Hertz, but it can deal with Null refs.

	Variable Value, StartIndex, StopIndex
	StartIndex = Min(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	StopIndex = Max(ParmStruct.LockIndexes[0],ParmStruct.LockIndexes[1])
	if (ParmStruct.ForceFit && ParmStruct.DepthFit && StringMatch(ParmStruct.SectionStr,"Ext"))
		StartIndex = 0
	endif

	if (abs(StopIndex-StartIndex) < 7)
		return(NaN)
	endif
	
	String HoldStr = "0"
	HoldStr += num2str(!ParmStruct.HertzParms.TipFit)
	HoldStr += num2str(!ParmStruct.DepthFit)
	HoldStr += num2str(!ParmStruct.ForceFit)
	//HoldStr += "1"

	FMapElasticDebugFunc(0,DebugTheFit,ParmStruct)//,CalcStruct)

	if (!Ec)
		Ec = 100e6
	endif
//DebugSaveData(YData,XData)
	Hertz(ParmStruct.HertzParms.TipGeometry,Ec,TipParm,XOffset,ForceOffset,HoldStr,XData,YData,ParmStruct.FitWave,StartIndex,StopIndex)
	

	ParmStruct.Ec = Ec
	FmapCalcElasticFinish(ParmStruct,CalcStruct)

	FMapElasticDebugFunc(1,DebugTheFit,ParmStruct)//,CalcStruct)
	
	return(CalcStruct.Outputs[0])
End //FMapCalcHertz


Function FMapCalcInvols(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB
	Wave/Z ParmWave
	
	String FPname = NameOfWave(Data)
	String BaseName, Suffix, DataType, SectionStr
	ExtractForceWaveName(FPname,BaseName,Suffix,DataType,SectionStr)
	
	Variable Output = SlopeCurveFunc(Data,DataB,SectionStr)
	return(output)
End //FMapCalcInvols


Function/S FMapCalcInvolsInfo()

	String Output = "DataType:DeflV;Section:Ext;DataTypeB:ZSnsr;ParmWave:None;CalcType:Invols;"
	return(output)
End //FMapCalcInvolsInfo


Function FMapCalcJKR2Point(Force,Ind,ParmWave)
	Wave Force
	Wave/Z Ind		//used
	Wave/Z ParmWave		//not used
	
	Variable PoissonRatio = 0		//if Poisson Ratio is not passed in, then this will 
	//Make the calculation return Ec, in that
//print (1-cmplx(0,.57735)^2)
//1
	PoissonRatio = 0
	Variable Radius = 20e-9
	if (WaveExists(ParmWave) && (DimSize(ParmWave,0) > 0))
		Radius = ParmWave[0]
	endif
	if (WaveExists(ParmWave) && (DimSize(ParmWave,0) > 1))
		PoissonRatio = ParmWave[1]
	endif
//	print Radius
		
	Variable IsLoading = 0		//this function just gets the retract data for now.
	Variable Index0, Index1
	Variable Start, Stop
	Variable ZeroPoint, DeltaForce, DeltaInd
	Variable JKRFactor// = 0.715		//has the 4/3 and the PoissonRatio of .5 in it.
	JKRFactor = 3/4*(1-PoissonRatio^2)*((1+16^(1/3))/3)^1.5
	Variable output
	
	
	WaveStats/Q Force
	Index0 = x2pnt(Force,V_minloc)
	Start = 0
	Stop = DimSize(Force,0)-1
	if (Ind[Start] < Ind[Stop])
		IsLoading = 1
	endif
	
	if (IsLoading)
		WaveStats/Q/R=[Start,Start+9] Force
		SwapVars(Start,Stop)
	else
		WaveStats/Q/R=[Stop-9,Stop] Force
	endif
	ZeroPoint = V_Avg
	
	FindLevel/P/Q/R=[Start,Stop] Force,ZeroPoint
	Index1 = V_LevelX
	DeltaForce = Force[Index1]-Force[Index0]
	DeltaInd = Max(Ind[Index1]-Ind[Index0],1e-15)			//zero and negative numbers are really bad
					//so we will require this to be 1 fm, to keep the output resonable.
	output = JKRFactor*DeltaForce/sqrt(Radius*DeltaInd^3)

	return(output)
	
End //FMapCalcJKR2Point


Function/S FMapCalcJKR2PointInfo()

	String Output = "DataType:Force;Section:Ret;DataTypeB:Ind;ParmWave:None;CalcType:YoungsJKR;"
	return(output)
End //FMapCalcJKR2PointInfo


//Function FMapCalcJKRIndentation(Force,Ind,ParmWave)
//	Wave Force
//	Wave/Z Ind		//used
//	Wave/Z ParmWave		//not used
//	
////	Variable PoissonRatio = 0		//if Poisson Ratio is not passed in, then this will 
////	//Make the calculation return Ec, in that
//////print (1-cmplx(0,.57735)^2)
//////1
////	PoissonRatio = 0
////	Variable Radius = 20e-9
////	if (WaveExists(ParmWave) && (DimSize(ParmWave,0) > 0))
////		Radius = ParmWave[0]
////	endif
////	if (WaveExists(ParmWave) && (DimSize(ParmWave,0) > 1))
////		PoissonRatio = ParmWave[1]
////	endif
////	print Radius
//		
//	Variable IsLoading = 0		//this function just gets the retract data for now.
//	Variable Index0, Index1
//	Variable Start, Stop
//	Variable ZeroPoint, DeltaForce, DeltaInd
////	Variable JKRFactor// = 0.715		//has the 4/3 and the PoissonRatio of .5 in it.
////	JKRFactor = 3/4*(1-PoissonRatio^2)*((1+16^(1/3))/3)^1.5
//	Variable output
//	
//	
//	WaveStats/Q Force
//	Index0 = x2pnt(Force,V_minloc)
//	Start = 0
//	Stop = DimSize(Force,0)-1
//	if (Ind[Start] < Ind[Stop])
//		IsLoading = 1
//	endif
//	
//	if (IsLoading)
//		WaveStats/Q/R=[Start,Start+9] Force
//		SwapVars(Start,Stop)
//	else
//		WaveStats/Q/R=[Stop-9,Stop] Force
//	endif
//	ZeroPoint = V_Avg
//	
//	FindLevel/P/Q/R=[Start,Stop] Force,ZeroPoint
//	Index1 = V_LevelX
//	DeltaForce = Force[Index1]-Force[Index0]
//	DeltaInd = Ind[Index1]-Ind[Index0]
//	if ((DeltaInd < 1e-15) || (DeltaForce < 0))
//		return(Nan)
//	else
//		return(DeltaInd)
//	endif
//
//					//so we will require this to be 1 fm, to keep the output resonable.
//	//output = JKRFactor*DeltaForce/sqrt(Radius*DeltaInd^3)
//
//	//return(output)
//	
//End //FMapCalcJKRIndentation
//
//
//Function/S FMapCalcJKRIndentationInfo()
//
//	String Output = "DataType:Force;Section:Ret;DataTypeB:Ind;ParmWave:None;CalcType:IndJKR;"
//	return(output)
//
//End //FMapCalcJKRIndentationInfo


ThreadSafe Function SlopeCurveFunc(YData,XData,SectionStr)
	Wave YData, XData
	String SectionStr
	
	
	
	//Gutted version of HertzCurveFunc, that can be used on a FP by FP basis (for use with map calcing).
		
	Variable LowRatio = .10
	Variable HighRatio = .90

	
	//OK, we need to get the correct section
	

	Variable ForceMax, ForceMin, Value, Index0, Index1, StartIndex, StopIndex
	Variable Nop = DimSize(YData,0)
	
	ForceMax = WaveMax(YData)
	
	StrSwitch (SectionStr)
		case "Ret":
		case "Ext":
			break
	
		default:
			if (XData[0] < XData[Nop-1])
				//we are going forward.
				SectionStr = "Ext"
			else
				SectionStr = "Ret"
			endif
			break
			
	endswitch
	
	StrSwitch (SectionStr)
		case "Ext":
			WaveStats/M=1/Q/R=[0,10] YData
			break
			
		case "Ret":
			WaveStats/M=1/Q/R=[Nop-10,Nop-1] YData
			break
			
	endswitch
		
	
	ForceMin = V_Avg

	Value = (ForceMax-ForceMin)*LowRatio+ForceMin
	FindLevel/B=5/P/Q/R=[0,Nop-1] YData,Value
	Index0 = round(V_LevelX)
	
	Value = (ForceMax-ForceMin)*HighRatio+ForceMin
	FindLevel/B=5/P/Q/R=[0,Nop-1] YData,Value
	Index1 = round(V_LevelX)
	
	if (IsNan(Index1))
		WaveStats/Q YData
		Index1 = round(x2pnt(YData,V_maxloc))
	endif
		
		
		
	StartIndex = Min(Index0,Index1)
	StopIndex = Max(Index0,Index1)
	Variable Slope, Intercept
	Poly1Fit(YData,XData,StartIndex,StopIndex,Slope,Intercept)

//	if (IsNan(Slope))
//		print Slope
//	endif
	
	
	return(Slope)
End //SlopeCurveFunc


Function FMapCalcCurrent(CalcStruct)
	Struct FMapCalcStruct &CalcStruct
	
	Variable output = 0
	if (CalcStruct.IsInfo)
		//we fill in information about the default state.

		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 2
		CalcStruct.OutputNameList = "CurrentMin;CurrentMax;"//"VoltageCoercive;VoltageImprint;VoltageNegative;VoltagePositive;"
		CalcStruct.NumOfChannels = 1		//inputs

		CalcStruct.Data[0].Channel = "Cur"
		CalcStruct.Data[0].Segment = "ALL"
		CalcStructInfoFunc(CalcStruct)

		return(output)
	endif
	
	Variable CurMax = WaveMax(CalcStruct.Data[0].Data)
	Variable CurMin = WaveMin(CalcStruct.Data[0].Data)
	
	
	
	CalcStruct.Outputs[0] = CurMin
	CalcStruct.outputs[1] = CurMax

	return(CalcStruct.Outputs[0])	
End //FMapCalcCurrent

//Function FMapCalcIVSlopeAround0V(CalcStruct)
//	Struct FMapCalcStruct &CalcStruct
//	
//	Variable output = 0
//	if (CalcStruct.IsInfo)
//		CalcStruct.IsInfo = 0
//		CalcStruct.InfoStr = ""
//		CalcStruct.NumOfOutputs = 1
//		CalcStruct.OutputNameList = "IVSlope0V;"
//		CalcStruct.NumOfChannels = 2
//		CalcStruct.Data[0].Channel = "Cur"
//		CalcStruct.Data[1].Channel = "Bias"
//		CalcStruct.Data[0].Segment = "ALL"
//		
//		CalcStructInfoFunc(CalcStruct)
//		
//		return(output)
//	endif
//	
//	//TODO: The actual calculation
//	return(CalcStruct.Outputs[0])
//End

Function FMapCalcCurrentAtBias(CalcStruct)
	Struct FMapCalcStruct &CalcStruct
	
	Variable output = 0
	if (CalcStruct.IsInfo)
		//we fill in information about the default state.

		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 2
		CalcStruct.OutputNameList = "CurrentMin;CurrentMax;"
		CalcStruct.NumOfChannels = 2		//inputs

		CalcStruct.Data[0].Channel = "Cur"
		CalcStruct.Data[1].Channel = "Bias"
		CalcStruct.Data[0].Segment = "ALL"
		CalcStruct.Data[1].Segment = "ALL"
		CalcStructInfoFunc(CalcStruct)

		return(output)
	endif
	
	if (!WaveExists(CalcStruct.Data[1].Data) || !DimSize(CalcStruct.Data[1].Data,0))
		Variable Index = DimSize(CalcStruct.Data[0].Data,0)/2
		CalcStruct.Outputs[0] = CalcStruct.Data[0].Data[0]
		CalcStruct.Outputs[1] = CalcStruct.Data[0].Data[Index]
	else
		WaveStats/Q CalcStruct.Data[1].Data
		CalcStruct.Outputs[0] = CalcStruct.Data[0].Data[V_minRowLoc]
		CalcStruct.Outputs[1] = CalcStruct.Data[0].Data[V_maxRowLoc]
	endif
	return(CalcStruct.Outputs[0])	
End //FMapCalcCurrentAtBias


Function/S ThermalModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Thermal"
		ParmStruct.Pict = "Thermal"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ThermDone"
		ParmStruct.NumParms = 1
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Thermal,SpringConstant,Calibration,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "The Max Samples is how many samples you want to collect before it stops and goes to the next step.  This will only collect the data.\rSee other thermal modules to calibrate the spring constant"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
		
		Argument.ParmName = "ThermalSamplesLimit"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)

		//Then Hijack with the values we want.
		if (!Argument.Value || !IsFinite(Argument.Value))
			Argument.Value = 20
		endif
		Argument.Title = "Max Samples"
		Argument.Low = 1		//this module can not allow unlimited samples.
		Argument.High = 1e6
		Argument.Value = Limit(Argument.Value,Argument.Low,Argument.High)
		
		
		ParmStruct.Argument[0] = Argument

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	//This module, all the parms are standard, so just do a thermal.
	PV("ButtonTime",0)		//we have to tell it that the button time is zero, to make sure that we can get trough.
	PV("MacroIsRunning",1)		//hack it in
	Variable Error = DoThermalFunc("DoThermalButton_1")
	if (Error)
		//the thermal was not started for some reason, get to next step.
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ThermalModule

Function/S GetRealModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "GetReal"
		ParmStruct.Pict = "Sader"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "Sader"
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Thermal,SpringConstant,Calibration,Sader,GetReal"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This runs a thermal and calibrates Invols and spring constant using the Sader method.\rYou need to select which lever you have with the Lever panel (Programming)."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	//This module, all the parms are standard, so just do a thermal.
	PV("ButtonTime",0)		//we have to tell it that the button time is zero, to make sure that we can get trough.
	PV("MacroIsRunning",1)		//hack it in
	Variable Error = DoThermalFunc("NewSaderThermal_1")
	if (Error)
		//the thermal was not started for some reason, get to next step.
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //GetRealModule



Function/S TemplateModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Template"
		ParmStruct.Pict = "Back"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ThermDone"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Template"
		ParmStruct.KeyWords = ", separated String List of KeyWords,Things like thermal,Force,Imaging, But DO NOT HAVE SPACES!"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "Error! This is the template function\rThe requested function may not conform to the required input / outputs"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		
		Argument.ParmName = "ThermalSamplesLimit"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		//Then Hijack with the values we want.
		Argument.Title = "Max Samples"
		Argument.Low = 1		//this module can not allow unlimited samples.
		Argument.High = 1e6
		Argument.Value = Limit(Argument.Value,Argument.Low,Argument.High)
		
		
		ParmStruct.Argument[0] = Argument

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //TemplateModule


Function/S IndenterModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable A, nop = 4, Index
	Variable IndentModeIndex = 0
	Variable FuncIndex = 2
	Variable UnitsIndex = 6
	Variable FEIndex = 4
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Indenter Setup"
		ParmStruct.Pict = "Indent"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 8
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,Indenter,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "Sets up the indenter settings."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = IndentModeIndex
		//Indent Mode
		Argument.ParmName = "DwellRampMode"
		Argument.Type = "Popup"
		Argument.ColumnLabel = ""
		Argument.StrList = GUS(Argument.ParmName)
		Argument.StrValue = GTS(Argument.ParmName)
		Argument.Value = GV(Argument.ParmName)
		Argument.Title = "Indenter Mode"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""
		Argument.Value += 1		//zero based [ARPopFunc]
		Argument.ParmName = "ModuleParm"+num2str(Index)		//this is a parm that stays changed.		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = FuncIndex
		//Indenter Function
		Argument.ParmName = "DwellRampFunc"
		Argument.Type = "Popup"
		Argument.ColumnLabel = ""
		Argument.StrList = ARIndentGetFuncList()
		Argument.StrValue = GTS(Argument.ParmName)
		Argument.Value = GV(Argument.ParmName)
		Argument.Title = "Indenter Function"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""
		Argument.Value += 1		//zero based [ARPopFunc]
		Argument.ParmName = "ModuleParm"+num2str(Index)		//this is a parm that stays changed.		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = UnitsIndex
		//Indenter Function
		Argument.ParmName = "DwellRampUnits"
		Argument.Type = "Popup"
		Argument.ColumnLabel = ""
		Argument.StrList = GetIndentUnits()
		Argument.StrValue = GTS(Argument.ParmName)
		Argument.Value = GV(Argument.ParmName)
		Argument.Title = "Units"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value += 1		//zero based [ARPopFunc]
		
		ParmStruct.Argument[Index] = Argument
		
	
		//Dwell Ramp Parms	
		for (A = 0;A < nop;A += 1)
			Index = A*2+1
			Argument.ParmName = "DwellRampParm"+num2str(A)
			Argument.Type = "Value"
			Argument.ColumnLabel = ""
			//Then seed the values with the current Global value
			ARMacroVarWave2Arg(Argument)
			
			//Then Hijack with the values we want.
			Argument.ParmName = "ModuleParm"+num2str(Index)
			
			ParmStruct.Argument[Index] = Argument
		endfor
		
		Index = FEIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "c:Documents and Settings:"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Path to Load FE Profile"
		Argument.FuncName = "ModuleSetVarFunc"
	
		ParmStruct.Argument[Index] = Argument
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	
	
	//well special case for FE
	
	
	//It is up to us to put in DwellRampMode and Units.
	Variable TabNum = ARPanelTabNumLookup("ARIndentPanel")
	String TabStr = "_"+num2str(TabNum)
	Variable IndentMode = ParmStruct.Argument[IndentModeIndex].Value-1
	PV("DwellRampMode",IndentMode)
	PTS("DwellRampMode",ParmStruct.Argument[IndentModeIndex].StrValue)
	UpdateAllPopups("DwellRampModePop"+TabStr,IndentMode+1)
	
	PV("DwellRampUnits",ParmStruct.Argument[UnitsIndex].Value-1)
	PTS("DwellRampUnits",ParmStruct.Argument[UnitsIndex].StrValue)
	UpdateAllPopups("DwellRampUnitsPop"+TabStr,ParmStruct.Argument[UnitsIndex].Value)
	
	PV("DwellRampFunc",ParmStruct.Argument[FuncIndex].Value-1)
	PTS("DwellRampFunc",ParmStruct.Argument[FuncIndex].StrValue)
	UpdateAllPopups("DwellRampFuncPop"+TabStr,ParmStruct.Argument[FuncIndex].Value)
	
	
	
	if (StringMatch(ParmStruct.Argument[FuncIndex].StrValue,"Function Editor"))
		ARFEIndent()		//make sure things are initialized
		Struct WMButtonAction ButtonStruct
		ButtonStruct.EventCode = 2
		ButtonStruct.Ctrlname = "LoadButton"
		ButtonStruct.Win = "FEGraphIndenter"
		String PathStr = ConvertPCPathToIgor(ParmStruct.Argument[FEINdex].StrValue)
		ButtonStruct.UserData = LastDir(PathStr)
		NewPath/O/Q/Z FEGraphPath,UpDir(PathStr)
		ARFEButtonFunc(ButtonStruct)
	else
		//then it is up to us to put the parms in the right place...
		String DataFolder = GetDF("Force:Dwell")
		Wave/Z ParmWave = $DataFolder+"Parm"+num2str(IndentMode)+"VariablesWave"
		//Wave/Z/T ParmDescript = $DataFolder+"Parm"+num2str(IndentMode)+"VariablesDescription"
		//Duplicate/O ParmWave,$DataFolder+"ParmBackup"
		//Wave Backup = $DataFolder+"ParmBackup"
		for (A = 0;A < nop;A += 1)
			ParmWave[A][0] = ParmStruct.Argument[A*2+1].Value
			PV("DwellRampParm"+Num2str(A),ParmWave[A][0])
		endfor
		
		
		UpdateARIndentDwell()
		//Duplicate/O Backup,ParmWave
	endif
	
	//Turn on the indent mode automatically.
	ARCheckFunc("IndentModeCheck_0",1)
	
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //IndenterModule


Function/S ImagingModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index = 0
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Scan"
		ParmStruct.Pict = "Scan"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ImageScan"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Scan,Image,"
		ParmStruct.Requires = ""		//works on all systems.
		//ParmStruct.help = "This will scan an image.  If a \"use checkbox\" is turned off, the parmeter to the right it will not be applied to the scan.\rSo the scan will use whatever value is currently entered in the main interface for that parameter.\rThe last frame is finished with a \"last scan\", so it will leave it in contact with the surface, or withdraw, based on your settings."
		ParmStruct.help = "This will scan an image.\rThe scan will use whatever value is currently entered in the main interface.\rThe last frame is finished with a \"last scan\", so it will leave it in contact with the surface, or withdraw, based on your settings."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = 1
		
		//which axis
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Start 1st frame:"
		Argument.StrList = "Scan Down;Scan Up;Toggle;"
		Argument.StrValue = "Toggle"
		Argument.Value = 3
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument


		Index = 0
		//Number of Frames
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Number Of Frames"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = "ModuleSetVarFunc"
		Argument.UnitString = ""
		Argument.FormatStr = "%.0f"
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 10
		Argument.StepSize = 1
		
		ParmStruct.Argument[Index] = Argument
		
		
		
		Index = 2
		//Use Scan Size
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Scan Size"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = 3
		
		Argument.ParmName = "ScanSize"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)

		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = 4
		//Use X offset
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this X Offset"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = 5
		
		Argument.ParmName = "XOffset"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		ParmStruct.Argument[Index] = Argument
		
		Index = 6
		//Use Y offset
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Y Offset"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = 7
		
		Argument.ParmName = "YOffset"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		ParmStruct.Argument[Index] = Argument
		
		Index = 8
		//Use Setpoint
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Setpoint"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = 9
		Struct ARImagingModeStruct ImagingModeParms
		ARGetImagingMode(ImagingModeParms)
		
		Argument.ParmName = ImagingModeParms.SetpointParm
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.Title = "Setpoint"
		Argument.FormatStr = "%.3f "
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		ParmStruct.Argument[Index] = Argument
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	


	String DataFolder = GetDF("Macro")
	Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif
	Variable Counter = ReplaceNaN(NumberByKey("Count", MacroData[Index],cMacroKey0,cMacroSep0,0),0)
//	if (IsNan(Counter))
//		Counter = 0
//	endif
	Variable CounterMem = Counter
	if (Counter+1 >= round(ParmStruct.Argument[0].Value))
		//OK, 
		Counter = -1		//reset the counter, we are done with this loop.
		Execute/P/Q/Z "PV(\"LastScan\",1)"
		ParmStruct.CallbackName = "ImageDone"
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		CurrentMacro[Index][1] = ARMacroStruct2String(ParmStruct)
		PV("MacroNextStep",Index+1)//Next Time in, we are moving on.
	else
		ParmStruct.CallbackName = "ImageScan"
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		CurrentMacro[Index][1] = ARMacroStruct2String(ParmStruct)
		PV("MacroNextStep",Index)		//move the counter back 1, so we come back into this module
	endif
	MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)



	String CtrlName = "Scan_0"
	StrSwitch (ParmStruct.Argument[1].StrValue)
		case "Scan Up":
			CtrlName = "Up"+CtrlName
			break

		case "Scan Down":
			CtrlName = "Down"+CtrlName
			break
			
		case "Toggle":
			CtrlName = "Do"+CtrlName
			break

	endswitch
	if (CounterMem == 0)
		DoScanFunc(CtrlName)
	endif


	
	return(output)
End //ImagingModule


Function/S StartScanModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index = 0
	Variable ScanDirIndex = 0
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "StartScan"
		ParmStruct.Pict = "Scan"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ImageGo"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Scan,Image,"
		ParmStruct.Requires = "TestingFramework"
		ParmStruct.help = "This will \"START\" to scan an image.\rThis an advanced module to allow testing of how the scanning is operating.\rThe scan will use whatever value is currently entered in the main interface.\rThe last frame is finished with a \"last scan\", so it will leave it in contact with the surface, or withdraw, based on your settings."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = ScanDirIndex
		//which axis
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Start 1st frame:"
		Argument.StrList = "Scan Down;Scan Up;Toggle;"
		Argument.StrValue = "Toggle"
		Argument.Value = 3
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	

	String CtrlName = "Scan_0"
	StrSwitch (ParmStruct.Argument[ScanDirIndex].StrValue)
		case "Scan Up":
			CtrlName = "Up"+CtrlName
			break

		case "Scan Down":
			CtrlName = "Down"+CtrlName
			break
			
		case "Toggle":
			CtrlName = "Do"+CtrlName
			break

	endswitch
	DoScanFunc(CtrlName)


	
	return(output)
End //StartScanModule


Function/S AutoTuneModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable LowIndex = 3
	Variable HighIndex = 5
	Variable TargetAmpIndex = 7
	Variable TargetPercentIndex = 9
	Variable DualACIndex = 0
	Variable SkipIndex = 1
	Variable UseLowIndex = 2
	Variable UseHighIndex = 4
	Variable UseTargetIndex = 6
	Variable UsePercentIndex = 8
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Auto Tune"
		ParmStruct.Pict = "Tune"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "Tune"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 10
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "AutoTune,Tune,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will do an Auto Tune"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
	
		Index = DualACIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Popup"
		Argument.StrValue = "1st Freq"
		Argument.StrList = "1st Freq;2nd Freq;"
		Argument.Value = 0
		Argument.FuncName = "ModulePopFunc"
		Argument.UnitString = ""
		Argument.FormatStr = ""
		Argument.Title = "Dual AC Mode:"
		Argument.ColumnLabel = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
	

		Index = LowIndex
		Argument.ParmName = "AutoTuneLow"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument

		
		Index = HighIndex
		Argument.ParmName = "AutoTuneHigh"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument

		
		Index = TargetAmpIndex
		Argument.ParmName = "TargetVoltage"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument

		
		Index = TargetPercentIndex
		Argument.ParmName = "TargetPercent"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument

		
		Index = UseLowIndex
		//Use AutoTune Low
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Auto Tune Low"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument

		Index = UseHighIndex
		//Use AutoTune High
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Auto Tune High"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument

		Index = UseTargetIndex
		//Use Target
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Target Amplitude"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument


		Index = UsePercentIndex
		//Use Percent
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Target Percent"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument



		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard
	
	
	String TempStr = ""
	if (ParmStruct.Argument[DualACIndex].Value == 2)
		TempStr = "1"
		if (!GV("DualACMode"))
			TuneBoxFunc("DualACModeBox_3",1)
		endif
	endif
	
	CantTuneFunc("DoTuneAuto"+TempStr+"_3")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //AutoTuneModule


Function/S NudgerModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Nudger"
		ParmStruct.Pict = "Nudger"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 3
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "XY,Translation,Nudger,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "Module to move the X,Y, or Z stage a set distance in closed or open loop."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		//which axis
		Argument.ParmName = "ModuleParm0"
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Axis:"
		Argument.StrList = "X;Y;Z;"
		Argument.StrValue = "X"
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[0] = Argument

		//closed loop / open loop
		Argument.ParmName = "ModuleParm1"
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Mode:"
		Argument.StrList = "Closed Loop;Open Loop;"
		Argument.StrValue = "Closed Loop"
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[1] = Argument

		//Distance
		Argument.ParmName = "ModuleParm2"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Distance:"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1e-6
		Argument.Units = 1e-6
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		Argument.High = abs(GV("RetractZ")-GV("ExtendZ"))
		Argument.Low = -Argument.High
		Argument.StepSize = 1e-7
		Argument.FormatStr = "%.3W1P"
		Argument.UnitString = "m"
		Argument.MinUnits = 1e-6
		
		
		ParmStruct.Argument[2] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)



	String Axis = ParmStruct.Argument[0].StrValue
	Variable ClosedLoop = StringMatch(ParmStruct.Argument[1].StrValue,"Closed*")

		//we subtract .5 to make things softer, since we are poping, and not ramping.
	String Channel = "", ErrorStr = ""
	Struct ARFeedbackStruct FB
	Variable Sens
	ARGetFeedbackParms(FB,"output"+Axis)

	if (StringMatch(Axis,"Z"))
		ir_StopPISLoop(NaN,LoopName="HeightLoop")
		SVAR WhatsRunning = $GetDF("Main")+"WhatsRunning"
		if ((ItemsInList(WhatsRunning,";") == 1) && WhichListItem("engage",WhatsRunning,";",0,0) >= 0)
			ARStatus(0,"Ready")
		endif
		ARManageRunning("Engage",0)
		CheckYourZ(1)
	endif

	if (ClosedLoop)
		FB.PGain = 0
		FB.SGain = 0
		ErrorStr += ir_WritePIDSloop(FB)
		Channel = "$"+FB.LoopName+".setpoint"
		Sens = GV(Axis+"LVDTSens")
	else
		ir_stopPISLoop(NaN,LoopName=FB.LoopName)
		Channel = "output."+Axis
		Sens = GV(Axis+"PiezoSens")
	endif

	//OK, we know the pisloop is started up, or stoped as needed.
	
	
	Variable Value = td_ReadValue(Channel)
	Variable Delta = ParmStruct.Argument[2].Value
	Delta /= Sens		//Volts
	ErrorStr += num2str(td_SetRamp(.1,Channel,0, Value+Delta,"",0,0,"",0,0,"ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"))+","
	ARReportError(ErrorStr)

	
	
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //NudgerModule


Function/S SingleForceModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "SingleForce"
		ParmStruct.Pict = "Force1"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ForceDone"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will do a single force plot\rIt just uses the standard parameters"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard
	
	DoForceFunc("SingleForce_2")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //SingleForceModule


Function/S MultiForceModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "MultiForce"
		ParmStruct.Pict = "ForceN"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ForceDone"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will do a set number of force plots\rIt just uses the standard parameters"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		
		Argument.ParmName = "MaxContinuousForce"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		//Then Hijack with the values we want.
		Argument.Title = "Number of Force Plots"
		Argument.Low = 1		//this module can not allow unlimited samples.
		Argument.High = 1e6
		if (Numtype(argument.Value) == 1)		//inf
			Argument.Value = 10		//our default
		else
			Argument.Value = Limit(Argument.Value,Argument.Low,Argument.High)
		endif
		
		
		ParmStruct.Argument[0] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard
	
	DoForceFunc("ManyForce_2")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //MultiForceModule


Function/S ParameterModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Parameter"
		ParmStruct.Pict = "ParmChange"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Parameter,GlobalVariables,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module can change any of the Global variables.\rNote that full error checking is not done till run time.\rAlso Note that the parameter changed by this module will remain at that value for subsequent steps."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		
		Argument.ParmName = "ModuleParm0"
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = GetMBParmList()
		Argument.StrValue = "ScanSize"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Parameter Name"
		Argument.FuncName = "ModulePopFunc"
	
		
		
		
		ParmStruct.Argument[0] = Argument
		
		
		Argument.ParmName = Argument.StrValue
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		
		
		
		Argument.ParmName = "ModuleParm1"
		Argument.Title = "Parameter Value"
		Argument.StrValue = ""
		
		
		ParmStruct.Argument[1] = Argument

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	Argument = ParmStruct.Argument[1]
	Argument.ParmName = ParmStruct.Argument[0].StrValue
	Argument.FuncName = ARSetVarFuncLookup(Argument.ParmName)
	ARMacroArg2VarWave(Argument,SkipBit=0)
	
	
	
	
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ParameterModule


Function/S IncParmModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Increment Parameter"
		ParmStruct.Pict = "ParmPlus"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 3
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Parameter,GlobalVariables,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module can change any of the Global variables.\rNote that full error checking is not done till run time.\rAlso Note that the parameter changed by this module will remain at that value for subsequent steps."
		ParmStruct.Help += "\rIn Log Mode, the new value is 10^(Log(Value)+Increment).\rSo .5 will get you 2 steps per decade"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
		
	
	
		
		Argument.ParmName = "ModuleParm0"
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "ScanSize"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Parameter Name"
		Argument.FuncName = "ModuleSetVarFunc"
	
		
		
		
		ParmStruct.Argument[0] = Argument
		
		
		Argument.ParmName = "moduleParm1"
		Argument.Type = "Value"
		Argument.Value = 1
		Argument.StepSize = .1
		Argument.ColumnLabel = ""
		Argument.Title = "Increment"
		Argument.StrValue = ""
		
		
		ParmStruct.Argument[1] = Argument
		
		
		Argument.ParmName = "moduleParm2"
		Argument.Type = "Popup"
		Argument.Title = "Increment by:"
		Argument.StrList = "Addition;Multiply;Log;"
		Argument.StrValue = "Addition"
		
		
		ParmStruct.Argument[2] = Argument
		
		
		

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	
	ARMacroString2Struct(ParmStruct,ParmStr)
	
	Argument.ParmName = ParmStruct.Argument[0].StrValue
	Argument.Type = "Value"
	Argument.ColumnLabel = ""
	ARMacroVarWave2Arg(Argument)
	
	Variable Factor = ParmStruct.Argument[1].Value
	
	StrSwitch (ParmStruct.Argument[2].StrValue)
		Case "Addition":
			Argument.Value += Factor
			break
			
		case "Multiply":
			Argument.Value *= Factor
			break
		
		case "Log":
			Argument.Value = 10^(Log(Argument.Value)+Factor)
			break
			
	endswitch
	Argument.Units = 1
	
	Argument.FuncName = ARSetVarFuncLookup(Argument.ParmName)
	ARMacroArg2VarWave(Argument,SkipBit=0)
	
	
	
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //IncParmModule


Function/S StoreValueModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable ParmIndex = 0
	Variable WaveIndex = 1
	Variable Index
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "StoreValue"
		ParmStruct.Pict = "Store"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Parameter,GlobalVariables,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module can store any of the Global variables.\rIt will append the value to a wave specified."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = ParmIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "ThermalQ"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Parameter Name"
		Argument.FuncName = "ModuleSetVarFunc"
	
		
		
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = WaveIndex
		Argument.Title = "WavePath"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "root:StoredValuesWave"
		
		
		ParmStruct.Argument[Index] = Argument

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	Wave StoredValues = InitOrDefaultWave(ParmStruct.Argument[WaveIndex].StrValue,0)
	Index = DimSize(StoredValues,0)
	InsertPoints/M=0 Index,1,StoredValues
	StoredValues[Index] = GV(ParmStruct.Argument[ParmIndex].StrValue)
	SetDimLabel 0,Index,$ParmStruct.Argument[ParmIndex].StrValue,StoredValues
	
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //StoreValueModule


Function/S UserFunctionModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "User Function"
		ParmStruct.Pict = "Callback"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Callback,UserFunction,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will execute the string entered.\rYou can use this to call any Igor, AR, or user function"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		
		Argument.ParmName = "ModuleParm0"
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "foo()"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Execute:"
		Argument.FuncName = "ModuleSetVarFunc"
	
		
		
		
		ParmStruct.Argument[0] = Argument
		
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	Execute/Q/Z ParmStruct.Argument[0].StrValue
	if (V_Flag)
		ARPrint("Error in user callback: "+ParmStruct.Argument[0].StrValue,"Error")
	endif
		
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //UserFunctionModule


Function/S SpringConstantModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable FrequencyIndex = 1
	Variable WidthIndex = 3
	Variable UseFreqIndex = 0
	Variable UseWidthIndex = 2
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "SpringConstant"
		ParmStruct.Pict = "SpringConstant"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Thermal,SpringConstant,Calibration,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will zoom in on a thermal peak, initialize the parameters, and then fit the curve and calculate the spring constant."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = FrequencyIndex
		Argument.ParmName = "ThermalCenter"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		//Then Hijack with the values we want.
		Argument.Title = "Expected Frequency"
		
		
		ParmStruct.Argument[Index] = Argument

		Index = WidthIndex
		Argument.ParmName = "ThermalWidth"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		//Then Hijack with the values we want.
		Argument.Title = "Frequency Width"


		ParmStruct.Argument[Index] = Argument


		Index = UseFreqIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Checkbox"
		Argument.Value = 1
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		//Then Hijack with the values we want.
		Argument.Title = "Use This Frequency"


		ParmStruct.Argument[Index] = Argument


		Index = UseWidthIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Checkbox"
		Argument.Value = 1
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		//Then Hijack with the values we want.
		Argument.Title = "Use This Width"


		ParmStruct.Argument[Index] = Argument

	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	//This module, all the parms are standard, so just do the work
	PV("MacroIsRunning",1)		//hack it in
	MainBoxFunc("ThermalZoomBox_1",1)
	DoThermalFunc("FitGuess_1")
	DoThermalFunc("TryFit_1")
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //SpringConstantModule


Function/S ForModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "ForLoop"
		ParmStruct.Pict = "For"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "FlowControl,Programming,ForLoop,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This is the start of a for loop\rIt must always be accompanied with the EndForModule"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		
		Argument.ParmName = "ModuleParm0"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 5
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 10		//this gets us a step size of 1. (MinUnits/Divisor)
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.0f"
		Argument.UnitString = ""
		Argument.Title = "Number of times through loop"
		Argument.FuncName = "ModuleSetVarFunc"
	
		
		ParmStruct.Argument[0] = Argument
		
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	String DataFolder = GetDF("Macro")
	Variable Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif
	Variable Counter = NumberByKey("Count", MacroData[Index],cMacroKey0,cMacroSep0,0)
	Variable GoToPos = NumberByKey("End", MacroData[Index],cMacroKey0,cMacroSep0,0)
	if (IsNan(GoToPos))
		ARPrint("Unterminated for loop?","Error")
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		GoToPos = DimSize(CurrentMacro,0)-2
	endif
	if (Counter >= ParmStruct.Argument[0].Value)
		PV("MacroNextStep",GoToPos+1)
		Counter = -1		//reset the counter, we are done with this loop.
	endif
	MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ForModule


Function/S EndForModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "EndForLoop"
		ParmStruct.Pict = "EndFor"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Programming,Offline,"
		ParmStruct.KeyWords = "FlowControl,Programming,ForLoop,End,Offline,ImageProcessing,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This is the End of a for loop\rIt must always be accompanied with the ForModule"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	

	String DataFolder = GetDF("Macro")
	Variable Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif

	Variable GoToPos = NumberByKey("For", MacroData[Index],cMacroKey0,cMacroSep0,0)
	if (IsNan(GoToPos))
		ARPrint("Extra EndFor statment?","Error")
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		GoToPos = DimSize(CurrentMacro,0)-2
	endif
	PV("MacroCurrentStep",GoToPos)
	PV("MacroNextStep",GoToPos+1)
	RunMacroStep(1)		//direct call, start up the next step.
//	PV("MacroCurrentStep",GoToPos-1)
//	
//	String Callback = StringByKey("callback",MacroData[GoToPos-1][1],cMacroKey0,cMacroSep0,0)
//	
//	//if your function is synchronous [compleats all work in this function, and does not need a callback]
//	//then you should enable the following line:
//	execute/P/Q/Z "ARCallbackFunc(\""+Callback+"\")"
	
	
	return(output)
End //EndForModule


Function/S NextSpotModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable CycleIndex = 0
	Variable SkipZero = 1
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Go to Next Spot"
		ParmStruct.Pict = "NextSpot"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "GoToSpot"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "GoThere,Spot,XY,Translation,Force,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will go to the next spot\rIf Cycle is turned on, it will wrap the force plot index when you go past the number of spots.\rif Skip Point Zero is turned on, it will not do point zero when it wraps around."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = CycleIndex
		//Cycle Checkbox
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "CheckBox"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Title = "Cycle through spot numbers"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""

		ParmStruct.Argument[Index] = Argument
		
	
		Index = SkipZero
		//Cycle Checkbox
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "CheckBox"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.Title = "Skip Point Zero"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""

		ParmStruct.Argument[Index] = Argument
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	Variable DoCycle = 0
	if (ParmStruct.NumParms && ParmStruct.Argument[CycleIndex].Value)
		DoCycle = 1
	endif
	
	
	
	
	String DataFolder = GetDF("Force")
	Wave SpotWaveY = $DataFolder+"SpotY"
	Variable ForceSpotNumber = GV("ForceSpotNumber")+1
	if (DoCycle)
		ForceSpotNumber = mod(ForceSpotNumber,DimSize(SpotWaveY,0))
		if (ParmStruct.Argument[SkipZero].Value && (ForceSpotNumber == 0))
			ForceSpotNumber = 1
		endif
	elseif (ForceSpotNumber >= DimSize(SpotWaveY,0))
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		ARPrint("No more spots to go to, skipping Macro Step.","Error")
		return(Output)
	endif
	
	
	PV("ForceSpotNumber",ForceSpotNumber)
	GoToSpot()

	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //NextSpotModule


Function/S NextForceModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Show Next Force Plot"
		ParmStruct.Pict = "NextForce"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "Force,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will show the next available force plot in memory."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	

	ForceDisplayButtonProc("Next1ForceButton_0")
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //NextForceModule


Function/S XYOffsetForceModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "XY offset Force Plot"
		ParmStruct.Pict = "XYoffForce"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "Force,Modify,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will do automated XY offsets of the selected force data."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	ForceOffsetButtonFunc("AutoYOffset_4")
	ForceOffsetButtonFunc("AutoXOffset_4")

	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //XYOffsetForceModule


Function/S OfflineInvolsModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable WriteBackIndex = 4
	Variable WaveIndex = 5
	Variable SegmentIndex = 0
	Variable LowIndex = 2
	Variable HighIndex = 3
	Variable SkipIndex = 1
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Offline Invols"
		ParmStruct.Pict = "OfflineInvols"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 6
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "Force,Modify,Analyze,Invols,Calibration,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module does automated Invols determination on selected force plots.\r"
		ParmStruct.Help += "If the write Invols back checkbox is selected, it will set the selected force plot's Invols to the determined value"
		ParmStruct.Help += "If the Storage Wave parm points to a wave, then the determined value will be stored in that wave."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = SegmentIndex
		//Which Segment
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = ""
		Argument.StrList = "Ret;Ext;"
		Argument.StrValue = "Ext"
		Argument.Value = 2
		Argument.Title = "Segment"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""

		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
		
		Index = LowIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 10
		Argument.FormatStr = "%.2g "
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Low Index"
		Argument.UnitString = "%"
		Argument.FuncName = ""
		Argument.Low = 0
		Argument.High = 100
		Argument.StepSize = 5
		ParmStruct.Argument[Index] = Argument
		
	
		Index = HighIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 90
		Argument.Title = "High Index"
		ParmStruct.Argument[Index] = Argument
		
		Index = WriteBackIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 1
		Argument.Type = "Checkbox"
		Argument.Title = "Write Invols back\\rto Force plot"		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = WaveIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "root:StoredValuesWave"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Storage WavePath"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	

	//Get the topmost selected force plot.


	//this module posts the callback up front, it may kick out early
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	

	



	Variable Invols, Intercept
	Variable StoreValue = Strlen(ParmStruct.Argument[WaveIndex].StrValue)
	Variable WriteBack = ParmStruct.Argument[WriteBackIndex].Value
	
	if (!StoreValue && !WriteBack)
		//if we are not really doing anything, then leave.
		//don't waste the CPU
		return(output)
	endif
	Variable LowRatio = ParmStruct.Argument[LowIndex].Value/100
	Variable HighRatio = ParmStruct.Argument[HighIndex].Value/100
	Variable LowValue, HighValue, Range, Offset, StartIndex, StopIndex, FitIndex0, FitIndex1
	if (StoreValue)
		Wave StoredValues = InitOrDefaultWave(ParmStruct.Argument[WaveIndex].StrValue,0)
	endif
	Index = DimSize(StoredValues,0)
	
	String SectionStr = ParmStruct.Argument[SegmentIndex].StrValue
	
	Make/Free/N=(0) Deflection,ZSensor
	String FPList, DataFolderList
	GetForcePlotsList(0,FPList,DataFolderList)
	Variable A, nop = ItemsInList(FPList,";")
	String FPName, DataFolder
	for (A = 0;A < nop;A += 1)
		FPName = StringFromList(A,FPList,";")
		DataFolder = StringFromList(A,DataFolderList,";")
		Wave DeflSrc = $CalcForceDataType(DataFolder,FPName+"DeflV")
		Wave ZSnsrSrc = $CalcForceDataType(DataFolder,FPName+"ZSnsr")
		ExtractForceSection(DeflSrc,Deflection,DestName=NameOfWave(DeflSrc)+"DeflV_"+SectionStr)
		ExtractForceSection(ZSnsrSrc,ZSensor,DestName=NameOfWave(ZsnsrSrc)+"Zsnsr_"+SectionStr)
		Offset = WaveMin(Deflection)
		Range = WaveMax(Deflection)-Offset
		LowValue = Range*LowRatio+Offset
		HighValue = Range*HighRatio+Offset
		StartIndex = 0
		StopIndex = DimSize(Deflection,0)-1
		StrSwitch(SectionStr)
			case "Ret":
				break
				
			case "Ext":
				SwapVars(StartIndex,StopIndex)
				break
				
		endswitch
		FindLevel/R=[StartIndex,StopIndex]/P/Q Deflection,LowValue
		if (V_Flag)
			Continue
		endif
		FitIndex0 = V_LevelX
		FindLevel/R=[StartIndex,StopIndex]/P/Q Deflection,HighValue
		if (V_Flag)
			Continue
		endif
		FitIndex1 = V_LevelX
		if (FitIndex1 < FitIndex0)
			SwapVars(FitIndex1,FitIndex0)
		endif

		Poly1Fit(Deflection,ZSensor,FitIndex0,FitIndex1,Invols,Intercept)
//Duplicate/O Deflection,root:Defl
//Duplicate/O ZSensor,root:Zsensor
//NVAR qweqwe = $initOrDefault("Root:Start",FitIndex0)
//qweqwe = FitIndex0
//NVAR qweqwe = $initOrDefault("Root:Stop",FitIndex1)
//qweqwe = FitIndex1
//		
//		print Invols
		
//Wave ParmWave = InitOrDefaultWave("root:"+"AR_Coef",2)
//Redimension/N=(2)/D ParmWave
//CurveFit/Q/W=0 line kwCWave=ParmWave, Deflection[FitIndex0,FitIndex1] /X=Zsensor
//Invols = 1/ParMWave[1]
//print Invols,Deflection[FitIndex0],Deflection[FitIndex1],ZSensor[FitIndex0],ZSensor[FitIndex1]		
//print (ZSensor[FitIndex1]-ZSensor[FitIndex0])/(Deflection[FitIndex1]-Deflection[FitIndex0])


		if (WriteBack)
			CallSetVarFunc(AlterForceParameters,"InvOLS_"+num2istr(A)+"SetVar_2",Invols,"",":Variables:FDPVariablesWave[%InvOLS_"+num2istr(A)+"][%Value]")
		endif
		if (StoreValue)
			InsertPoints/M=0 Index,1,StoredValues
			StoredValues[Index] = Invols
			SetDimLabel 0,Index,$DataFolder+FPName,StoredValues
			
		endif

	endfor
	
	
	



	
	return(output)
End //OfflineInvolsModule


Function/S HertzForceModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable TipGeoIndex = 0
	Variable SkipIndex = 1
	Variable TipParmIndex = 2
	Variable UseTipParmIndex = 3
	Variable DepthOffsetIndex = 4
	Variable UseDepthOffsetIndex = 5
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Hertz fit Force Plot"
		ParmStruct.Pict = "Hertz"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 6
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "Force,Elastic,Hertz"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "Fits the displayed offline data with the hertz model"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = TipGeoIndex
		//Tip Geo
		Argument.ParmName = "IndentTipGeo"
		Argument.Type = "Popup"
		Argument.ColumnLabel = ""
		Argument.StrList = cHertzTipGeos
		Argument.StrValue = GTS(Argument.ParmName)
		Argument.Value = GV(Argument.ParmName)
		Argument.Title = "Tip Geometry"
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = "ModulePopFunc"

		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
		
		
		
		Index = TipParmIndex
		
		Argument.ParmName = "Indent"+Argument.StrValue+"Parm"		//take the current geo and enter the value.
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = UseTipParmIndex
		Argument.ParmName = "IndentTipFit"
		Argument.Type = "CheckBox"
		ARMacroVarWave2Arg(Argument)
		Argument.FuncName = ""
		Argument.Title = "Fit for Tip Parm"
		ParmStruct.Argument[Index] = Argument


		Index = DepthOffsetIndex
		
		Argument.ParmName = "IndentXOffset"		//take the current geo and enter the value.
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = UseDepthOffsetIndex
		Argument.ParmName = "HertzXOffsetFit"
		Argument.Type = "CheckBox"
		ARMacroVarWave2Arg(Argument)
		Argument.FuncName = ""
		Argument.Title = "Fit for Depth offset"
		ParmStruct.Argument[Index] = Argument



		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	
	String FPName = GTS("IndentForceName")
	String DataFolder = GetFPNameDataFolder(FPname)
	Struct ARElasticParmStruct ElasticParms
	ARReadElasticParms(ElasticParms,DataFolder,FPName)
	
	Wave PanelParms = $GetDF("Windows")+"ForceElasticPanelParms"
	Variable LastTab = PanelParms[%SubTabNum][0]
	PanelParms[%SubTabNum][0] = WhichListItem("Hertz",cElasticModelList,";",0,0)
	Struct WMButtonAction ButtonStruct
	ButtonStruct.EventCode = 2
	ButtonStruct.CtrlName = "ElasticResetButton_8"

	if (!ElasticParms.DidFit)
		ElasticHandler()
	else
		ElasticButtonFunc(ButtonStruct)
	endif
	PanelParms[%SubTabNum][0] = LastTab
	
//	ForceOffsetButtonFunc("AutoYOffset_4")
//	ForceOffsetButtonFunc("AutoXOffset_4")

	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //HertzForceModule


Function/S HeaterModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	Variable TabNum = ARPanelTabNumLookup("HeaterPanel")
	String TabStr = "_"+num2str(TabNum)
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Heater"
		ParmStruct.Pict = "Temperature"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "Heater"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Heater,Temperature,"
		ParmStruct.Requires = "Heater"
		ParmStruct.help = "This module will run the heater stage to a give setpoint, and then move to the next step.\rIt will only operate in Feedback mode.\rEnter NaN for TargetTemp, or RampRate to not change them."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = 0
		
		Argument.ParmName = "HeaterTargetTemp"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Target Temperature"
			Argument.Value = 25
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 0
			Argument.High = 300
			Argument.StepSize = 1
			Argument.MinUnits = 1
			Argument.FormatStr = "%.1f"
			Argument.UnitString = " º C"
			Argument.FuncName = ""

		endif
		
		Argument.ParmName = "ModuleParm"+num2str(Index)		// we will have to do this by hand
		//since we don't want the parm to go back after we get to the setpoint....
		ParmStruct.Argument[Index] = Argument


		Index = 1
		
		Argument.ParmName = "HeaterRampRate"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Ramp Rate"
			Argument.Value = 5
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 0
			Argument.High = 10		//probably need better defaults here, but they are all read from infoblocks.,
			Argument.StepSize = 1
			Argument.MinUnits = 1
			Argument.FormatStr = "%.2f"
			Argument.UnitString = " º C/min"
			Argument.FuncName = ""

		endif
		Argument.ParmName = "ModuleParm"+num2str(index)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = 2
		
		Argument.ParmName = "HeaterCallbackThreshold"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Threshold"
			Argument.Value = 1
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 1e-3
			Argument.High = 1000		//probably need better defaults here, but they are all read from infoblocks.,
			Argument.StepSize = 1
			Argument.MinUnits = 1
			Argument.FormatStr = "%.2f"
			Argument.UnitString = " º C/min"
			Argument.FuncName = ""

		endif
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument


		Index = 3
		
		Argument.ParmName = "HeaterCallbackDelay"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Delay"
			Argument.Value = 0
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 0
			Argument.High = 1000		//probably need better defaults here, but they are all read from infoblocks.,
			Argument.StepSize = 1
			Argument.MinUnits = 1
			Argument.FormatStr = "%.2f"
			Argument.UnitString = " sec"
			Argument.FuncName = ""

		endif
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	String FuncName = "HeaterSetVarFunc"
	if (ARCheckFuncRef("ProtoSetVarFunc",FuncName))
		//Get out, we will have errors
		DoAlert 0,"Temperature stage error, device not connected? skipping Macro Step"
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif
	
	FuncRef ProtoSetVarFunc SetVarFunc=$FuncName
	FuncRef ForceCheckboxFunc CheckFunc=$"HeaterCheckBoxFunc"
	
	String ControlName
	Variable VarNum
	String VarStr, VarName
	
	//First make sure we are on, and that the FB is on
	
	CheckFunc("HeaterFeedbackOnCheck"+TabStr,1)
	CheckFunc("HeaterModeOnCheck"+TabStr,1)
	
	
	
	//then lets do the ramp rate
	ParmStruct.Argument[1].ParmName = "HeaterRampRate"		//put the parmname back
	VarStr = ""
	ControlName = ParmStruct.Argument[1].ParmName+"SetVar"+TabStr
	VarNum = ParmStruct.Argument[1].Value
	VarName = GWNS(ParmStruct.Argument[1].ParmName)+"[%"+ParmStruct.Argument[1].ParmName+"]"
	if (!isNaN(VarNum))		//enter Nan to not change things
		SetVarFunc(ControlName,varNum,varStr,varName)
	endif
	
	if (ParmStruct.NumParms > 2)		//if they have an old module, it did not have these 2 parms, so don't run them
	//They don't have the information.
		//Then the threshold
		//we have to do this by hand, because the heater is slow, we can't push and pop
		//Values, we have to just set them.
		ParmStruct.Argument[2].ParmName = "HeaterCallbackThreshold"
		if (!IsNan(ParmStruct.Argument[2].Value))
			PV(ParmStruct.Argument[2].ParmName,ParmStruct.Argument[2].Value)
		endif
		
		//Then the delay
		//we have to do this by hand, because the heater is slow, we can't push and pop
		//Values, we have to just set them.
		ParmStruct.Argument[3].ParmName = "HeaterCallbackDelay"
		if (!IsNan(ParmStruct.Argument[3].Value))
			PV(ParmStruct.Argument[3].ParmName,ParmStruct.Argument[3].Value)
		endif
	endif

	//then the setpoint
	ParmStruct.Argument[0].ParmName = "HeaterTargetTemp"
	VarStr = ""
	ControlName = ParmStruct.Argument[0].ParmName+"SetVar"+TabStr
	VarNum = ReplaceNaN(ParmStruct.Argument[0].Value,GV(ParmStruct.Argument[0].ParmName))
	VarName = GWNS(ParmStruct.Argument[0].ParmName)+"[%"+ParmStruct.Argument[0].ParmName+"]"
//	if (IsNan(VarNum))
//		VarNum = GV(ParmStruct.Argument[0].ParmName)
//	endif
	
	if (!IsNaN(VarNum))
		SetVarFunc(ControlName,varNum,varStr,varName)
	else
		//then we need to re-arm the callback
		Execute/Q/Z "HeaterCallbackFunc(1)"		//Execute incase the Heater code is not loaded
	endif

	//I think we are all set now.	
	
	return(output)
End //HeaterModule


Function/S VFMModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Variable TabNum = ARPanelTabNumLookup("VFMPanel")
	String TabStr = "_"+num2str(TabNum)

	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable FieldIndex = 0
	Variable RampIndex = 1
	Variable ThreshIndex = 2
	Variable DelayIndex = 3
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "VFM"
		ParmStruct.Pict = "VFM"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "VFM"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "VFM,MFM,"
		ParmStruct.Requires = "VFM"
		ParmStruct.help = "This module will run the VFM stage to a give setpoint, and then move to the next step.\rIt will only operate in Feedback mode.\rEnter NaN for TargetField, or RampRate to not change them."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = FieldIndex
		
		Argument.ParmName = "VFMTargetField"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Target Field"
			Argument.Value = -1200
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = -3250
			Argument.High = 2250
			Argument.StepSize = 100
			Argument.MinUnits = 1
			Argument.FormatStr = "%.1f"
			Argument.UnitString = " G"
			Argument.FuncName = ""

		endif
		
		Argument.ParmName = "ModuleParm"+num2str(Index)		// we will have to do this by hand
		//since we don't want the parm to go back after we get to the setpoint....
		ParmStruct.Argument[Index] = Argument


		Index = RampIndex
		
		Argument.ParmName = "VFMRampRate"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Ramp Rate"
			Argument.Value = 500
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 0
			Argument.High = 10000		//probably need better defaults here, but they are all read from infoblocks.,
			Argument.StepSize = 50
			Argument.MinUnits = 1
			Argument.FormatStr = "%.1f"
			Argument.UnitString = " G/min"
			Argument.FuncName = ""

		endif
		Argument.ParmName = "ModuleParm"+num2str(index)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = ThreshIndex
		
		Argument.ParmName = "VFMErrorTol"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Error Tolerance"
			Argument.Value = 55
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 1
			Argument.High = 55		//probably need better defaults here, but they are all read from infoblocks.,
			Argument.StepSize = 1
			Argument.MinUnits = 1
			Argument.FormatStr = "± %.1f"
			Argument.UnitString = " G"
			Argument.FuncName = ""

		endif
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument


		Index = DelayIndex
		
		Argument.ParmName = "VFMCallbackDelay"		//This only exists if the heater is loaded....
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		if (!IsNan(GetValue(Argument.ParmName,"Value",0)))		//see if it is a parm.
			ARMacroVarWave2Arg(Argument)
		else
			Argument.Title = "Delay"
			Argument.Value = 0
			Argument.ColumnLabel = "Value"
			Argument.StrValue = ""
			Argument.StrList = ""
			Argument.Units = 1
			Argument.Low = 0
			Argument.High = 1000
			Argument.StepSize = 1
			Argument.MinUnits = 1
			Argument.FormatStr = "%.2f"
			Argument.UnitString = " sec"
			Argument.FuncName = ""

		endif
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	String FuncName = "VFMSetVarFunc"
	if (ARCheckFuncRef("ProtoSetVarFunc",FuncName))
		//Get out, we will have errors
		DoAlert 0,"VFM stage error, device not connected? skipping Macro Step"
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif
	
	FuncRef ProtoSetVarFunc SetVarFunc=$FuncName
	FuncRef ForceCheckboxFunc CheckFunc=$"VFMCheckboxFunc"
	
	String ControlName
	Variable VarNum
	String VarStr, VarName
	
	//First make sure we are on, and that the FB is on
	
	CheckFunc("VFMFeedbackOnCheck"+TabStr,1)
	
	
	//then lets do the ramp rate
	ParmStruct.Argument[RampIndex].ParmName = "VFMRampRate"		//put the parmname back
	VarStr = ""
	ControlName = ParmStruct.Argument[RampIndex].ParmName+"SetVar"+TabStr
	VarNum = ParmStruct.Argument[RampIndex].Value
	VarName = GWNS(ParmStruct.Argument[RampIndex].ParmName)+"[%"+ParmStruct.Argument[RampIndex].ParmName+"]"
	if (!isNaN(VarNum))		//enter Nan to not change things
		SetVarFunc(ControlName,varNum,varStr,varName)
	endif
	

	ParmStruct.Argument[ThreshIndex].ParmName = "VFMErrorTol"
	if (!IsNan(ParmStruct.Argument[ThreshIndex].Value))
		PV(ParmStruct.Argument[ThreshIndex].ParmName,ParmStruct.Argument[ThreshIndex].Value)
	endif
	
	//Then the delay
	//we have to do this by hand, because the heater is slow, we can't push and pop
	//Values, we have to just set them.
	ParmStruct.Argument[DelayIndex].ParmName = "VFMCallbackDelay"
	if (!IsNan(ParmStruct.Argument[DelayIndex].Value))
		PV(ParmStruct.Argument[DelayIndex].ParmName,ParmStruct.Argument[DelayIndex].Value)
	endif

	//then the setpoint
	ParmStruct.Argument[FieldIndex].ParmName = "VFMTargetField"
	VarStr = ""
	ControlName = ParmStruct.Argument[FieldIndex].ParmName+"SetVar"+TabStr
	VarNum = ParmStruct.Argument[FieldIndex].Value
	VarName = GWNS(ParmStruct.Argument[FieldIndex].ParmName)+"[%"+ParmStruct.Argument[FieldIndex].ParmName+"]"
	if (!IsNaN(VarNum))
		SetVarFunc(ControlName,varNum,varStr,varName)
	endif
	
//	PV("MacroIsRunning",0)
//	VFMBackground()		//make this update, to try and get it from miss firing up front
	CheckFunc("VFMModeOnCheck"+TabStr,1)
	return(output)
End //VFMModule

Function/S StopModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Stop!!!"
		ParmStruct.Pict = "StopButton"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "Stop"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Stop,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module is just like clicking on a stop or Withdraw button"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	DoScanFunc("StopScan_0")
	
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //StopModule


Function/S ForceMapModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index = 0
	Variable FrameIndex = 0
	Variable FirstFrameIndex = 1
	Variable PointIndex = 2
	Variable LineIndex = 3
	Variable UseSizeIndex = 4
	Variable SizeIndex = 5
	Variable UseXOffIndex = 6
	Variable XOffIndex = 7
	Variable UseYOffIndex = 8
	Variable YOffIndex = 9
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Force Map"
		ParmStruct.Pict = "ForceMap"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "ForceDone"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Scan,Image,Force,ForceMap,"
		ParmStruct.Requires = ""		//works on all systems.
		//ParmStruct.help = "This will do a Force Map.  If a \"use checkbox\" is turned off, the parmeter to the right will not be applied to the Map.\rSo the Map will use whatever value is currently entered in the main interface for that parameter."
		ParmStruct.help = "This will do a Force Map.\rThe Map will use whatever value is currently entered in the main interface."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = FirstFrameIndex
		
		//which axis
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Start 1st frame:"
		Argument.StrList = "Scan Down;Scan Up;Toggle;"
		Argument.StrValue = "Toggle"
		Argument.Value = 3
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument


		Index = FrameIndex
		//Number of Frames
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Number Of Frames"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = "ModuleSetVarFunc"
		Argument.UnitString = ""
		Argument.FormatStr = "%.0f"
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 10
		Argument.StepSize = 1
		
		ParmStruct.Argument[Index] = Argument
		
		
		
		Index = UseSizeIndex
		//Use Scan Size
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Scan Size"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = SizeIndex
		
		Argument.ParmName = "ScanSize"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = UseXOffIndex
		//Use X offset
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this X Offset"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = XOffIndex
		
		Argument.ParmName = "XOffset"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		ParmStruct.Argument[Index] = Argument
		
		Index = UseYOffIndex
		//Use Y offset
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Y Offset"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = YOffIndex
		
		Argument.ParmName = "YOffset"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		ParmStruct.Argument[Index] = Argument
		
		Index = PointIndex
		
		Argument.ParmName = "FMapScanPoints"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		ParmStruct.Argument[Index] = Argument
		
		
		Index = LineIndex
		
		Argument.ParmName = "FMapScanLines"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		ParmStruct.Argument[Index] = Argument
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	


	String DataFolder = GetDF("Macro")
	Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif
	Variable Counter = ReplaceNaN(NumberByKey("Count", MacroData[Index],cMacroKey0,cMacroSep0,0),0)
//	if (IsNan(Counter))
//		Counter = 0
//	endif
	Variable CounterMem = Counter
	if (Counter+1 >= round(ParmStruct.Argument[FrameIndex].Value))
		//OK, 
		Counter = -1		//reset the counter, we are done with this loop.
//		Execute/P/Q/Z "PV(\"LastScan\",1)"
//		ParmStruct.CallbackName = "ForceDone"
//		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
//		CurrentMacro[Index][1] = ARMacroStruct2String(ParmStruct)
		PV("MacroNextStep",Index+1)//Next Time in, we are moving on.
		Execute/P/Q/Z "ARCheckFunc(\"FMapContinuousBox_4\",0)"		//make sure continuous is turned off.
	else
//		ParmStruct.CallbackName = "ImageScan"
//		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
//		CurrentMacro[Index][1] = ARMacroStruct2String(ParmStruct)
		PV("MacroNextStep",Index)		//move the counter back 1, so we come back into this module
		ARCheckFunc("FMapContinuousBox_4",1)		//make sure continuous is turned on.
	
	endif
	MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)


	String CtrlName = "FMap_4"
	StrSwitch (ParmStruct.Argument[FirstFrameIndex].StrValue)
		case "Scan Up":
			CtrlName = "Up"+CtrlName
			break

		case "Scan Down":
			CtrlName = "Down"+CtrlName
			break
			
		case "Toggle":
			CtrlName = "Do"+CtrlName
			break

	endswitch
	if (CounterMem == 0)
		FMapButtonFunc(CtrlName)
	endif


	
	return(output)
End //ForceMapModule


Function/S RTInvolsModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable SegmentIndex = 2
	Variable KappaIndex = 3
	Variable HighIndex = 4
	Variable LowIndex = 5
	Variable SkipIndex = 1
	Variable DataIndex = 0
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Invols"
		ParmStruct.Pict = "RTInvols"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 6
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,Calibration,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will fit the contact region of the currently collected RealTime force plot to obtain the Invols"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = DataIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Data Type"
		Argument.StrList = "Deflection;Amplitude;"//Amplitude2;"
		Argument.StrValue = "Deflection"
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
	
		Index = SkipIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument


		Index = SegmentIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "PopUp"
		Argument.ColumnLabel = ""
		Argument.Title = "Segment:"
		Argument.StrList = "Extend;Retract;"
		Argument.StrValue = "Extend"
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument
	
	
	
		Index = KappaIndex
		
		Argument.ParmName = "KappaFactor"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		
		ParmStruct.Argument[Index] = Argument



		Index = HighIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "High Fraction"
		argument.Value = .85
		Argument.StrValue = ""
		argument.StrList = ""
		Argument.Units = 1
		Argument.Low = .1
		Argument.High = .999999999
		Argument.StepSize = .05
		Argument.MinUnits = 1
		Argument.FormatStr = "%.4f"
		Argument.UnitString = ""
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = LowIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Low Fraction"
		argument.Value = .15
		Argument.StrValue = ""
		argument.StrList = ""
		Argument.Units = 1
		Argument.Low = .000000000001
		Argument.High = .9
		Argument.StepSize = .05
		Argument.MinUnits = 1
		Argument.FormatStr = "%.4f"
		Argument.UnitString = ""
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//do we use ZSensor or Raw?
	
	String ForceList = GTS("ForceSaveList")
	String InvolsStr = "Invols"
	
	String DataFolder = GetDF("Force")
	StrSwitch (ParmStruct.Argument[DataIndex].StrValue)
		case "Deflection":
			if (WhichListItem("Deflection",ForceList,";",0,0) < 0)
				ARPrint("Don't Have "+ParmStruct.Argument[DataIndex].StrValue+" for Invols","Error")
				execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
				return("")
			endif
			Wave DataVolts = $DataFolder+"DeflVolts"
			break
			
		case "Amplitude":
			InvolsStr = "AmpInvols"
			if (WhichListItem("Amplitude",ForceList,";",0,0) < 0)
				if (WhichListItem("Amplitude1",ForceList,";",0,0) < 0)
					ARPrint("Don't Have "+ParmStruct.Argument[DataIndex].StrValue+" for Invols","Error")
					execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
					return("")
				else
					Wave DataVolts = $DataFolder+"Amp1Volts"
				endif
			else
				Wave DataVolts = $DataFolder+"AmpVolts"
			endif
			break
			
		case "Amplitude2":
			InvolsStr = "Amp2Invols"
			if (WhichListItem("Amplitude2",ForceList,";",0,0) < 0)
				ARPrint("Don't Have "+ParmStruct.Argument[DataIndex].StrValue+" for Invols","Error")
				execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
				return("")
			endif
			Wave DataVolts = $DataFolder+"Amp2Volts"
			break
			
	endswitch
	
	
	
	Wave Raw = $DataFolder+"RawZSensor"
	String NoteStr = Note(Raw)
	String Indexes = StringByKey("Indexes",NoteStr,":","\r",0)
	String Directions = StringByKey("Direction",NoteStr,":","\r",0)
	
	Variable/C IndexVar
	Variable StartIndex, StopIndex
	Variable DataRange, DataLow, DataHigh, Low, High, TempVar0,TempVar1,TempVar2,TempVar3
	
	
	IndexVar = ARWhichForceIndexes(Indexes,Directions,ParmStruct.Argument[SegmentIndex].StrValue)
	
	StartIndex = Real(IndexVar)		//Start and Stop of segment
	StopIndex = Imag(IndexVar)
	
	
	
	
	WaveStats/Q/R=[StartIndex,StopIndex] DataVolts
	DataLow = V_Min
	DataHigh = V_max
	DataRange = DataHigh-Datalow
	
	Low = DataRange*ParmStruct.Argument[LowIndex].Value+DataLow
	High = DataRange*ParmStruct.Argument[HighIndex].Value+DataLow
	
	
	FindLevel/B=5/P/Q/R=[StartIndex,StopIndex] DataVolts,Low
	if (V_Flag)
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif
	TempVar0 = V_LevelX
	
	
	FindLevel/B=5/P/Q/R=[StartIndex,StopIndex] DataVolts,High
	if (V_Flag)
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif
	TempVar1 = V_LevelX
	
	
	StartIndex = Min(TempVar0,TempVar1)
	StopIndex = max(TempVar0,TempVar1)
	
	
	DoSensCalc(InvolsStr,StartIndex,StopIndex)
	//This module, all the parms are standard
	
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //RTInvolsModule


Function/S ZeroPDModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Zero Photo Diode"
		ParmStruct.Pict = "ZeroPD"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "PDMotor"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Deflection,PhotoDiode,Cypher,"
		ParmStruct.Requires = "Cypher"		//works only on cypher
		ParmStruct.help = "This will zero the deflection and lateral."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	if (Exists("ZeroPD"))
		Execute/Q "ZeroPD()"		//wrap it in an execute, since this can compile without the MotorControl.ipf
	else
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"	
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ZeroPDModule


Function/S PauseForUserModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "PauseForUser"
		ParmStruct.Pict = "Pause"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Pause,User,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will bring up a panel, with a message for the user\rIt will then wait for the user to click OK to continue the macro."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		
		Argument.ParmName = "ModuleParm0"
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.Value = 0
		Argument.StrValue = "Make your adjustments and then click continue"
		Argument.StrList = ""
		Argument.Units = 0
		Argument.Low = 0
		Argument.High = 0
		Argument.StepSize = 0
		Argument.MinUnits = 0
		Argument.UnitString = ""
		Argument.FuncName = ""
		Argument.FormatStr = ""


		
		//Then Hijack with the values we want.
		Argument.Title = "Message to user"
		
		
		ParmStruct.Argument[0] = Argument

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	
	String GraphStr = "PauseForUserPanel"
	
	
	//if it comes back in as a buttonfunc, it will be:
	if (StringMatch(ParmStr,"UserOKButton"))
		execute/P/Q/Z "ARCallbackFunc(\"None\")"
		DoWindow/K $GraphStr
		return(output)
	elseif (StringMatch(ParmStr,"UserCancelButton"))
		DoWindow/K $GraphStr
		Struct WMButtonAction ButtonStruct
		ButtonStruct.Win = "MacroBuilderPanel"
		ButtonStruct.EventCode = 2
		ButtonStruct.EventMod = 0
		ButtonStruct.Ctrlname = "CurrentModuleStopButton"
		MacroButtonFunc(ButtonStruct)
		return(output)
	endif
	
	
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	DoWindow/K $GraphStr
	
	Struct ARWindowStruct WindowStruct
	WindowStructMouseInit(WindowStruct,GraphStr)
	WindowStruct.KillFlag = 2		//Thats right, KILL=2

	Variable WasThere = ARSafeNewWindow(WindowStruct)
	
	
	
	
	ARMessage(ParmStruct.Argument[0].StrValue,GraphStr=GraphStr,DoPauseForUser=0,FontSize=27,ShowAtMouse=1)
	
	MakeButton(GraphStr,"UserOKButton","Continue",80,20,20,40,GetFuncName(),0,Help="Click to continue Macro")

	MakeButton(GraphStr,"UserCancelButton","Abort Macro",100,20,120,40,GetFuncName(),0,Help="Click to Stop Macro")
	
	GetWindow $GraphStr,WSize
	MoveWindow/W=$GraphStr V_Left,V_Top,V_Right,V_Bottom+30
	ARDrawRect(GraphStr,65535,00,0)
	
	
	
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //PauseForUserModule


Function/S MakeWaveModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable WaveSizeIndex = 0
	Variable WaveNameIndex = 1
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Make Wave"
		ParmStruct.Pict = "Wave"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Make,Wave,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will make a single precision wave, clear its contents and make it the desired number of points"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = WaveSizeIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = 67093750*3		//I have no idea where the limit really is.
		Argument.MinUnits = 1
		Argument.StepSize = 32
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Size of Wave"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		

		Index = WaveNameIndex
		Argument.Type = "String"
		Argument.Title = "WavePath"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "root:StoredValuesWave"
		ParmStruct.Argument[Index] = Argument

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	Wave StoredValues = InitOrDefaultWave(ParmStruct.Argument[WaveNameIndex].StrValue,0)
	FastOp StoredValues = (0)
	Redimension/N=(ParmStruct.Argument[WaveSizeIndex].Value) StoredValues
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //MakeWaveModule


Function/S ExtractLayerModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable TopIndex = 0
	Variable SkipIndex = 1
	Variable Index
	Variable NapIndex = 2
	Variable ChannelIndex = 3
	Variable TraceIndex = 4
	Variable ModIndex = 5
	

	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Extract Layer"
		ParmStruct.Pict = "ExtractLayer"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 6
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Layer,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and extract the named layer into the wave root:Images:LayerData\rIf the checkbox is turned on, it will work on whatever is being displayed\rOtherwise it will search for the first layer that matches your other arguments."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = TopIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "CheckBox"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = 0
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Use Current Layer"
		Argument.FuncName = ""
		
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
		
		
		Index = NapIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Any;Nap;Map;None;"
		Argument.StrValue = "Any"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Channel Prefix:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = ChannelIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "Height"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Channel Name"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = TraceIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Any;Trace;Retrace;"
		Argument.StrValue = "Any"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Trace: "
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = ModIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "None;"+MakeValueStringList(9,0)+"Last;"
		Argument.StrValue = "None"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Mod Layer: "
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument	
		
		
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	//String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	
	
//	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*",";","WIN:1"),";")
//	String ImageFolder, ImageName
//	Variable Layer
//	GetGraphData(GraphStr,ImageFolder,ImageName,Layer)
//	Wave ImageWave = $ImageFolder+ImageName
	
	
	String ChannelName = ""
	String ChannelList = GetDimLabels(ImageWave,2)
	String MatchStr = ""
	StrSwitch (ParmStruct.Argument[NapIndex].StrValue)
		case "Any":
			MatchStr += "*"
			break
		
		case "Nap":
		case "Map":
			MatchStr += ParmStruct.Argument[NapIndex].StrValue
			break
		
		case "None":
			//Do nothing
			break
			
	endswitch
	
	MatchStr += ParmStruct.Argument[ChannelIndex].StrValue
	Variable DoubleStar = 0
	String ModStr = ParmStruct.Argument[ModIndex].StrValue
	
	
	StrSwitch (ParmStruct.Argument[TraceIndex].StrValue)
		case "Any":
			MatchStr += "*"
			if (StringMatch(ModStr,"Last") || StringMatch(ModStr,"None"))
				DoubleStar = 1		//special case
			else
				MatchStr += "Mod"+ModStr
			endif
			break
			
		case "Trace":
		case "Retrace":
			MatchStr += ParmStruct.Argument[TraceIndex].StrValue
			if (StringMatch(ModStr,"Last") || StringMatch(ModStr,"None"))
				MatchStr += "*"
			else
				MatchStr += "Mod"+ModStr
			endif
			break
			
	endswitch
	
	
	String ChannelOps = ListMatch(ChannelList,MatchStr,";")
	if (DoubleStar)
		if (StringMatch(ModStr,"Last"))
			ChannelOps = ListMatch(ChannelOps,"*Mod*",";")
		else		//none
			ChannelOps = ListMatch(ChannelOps,"!*Mod*",";")
		endif
	endif

	if (ParmStruct.Argument[TopIndex].Value)
		Index = ImageParms.Layer
	else
		ImageParms.Layer = Str2num(ParmStruct.Argument[ChannelIndex].StrValue)
		if (!IsNan(ImageParms.Layer))
			Index = ImageParms.Layer
		elseif (ItemsInList(ChannelOps))
			Index = WhichListItem(StringFromList(0,ChannelOps,";"),ChannelList,";",0,0)
		endif
	endif
	
	if (Index >= 0)
		GoToData("Images")
		ExtractLayerNum(ImageWave,Index)
	else
		ARPrint("can not find layer: "+MatchStr+" In "+GetWavesDataFolder(ImageWave,2),"Error")
	endif

	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ExtractLayerModule


Function/S AbortModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr,"Info*"))
		ParmStruct.Name = "Abort"
		ParmStruct.Pict = "Abort"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Abort,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will Stop the macro from continuing"
		if (StringMatch(ParmStr,cMacroShort+"*"))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	
//	Execute/P/Q/Z "PV(\"MacroIsRunning\",0)"
//	Execute/P/Q/Z "GhostMacroBuilderPanel()"
	Struct WMCheckBoxAction CheckStruct
	CheckStruct.Win = "MacroBuilderPanel"
	CheckStruct.EventCode = 2
	CheckStruct.Checked = 0
	CheckStruct.Ctrlname = "CurrentModuleRunCheck_2"
	MacroCheckFunc(CheckStruct)
	//Do not return the callback, so that it does not keep things running.
	
	return(output)
	
End //AbortModule


Function/S ForceRampSModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Force Ramp Simple"
		ParmStruct.Pict = "Force1"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "FRampS"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,ForceRampSimple,"
		ParmStruct.Requires = "ForceRampSimple"		//works on all systems.
		ParmStruct.help = "This module will do a single Force Ramp\rIt just uses the standard parameters"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	Execute/P/Q/Z "RunForceRamp();PlotForceRamp();"
	if (V_Flag)
		ARPrint("Can not find Force Ramp code to run, please load the user function","Error")
	endif
	
	
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ForceRampSModule


Function/S EngageModule(ParmStr)	//this is used for CTFC engages and Macro stuff
	String ParmStr			//try not to do random things that might break the Macro stuff
					//but if that is too hard then we should just make another function for CTFC engages	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Struct ARImagingModeStruct ImagingModeParms
	Struct ARFeedbackStruct FB
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))	//if this is info it just comes in and initializes the structure
		ParmStruct.Name = "Engage"
		ParmStruct.Pict = "Engage"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = GetFuncName()//This one will use its own Callback, that is will create.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Engage,CTFCRamp,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This actually does a CTFC, ramping the Z open loop to reach the trigger point.\rThe Trigger Channel / Trigger point are determined from your image mode & setpoint.  Use a trigger point of Nan to use the value in the main software.\rRampRate is the rate at which Z is ramped.\rDelay is a time delay until the next step."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		ARGetImagingMode(ImagingModeParms)
		
		Argument.ParmName = "ModuleParm0"
		Argument.Title = "Imaging Mode"
		Argument.Type = "Popup"
		Argument.Value = Nan
		Argument.ColumnLabel = ""
		Argument.StrValue = ImagingModeParms.ImagingModeName
		Argument.StrList = ImageModeList()
		Argument.Units = Nan
		Argument.Low = Nan
		Argument.High = Nan
		Argument.StepSize = Nan
		Argument.MinUnits = Nan
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""		//we will need a function here to deal with swapping the setpoint.
		
		ParmStruct.Argument[0] = Argument
		
		
		
		Argument.ParmName = "ModuleParm1"
		Argument.Title = "Setpoint"
		Argument.Type = "Value"
		Argument.Value = ImagingModeParms.Feedback[0].Setpoint
		Argument.ColumnLabel = ""
		Argument.StrValue = ""
		Argument.StrList = ""
		Argument.Units = GVU(ImagingModeParms.SetpointParm)
		Argument.Low = GVL(ImagingModeParms.SetpointParm)
		Argument.High = GVH(ImagingModeParms.SetpointParm)
		Argument.StepSize = GVS(ImagingModeParms.SetpointParm)
		Argument.MinUnits = GVMU(ImagingModeParms.SetpointParm)
		Argument.FormatStr = GFS(ImagingModeParms.SetpointParm)
		Argument.UnitString = GUS(ImagingModeParms.SetpointParm)
		Argument.FuncName = ""
		
		ParmStruct.Argument[1] = Argument
		
		
		Argument.ParmName = "ModuleParm2"
		Argument.Title = "Ramp Rate"
		Argument.Type = "Value"
		Argument.Value = 20
		Argument.ColumnLabel = ""
		Argument.StrValue = ""
		Argument.StrList = ""
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = 300
		Argument.StepSize = 2
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3g"
		Argument.UnitString = " V/s"
		Argument.FuncName = ""
		
		ParmStruct.Argument[2] = Argument
		
		
		Argument.ParmName = "ModuleParm3"
		Argument.Title = "Delay Time"
		Argument.Type = "Value"
		Argument.Value = 1
		Argument.ColumnLabel = ""
		Argument.StrValue = ""
		Argument.StrList = ""
		Argument.Units = 1
		Argument.Low = .001
		Argument.High = 300
		Argument.StepSize = .1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3g"
		Argument.UnitString = " s"
		Argument.FuncName = ""
		
		ParmStruct.Argument[3] = Argument
		
		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	Wave MeterStatus = $GetDF("Meter")+"MeterStatus"
	Variable MeterRun = SafeGVByLabel(MeterStatus,"Run",NotThereValue=0)
	SafePVByLabel(MeterStatus,0,"Run")

	Variable ImagingMode, RampDest, TriggerPoint, IsGreater, RampVelocity, rampOffset2 = 0
	String RampChannel, TriggerChannel, Callback, Event, EventRamp, EventDwell, ErrorStr = ""

	Variable DoStart = 1, Deflection, amplitude
	Event = StringByKey("StartEvent",ParmStr,cMacrokey0,cMacroSep0,0)
	if (Strlen(Event))
		DoStart = 0
	else
		Event = cCTFCEngageStartEvent
	endif
	EventRamp = cCTFCEngageRampEvent
	EventDwell = cCTFCEngageDwellEvent
	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	ImagingMode = WhichListItem(ParmStruct.Argument[0].StrValue,ImageModeList(),";",0)
	if (ImagingMode < 0)
		Doalert 0,"error, ImagingMode: "+ParmStruct.Argument[0].StrValue+" Not Valid"
		return(output)
	endif
	Switch (ImagingMode)
		case cFMFastMapMode:
		case cACFastMapMode:
		case cFastMapMode:
			SetTuneLockin("A")
			break
			
	endswitch
	
	ARGetImagingMode(ImagingModeParms,ImagingMode=ImagingMode)
	FB = ImagingModeParms.Feedback[0]
	RampChannel = "Height"
	RampDest = 150
	TriggerPoint = ReplaceNaN(ParmStruct.Argument[1].Value,FB.Setpoint)
//	if (IsNan(TriggerPoint))
//		TriggerPoint = FB.Setpoint
//	endif
	FB.Setpoint = TriggerPoint
	FB.DynamicSetpoint = false
	TriggerChannel = FB.Input
//	String SecondaryFeedbackEvent = EventDwell
	String PrimaryFeedbackEvent = EventDwell
//	Variable RetractDist = 0
	Variable ARCZBit = 0x4
	Switch (ImagingMode)
		case cFMFastMapMode:
			FFMapSetup()		//sets up other things needed for the Feedback loop to work in this mode
			MakeFastMapViewerWaves()	//these waves need to be made if we are at this point

			rampOffset2 = -FastMapAmpVolts()*.7	//this should start the feedback at the perfect height, and leave a little for creep toward the surface
			triggerPoint = FB.Setpoint

			ARCZBit = 0		//we are going to be using the arc Z
			PrimaryFeedbackEvent = cFastMapZStartEvent	//the feedback needs to start at the same time as data acquisition and the FFM drive
			if (StringMatch(GTS("FrequencyFeedback"), "Frequency"))
				triggerChannel = "Frequency"
			else
				triggerChannel = "Dissipation"
			endif

			break
			
		case cACFastMapMode:
			FFMapSetup()		//sets up other things needed for the Feedback loop to work in this mode
			MakeFastMapViewerWaves()	//these waves need to be made if we are at this point

			rampOffset2 = -FastMapAmpVolts()*.7	//this should start the feedback at the perfect height, and leave a little for creep toward the surface
			triggerPoint = FB.Setpoint

			ARCZBit = 0		//we are going to be using the arc Z
			PrimaryFeedbackEvent = cFastMapZStartEvent	//the feedback needs to start at the same time as data acquisition and the FFM drive
			TriggerChannel = "Amplitude"	//this needs to be amplitude

			break
			
		case cFastMapMode:
			FFMapSetup()		//sets up other things needed for the Feedback loop to work in this mode
			MakeFastMapViewerWaves()
			Deflection = Td_ReadValue("DeflectionValue")	//get the current deflection
			rampOffset2 = -FastMapAmpVolts()*.7	//this should start the feedback at the perfect height, and leave a little for creep toward the surface

			FB.SetpointOffset = 0;	//we never actually use setpointoffset, so set it to 0

			triggerPoint += deflection	//just add this
			ARCZBit = 0				//we are using ARC Z
			PrimaryFeedbackEvent = cFastMapZStartEvent	//everything needs to start at the same time
			TriggerChannel = "Deflection"

			break
		
	endswitch
	
	StrSwitch (TriggerChannel)	//this mainly sets the direction of the trigger
		case "Current":
		case "Current2":
		case "Log.output":
			IsGreater = ImagingModeParms.GainSign<=0
			IsGreater = !IsGreater		//cOrcaSign?
			rampOffset2 = -20e-9/GV("ZpiezoSens")		//withdraw a little so it won't get crammed into surface while feedback is being turned on
			if ((GV("MicroscopeID") == cMicroscopeCypher) && ((GV("ARCZ") & ~0x4) == 0))
				//if you are a cypher
				//and the loop is going to be on the cypher.
				//we don't start the slow feedback loop automatically
				//in fact we don't ever start the slow loop
				//when we get our callback, we will clear that loop (that never started) and write the cypher loop.
				PrimaryFeedbackEvent = cFastMapZStartEvent	//temporary hack
			endif
			break
		
		case "Amplitude":
			IsGreater = 0
			break
			
		case "FastMapFBInput":
			IsGreater = ImagingModeParms.GainSign >= 0
			break
			
			
		case "PolyCombo.0.Output":		//virtual deflection	
			TriggerChannel = "Deflection"
			FB.Input = "Deflection"
			//Dont break
		case "Deflection":
			IsGreater = 1
			break
			
		case "Frequency":
		case "Dissipation":
			IsGreater = ImagingModeParms.GainSign >= 0
//			SecondaryFeedbackEvent = "Always"	//this should have already been set above
			//doalert 0,"No, you can not use the engage module in FM mode\rNo\rno"
			//return(output)
			break
			
		Default:
			Debugger
			break
			
	endswitch
	
	//once this callback hits, it will move to the next module step
	if (!StringMatch(ParmStruct.CallbackName,GetFuncName()))
		Callback = ParmStruct.CallbackName
	else
		Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	endif
	//Callback = "LaterEngage(\"\");"+Callback

	//this is something very custom Clint was working on for STM engage on cypher.  It seems to work there, but breaks other systems, for starters, SwapZHack swaps the Z Dac to cypher.
	if ((imagingMode == cSTMMode) && (GV("MicroscopeID") == cMicroscopeCypher))
		Wave/Z MotorGui = root:Packages:MFP3D:Main:Variables:MotorGuiVariablesWave
		RampVelocity = Min(20,SafeGVByLabel(MotorGui,"EngageApproachRate",NotThereValue=20))	//this is normally 20
		//ParmStruct.Argument[3].Value = 0		//we need to swap out the Z dac, so we can't use the CTFC events to start the loop.
	else							//if someone has set the EngageApproachRate (on a Cypher) to less than 20 it will use that number
		RampVelocity = ParmStruct.Argument[2].Value
		if (StringMatch(ParmStruct.Argument[2].UnitString,"m/s"))		//if we support distance values, convert over to V/s
			RampVelocity /= GV("ZPiezoSens")
		endif
	endif	

	//Clear our events.
	ErrorStr += num2str(td_WriteString("Event."+Event,"Clear"))+","
	ErrorStr += num2str(td_WriteString("Event."+EventRamp,"Clear"))+","
	ErrorStr += num2str(td_WriteString("Event."+EventDwell,"Clear"))+","
	ErrorStr += num2str(td_WriteString("Event."+PrimaryFeedbackEvent,"Clear"))+","
	//ErrorStr += num2str(td_WriteString("Events.Clear",Event+";"+EventRamp+";"+EventDwell+";"))+","
	
	//setup but dont start the ramp
//	wave CTFC = CTFCRamp(RampChannel,RampDest,TriggerPoint,TriggerChannel,IsGreater,RampVelocity,-rampVelocity,rampOffset2,Callback,Event,EventRamp,ParmStruct.Argument[3].Value,EventDwell)
	Wave/T CTFCParms = InitOrDefaultTextWave(GetDF("Force")+"CTFCParms",0)
	ErrorStr += ir_ReadGroup("CTFC",CTFCParms)

	Variable Distance = RampDest-td_ReadValue(RampChannel)		//how far we need to go
														//just set the wave up and write it
	CTFCParms[%RampChannel][0] = RampChannel
	CTFCParms[%RampOffset1][0] = num2str(Distance)
	CTFCParms[%RampSlope1][0] = num2str(RampVelocity)//*Sign(Distance))	//the Distance has to be positive or we have problems
	CTFCParms[%RampOffset2][0] = num2str(rampOffset2)		//withdraw the perfect distance so the feedback should just work, this number must be negative
	CTFCParms[%RampSlope2][0] = num2str(-rampVelocity*20)//*sign(distance))
	CTFCParms[%TriggerChannel1][0] = TriggerChannel
	CTFCParms[%TriggerType1][0] = "Absolute"			//we faked a relative if we needed to
	CTFCParms[%TriggerValue1][0] = num2str(TriggerPoint)
	CTFCParms[%TriggerCompare1][0] = StringFromList(IsGreater,"<=;>=;",";")
	CTFCParms[%TriggerChannel2][0] = "output.Dummy"
	CTFCParms[%TriggerType2][0] = "Absolute"
	CTFCParms[%TriggerValue2][0] = "0"
	CTFCParms[%TriggerCompare2][0] = ">="			//does not matter, just need to set to something valid, so there is no error.
	CTFCParms[%DwellTime1][0] = "0"										//but we are no longer using dwell trigger, we use a callback instead
	CTFCParms[%DwellTime2][0] = num2str(ParmStruct.Argument[3].Value)	//this needs to be non-zero so that the dwell trigger works, but we aren't using dwell trigger, using callback instead
	CTFCParms[%Callback][0] = Callback
	CTFCParms[%EventDwell][0] = eventDwell
	CTFCParms[%EventRamp][0] = EventRamp
	CTFCParms[%EventEnable][0] = Event		//this is the event that starts the CTFC

	SwapZDAC(0)		//we are doing a CTFC, so this has to be done. We have to do it before the WriteGroup because Height might not have the correct alias
	errorStr += ir_WriteGroup("CTFC",CTFCParms)		//set it up
	errorStr += ir_ReadGroup("CTFC",CTFCParms)		//read it back for debugging
	
	//adjust the FB loop to start when everything else does, this happens somewhere in the callback or callback functions
	FB.StartEvent = primaryFeedbackEvent
	FB.StopEvent = "Never"
	FB.DontSwapToBackpack = true
	
	//setup the main FB loop
	PV("ArcZ",GV("ARCz") | ARCZBit)
	ErrorStr += IR_WritePIDSloop(FB)
	Variable A
	for (A = 1;A < ImagingModeParms.FeedbackCount;A += 1)		//this just sets up the secondary loops and they should just start now
		FB = ImagingModeParms.Feedback[A]			//but we do want to turn on any other feedback loops
		FB.StartEvent = "Always"
		FB.StopEvent = "Never"
//		if (stringmatch(FB.output,"Frequency"))	//this is now done in ARGetImagingMode
//			FB.outputMin = -1000
//			FB.outputMax = 1000
//		endif
		ErrorStr += IR_WritePIDSloop(FB)
	endfor

	//deal with GUI
	ARManageRunning("Engage",1)		//make sure other things know we are engaged.
	UpdateAllControls("SimpleEngageButton",cWithdrawButtonTitle,"StopEngageButton","DoScanFunc",DropEnd=2,Help=cWithdrawTT)
	
	if (!GV("ScanStatus"))
		ARStatus(1,"Engaged")
	endif
	MeterStatus[%EngageOn][0] = 15															//this gives the feedback time to extend the piezo
	if (ImagingMode == cSTMMode)
		ToggleSTM(1)
	else
		MasterARGhostFunc("OrcaGainSetVar_*;OrcaGain2SetVar_*;","")
	endif

	//GO!
//print ir_ReadValue("Cypher.LockinA.0.Filter.Freq")
	if (DoStart)
		ErrorStr += ir_WriteString("Event."+Event,"Once")
	endif
	if (MeterRun)
		SafePVByLabel(MeterStatus,MeterRun,"Run")
		StartMeter("")
	endif
	ARReportError(errorStr)
	return(output)
End //EngageModule

Function/S DelayModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Delay"
		ParmStruct.Pict = "Timer"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = GetFuncName()		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Timer,Delay,Sleep,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will wait for a specified amount of time"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Argument.ParmName = "ModuleParm0"
		Argument.Title = "Delay Time"
		Argument.Type = "Value"
		Argument.Value = 4
		Argument.ColumnLabel = ""
		Argument.StrValue = ""
		Argument.StrList = ""
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = 24*60*60		//they can wait 1 day, reasonable arbitrary limit
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3g"
		Argument.UnitString = " s"
		Argument.FuncName = ""
		
		ParmStruct.Argument[0] = Argument

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	if (ParmStruct.Argument[0].Value < .5)
		Sleep/T ParmStruct.Argument[0].Value*60
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	else
		aru_Callback(cDeviceModuleCallback,ParmStruct.Argument[0].Value*1000,"ARCallbackFunc(\""+GetFuncName()+"\")")
	endif
	//This module, all the parms are standard, so just do a thermal.
	
	//DoThermalFunc("DoThermalButton_1")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //DelayModule


Function/S WaitForModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable FuncNameIndex = 0
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "WaitFor"
		ParmStruct.Pict = "Timer"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = ""
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "WaitFor,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will wait for a specified Callback to hit"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = FuncNameIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Title = "Callback"
		Argument.Type = "Popup"
		Argument.Value = 0
		Argument.ColumnLabel = "Description"
		Argument.StrValue = "ImageScan"
		Argument.StrList = ReplaceString("ARUserCallback",GetUserCallbackList(),"")
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3g"
		Argument.UnitString = " s"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	ParmStruct.CallbackName = ParmStruct.Argument[FuncNameIndex].StrValue
	Index = GV("MacroCurrentStep")
	String DataFolder = GetDF("Macro")
	Wave/T/Z CurrentMacro = $DataFolder+"CurrentMacro"
	CurrentMacro[Index][1] = ARMacroStruct2String(ParmStruct)
	
	return(output)
End //WaitForModule


Function/S LTAModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "LTA"
		ParmStruct.Pict = "Temperature"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "LTA"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,LTA,"
		ParmStruct.Requires = "LTA"		//works on all systems.
		ParmStruct.help = "This module will run the LTA user panel.  It does one run."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	PV("MacroIsRunning",1)		//hack it in	
	Variable error = ARExecuteControl2("StartLTA","ZThermButtonProc","Ztherm","",1,NaN,"")
	if (Error)
		ARPrint("Can not find LTA code to run, please load the user Panel","Error")
	endif
	
	
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	return(output)
End //LTAModule


Function/S LTADetrendModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "LTADetrend"
		ParmStruct.Pict = "Temperature"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "LTADt"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,LTA,detrend,"
		ParmStruct.Requires = "LTA"		//works on all systems.
		ParmStruct.help = "This module will run the LTA user panel.  It does detrend."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	Variable error = ARExecuteControl2("DetrendZThermButton","ZThermButtonProc","Ztherm","",1,NaN,"")
	if (Error)
		ARPrint("Can not find ZTherm code to run, please load the ZTherm user Panel","Error")
	endif
	
	
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //LTADetrendModule


Function/S TDDBModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "TDDB"
		ParmStruct.Pict = "TDDB"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "TDDB"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Force,TDDB,"
		ParmStruct.Requires = "TDDB"		//works on all systems.
		ParmStruct.help = "This module will run the TDDB user panel.  It does one run."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	PV("MacroIsRunning",1)		//hack it in	
	
	Variable error = ARExecuteControl2("RampTDDB","ButtonTDDBproc","TDDBPanel","",1,NaN,"")
	if (Error)
		ARPrint("Can not find TDDB code to run, please load the user Panel","Error")
	endif
	
	
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [completes all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	return(output)
End //TDDBmodule


Function ARTriangleWave(Amp,Freq,Phase,Offset,ScanTime,OutputWave)
	Variable Amp,Freq,Phase,Offset,ScanTime
	Wave OutputWave
	
	Variable nop = DimSize(OutPutWave,0)-1
	MultiThreadFixer()
	MultiThread OutputWave[] = mod(P/nop*ScanTime*Freq+Phase,1)
	MultiThread OutputWave[] = (Amp-(OutputWave[P]-0.5)*2*Amp)*(OutputWave[P] > 0.5)+OutputWave[P]*2*Amp*(OutputWave[P] <= 0.5)
	FastOp OutputWave = OutputWave+(Offset)
	
End //ARTriangleWave


Function ARSquareWaveFunc(Amp,Freq,Fraction,Offset,ScanTime,OutputWave)
	Variable Amp,Freq,Fraction,Offset,ScanTime
	Wave OutputWave


	Fraction = 1-Fraction
	Variable nop = DimSize(OutPutWave,0)-1
	MultiThreadFixer()

	MultiThread OutputWave[] = mod(P/nop*ScanTime*Freq,1)
	MultiThread OutPutWave[] = (OutPutWave[P] >= Fraction)
	FastOp OutputWave = (Amp)*OutputWave+(Offset)
	
End //ARSquareWaveFunc


Function/S InputWaveModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable ChannelAIndex = 0
	Variable WaveAIndex = 1
	Variable ChannelBIndex = 2
	Variable WaveBIndex = 3
	Variable SampleRateIndex = 7
	Variable TotalTimeIndex = 6
	Variable StartEventIndex = 4
	Variable KeepRunningEventIndex = 5
	Variable BankIndex = 8
	Variable CallbackIndex = 9
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Input Wave(s)"
		ParmStruct.Pict = "InputWave"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 10
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Input,Wave,td_,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will setup input wave(s) to run and collect data."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = ChannelAIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Channel A Name"
		Argument.FuncName = ""
	
		ParmStruct.Argument[Index] = Argument
		
		Index = WaveAIndex
		Argument.Type = "String"
		Argument.Title = "Path to Wave A"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = ChannelBIndex
		Argument.Type = "String"
		Argument.Title = "[Channel B Name]"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = WaveBIndex
		Argument.Type = "String"
		Argument.Title = "[Path to Wave B]"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = SampleRateIndex
		Argument.Title = "Sample Rate"
		Argument.Type = "Popup"
		Argument.StrList = ARSampleRateList()
		SprintF Argument.StrValue,"%.2W1PHz",2000
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = TotalTimeIndex
		Argument.Title = "Total Time"
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 10
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = .25
		Argument.High = 1000
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.2g "
		Argument.UnitString = "s"
		ParmStruct.Argument[Index] = Argument
		
		Index = StartEventIndex
		Argument.Title = "Start Event"
		Argument.Type = "Popup"
		Argument.StrList = ir_GetGroupLabels("Event")
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Always"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = KeepRunningEventIndex
		Argument.Title = "Keep Running Event"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Never"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = BankIndex
		Argument.Title = "Bank"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "0"
		Argument.StrList = "0;1;2;"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = CallbackIndex
		Argument.Type = "String"
		Argument.Title = "[Callback]"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		Argument.StrList = ""
		ParmStruct.Argument[Index] = Argument
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	ARMacroString2Struct(ParmStruct,ParmStr)
	String UserCallback = "", ErrorStr = "", Callback = ""
	Variable SampleRate, nop, HaveWaveA, HaveWaveB, IsPair, Bank, TotalTime, Deci
	String ChannelA, ChannelB, Event
	Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"
	
	
	Wave/Z WaveA = $ParmStruct.Argument[WaveAIndex].StrValue
	Wave/Z WaveB = $ParmStruct.Argument[WaveBIndex].StrValue
	ChannelA = ParmStruct.Argument[ChannelAIndex].StrValue
	ChannelB = ParmStruct.Argument[ChannelBIndex].StrValue





	
	if (Strlen(ChannelA) && !WaveExists(WaveA) && Strlen(ParmStruct.Argument[WaveAIndex].StrValue))
		Wave WaveA = InitOrDefaultWave(ParmStruct.Argument[WaveAIndex].StrValue,0)
	endif
	
	
	if (Strlen(ChannelB) && !WaveExists(WaveB) && Strlen(ParmStruct.Argument[WaveBIndex].StrValue))
		Wave WaveB = InitOrDefaultWave(ParmStruct.Argument[WaveBIndex].StrValue,0)
	endif
	
	
	
	HaveWaveA = WaveExists(WaveA) && Strlen(ChannelA)
	HaveWaveB = WaveExists(WaveB) && Strlen(ChannelB)
	IsPair = 0
	IsPair = HaveWaveA && HaveWaveB
	
	
	if (!IsPair && !HaveWaveA)		//if we don't have a pair, we assume A is the Wave.
		if (HaveWaveB)		//But we have B, so we must not have A
			Wave WaveA = WaveB			//simple shift over to use B.
			ChannelA = ChannelB
			//use probably miss entered A, so lets tell them
			ARPrint("Error, Wave pair running as a single, missing: "+ParmStruct.Argument[WaveAIndex].StrValue+" or can't read channel: "+ChannelA+"\r","Error",StackInfo=1)
		elseif (Strlen(ParmStruct.Argument[WaveAIndex].StrValue))
			Wave WaveA = InitOrDefaultWave(ParmStruct.Argument[WaveAIndex].StrValue,0)
		else
		
			ARPrint("Skipping "+GetFuncName()+", don't have either wave or channels","Error")
			execute/P/Q/Z Callback
			return(output)		//get out before trouble hits.
		endif
	endif
	
	
	Event = ParmStruct.Argument[StartEventIndex].StrValue+","
	Event += ParmStruct.Argument[KeepRunningEventIndex].StrValue
	Bank = str2num(ParmStruct.Argument[BankIndex].StrValue)
	TotalTime = ReplaceNaN(ParmStruct.Argument[TotalTimeIndex].Value,rightx(WaveA))
//	if (Isnan(TotalTime))
//		TotalTime = rightx(WaveA)
//	endif
	SampleRate = UnitFactor(ParmStruct.Argument[SampleRateIndex].StrValue,1,"")*str2num(ParmStruct.Argument[SampleRateIndex].StrValue)
	UserCallback = ParmStruct.Argument[CallBackIndex].StrValue
	nop = SampleRate*TotalTime
	nop += (32-mod(nop,32))*(!!mod(nop,32))		//mod upwards
	Deci = ARGetDeci(SampleRate)
	ErrorStr += num2str(td_StopInWaveBank(Bank))+","
	if (IsPair)
		Redimension/N=(nop) WaveA, WaveB
		ErrorStr += IR_XSetInWavePair(Bank,Event,ChannelA,waveA,ChannelB,WaveB,UserCallback,Deci)
	else
		Redimension/N=(nop) WaveA
		ErrorStr += IR_XSetInWave(Bank,Event,ChannelA,waveA,UserCallback,Deci)
	endif
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //InputWaveModule


Function/S OutputWaveModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable ChannelAIndex = 0
	Variable WaveAIndex = 1
	Variable ChannelBIndex = 2
	Variable WaveBIndex = 3
	Variable StartEventIndex = 4
	Variable KeepRunningEventIndex = 5

	Variable TotalTimeIndex = 6
	Variable BankIndex = 8
	Variable CallbackIndex = 9
	Variable DeciSignIndex = 7
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Output Wave(s)"
		ParmStruct.Pict = "OutputWave"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 10
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Output,Wave,td_,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will setup Output wave(s) to run and drive things."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = ChannelAIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Output A Name"
		Argument.FuncName = ""
	
		ParmStruct.Argument[Index] = Argument
		
		Index = WaveAIndex
		Argument.Type = "String"
		Argument.Title = "Path to Wave A"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = ChannelBIndex
		Argument.Type = "String"
		Argument.Title = "[Output B Name]"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = WaveBIndex
		Argument.Type = "String"
		Argument.Title = "[Path to Wave B]"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = StartEventIndex
		Argument.Title = "Start Event"
		Argument.Type = "Popup"
		Argument.StrList = ir_GetGroupLabels("Event")
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Always"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = KeepRunningEventIndex
		Argument.Title = "Keep Running Event"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Never"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = BankIndex
		Argument.Title = "Bank"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "0"
		Argument.StrList = "0;1;2;"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = CallbackIndex
		Argument.Type = "String"
		Argument.Title = "[Callback]"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		Argument.StrList = ""
		ParmStruct.Argument[Index] = Argument
	
		Index = TotalTimeIndex
		Argument.Title = "Total Time"
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 10
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = .25
		Argument.High = 1000
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.2g "
		Argument.UnitString = "s"
		ParmStruct.Argument[Index] = Argument
		
		Index = DeciSignIndex
		Argument.Title = "Interpolation"
		Argument.Type = "Popup"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Spline"
		Argument.StrList = "Spline;Linear;"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	ARMacroString2Struct(ParmStruct,ParmStr)
	String UserCallback = "", ErrorStr = "", Callback = ""
	Variable SampleRate, nop, HaveWaveA, HaveWaveB, IsPair, Bank, TotalTime, Deci
	String ChannelA, ChannelB, Event
	Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"
	
	
	Wave/Z WaveA = $ParmStruct.Argument[WaveAIndex].StrValue
	Wave/Z WaveB = $ParmStruct.Argument[WaveBIndex].StrValue
	ChannelA = ParmStruct.Argument[ChannelAIndex].StrValue
	ChannelB = ParmStruct.Argument[ChannelBIndex].StrValue
	
	if (StringMatch(ChannelA,"Cypher.*"))
		ChannelA = ""
		ARPrint("Can not drive Cypher things yet","Info")
	endif
	if (StringMatch(ChannelB,"Cypher.*"))
		ChannelB = ""
		ARPrint("Can not drive Cypher things yet","Info")
	endif
	
	
	HaveWaveA = WaveExists(WaveA) && Strlen(ChannelA)
	HaveWaveB = WaveExists(WaveB) && Strlen(ChannelB)
	IsPair = 0
	IsPair = HaveWaveA && HaveWaveB
//	if (Strlen(ParmStruct.Argument[WaveAIndex].StrValue) && !HaveWaveA)
//		print "Can not find wave A at: "+ParmStruct.Argument[WaveAIndex].StrValue
//	endif
	if (Strlen(ParmStruct.Argument[WaveBIndex].StrValue) && !HaveWaveB)
		if (!WaveExists(WaveB))
			ARPrint("Error in "+GetFuncName()+"\tWave pair running as a single, missing: "+ParmStruct.Argument[WaveBIndex].StrValue,"Error")
		else
			ARPrint("Error in "+GetFuncName()+"\tWave pair running as a single, Empty ChannelB","Error")
		endif
	endif
	
	
	
	if (!IsPair && !HaveWaveA)		//if we don't have a pair, we assume A is the Wave.
		if (HaveWaveB)		//But we have B, so we must not have A
			//use probably miss entered A, so lets tell them
			if (!WaveExists(WaveA))
				ARPrint("Error in "+GetFuncName()+"\tWave pair running as a single, missing: "+ParmStruct.Argument[WaveAIndex].StrValue,"Error")
			else
				ARPrint("Error in "+GetFuncName()+"\tWave pair running as a single, Empty ChannelA","Error")
			endif
			Wave WaveA = WaveB			//simple shift over to use B.
			ChannelA = ChannelB
		else
			ARPrint("Skipping "+GetFuncName()+", don't have either wave or channels","Error")
			execute/P/Q/Z Callback
			return(output)		//get out before trouble hits.
		endif
	endif
		
	
	Event = ParmStruct.Argument[StartEventIndex].StrValue
	if (!StringMatch(ParmStruct.Argument[KeepRunningEventIndex].StrValue,"Never"))
		Event += ","+ParmStruct.Argument[KeepRunningEventIndex].StrValue
	endif
		
	Bank = str2num(ParmStruct.Argument[BankIndex].StrValue)
	TotalTime = ReplaceNaN(ParmStruct.Argument[TotalTimeIndex].Value,rightx(WaveA))
//	if (Isnan(TotalTime))
//		TotalTime = rightx(WaveA)
//	endif
	UserCallback = ParmStruct.Argument[CallBackIndex].StrValue
	nop = DimSize(WaveA,0)
	SampleRate = nop/TotalTime
	Deci = ARGetDeci(SampleRate)
	if (StringMatch(ParmStruct.Argument[DeciSignIndex].StrValue,"Linear"))
		Deci *= -1
	endif


	if (IsPair)
		Redimension/N=(nop) WaveB
		ErrorStr += IR_xSetOutWavePair(Bank,Event,ChannelA,waveA,ChannelB,WaveB,UserCallback,Deci)
	else
		ErrorStr += IR_xSetOutWave(Bank,Event,ChannelA,waveA,UserCallback,Deci)
	endif
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //OutputWaveModule


Function/S ARSampleRateList()


	Variable ItemsPerStep = 20
	Variable SizePerStep = 4
	Variable NumOfSteps = 8
	Variable Start
	Variable ThisStep, A
	String output = ""
	String TempStr
	Variable StepSize
	Variable nop = 1
	
	for (ThisStep = 0;ThisStep<NumOfSteps;ThisStep += 1)
		StepSize = SizePerStep^ThisStep
		Start = nop
		nop = ItemsPerStep*StepSize+Start
		for (A = Start;A < nop;A += StepSize)
			SprintF TempStr,"%.2W1PHz",cMasterSampleRate/A
			//TempStr = num2str(cMasterSampleRate/A)
			output += TempStr+";"
		endfor
		//output += "-;"
	endfor
	
	
	
	return(output)

End //ARSampleRateList

Function/S WriteStringModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable ParmNameIndex = 0
	Variable ParmValueIndex = 1
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "WriteString"
		ParmStruct.Pict = "WriteString"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Output,String,td_,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will write a string value to the controller."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = ParmNameIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Parm Name"
		Argument.FuncName = ""
	
		ParmStruct.Argument[Index] = Argument
		
		Index = ParmValueIndex
		Argument.Type = "String"
		Argument.Title = "String to Write: "
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	String ParmName = ParmStruct.Argument[ParmNameIndex].StrValue
	String Value = ParmStruct.Argument[ParmValueIndex].StrValue
	String ErrorStr = ""
	
	ErrorStr += num2str(td_WriteString(ParmName,Value))+","
	
	
	String Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //WriteStringModule


Function/S WriteValueModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable ParmNameIndex = 0
	Variable ParmValueIndex = 1
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "WriteValue"
		ParmStruct.Pict = "WriteValue"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Output,Value,td_,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will write a numerical value to the controller."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = ParmNameIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		Argument.Title = "Parm Name"
		Argument.FuncName = ""
	
		ParmStruct.Argument[Index] = Argument
		
		Index = ParmValueIndex
		Argument.Type = "Value"
		Argument.Title = "Value to Write: "
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = ""
		ParmStruct.Argument[Index] = Argument
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	String ParmName = ParmStruct.Argument[ParmNameIndex].StrValue
	Variable Value = ParmStruct.Argument[ParmValueIndex].Value
	String ErrorStr = ""
	
	ErrorStr += ir_WriteValue(ParmName,Value)
	
	
	String Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //WriteValueModule


Function/S FrictionLoopModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable CountIndex = 0
	Variable SaveIndex = 1
	Variable RateIndex = 2
	Variable DistIndex = 3

	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Friction Loop"
		ParmStruct.Pict = "FrictionLoop"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "FLoop"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Friction,Lateral,"
		ParmStruct.Requires = "FrictionLoop"
		ParmStruct.help = "This module will Run the friction loop user panel"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = CountIndex
		
		Argument.ParmName = "FLMaxCount"
		Argument.Type = "Value"
		ARMacroVarWave2Arg(Argument)
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		
		Argument.Title = "Number of loops"
		Argument.Value = 10
		Argument.Units = 1
		Argument.Low = 1
		Argument.High = 1000
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.0f "
		Argument.UnitString = ""
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = SaveIndex
		Argument.ParmName = "FLSave2Mem"
		ARMacroVarWave2Arg(Argument)
		Argument.Value = 1		//no, we don't care what the current interface's value is, if you are running FL from the macro, 
		//default to save.
		Argument.Type = "Checkbox"
		Argument.Title = "Save to Memory"
		ParmStruct.Argument[Index] = Argument
		
		
		
		Index = RateIndex
		Argument.Type = "Value"
		Argument.ParmName = "FLRate"
		ARMacroVarWave2Arg(Argument)
		Argument.Title = "Rate"
		ParmStruct.Argument[Index] = Argument
		
		
		Index = DistIndex
		Argument.Type = "Value"
		Argument.ParmName = "FLDist"
		ARMacroVarWave2Arg(Argument)
		Argument.Title = "Distance"
		ParmStruct.Argument[Index] = Argument
		
		

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	if (!Exists("MakeFLGraph"))
		OpenUserPanels("FrictionLoop")
	endif


	
	ARMacroString2Struct(ParmStruct,ParmStr)

	Execute("MakeFLGraph()")
	PV("FLCount",0)
	if (ParmStruct.Argument[CountIndex].Value == 1)
		PVU("FLValue",0)
		Execute("SetupFLDrive(\"Once\")")
		
	else
		PVU("FLValue",1)
		Execute("SetupFLDrive(\"Set\")")
	endif




	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z Callback
	
	return(output)
End //FrictionLoopModule



Function/S SetpointModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable FeedbackLoopIndex = 0
	Variable SkipIndex = 1
	Variable UseSetpointIndex = 2
	Variable SetpointIndex = 3
	Variable UseSetpointOffsetIndex = 4
	Variable SetpointOffsetIndex = 5
	Variable UseMinIndex = 6
	Variable MinIndex = 7
	Variable UseMaxIndex = 8
	Variable MaxIndex = 9
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Setpoint"
		ParmStruct.Pict = "Setpoint"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 10
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Output,Feedback,td_,Setpoint,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will adjust a running feedback loop."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = FeedbackLoopIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Height;ZSensor;XSensor;YSensor;Drive;Potential;Frequency;0;1;2;3;4;5;"
		
		if (HasBackPack())
			Argument.StrList += "Cypher0;Cypher1;Cypher2;Cypher3;"
		endif
		
		Argument.StrValue = "Height"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Feedback Loop"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = SkipIndex
		Argument.Type = "Skip"
		Argument.Value = 0
		Argument.Title = "Loop runs on Cypher\\r(Advanced)"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = UseSetpointIndex
		Argument.Title = "Use This Setpoint"
		Argument.Type = "Checkbox"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 1
		ParmStruct.Argument[Index] = Argument


		Index = SetpointIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 1
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = UseSetpointOffsetIndex
		Argument.Title = "Use This Setpoint Offset"
		Argument.Type = "Checkbox"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 0
		ParmStruct.Argument[Index] = Argument


		Index = SetpointOffsetIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 0
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
	
		Index = UseMinIndex
		Argument.Type = "Checkbox"
		Argument.Title = "Use this Minimum:"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		ParmStruct.Argument[Index] = Argument
		
		Index = MinIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = -inf
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = UseMaxIndex
		Argument.Type = "Checkbox"
		Argument.Title = "Use this Maximum:"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		ParmStruct.Argument[Index] = Argument
		
		Index = MaxIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = inf
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
		
	
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	
	ARMacroString2Struct(ParmStruct,ParmStr)


	String LoopName = ParmStruct.Argument[FeedbackLoopIndex].StrValue
	String ErrorStr = ""
	String Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"

	StrSwitch (LoopName)
		case "XSensor":
		case "YSensor":
		case "ZSensor":
			LoopName = "$"+LoopName+"Output"+LoopName[0]+"Loop"
			break
	
		case "Height":
		case "Frequency":
		case "Potential":
		case "Drive":
			LoopName = "$"+LoopName+"Loop"
			break
		
		case "0":
		case "1":
		case "2":
		case "3":
		case "4":
		case "5":
			LoopName = "PIDSLoop."+LoopName
			break

		case "Cypher0":
		case "Cypher1":
		case "Cypher2":
		case "Cypher3":
			LoopName = "Cypher.PIDSLoop."+GetEndNumStr(LoopName)
			break

	
	
		default:
			break
	endswitch
	
	
	
	
	Variable nop = ParmStruct.Argument[UseSetpointIndex].Value
	nop += ParmStruct.Argument[UseSetpointOffsetIndex].Value
	nop += ParmStruct.Argument[UseMinIndex].Value
	nop += ParmStruct.Argument[UseMaxIndex].Value
	
	Make/N=(nop)/FREE ParmWave
	
	Index = 0
	
	
	
	if (ParmStruct.Argument[UseSetpointIndex].Value)
		SetDimLabel 0,Index,$"Setpoint",ParmWave
		ParmWave[Index] = ParmStruct.Argument[SetpointIndex].Value
		Index += 1
		//ErrorStr += ir_WriteValue(LoopName+".Setpoint",ParmStruct.Argument[SetpointIndex].Value)
	endif


	if (ParmStruct.Argument[UseSetpointOffsetIndex].Value)
		SetDimLabel 0,Index,$"SetpointOffset",ParmWave
		ParmWave[Index] = ParmStruct.Argument[SetpointOffsetIndex].Value
		Index += 1
		//ErrorStr += ir_WriteValue(LoopName+".SetpointOffset",ParmStruct.Argument[SetpointOffsetIndex].Value)
	endif


	if (ParmStruct.Argument[UseMinIndex].Value)
		SetDimLabel 0,Index,$"OutputMin",ParmWave
		ParmWave[Index] = ParmStruct.Argument[MinIndex].Value
		Index += 1
		//ErrorStr += ir_WriteValue(LoopName+".OutputMin",ParmStruct.Argument[MinIndex].Value)
	endif

	if (ParmStruct.Argument[UseMaxIndex].Value)
		SetDimLabel 0,Index,$"OutputMax",ParmWave
		ParmWave[Index] = ParmStruct.Argument[MaxIndex].Value
		Index += 1
		//ErrorStr += ir_WriteValue(LoopName+".OutputMax",ParmStruct.Argument[MaxIndex].Value)
	endif

	if (Nop)
		ErrorStr += ir_WriteMany(ParmWave,ParentGroup=LoopName+".")
	endif
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //SetpointModule


Function/S FeedbackModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	String TempStr
	Variable Index = 0
	
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable FeedbackLoopIndex = 0
	Variable BankIndex = 1
	Variable StartEventIndex = 2
	Variable StopEventIndex = 3
	Variable UseSetpointIndex = 4
	Variable SetpointIndex = 5
	Variable UseMinIndex = 6
	Variable MinIndex = 7
	Variable UseMaxIndex = 8
	Variable MaxIndex = 9
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Feedback Loop"
		ParmStruct.Pict = "FeedbackLoop"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 10
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Output,Feedback,td_,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will setup feedback loop to run and drive things."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = FeedbackLoopIndex
		
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Deflection;Amplitude;ZSensor;XSensor;YSensor;Current;Drive (FM);Drive (PFM);Potential;Frequency;Frequency (FM);Frequency (PFM);"
		Argument.StrValue = "Deflection"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Feedback Loop"
		Argument.FuncName = ""
	
		ParmStruct.Argument[Index] = Argument
		
		Index = BankIndex
		Argument.Type = "Popup"
		Argument.Title = "Bank"
		Argument.StrList = "Default;"+MakeValueStringList(5,0)
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = "Default"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		
		Index = StartEventIndex
		Argument.Title = "Start Event"
		Argument.Type = "Popup"
		Argument.StrList = "Default;"+ir_GetGroupLabels("Event")
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Default"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument


		Index = StopEventIndex
		Argument.Title = "Stop Event"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = "Default"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = UseSetpointIndex
		Argument.Type = "Checkbox"
		Argument.Title = "Use this Setpoint:"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		ParmStruct.Argument[Index] = Argument
		
		Index = SetpointIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = 1
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
		

		Index = UseMinIndex
		Argument.Type = "Checkbox"
		Argument.Title = "Use this Minimum:"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		ParmStruct.Argument[Index] = Argument
		
		Index = MinIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = -inf
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = UseMaxIndex
		Argument.Type = "Checkbox"
		Argument.Title = "Use this Maximum:"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		ParmStruct.Argument[Index] = Argument
		
		Index = MaxIndex
		Argument.Title = " "
		Argument.Type = "Value"
		Argument.StrList = ""
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Value = inf
		Argument.StrValue = ""
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3f"
		Argument.UnitString = ""
		ParmStruct.Argument[Index] = Argument
		
	
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	
	ARMacroString2Struct(ParmStruct,ParmStr)


	Variable ImagingMode = GV("ImagingMode")
	String LoopName = ParmStruct.Argument[FeedbackLoopIndex].StrValue
	LoopName = ReplaceString(" ",LoopName,"");
	String ErrorStr = ""
	Struct ARFeedbackStruct FB
	String ParmString
	String Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"


	StrSwitch (LoopName)
		case "Deflection":
			ImagingMode = cContactMode
			LoopName = "Height"
			break
			
		case "Current":
			ImagingMode = cSTMMode
			LoopName = "Height"
			break
			
		case "Amplitude":
			ImagingMode = cACMode
			LoopName = "Height"
			break
			
		case "Drive(FM)":
		case "Frequency(FM)":
		case "Drive(PFM)":
		case "Frequency(PFM)":
			ImagingMode = cFMMode+Stringmatch(LoopName,"*(PFM)")
			LoopName = LoopName[0,strsearch(LoopName,"(",0)-1]
			break
			
		case "Frequency":
			ImagingMode = cACMode
			break
			
		case cFastMapLoopName:
			ImagingMode = cFastMapMode
			break

			
	endswitch

	ARGetFeedbackParms(FB,LoopName,ImagingMode=ImagingMode)
	
	
	//OK, we have our FB structure setup, now lets hijack things.
	
	
	ParmString = ParmStruct.Argument[BankIndex].StrValue
	if (!StringMatch(ParmString,"Default"))
		FB.Bank = str2num(ParmString)
	endif
	
	ParmString = ParmStruct.Argument[StartEventIndex].StrValue
	if (!StringMatch(ParmString,"Default"))
		FB.StartEvent = ParmString
	endif
	
	
	ParmString = ParmStruct.Argument[StopEventIndex].StrValue
	if (!StringMatch(ParmString,"Default"))
		FB.StopEvent = ParmString
	endif
	
	if (ParmStruct.Argument[UseSetpointIndex].Value)
		FB.Setpoint = ParmStruct.Argument[SetpointIndex].Value
		FB.DynamicSetpoint = IsNan(FB.Setpoint)
	endif
	
	if (ParmStruct.Argument[UseMinIndex].Value)
		FB.outputMin = ParmStruct.Argument[MinIndex].Value
	endif
	
	if (ParmStruct.Argument[UseMaxIndex].Value)
		FB.outputMax = ParmStruct.Argument[MaxIndex].Value
	endif
	


	ErrorStr += IR_WritePIDSloop(FB)


	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //FeedbackModule


Function/S CTFCModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index = 0
	
	
	//Local Enum
	//Enumerate all parameters indexes
	Variable RampChannelIndex = 0
	Variable MaxRampTimeIndex = 1
	Variable RetDistIndex = 2
	Variable CallbackIndex = 3
	Variable TriggerChannelIndex = 4
	Variable TriggerTypeIndex = 5
	Variable TriggerCompareIndex = 6
	Variable TriggerValueIndex = 7
	Variable DwellTime0Index = 8
	Variable DwellTime1Index = 9
	Variable StartEventIndex = 10
	Variable DwellEventIndex = 11
	
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Complex Triggered Force Curve (CTFC)"
		ParmStruct.Pict = "CTFC"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 12		//yup, had to increase the number of avilable parms for this.
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Output,Force,td_,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will setup a CTFC to run and drive things.You still need to trigger the start event to start the CTFC running."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = RampChannelIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "Output.Z"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Ramp Channel"
		Argument.FuncName = ""
	
		ParmStruct.Argument[Index] = Argument


		Index = MaxRampTimeIndex
		Argument.Type = "Value"
		Argument.Title = "Max Ramp Time"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 1
		Argument.formatstr = "%.2f "
		Argument.UnitString = "s"
		Argument.Low = 0
		ParmStruct.Argument[Index] = Argument
		

		Index = RetDistIndex
		Argument.Type = "Value"
		Argument.Title = "Retract Distace"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = -10
		Argument.formatstr = "%.2f "
		Argument.UnitString = "V"
		Argument.Low = -inf		//someone is going to ramp frequency....
		Argument.High = inf
		ParmStruct.Argument[Index] = Argument
		
		Index = CallbackIndex
		Argument.Type = "String"
		Argument.Title = "[Callback]"
		Argument.StrValue = ""
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		Index = TriggerChannelIndex
		Argument.Type = "String"
		Argument.Title = "Trigger Channel"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = "Deflection"
		ParmStruct.Argument[Index] = Argument

		Index = TriggerTypeIndex
		Argument.Type = "Popup"
		Argument.Title = "Trigger Type"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		if (!GV("TriggerType"))
			Argument.StrValue = "Relative Start"
		else
			Argument.StrValue = "Absolute"
		endif
		Argument.StrList = "Absolute;Relative Start;Relative Min;Relative Max;Relative Ramp Start;"		//would be nice to call td_GetRange(CTFC.TriggerType1") on this, but that is only active when the controller is connected.
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument

		Index = TriggerCompareIndex
		Argument.Type = "Popup"
		Argument.Title = "Trigger Slope"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = "Positive"
		Argument.StrList = "Positive;Negative;"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		
		Index = TriggerValueIndex
		Argument.Type = "Value"
		Argument.Title = "Trigger Value"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 1
		Argument.formatstr = "%.2f "
		Argument.UnitString = "V"
		Argument.Low = -inf
		Argument.High = inf
		Argument.Units = 1
		Argument.MinUnits = 1
		Argument.StepSize = .1
		ParmStruct.Argument[Index] = Argument
		

		Index = DwellTime0Index
		Argument.Type = "Value"
		Argument.Title = "Dwell Time 0"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		Argument.formatstr = "%.2f "
		Argument.UnitString = "s"
		Argument.Low = 0
		Argument.High = inf
		Argument.Units = 1
		Argument.MinUnits = 1
		Argument.StepSize = .1
		ParmStruct.Argument[Index] = Argument
		
		Index = DwellTime1Index
		Argument.Type = "Value"
		Argument.Title = "Dwell Time 1"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Value = 0
		Argument.formatstr = "%.2f "
		Argument.UnitString = "s"
		Argument.Low = 0
		Argument.High = inf
		Argument.Units = 1
		Argument.MinUnits = 1
		Argument.StepSize = .1
		ParmStruct.Argument[Index] = Argument
		
		
		Index = StartEventIndex
		Argument.Title = "Start Event"
		Argument.Type = "Popup"
		Argument.StrList = ir_GetGroupLabels("Event")
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = cDefaultCTFCStartModuleEvent
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		Index = DwellEventIndex
		Argument.Title = "Dwell Event"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.StrValue = cDefaultCTFCDwellModuleEvent
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)+1
		ParmStruct.Argument[Index] = Argument
		
		
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.

	
	ARMacroString2Struct(ParmStruct,ParmStr)


	String ErrorStr = ""
	String Callback = "ARCallbackFunc(\""+ParmStruct.CallbackName+"\");"
	String UserCallback = ""
	String TempStr
	Variable TempVar

	Struct ARCTFCParms CTFCParms
	CTFCParms.NumOfSegmentsUsed = 2
	CTFCParms.RampChannel = ParmStruct.Argument[RampChannelIndex].StrValue
	TempStr = td_GetRange(CTFCParms.RampChannel)
	TempVar = str2num(StringFromList(2,TempStr,";"))-str2num(StringFromList(1,TempStr,";"))
	CTFCParms.Ramp[0].RampDistance = TempVar
	CTFCParms.Ramp[1].RampDistance = ParmStruct.Argument[RetDistIndex].Value
	if (CTFCParms.Ramp[1].RampDistance)
		CTFCParms.Ramp[1].RampRate = CTFCParms.Ramp[1].RampDistance/ParmStruct.Argument[MaxRampTimeIndex].Value
	else
		CTFCParms.Ramp[1].RampRate = CTFCParms.Ramp[0].RampDistance/ParmStruct.Argument[MaxRampTimeIndex].Value
	endif
	CTFCParms.Ramp[0].RampRate = abs(CTFCParms.Ramp[1].RampRate)*sign(CTFCParms.Ramp[0].RampDistance)
	CTFCParms.Ramp[0].TriggerChannel = ParmStruct.Argument[TriggerChannelIndex].StrValue
	CTFCParms.Ramp[1].TriggerChannel = "output.Dummy"
	CTFCParms.Ramp[0].TriggerType = ParmStruct.Argument[TriggerTypeIndex].StrValue
	CTFCParms.Ramp[1].TriggerType = "Absolute"
	if (StringMatch(ParmStruct.Argument[TriggerCompareIndex].StrValue,"Positive"))
		TempStr = ">="
	else
		TempStr = "<="
	endif
	CTFCParms.Ramp[0].TriggerSlope = TempStr
	CTFCParms.Ramp[1].TriggerSlope = TempStr		//not being used, so just set it to something valid.
	CTFCParms.Ramp[0].TriggerValue = ParmStruct.Argument[TriggerValueIndex].Value
	CTFCParms.Ramp[1].TriggerValue = 0
	CTFCParms.Ramp[0].DwellTime = ParmStruct.Argument[DwellTime0Index].Value
	CTFCParms.Ramp[1].DwellTime = ParmStruct.Argument[DwellTime1Index].Value
	CTFCParms.TriggerDelay = 0
	UserCallback = ParmStruct.Argument[CallbackIndex].StrValue
	TempStr = ParmStruct.Argument[StartEventIndex].StrValue
//	if (StringMatch(TempStr,"Always"))
//		UserCallback += ";"+Callback+";"
//		Callback = ""
//	endif
	CTFCParms.Callback = UserCallback
	CTFCParms.DwellEvent = ParmStruct.Argument[DwellEventIndex].StrValue
	CTFCParms.StartEvent = TempStr
	CTFCParms.RampEvent = cCTFCEngageRampEvent

	ErrorStr += ir_WriteCTFC(CTFCParms)


	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z Callback
	
	ARReportError(ErrorStr)
	return(output)
End //CTFCModule



Function/S DisplayWaveModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable YWavePathIndex = 1
	Variable XWavePathIndex = 2
	Variable GraphNameIndex = 0
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Display Wave"
		ParmStruct.Pict = "Graph"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 3
		ParmStruct.Type = "Programming"
		ParmStruct.KeyWords = "Display,Wave,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will append a wave to a graph."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		
		Index = GraphNameIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "GraphName"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Name of Graph"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = YWavePathIndex
		Argument.Type = "String"
		Argument.Title = "YWavePath"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = "root:YWave"
		ParmStruct.Argument[Index] = Argument

		Index = XWavePathIndex
		Argument.Type = "String"
		Argument.Title = "[XWavePath]"
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.StrValue = "root:XWave"
		ParmStruct.Argument[Index] = Argument
		
		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	Wave/Z YWave = $ParmStruct.Argument[YWavePathIndex].StrValue
	Wave/Z XWave = $ParmStruct.Argument[XWavePathIndex].StrValue
	if (!WaveExists(YWave))
		ARPrint("Wave: "+ParmStruct.Argument[YWavePathIndex].StrValue+" Does not exist","Error")
		return(output)
	endif
	String Graphstr = ParmStruct.Argument[GraphNameIndex].StrValue
	Variable WasThere = MakeGraph(GraphStr,Parent="MarcoBuilderPanel")
	if (WasThere)
		DoWindow/F $GraphStr
	endif
	Struct ARColorStruct Color
	ARForceColorTable(ItemsInList(TraceNameList(GraphStr,";",1),";"),Color)
	Struct ARAppendStruct PlotParms
	PlotParms.LineSize = .75
	PlotParms.Red = Color.Red
	PlotParms.Green = Color.Green
	PlotParms.Blue = Color.Blue
	PlotParms.LeftAxis = "Left"
	PlotParms.BottomAxis = "Bottom"
	PlotParms.IsRight = 0
	PlotParms.IsTop = 0
	PlotParms.Mode = 0
	PlotParms.LineStyle = 0
	PlotParms.MarkerSize = 3
	PlotParms.Marker = 19
	PlotParms.MarkerThick = .5
	PlotParms.MarkerSize = 0

	ARAppendToGraph(GraphStr,1,YWave,XWave,PlotParms)
	
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //DisplayWaveModule


Function/S ForcePlotLoopModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Force Plot For Loop"
		ParmStruct.Pict = "ForceFor"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "FlowControl,Programming,ForLoop,Force,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This is the start of a for loop\rIt must always be accompanied with the EndForModule\rThis is a special for loop, in that it will step through all the force plots in memory."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	//String FPList, DataFolderList
	//GetForcePlotsList(2,FPList,DataFolderList)
	Struct ForcePlotHandle Handle
	Handle.Init(Handle)
	Variable TotalForcePlots = Handle.Count
	
	String DataFolder = GetDF("Macro")
	Variable Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif
	Variable Counter = NumberByKey("Count", MacroData[Index],cMacroKey0,cMacroSep0,0)
	Variable GoToPos = NumberByKey("End", MacroData[Index],cMacroKey0,cMacroSep0,0)
	if (IsNan(GoToPos))
		ARPrint("Unterminated for loop?","Error")
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		GoToPos = DimSize(CurrentMacro,0)-2
	endif
	if (Counter >= TotalForcePlots)
		PV("MacroNextStep",GoToPos+1)
		Counter = -1		//reset the counter, we are done with this loop.
	else
		Handle.Pointer = Counter
		Handle.ByIndex(Handle)
		DisplayForcePlots(Handle.FPName,Handle.DataFolder)
	endif
	MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)


	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ForcePlotLoopModule


Function/S ImageLoopModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable DiskIndex = 0
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Offline Image For Loop"
		ParmStruct.Pict = "ImageFor"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "FlowControl,Programming,ForLoop,ImageProcessing,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This is the start of a for loop\rIt must always be accompanied with the EndForModule\rThis is a special for loop, in that it will step through all the images in memory or on Disk."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	


		
		Index = DiskIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Disk;Memory;"
		Argument.StrValue = "Disk"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Image Source:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	String PathStr = ""
	String ImageFolder = GetDF("ImageRoot")
	Variable IsDisk = 0
	if (StringMatch(ParmStruct.Argument[DiskIndex].StrValue,"Disk"))
		IsDisk = 1
		Wave/T ListWave = $ImageFolder+"ListWave"
		//Wave BuddyWave = $ImageFolder+"ListWaveBuddy"
	else
		Wave/T ListWave = $ImageFolder+"MemListWave"
		Wave/T LoadPathWave = $ImageFolder+"LoadPathWave"
		//Wave BuddyWave = $ImageFolder+"MemListWaveBuddy"
	endif
	
	//String ImageList
	//String ImageList = Twave2strListSepEmpty(ListWave,";")
	Variable Total, DoubleJeopardy
	Total = DimSize(ListWave,0)
	//Total = ItemsInList(ImageList,";")
	
	String ImageName, SavedDataFolder
	String JHand = "ImageLoopBar"
	
	String DataFolder = GetDF("Macro")
	Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif
	Variable Counter = NumberByKey("Count", MacroData[Index],cMacroKey0,cMacroSep0,0)
//print Counter
	Variable GoToPos = NumberByKey("End", MacroData[Index],cMacroKey0,cMacroSep0,0)
	if (IsNan(GoToPos))
		ARPrint("Unterminated for loop?","Error")
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		GoToPos = DimSize(CurrentMacro,0)-2
	endif
	if (Counter >= Total)
		PV("MacroNextStep",GoToPos+1)
		Counter = -1		//reset the counter, we are done with this loop.
		DoWindow/K $JHand
	else
	
		Variable ARISLoopIndex = FindMacroLoopIndex(Index,"ARISLoop",EndIndex=GoToPos-1)
		//
		//ImageName = StringFromList(Counter,ImageList,";")
		ImageName = ListWave[Counter][0]
		if (IsDisk)
			SavedDataFolder = GetDataFolder(1)
			SetDataFolder(ImageFolder)
			Wave/Z BrowseImage = $"root:Images:Browse:"+ImageName
			DoubleJeopardy = 1
			if (WaveExists(BrowseImage))
				ImageName = LastDir(StringByKey("FilePath",Note(BrowseImage),":",";",0))
				if (!Strlen(ImageName))
					ImageName = ListWave[Counter][0]+".ibw"
				else
					DoubleJeopardy = 0
				endif
			endif

			ImageName = ARLoadImage(ImageName,HackLevel25=1+!DoubleJeopardy)
			if (!Strlen(ImageName) &&  DoubleJeopardy)
				ImageName = ARLoadImage(ListWave[Counter]+".ARDF",HackLevel25=2)
			endif
			SetDataFolder(SavedDataFolder)
			PathInfo $cOfflinePName
			PathStr = S_Path
		else
			PathStr = LoadPathWave[Counter][0]
		endif
		Wave/Z ImageWave = $ImageFolder+ImageName
		//see if we have a nested ARIS loop
		if (ARISLoopIndex > 0)
			MacroBuilderSetARISImageName(ImageName,ARISLoopIndex)
		endif

        //edited code to EXPORT ARDFs
        print(ImageName)
		ExportGivenARDF(ImageName) 						//Export the ARDF
        // end itnserted code


		Struct MacroImageStruct ImageParms
		Wave/Z ImageParms.ImageWave = ImageWave
		ImageParms.ImageName = NameOfWave(ImageWave)
		ImageParms.Layer = 0
		ImageParms.LoopCounter = Counter
		ImageParms.LoopLimit[0] = 0
		ImageParms.LoopLimit[1] = Total
		ImageParms.LoadPathStr = PathStr
		Wave/Z ImageParms.MaskWave = $GetDF("ImageDataRoot")+ImageName+"Mask"+num2Str(ImageParms.Layer)
		if (!WaveExists(ImageParms.MaskWave) && WaveExists(ImageParms.ImageWave))
			Make/N=(DimSize(ImageParms.ImageWave,0),DimSize(ImageParms.ImageWave,1))/B/U $GetDF("ImageDataRoot")+ImageName+"Mask"+num2Str(ImageParms.Layer)
			Wave ImageParms.MaskWave = $GetDF("ImageDataRoot")+ImageName+"Mask"+num2Str(ImageParms.Layer)
			FastOp ImageParms.MaskWave = (1)
			CopyScales/I ImageParms.ImageWave,ImageParms.MaskWave
		endif
		ImageParms.IsWrite = 1
		MacroImageInfo(ImageParms,Index=Index)


//		if (WaveExists(ImageWave))
//			DisplayImage(ImageWave)								//display the image
//		endif
		if (!IsWindow(JHand))
			InitJbar(JHand,num2str(Total)+",","Image Loop","","")
		endif
		JbarInc(JHand,.03)
	endif
	MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)




	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageLoopModule

Function ExportGivenARDF(ARDF)
	
    String ARDF
	
    DeleteAllForceCurves(~2)
    AsciiExportARDF(ARDF, SaveDeflV=1)
    
End

Function/S ARISLoopModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable NameIndex = 0
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Offline ARIS For Loop"
		ParmStruct.Pict = "ImageFor"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "FlowControl,Programming,ForLoop,ImageProcessing,ARIS,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This is the start of a for loop\rIt must always be accompanied with the EndForModule\rThis is a special for loop, in that it will step through all the images in an Image sequence."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	


		
		Index = NameIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Offline#GetLoadedImSNameList()"
		Argument.StrValue = StringFromList(0,Offline#GetLoadedImSNameList(),";")
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "ARIS file in memory"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	String PathStr = ""
	String ImageFolder = GetDF("ImageRoot")
	Variable Total


	String ImageName, SavedDataFolder
	
	String DataFolder = GetDF("Macro")
	Index = GV("MacroCurrentStep")
	Wave/T/Z MacroData = $DataFolder+"MacroData"
	if (!WaveExists(MacroData))
		ARPrint("Macro error","Error")
		return(output)
	endif
	Variable Counter = NumberByKey("Count", MacroData[Index],cMacroKey0,cMacroSep0,0)
//print Counter
	Variable GoToPos = NumberByKey("End", MacroData[Index],cMacroKey0,cMacroSep0,0)
	if (IsNan(GoToPos))
		ARPrint("Unterminated for loop?","Error")
		Wave/T CurrentMacro = $DataFolder+"CurrentMacro"
		GoToPos = DimSize(CurrentMacro,0)-2
	endif



	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)
	if (!IsImageIMS(ImageParms.ImageName))
		PV("MacroNextStep",GoToPos+1)
		Counter = -1		//reset the counter, we are done with this loop.
		MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return output;
	endif

	Variable InMem = IsKeyInLookup(cIMSLoadedNameTable,ImageParms.ImageName)
	if (!InMem)
		PV("MacroNextStep",GoToPos+1)
		Counter = -1		//reset the counter, we are done with this loop.
		MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return output
	endif
	
	String ARISName = ImageParms.ImageName
	String FileName = GetKeyValueInLookup(cIMSLoadedNameTable,ImageParms.ImageName)
	Struct IMSViewModel IMSViewModel
	GetIMSViewModelFromFile(IMSViewModel,FileName)







	Total = IMSViewModel.File.NumOfFrames
	
	if (Counter >= Total)
		PV("MacroNextStep",GoToPos+1)
		Counter = -1		//reset the counter, we are done with this loop.
	else
		
		//Flow is tricky
		//Use the ImageParms to pull up the current ImageLoop's settings.
		//we assume that is a ARIS file
		
			
		

		//ImageName = ParmStruct.Argument[NameIndex].StrValue
		ImageName = ExtractImageFromARIS(ImageParms.ImageName,Counter)
		ImageParms.Init(ImageParms)		//we are going to reuse the ImageParms, but this time for an ARIS image

		Wave/Z ImageWave = $ImageFolder+ImageName


		Wave/Z ImageParms.ImageWave = ImageWave
		ImageParms.ImageName = ARISName
		ImageParms.Layer = 0
		ImageParms.LoopCounter = Counter
		ImageParms.LoopLimit[0] = 0
		ImageParms.LoopLimit[1] = Total
		ImageParms.LoadPathStr = IMSViewModel.File.Base.PathStr
		Wave/Z ImageParms.MaskWave = $GetDF("ImageDataRoot")+ImageName+"Mask"+num2Str(ImageParms.Layer)
		if (!WaveExists(ImageParms.MaskWave) && WaveExists(ImageParms.ImageWave))
			Make/N=(DimSize(ImageParms.ImageWave,0),DimSize(ImageParms.ImageWave,1))/B/U $GetDF("ImageDataRoot")+ImageName+"Mask"+num2Str(ImageParms.Layer)
			Wave ImageParms.MaskWave = $GetDF("ImageDataRoot")+ImageName+"Mask"+num2Str(ImageParms.Layer)
			FastOp ImageParms.MaskWave = (1)
			CopyScales/I ImageParms.ImageWave,ImageParms.MaskWave
		endif
		ImageParms.IsWrite = 1
		MacroImageInfo(ImageParms,Index=Index)

		//		if (WaveExists(ImageWave))
		//			DisplayImage(ImageWave)								//display the image
		//		endif
	
	endif
	MacroData[Index] = ReplaceNumberByKey("Count",MacroData[Index],Counter+1,cMacroKey0,cMacroSep0,0)




	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ARISLoopModule


Function/S SetARISImageModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable NameIndex = 0
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Sets which ARIS file that an ARISLoop will operate on"
		ParmStruct.Pict = "ImageLayer"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "FlowControl,Programming,ImageProcessing,ARIS,Image,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "ARISloops will work on the \"set\" ARIS image.\rYou can set the ARIS image with an Image loop, or this module."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	


		
		Index = NameIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Offline#GetLoadedImSNameList()"
		Argument.StrValue = StringFromList(0,Offline#GetLoadedImSNameList(),";")
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "ARIS file in memory"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	

	Variable InMem = IsKeyInLookup(cIMSLoadedNameTable,ParmStruct.Argument[NameIndex].StrValue)
	if (!InMem)
		return output
	endif
	
	
	String FileName = GetKeyValueInLookup(cIMSLoadedNameTable,ParmStruct.Argument[NameIndex].StrValue)
	if (Offline#ISImSFile(FileName))
		
//		Struct IMSViewModel IMSViewModel
//		GetIMSViewModelFromFile(IMSViewModel,FileName,DontSetFrame=true)
		MacroBuilderSetARISImageName(ParmStruct.Argument[NameIndex].StrValue,GV("MacroCurrentStep"))
	endif
	


	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //SetARISImageModule


Function/S InsertARISModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	

	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Insert ARIS"
		ParmStruct.Pict = "ExtractLayer"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Layer,ARIS,Save,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the ARIS loop module, and put it back into that file.\rThis will save the file, overwritting it."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	String Error
	String ID
	String FilePath = ImageParms.LoadPathStr+":"+ImageParms.ImageName+"."+cIMSExt
	Variable openForWrite
	
	if (IsKeyInLookup(cIMSLookupName,FilePath))
		ID = GetKeyValueInLookup(cIMSLookupName,FilePath)
		Struct IMSViewModel IMSViewModel
		GetIMSViewModelFromID(IMSViewModel,ID)
		
		openForWrite = !imSViewModel.File.Base.ReadOnly
		
		if (!openForWrite)
			openForWrite = !OpenImSForWrite(imSViewModel.File)
			StoreIMSViewModel(imsViewModel)
		endif
				
		if (openForWrite)
			Error = IRHDF_WriteData(IMSViewModel.File.Base.FileRef,ImageParms.ImageWave,FrameIndex=ImageParms.LoopCounter)
		endif
	endif


	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //InsertARISModule


Function/S StoreValueInARISModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable ParmIndex = 0
	Variable Index
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "StoreValue"
		ParmStruct.Pict = "Store"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "Parameter,GlobalVariables,ARIS,Image,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module can store any of the Global variables.\rIt will be added to the ARIS file for the frame set by the ARIS loop"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = ParmIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "IntegralGain"
		Argument.Value = NaN
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Parameter Name"
		Argument.FuncName = "ModuleSetVarFunc"
	
		
		
		
		ParmStruct.Argument[Index] = Argument
		

		
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)
	
	Variable Error
	String ID
	String FilePath = ImageParms.LoadPathStr+":"+ImageParms.ImageName+"."+cIMSExt
	if (IsKeyInLookup(cIMSLookupName,FilePath))
		ID = GetKeyValueInLookup(cIMSLookupName,FilePath)
		Struct IMSViewModel IMSViewModel
		GetIMSViewModelFromID(IMSViewModel,ID)
		Error = SaveParmToIMS(IMSViewModel.File.Base.FileRef,ImageParms.LoopCounter,ParmStruct.Argument[ParmIndex].StrValue,GV(ParmStruct.Argument[ParmIndex].StrValue))
	endif


	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //StoreValueInARISModule


Function/S ImageLayerModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable NapIndex = 0
	Variable ChannelIndex = 1
	Variable TraceIndex = 2
	Variable ModIndex = 3
	Variable StripIndex = 4
	Variable SkipIndex = 5
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Change Offline Image Layer"
		ParmStruct.Pict = "ImageLayer"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 6
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Layer,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and set the currently displayed channel\rYou can put a number in the Channel name to display by Layer index.\rIf the layer is not valid, this module does nothing."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	


		
		Index = NapIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Any;Nap;Map;None;"
		Argument.StrValue = "Any"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Channel Prefix:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = ChannelIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "Height"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Channel Name"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = TraceIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Any;Trace;Retrace;"
		Argument.StrValue = "Any"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Trace: "
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = ModIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "None;"+MakeValueStringList(9,0)+"Last;"
		Argument.StrValue = "None"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Mod Layer: "
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = StripIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "CheckBox"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "If layer is found\\rRemove ALL OTHER layers from image"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
//	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*",";","WIN:1"),";")
//	String ImageFolder, ImageName
	Variable Layer
//	GetGraphData(GraphStr,ImageFolder,ImageName,Layer)
//	Wave ImageWave = $ImageFolder+ImageName
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	String ChannelName = ""
	String ChannelList = GetDimLabels(ImageWave,2)
	String MatchStr = ""
	StrSwitch (ParmStruct.Argument[NapIndex].StrValue)
		case "Any":
			MatchStr += "*"
			break
		
		case "Nap":
		case "Map":
			MatchStr += ParmStruct.Argument[NapIndex].StrValue
			break
		
		case "None":
			//Do nothing
			break
			
	endswitch
	
	MatchStr += ParmStruct.Argument[ChannelIndex].StrValue
	Variable DoubleStar = 0
	String ModStr = ParmStruct.Argument[ModIndex].StrValue
	
	
	StrSwitch (ParmStruct.Argument[TraceIndex].StrValue)
		case "Any":
			MatchStr += "*"
			if (StringMatch(ModStr,"Last") || StringMatch(ModStr,"None"))
				DoubleStar = 1		//special case
			else
				MatchStr += "Mod"+ModStr
			endif
			break
			
		case "Trace":
		case "Retrace":
			MatchStr += ParmStruct.Argument[TraceIndex].StrValue
			if (StringMatch(ModStr,"Last") || StringMatch(ModStr,"None"))
				MatchStr += "*"
			else
				MatchStr += "Mod"+ModStr
			endif
			break
			
	endswitch
	
	
	String ChannelOps = ListMatch(ChannelList,MatchStr,";")
	if (DoubleStar)
		if (StringMatch(ModStr,"Last"))
			ChannelOps = ListMatch(ChannelOps,"*Mod*",";")
		else		//none
			ChannelOps = ListMatch(ChannelOps,"!*Mod*",";")
		endif
	endif
	
	Layer = Str2num(ParmStruct.Argument[ChannelIndex].StrValue)
	Index = -1
	if (!IsNan(Layer))
		Index = Layer
	elseif (ItemsInList(ChannelOps))
		Index = WhichListItem(StringFromList(0,ChannelOps,";"),ChannelList,";",0,0)
	endif
	
	ImageParms.Layer = Index
	ImageParms.IsWrite = 1		//tell the function we are writing this structure
	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	
	if (ParmStruct.Argument[StripIndex].Value && (ImageParms.Layer >= 0))
		//delete all other layers
		if (ImageParms.Layer < DimSize(ImageParms.ImageWave,2)-1)
			DeletePoints/M=2 ImageParms.Layer+1,DimSize(ImageParms.ImageWave,2)-ImageParms.Layer,ImageParms.ImageWave
		endif
		if (ImageParms.Layer)
			DeletePoints/M=2 0,ImageParms.Layer,ImageParms.ImageWave
		endif
		ImageParms.Layer = 0
	endif
	
	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	
	if ((Index >= 0) && IsWindow(GraphStr))
		SetARImageLayer(GraphStr,ImageParms.Layer)
		if (ParmStruct.Argument[StripIndex].Value && (ImageParms.Layer >= 0))
			TabIncFunc("Next0qqq",graphStr)
		endif
//		Struct WMTabControlAction InfoStruct
//		InfoStruct.EventCode = 2
//		InfoStruct.Win = GraphStr
//		InfoStruct.CtrlName = "DisplayLayerTab"
//		InfoStruct.Tab = Index
//		
//		if (Index >= 0)
//			Pass2LocalDisplayChangeLayers(InfoStruct)
//		endif
	elseif (Index < 0)
		print "Can not find layer: "+MatchStr+" in "+NameOfWave(ImageWave)
		
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageLayerModule


Function/S DoIVModule(ParmStr)
	String ParmStr
	
	//090909+513
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	//these indexes are also coded into MacroCheckFunc
	Variable MasterIndex = 0
	Variable SkipIndex = 1
	Variable FuncIndex = 2
	Variable CycleIndex = 3
	Variable AmpIndex = 4
	Variable FreqIndex = 5
	Variable arg3Index = 6
	Variable arg4Index = 7
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ARMacroString2Struct(ParmStruct,"NumParms"+cMacroKey0+"10"+cMacroSep0)		//just clear the structure, gets empty strings and Nans everywhere.
		Argument = ParmStruct.Argument[0]		//same deal. Get the Argument struct to a good init state
		ParmStruct.Name = "Do IV"
		ParmStruct.Pict = "DoIV"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "DoIV"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 8
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "DoIV,Orca,"
		ParmStruct.Requires = "Orca"		//works on all systems.
		ParmStruct.help = "Does an IV curve.  If the Use these parms is turned off, it uses whatever is in the DoIV controls.  Otherwise it will use the state of the controls here."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
		
		Index = MasterIndex
		Argument.Type = "CheckBox"
		argument.value = 1
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Title = "Use these parms:"
		Argument.FuncName = "MacroCheckFunc"
		ParmStruct.Argument[Index] = Argument

		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
		
		Index = FuncIndex
		Argument.ParmName = "ARDoIVFunc"
		Argument.Type = "Popup"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		Argument.Title = "Function"
		Argument.StrList = "ARDoIVTriangle;ARDoIVTriangleSquare;ARDoIVSquare;ARDoIVSine;"		//list only the ones we fully support, others need to be setup on the DoIV panel
		ParmStruct.Argument[Index] = Argument
		
		
		Index = CycleIndex
		Argument.ParmName = "ARDoIVCycles"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		Index = AmpIndex
		Argument.ParmName = "ARDoIVAmp"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = FreqIndex
		Argument.ParmName = "ARDoIVFrequency"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = Arg3Index
		Argument.ParmName = "ARDoIVArg2"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		
		Index = Arg4Index
		Argument.ParmName = "ARDoIVArg3"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument
		
		
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	
	ARMacroString2Struct(ParmStruct,ParmStr)

//	if (ParmStruct.Argument[MasterIndex].Value)
//	endif
	//make sure the drive wave is updated from the parm changes that may have happened.
	Struct ARBiasRampStruct BiasParms
	ARDoIVMakeDriveWave(BiasParms)
		
	
	//and do it.
	Struct WMButtonAction ButtonStruct
	ButtonStruct.EventCode = 2
	ButtonStruct.CtrlName = "ARDoIVDoItButton_1"
	ButtonStruct.Win = "ARDoIVPanel"
	ARDoIVButtonFunc(ButtonStruct)
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //DoIVModule


Function/S CIMModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable DirectionIndex = 0
	Variable SpeedIndex = 1
	Variable TimeIndex = 2
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "CIM"
		ParmStruct.Pict = "CIM"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 3
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Inertial,Motor,Cypher,"
		ParmStruct.Requires = "Cypher"
		ParmStruct.help = "Will Run the XY Piezos in a way that will slide the sample over.\rThe direction is relative to the video view\rTime is not used on slow speed, it is step mode."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
		Index = DirectionIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Up;Down;Right;Left;"
		Argument.StrValue = "Up"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Direction (Video Orientation)"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = SpeedIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Slow;Fast;"
		Argument.StrValue = "Fast"
		Argument.Value = 1
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Speed"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = TimeIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Title = "RunTime"
		Argument.Type = "Value"
		Argument.Value = 1
		Argument.ColumnLabel = ""
		Argument.StrValue = ""
		Argument.StrList = ""
		Argument.Units = 1
		Argument.Low = .001
		Argument.High = 20
		Argument.StepSize = 1
		Argument.MinUnits = 1
		Argument.FormatStr = "%.3g "
		Argument.UnitString = "s"
		Argument.FuncName = ""
		
		ParmStruct.Argument[Index] = Argument
		
		
		


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard, so just do a thermal.
	
	
	STRUCT WMCustomControlAction action
	Action.EventCode = 1		//mouse down
	Action.Win = ""
	Action.CtrlName = "Lg_"
	if (StringMatch(ParmStruct.Argument[SpeedIndex].StrValue,"Slow"))
		Action.EventCode = 2		//Mouse Up
		Action.CtrlName = "Sm_"
	endif
	
	//Up,Down,Right,Left, Take the first char of that for the control name
	Action.Ctrlname += ParmStruct.Argument[DirectionIndex].StrValue[0]
	Action.CtrlName += "CimButton"

	if (Exists("CimCustomControlProc"))
		FuncRef MacroFunc CimFunc=$"CimCustomControlProc"
		CimFunc(action)
	endif

	if (Action.EventCode == 2)		//single step
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	else
		//print "CimButtonFunc(\""+Action.CtrlName+"\",1,\"\")"
		aru_Callback(cDeviceModuleCallback,ParmStruct.Argument[TimeIndex].Value*1000,"CimButtonFunc(\""+Action.CtrlName+"\",2,\"\");ARCallbackFunc(\""+ParmStruct.CallbackName+"\")")
	endif
	
	
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //CIMModule


Function/S MotorEngageModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Motor Engage"
		ParmStruct.Pict = "MotorDown"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "MotorDown"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Engage,Motor,Cypher,"
		ParmStruct.Requires = "Cypher"
		ParmStruct.help = "Will click on the Start Tip approach button for you, and wait for it to finish."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard, so just do a thermal.
	STRUCT WMButtonAction ButtonStruct
	ButtonStruct.EventCode = 2
	ButtonStruct.Ctrlname = "MotorEngageButton_0"
	//EventCode
	//CtrlName
	if (Exists("MotorFunctionsButtonProc"))
		FuncRef ProtoButtonStruct WorkFunc=$"MotorFunctionsButtonProc"
		WorkFunc(ButtonStruct)
	else
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"		//just skip to the next step.
	endif
	
//	STRUCT WMCustomControlAction action
//	Action.EventCode = 1		//mouse down
//	Action.Win = ""
//	Action.CtrlName = "Lg_"
//	if (StringMatch(ParmStruct.Argument[SpeedIndex].StrValue,"Slow"))
//		Action.EventCode = 2		//Mouse Up
//		Action.CtrlName = "Sm_"
//	endif
//	
//	//Up,Down,Right,Left, Take the first char of that for the control name
//	Action.Ctrlname += ParmStruct.Argument[DirectionIndex].StrValue[0]
//	Action.CtrlName += "CimButton"
//
//	if (Exists("CimCustomControlProc"))
//		FuncRef MacroFunc CimFunc=$"CimCustomControlProc"
//		CimFunc(action)
//	endif
//
//	if (Action.EventCode == 2)		//single step
//		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
//	else
//		print "CimButtonFunc(\""+Action.CtrlName+"\",1,\"\")"
//		aru_Callback(6,ParmStruct.Argument[TimeIndex].Value*1000,"CimButtonFunc(\""+Action.CtrlName+"\",2,\"\");ARCallbackFunc(\""+ParmStruct.CallbackName+"\")")
//	endif
//	
//	
//	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
//	
	
	return(output)
End //MotorEngageModule


Function/S MotorWithdrawModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Motor Withdraw"
		ParmStruct.Pict = "MotorUp"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "MotorUp"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Withdraw,Motor,Cypher,"
		ParmStruct.Requires = "Cypher"
		ParmStruct.help = "Will click on the move to (Un) Load Sample button for you, and wait for it to finish."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard, so just do a thermal.
	STRUCT WMButtonAction ButtonStruct
	ButtonStruct.EventCode = 2
	ButtonStruct.Ctrlname = "LoadUnloadButton_0"
	//EventCode
	//CtrlName
	if (Exists("MotorFunctionsButtonProc"))
		FuncRef ProtoButtonStruct WorkFunc=$"MotorFunctionsButtonProc"
		WorkFunc(ButtonStruct)
	endif
	//This is syncronous
	//so we have to call the callback ourself.
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //MotorWithdrawModule


Function/S MotorMoveModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable DistanceIndex = 0
	Variable DirectionIndex = 1
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Motor Move"
		ParmStruct.Pict = "MotorMove"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "MotorMove"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Engage,Motor,Cypher,"
		ParmStruct.Requires = "Cypher"
		ParmStruct.help = "Will move the tip motors up or down.\r"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = DirectionIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Up;Down;"
		Argument.StrValue = "Up"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Direction"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
	
	
		Index = DistanceIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1e-6
		Argument.Units = Value2Units(Argument.Value)
		Argument.Low = 0
		Argument.High = 2e-3
		Argument.MinUnits = 1e-6
		Argument.StepSize = 1e-6
		
		Argument.FormatStr = "%.2W1P"
		Argument.UnitString = "m"
		Argument.Title = "Distance"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	Variable Scale = 1e6
	if (StringMatch(ParmStruct.Argument[DirectionIndex].StrValue,"Down"))
		Scale *= -1
	endif
	if (Exists("MoveEngageMotorsRelativeMicrons"))
		FuncRef protoFuncInV WorkFunc=$"MoveEngageMotorsRelativeMicrons"
		WorkFunc(ParmStruct.Argument[DistanceIndex].Value*Scale)
	else
		ARPrint("Macro Module Skipped, MotorControl not loaded or is an old version","Error",StackInfo=1)
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"		//just skip to the next step.
	endif
	
	return(output)
End //MotorMoveModule


Function FMapCalcWork(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//used
	Wave/Z ParmWave		//not used
	
	
	Make/N=0/FREE DestWave
	Variable DataOffset = WaveMax(Data)
	FastOp Data = Data+(-DataOffset)
	
	
	
	Variable Level0, Levelinf
	Variable Level0Index, LevelInfIndex, nop, XSign
	Variable StartIndex, StopIndex
	nop = DimSize(DataB,0)
	Level0 = DataB[0]
	LevelInf = DataB[nop-1]
	
	FindLevel/P/Q/R=[nop-1,0] DataB, Level0		//search backwards for the initial level
	if (V_Flag)
		Level0Index = 0
	else
		Level0Index = V_LevelX
	endif
	
	
	FindLevel/P/Q/R=[0,nop-1] DataB, Levelinf		//search forward for the last level
	if (V_Flag)
		LevelinfIndex = nop-1
	else
		LevelinfIndex = V_LevelX
	endif
	
	
	if ((Level0Index+1) > ((nop-1)-LevelInfIndex+1))		//take the larger one
		StartIndex = 0
		StopIndex = Level0Index
	else
		StartIndex = LevelInfIndex
		StopIndex = nop-1
	endif
//print StartIndex,StopIndex	
	WaveStats/Q/R=[StartIndex,StopIndex]/M=1 DataB
	
	
	
	if ((V_Max-DataB[StartIndex]) > (DataB[StartIndex]-V_Min))
		XSign = 1
	else
		XSign = -1
	endif
//	print XSign
	
	Integrate/METH=1/P/T Data /X=DataB/D=DestWave
	Variable output = DestWave[StopIndex]-DestWave[StartIndex]
	FastOp Data = Data+(DataOffset)
	return(output*XSign)
	
End //FMapCalcWork


Function/S FMapCalcWorkInfo()

	String Output = "DataType:Force;Section:All;DataTypeB:ZSnsr;ParmWave:None;CalcType:Work;"
	return(output)

End //FMapCalcWorkInfo


Function FMapCalcHertzSphere2P(Force,Ind,ParmWave)
	Wave Force
	Wave/Z Ind
	Wave/Z ParmWave
	
	Variable output = FMapCalcHertz2Point(Force,Ind,ParmWave,1.5)
	return(Output)
	
End //FMapCalcHertzSphere2Point


Function FMapCalcHertzCone2P(Force,Ind,ParmWave)
	Wave Force
	Wave/Z Ind
	Wave/Z ParmWave
	
	Variable output = FMapCalcHertz2Point(Force,Ind,ParmWave,2)
	return(Output)
	
End //FMapCalcHertzCone2Point


Function FMapCalcHertzPunch2P(Force,Ind,ParmWave)
	Wave Force
	Wave/Z Ind
	Wave/Z ParmWave
	
	Variable output = FMapCalcHertz2Point(Force,Ind,ParmWave,1)
	return(Output)
	
End //FMapCalcHertzPunch2Point


Function FMapCalcHertzIndentation(Force,Ind,ParmWave)
	Wave Force
	Wave/Z Ind
	Wave/Z ParmWave
	
	Variable output = FMapCalcHertz2Point(Force,Ind,ParmWave,-1)
	return(Output)
	
End //FMapCalcHertzIndentation


Function/S FMapCalcHertzSphere2PInfo()
	String Output = FMapCalcHertz2PointInfo()
	return(output)
end //FMapCalcHert2PointInfo


Function/S FMapCalcHertzCone2PInfo()
	String Output = FMapCalcHertz2PointInfo()
	Output = ReplaceStringByKey("CalcType",Output,"YoungsHertzCone",":",";",0)
	return(output)
end //FMapCalcHertzCone2PointInfo


Function/S FMapCalcHertzPunch2PInfo()
	String Output = FMapCalcHertz2PointInfo()
	Output = ReplaceStringByKey("CalcType",Output,"YoungsHertzPunch",":",";",0)
	return(output)
end //FMapCalcHertzPunch2PointInfo


Function/S FMapCalcHertzIndentationInfo()
	String Output = FMapCalcHertz2PointInfo()
	Output = ReplaceStringByKey("CalcType",Output,"IndentationHertz",":",";",0)
	return(output)
end //FMapCalcHertzPunch2PointInfo


Function/S FMapCalcHertz2PointInfo()
	String Output = "DataType:Force;Section:Ext;DataTypeB:Ind;ParmWave:None;CalcType:YoungsHertz;"
	return(output)
end //FMapCalcHert2PointInfo


Function FMapCalcHertz2Point(Force,Ind,ParmWave,TipGeo)
	Wave Force
	Wave/Z Ind
	Wave/Z ParmWave
	Variable TipGeo
	
	
	//Variable TipGeo = 1.5		//Sphere
	Variable TipParm = 20e-9
	Variable PoissonRatio = 0
	if (WaveExists(ParmWave))
//		if (DimSize(ParmWave,0) > 0)
//			TipGeo = ParmWave[0]/2+1		//Exponent
//		endif
		if (DimSize(ParmWave,0) > 0)
			TipParm = ParmWave[0]
		elseif (TipGeo == 2)
			TipParm = 36
		endif
		if (DimSize(ParmWave,0) > 1)
			PoissonRatio = ParmWave[1]
		endif
	endif
	Variable HertzFactor
	
	Switch (TipGeo*2)
		case 2:		//punch
			HertzFactor = .5/TipParm
			break
			
		case 3:			//sphere
			HertzFactor = 3/4/sqrt(TipParm)
			break
			
		case 4:			//Cone
			HertzFactor = pi/2/tan(TipParm/180*pi)
			break
			
	endswitch
			
	HertzFactor *= 1-PoissonRatio^2
	
	Variable output
	Variable Index0, Index1, Start, Stop, IsLoading = 0, ZeroPoint, DeltaForce, DeltaInd, MaxForce, Slope
	Variable HighForce, LowForce
	Variable HighRatio = .9
	Variable LowRatio = .5
	
	Start = 0
	Stop = DimSize(Force,0)-1
	if (Ind[Start] < Ind[Stop])
		IsLoading = 1
	endif
	
	if (IsLoading)
		WaveStats/Q/R=[Start,Start+9] Force
		SwapVars(Start,Stop)
	else
		WaveStats/Q/R=[Stop-9,Stop] Force
	endif
	ZeroPoint = V_Avg
	MaxForce = WaveMax(Force)
	HighForce = (MaxForce-ZeroPoint)*HighRatio+ZeroPoint
	LowForce = (MaxForce-ZeroPoint)*LowRatio+ZeroPoint
	
	
	FindLevel/P/Q/R=[Start,Stop] Force,HighForce
	Index1 = V_LevelX
	FindLevel/P/Q/R=[Index1,Stop] Force,LowForce
	Index0 = V_LevelX
	DeltaForce = (Force[Index1]-ZeroPoint)^(1/TipGeo)-(Force[Index0]-ZeroPoint)^(1/TipGeo)
	DeltaInd = Max(Ind[Index1]-Ind[Index0],1e-15)			//zero and negative numbers are really bad
	if (TipGeo < 0)
		Return(DeltaInd/(HighRatio-LowRatio))
	endif
	
	output = HertzFactor*(DeltaForce/DeltaInd)^TipGeo
	return(output)
end //FMapCalcHertz2Point


Function FMapCalcPlasticity(CalcStruct)
	Struct FMapCalcStruct &CalcStruct
	Variable output
	Struct ARForcePlotStruct DataStruct
	if (CalcStruct.IsInfo)
		//we fill in information about the default state.
		//This system is not really needed for the advanced functions, not sure if I want to bother putting in the read code.
		CalcStruct.IsInfo = 0
		CalcStruct.InfoStr = ""
		CalcStruct.NumOfOutputs = 1
		CalcStruct.OutputNameList = "Plasticity;"
		CalcStruct.NumOfChannels = 4
		DataStruct.FPName = ""
		DataStruct.DataFolder = ""
		DataStruct.LoadPath = ""
		DataStruct.IsFixed = 1
		Wave/Z DataStruct.Data = $""

		DataStruct.Channel = "Force"
		DataStruct.Segment = "Ext"
		CalcStruct.Data[0] = DataStruct
		
		DataStruct.Channel = "Ind"
		DataStruct.Segment = "Ext"
		CalcStruct.Data[1] = DataStruct
		
		DataStruct.Channel = "Force"
		DataStruct.Segment = "Ret"
		CalcStruct.Data[2] = DataStruct
		
		DataStruct.Channel = "Ind"
		DataStruct.Segment = "Ret"
		CalcStruct.Data[3] = DataStruct

		CalcStructInfoFunc(CalcStruct)
		
		return(0)
	endif
	

	Struct ARElasticParmStruct ElasticParms
	ElasticParms.FPName = ""
	ElasticParms.DataFolder = ""
	ElasticParms.DidXY = 0
	ElasticParms.DidPreFit = 0
	ElasticParms.ModelName = "Hertz"
	Wave ElasticParms.Force = CalcStruct.Data[0].Data
	Wave ElasticParms.Ind = CalcStruct.Data[1].Data
	Wave ElasticParms.ForceRet = CalcStruct.Data[2].Data
	Wave ElasticParms.IndRet = CalcStruct.Data[3].Data
	Wave/Z ElasticParms.FitWave = $""
	ElasticParms.LockIndexes[0] = 0
	ElasticParms.LockIndexes[1] = Dimsize(ElasticParms.Force,0)-1
	ElasticParms.IsLoading = 1
	ElasticParms.SectionStr = CalcStruct.Data[0].Segment
	ElasticParms.SpringConstant = CalcStruct.SpringConstant//NumberByKey("SpringConstant",Note(ElasticParms.Force),":","\r",0)
	ElasticXYOffsetFunc(ElasticParms)
	ElasticPreFitFunc(ElasticParms)


	Variable AreaRet = ContactWorkSubFunc(CalcStruct.Data[2].Data,CalcStruct.Data[3].Data)
	Variable AreaExt = ContactWorkSubFunc(CalcStruct.Data[0].Data,CalcStruct.Data[1].Data)

	output = (AreaExt-AreaRet)/AreaExt


	CalcStruct.Outputs[0] = output
	
	return(output)
End //FMapCalcPlasticity


//Function FMapCalcContactWork(Force,Ind,ParmWave)
//	Wave Force
//	Wave/Z Ind		//used
//	Wave/Z ParmWave		//not used
//
//
//	//Find Zero ind
//	Variable Nop = DimSize(Force,0)
//	
//	Variable IsLoading = Ind[0] < Ind[nop-1]
//	Variable StartIndex, StopIndex
//	if (IsLoading)
//		StopIndex = nop-1
//		FindLevel/P/Q/R=[0,nop-1] Ind,0
//		if (V_Flag)
//			StartIndex = 0
//		else
//			StartIndex = V_LevelX
//		endif
//	else
//		StartIndex = 0
//		FindLevel/P/Q/R=[nop-1,0] Ind,0
//		if (V_Flag)
//			StopIndex = nop-1
//		else
//			StopIndex = V_LevelX
//		endif
//	endif
////if you compare this function to the ThreadSafe function, then you need to round the indexes, that function does not interpolate between values
////StopIndex = Round(stopIndex)
////StartIndex = Round(StartIndex)
//
//	Duplicate/FREE Force,TempWave
//	TempWave[StartIndex,StopIndex] = Max(TempWave[P],0)			//we ignore adhesion, any deflection value < 0 is cut off.
//	Integrate/METH=1/P/T TempWave /X=Ind
//	Variable output = TempWave[StopIndex]-TempWave[StartIndex]
//	return(output*(IsLoading*2-1))
//End //FMapCalcContactWork


//Function/S FMapCalcContactWorkInfo()
//	String output = "DataType:Force;Section:Ext;DataTypeB:Ind;ParmWave:None;CalcType:Work;"
//	return(output)
//End //FMapCalcContactWorkInfo


Function/S SingleTuneModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable DriveIndex = 3
	Variable WidthIndex = 5
	Variable DriveAmpIndex = 7
	Variable DualACIndex = 0
	Variable SkipIndex = 1
	Variable UseDriveIndex = 2
	Variable UseWidthIndex = 4
	Variable UseDriveAmpIndex = 6
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Single Tune"
		ParmStruct.Pict = "OneTune"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "Tune"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 8
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Tune,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module will do an Single Tune"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
	
		Index = DualACIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Popup"
		Argument.StrValue = "1st Freq"
		Argument.StrList = "1st Freq;2nd Freq;"
		Argument.Value = 0
		Argument.FuncName = "ModulePopFunc"
		Argument.UnitString = ""
		Argument.FormatStr = ""
		Argument.Title = "Dual AC Mode:"
		Argument.ColumnLabel = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
	

		Index = DriveIndex
		Argument.ParmName = "DriveFrequency"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument

		
		Index = WidthIndex
		Argument.ParmName = "SweepWidth"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.Title = "Sweep Width"
		ParmStruct.Argument[Index] = Argument

		
		Index = DriveAmpIndex
		Argument.ParmName = "DriveAmplitude"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		ParmStruct.Argument[Index] = Argument

		
		Index = UseDriveIndex
		//Use AutoTune Low
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Drive Frequency"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument

		Index = UseWidthIndex
		//Use AutoTune High
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Sweep Width"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument

		Index = UseDriveAmpIndex
		//Use Target
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Use this Drive Amplitude"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""
		
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard
	
	
	String TempStr = ""
	if (ParmStruct.Argument[DualACIndex].Value == 2)
		TempStr = "1"
		if (!GV("DualACMode"))
			TuneBoxFunc("DualACModeBox_3",1)
		endif
	endif
	
	CantTuneFunc("DoTuneOnce"+TempStr+"_3")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //SingleTuneModule


Function/S ThermalTuneModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable DualACIndex = 0
	Variable JustPhaseIndex = 2
	Variable SkipIndex = 1
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Frequency & Phase from the Thermal"
		ParmStruct.Pict = "FnP_T"
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "Tune"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 3
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Tune,Thermal,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This module takes the Frequency and / or Phase from the thermal fit, and sets the cantilever drive."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
	
	
		Index = DualACIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "Popup"
		Argument.StrValue = "1st Freq"
		Argument.StrList = "1st Freq;2nd Freq;"
		Argument.Value = 0
		Argument.FuncName = "ModulePopFunc"
		Argument.UnitString = ""
		Argument.FormatStr = ""
		Argument.Title = "Dual AC Mode:"
		Argument.ColumnLabel = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
	

		Index = JustPhaseIndex
		Argument.ParmName = "ModuleParm"+Num2str(Index)
		Argument.Type = "CheckBox"
		Argument.ColumnLabel = ""
		Argument.Value = 0
		Argument.Title = "Only set Phase"
		ParmStruct.Argument[Index] = Argument

		


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	

	ARMacroString2Struct(ParmStruct,ParmStr)
	
	
	//This module, all the parms are standard
	
	PV("MacroIsRunning",1)		//hack it in
		
	String TempStr = ""
	if (ParmStruct.Argument[DualACIndex].Value == 2)
		if (!GV("DualACMode"))
			TuneBoxFunc("DualACModeBox_3",1)
		endif
	endif
	PV("WhichACMode",ParmStruct.Argument[DualACIndex].Value)
	if (ParmStruct.Argument[JustPhaseIndex].Value)
		TempStr = "DoTuneThermalPhase"
	else
		TempStr = "DoTuneFromThermal"
	endif
	
	CantTuneFunc(TempStr+"_3")
	//here we call the realtime function that does the real work.
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ThermalTuneModule


//Function/S ImageTemplateModule(ParmStr)
//	String ParmStr
//	
//	String output = ""
//	
//	
//	Struct ARMacroStruct ParmStruct
//	Struct ARMacroParmStruct Argument
//	Variable Index
//	
//	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
//		ParmStruct.Name = "Template Module for offline images, to be deleted"
//		ParmStruct.Pict = "ImageTemplate"		//some generic 50x50 picture.
//		ParmStruct.FuncName = GetFuncName()
//		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
//		ParmStruct.NumParms = 0
//		ParmStruct.Type = "Offline"
//		ParmStruct.KeyWords = "ImageProcessing,"
//		ParmStruct.Requires = ""		//works on all systems.
//		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and DO SOMETHING"
//		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
//			ParmStruct.NumParms = 0
//			output = ARMacroStruct2String(ParmStruct)
//			return(Output)
//		endif
//	
//
////		Index = SomeIndex
////		Argument.ParmName = "ModuleParm"+num2str(Index)
////		Argument.Type = "Popup"
////		Argument.ColumnLabel = "Description"
////		Argument.StrList = "Any;Nap;Map;None;"
////		Argument.StrValue = "Any"
////		Argument.Value = 0
////		Argument.Units = 1
////		Argument.Low = -inf
////		Argument.High = inf
////		Argument.MinUnits = 1
////		Argument.StepSize = 1
////		
////		Argument.FormatStr = ""
////		Argument.UnitString = ""
////		Argument.Title = "Channel Prefix:"
////		Argument.FuncName = ""
////		ParmStruct.Argument[Index] = Argument
////
////		
////		Index = ChannelIndex
////		Argument.ParmName = "ModuleParm"+num2str(Index)
////		Argument.Type = "String"
////		Argument.ColumnLabel = "Description"
////		Argument.StrList = ""
////		Argument.StrValue = "Height"
////		Argument.Value = 0
////		Argument.Units = 1
////		Argument.Low = -inf
////		Argument.High = inf
////		Argument.MinUnits = 1
////		Argument.StepSize = 1
////		
////		Argument.FormatStr = ""
////		Argument.UnitString = ""
////		Argument.Title = "Channel Name"
////		Argument.FuncName = ""
////		ParmStruct.Argument[Index] = Argument
//
//		
//
//		output = ARMacroStruct2String(ParmStruct)
//		return(Output)
//	endif
//	//we are passed all the parms we need.
//	//convert them to a structure for use.
//	
//	Struct MacroImageStruct ImageParms
//	MacroImageInfo(ImageParms)
//
//	ARMacroString2Struct(ParmStruct,ParmStr)
//	Variable Layer
//	Wave/Z ImageWave = ImageParms.ImageWave
//	if (!WaveExists(ImageWave))
//		if (ImageParms.RunMode)		//this is a test mode, the failure to get a wave ref is probably because things did not init as they will in the macro
//			print "Please open an image into the offline to test this step on"
//		else
//			print "Error in the "+GetFuncName()+", lost the image wave"
//		endif
//		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
//		return(output)
//	endif
//	
//	
//	
//																								//<Main Body>
//	
//	
//	
//																								//<End Main Body>
//	
//	
//																								//<Update Graph>
//	//if we need to work on the topmost display of the image, here is the graph:	
//	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
//	if (IsWindow(GraphStr))
//	endif
//																								//<End Update Graph>
//																								
//																								
//	//if we needed to write back the ImageParms structure, this is how:	
////	ImageParms.IsWrite = 1		//tell the function we are writing this structure
////	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
//	
//	//if your function is synchronous [compleats all work in this function, and does not need a callback]
//	//then you should enable the following line:
//	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
//	
//	
//	return(output)
//End //ImageTemplateModule


Function/S ImageMaskModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	
	Variable CalcIndex = 0		//if this changes, Update PreMacroCheck
	Variable ThresholdIndex = 4
	Variable RangeIndex = 5
	Variable MaskModIndex0 = 6
	Variable MaskModIndex1 = 8
	Variable MaskModIndex2 = 10
	Variable SkipIndex0 = 7
	Variable SkipIndex1 = 9
	Variable SkipIndex2 = 1
	Variable InvertIndex = 2
	Variable PasteIndex = 3		//if this changes, Update PreMacroCheck
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		Wave PanelParms = $GetDF("Windows")+"MaskPanelParms"


		ParmStruct.Name = "offline Image Mask"
		ParmStruct.Pict = "Mask"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 11
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Mask,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and set or reset the mask.\r"
		ParmStruct.Help += "Threshold is only used for manual masks\rRange is not used for adaptive, set range to zero to turn off."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = SkipIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = "0"
		Argument.Value = 0
		Argument.Title = ""
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = SkipIndex1
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex2
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		Index = InvertIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.Title = "Inverse"
		Argument.StrList = ""
		Argument.StrValue = ""
		
		Argument.Value = GV("InverseMask")
		Argument.FuncName = ""
		Argument.UnitString = ""
		Argument.FormatStr = ""

		ParmStruct.Argument[Index] = Argument

		
		Index = CalcIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Manual;Iterative;Bimodal;Adaptive;Paste;Reset;"
		Argument.StrValue = "Paste"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Mask Method"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = ThresholdIndex
		Argument.ParmName = "MaskThreshold"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Title = "Threshold"
		ParmStruct.Argument[Index] = Argument

		Index = PasteIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.ParmName = "ARDoIVCycles"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Which ClipBoard"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = 300
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.0f"
		Argument.UnitString = ""
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = RangeIndex
		Argument.ParmName = "MaskRange"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		//Then seed the values with the current Global value
		ARMacroVarWave2Arg(Argument)
		Argument.Value *= GV("UseRange")
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Title = "Range"
		ParmStruct.Argument[Index] = Argument

		Index = MaskModIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.Title = "First Additional Mask Operation"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "None;Inverse;"+ListMultiply("Erode x;Dilate x;",MakeValueStringList(3,1),";")
		Argument.StrValue = "None"
		Argument.Value = WhichListItem(Argument.StrValue,Argument.StrList,";",0,0)
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		ParmStruct.Argument[Index] = Argument


		Index = MaskModIndex1
		Argument.Title = "Second Additional Mask Operation"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument

		Index = MaskModIndex2
		Argument.Title = "Third Additional Mask Operation"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument


//
//		
//		Index = ChannelIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "String"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = ""
//		Argument.StrValue = "Height"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Name"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument

		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
																								//<Main Body>
	String SavedDataFolder = GetDataFolder(1)
	String TempFolder = GetDF("ImageDataRoot")
	if (!WaveExists(ImageParms.MaskWave))
		Make/N=(DimSize(ImageWave,0),DimSize(ImageWave,1))/O/B/U $TempFolder+NameOfWave(ImageWave)+"Mask"+num2str(ImageParms.Layer)
		Wave ImageParms.MaskWave = $TempFolder+NameOfWave(ImageWave)+"Mask"+num2str(ImageParms.Layer)
		ImageParms.IsWrite = 1
	endif
	
	StrSwitch (ParmStruct.Argument[CalcIndex].StrValue)
		case "Manual":
		case "Iterative":
		case "Bimodal":
		case "Adaptive":
		case "Fuzzy-Entropy":			//not in GUI, but code should be ready2go
		case "Fuzzy-Mean Gray":
			Wave LayerWave = ExtractLayerNum(ImageWave,ImageParms.Layer,DestName=TempFolder+"LayerWave")
			SetDataFolder(TempFolder)
			ARMaskFunc(LayerWave,ImageParms.MaskWave,"MakeMask",ParmStruct.Argument[CalcIndex].Value-1,ParmStruct.Argument[ThresholdIndex].Value,ParmStruct.Argument[RangeIndex].Value,ParmStruct.Argument[InvertIndex].Value)
			SetDataFolder(SavedDataFolder)
			break
			
		case "Paste":
			Wave/Z ClipBoard = $GetDF("ImageRoot")+"Masks:"+"ClipBoard"+num2str(ParmStruct.Argument[PasteIndex].Value)
			if (!WaveExists(ClipBoard))
				Wave/Z ClipBoard = $GetDF("ImageRoot")+"Masks:"+"ClipBoard"
			endif
			if (!WaveExists(ClipBoard))
				Wave/Z ClipBoard = $GetDF("ImageRoot")+"Masks:"+"ClipBoard0"
			endif
			if (!WaveExists(ClipBoard))
				ARPrint("Clipboard mask is gone\rI know it was there when we started this macro...\rDon't know why it is no longer there.","Debug")
				execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
				return(output)
			endif
			ARMaskFunc(ImageWave,ClipBoard,"Scale",nan,nan,nan,ParmStruct.Argument[InvertIndex].Value,DestMaskName=GetWavesDataFolder(ImageParms.MaskWave,2))
			break
			
		case "Reset":
			FastOp ImageParms.MaskWave = 1		//reset the mask
			break
			
	endswitch
	
	
	Variable StepSize = 2
	Variable A, B, nopB
	for (A = MaskModIndex0;A <= MaskModIndex2;A += StepSize)
		Argument = ParmStruct.Argument[A]
		StrSwitch (Argument.StrValue)
			case "None":
				continue
				break
				
			case "Inverse":
				ImageParms.MaskWave = !ImageParms.MaskWave
				break
				
			case "Dilate x1":
			case "Dilate x2":
			case "Dilate x3":
			case "Erode x1":
			case "Erode x2":
			case "Erode x3":
				nopB = GetEndNum(Argument.StrValue)
				for (B = 0;B < nopB;B += 1)
					ARMaskFunc(ImageWave,ImageParms.MaskWave,Argument.StrValue[0,strlen(Argument.StrValue)-1-strlen(" x1")]+"Mask",nan,nan,nan,nan)
				endfor
				break
		
		endswitch
	endfor
	
	
																								//<End Main Body>
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
		UpdateImageMask(GraphStr)
	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
	if (ImageParms.IsWrite)
		MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageMaskModule


Function/S ImageFlattenModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable OrderIndex = 0
	Variable OffsetIndex = 1
	Variable ModLayerIndex = 2
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Flatten"
		ParmStruct.Pict = "Flatten"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 3
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Modify,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and flatten it."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = OrderIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "0;1;2;3;Histogram;Magic Mask;Magic Mask (Pits);"
		Argument.StrValue = "1"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Flatten Order"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = OffsetIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.StrList = "Mask;Entire Image;"
		Argument.StrValue = "Entire Image"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Zero the:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = ModLayerIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.StrList = "Overwrite Orginal Layer;Mod Layer;"
		Argument.StrValue = "Mod Layer"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Output"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>

	String TempFolder = GetDF("ImageDataRoot")
	
	
	if (StringMatch(ParmStruct.Argument[ModLayerIndex].StrValue,"Mod Layer"))
		Layer = ImageParms.Layer
		InsertModLayer(GraphStr,ImageWave,Layer,AllowDialogs=false)
		if (Layer != ImageParms.Layer)
			ImageParms.Layer = Layer
			ImageParms.IsWrite = 1
			if (WaveExists(ImageParms.MaskWave))		//this may or may not have been done by InsertModLayer, lets make sure it is.
				Duplicate/O ImageParms.MaskWave $TempFolder+NameOfWave(ImageParms.ImageWave)+"Mask"+num2str(Layer)
				Wave ImageParms.MaskWave = $TempFolder+NameOfWave(ImageParms.ImageWave)+"Mask"+num2str(Layer)
			endif
		endif
		
	endif
	
																								//<Main Body>
	Make/FREE/D CoefWave
//print (ParmStruct.Argument[OrderIndex].Value-1)
	ARFlatten(ImageParms.ImageWave,ParmStruct.Argument[OrderIndex].Value-1,ImageParms.Layer,CoefWave,ImageParms.MaskWave,2-ParmStruct.Argument[OffsetIndex].Value)
	UpdateFlattenNote(ImageParms.ImageWave,ImageParms.Layer,ParmStruct.Argument[OrderIndex].Value-1,CoefWave)
	
																								//<End Main Body>
	
	
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
	if (ImageParms.IsWrite)
		MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageFlattenModule


Function/S ImagePlaneFitModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable XYIndex = 0
	Variable OrderIndex = 1
	Variable OffsetIndex = 2
	Variable ModLayerIndex = 3
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Planefit"
		ParmStruct.Pict = "Planefit"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Modify,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and planefit it."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = XYIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "X;Y;XY;"
		Argument.StrValue = "XY"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Planefit direction(s)"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = OrderIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "0;1;2;3;Histogram;"
		Argument.StrValue = "1"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Planefit Order"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = OffsetIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.StrList = "Mask;Entire Image;"
		Argument.StrValue = "Entire Image"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Zero the:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = ModLayerIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.StrList = "Overwrite Original Layer;Mod Layer;"
		Argument.StrValue = "Mod Layer"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Output"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>

	String TempFolder = GetDF("ImageDataRoot")
	
	
	if (StringMatch(ParmStruct.Argument[ModLayerIndex].StrValue,"Mod Layer"))
		Layer = ImageParms.Layer
		InsertModLayer(GraphStr,ImageWave,Layer,AllowDialogs=false)
		if (Layer != ImageParms.Layer)
			ImageParms.Layer = Layer
			ImageParms.IsWrite = 1
			if (WaveExists(ImageParms.MaskWave))		//this may or may not have been done by InsertModLayer, lets make sure it is.
				Duplicate/O ImageParms.MaskWave $TempFolder+NameOfWave(ImageParms.ImageWave)+"Mask"+num2str(Layer)
				Wave ImageParms.MaskWave = $TempFolder+NameOfWave(ImageParms.ImageWave)+"Mask"+num2str(Layer)
			endif
		endif
		
	endif
	
																								//<Main Body>
	Make/FREE/D CoefWave																								
	//ARFlatten(ImageParms.ImageWave,ParmStruct.Argument[OrderIndex].Value,ImageParms.Layer,CoefWave,ImageParms.MaskWave,2-ParmStruct.Argument[OffsetIndex].Value)

//print (ParmStruct.Argument[OrderIndex].Value-1)
	ARPlaneFit("Do"+ParmStruct.Argument[XYIndex].StrValue,ImageParms.ImageWave,ParmStruct.Argument[OrderIndex].Value-1,ImageParms.Layer,CoefWave,ImageParms.MaskWave,2-ParmStruct.Argument[OffsetIndex].Value)
	UpdatePlanefitNote(ImageParms.ImageWave,ImageParms.Layer,CoefWave)
	
	
																								//<End Main Body>
	
	
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
	if (ImageParms.IsWrite)
		MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImagePlaneFitModule


Function/S ImageMovieModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable FrameRateIndex = 0
	Variable NameIndex = 2
	Variable DirectionIndex = 1
	Variable UseMMIndex = 3
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Offline Image Movie Maker"
		ParmStruct.Pict = "Movie_MB"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Movie,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and make a movie."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = DirectionIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Up;Down;Both;"
		Argument.StrValue = "Up"
		Argument.Value = 1
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Scan Direction"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = FrameRateIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "Height"
		Argument.Value = 10
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.2f"
		Argument.UnitString = " fps"
		Argument.Title = "Frame Rate"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		Index = NameIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "Movie"
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Movie Name"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = UseMMIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "CheckBox"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "Movie.avi"
		Argument.Value = 0
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Use Movie Maker Layout"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
																								//<Main Body>
	
	Variable MacroIndex = GV("MacroCurrentStep")
	Wave/T MacroData = $GetDF("Macro")+"MacroData"
	String ExtraData = MacroData[MacroIndex]

	Variable LoopCounter, LoopLimit

	if (!Strlen(ExtraData) || IsNan(NumberByKey("LoopCounter",ExtraData,cMacroKey0,cMacroSep0,0)))		//first time in, we need to set this.
		LoopCounter = 0
		ExtraData = ReplaceNumberByKey("LoopCounter",ExtraData,1,cMacroKey0,cMacroSep0,0)
		LoopLimit = ImageParms.LoopLimit[1]
		ExtraData = ReplaceNumberByKey("LoopLimit",ExtraData,LoopLimit,cMacroKey0,cMacroSep0,0)
	else
		LoopCounter = NumberByKey("LoopCounter",ExtraData,cMacroKey0,cMacroSep0,0)
		ExtraData = ReplaceNumberByKey("LoopCounter",ExtraData,LoopCounter+1,cMacroKey0,cMacroSep0,0)
		LoopLimit = NumberByKey("LoopLimit",ExtraData,cMacroKey0,cMacroSep0,0)
	endif

	MacroData[MacroIndex] = ExtraData

	Variable LayoutCheck = ParmStruct.Argument[UseMMIndex].Value
	String GraphStr = MovieWindow(ImageParms.ImageWave,ImageParms.Layer,LayoutCheck)
	if (ImageParms.RunMode)
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif
	
	
	Variable FrameRate = ParmStruct.Argument[FrameRateIndex].Value
	String MovieName = ParmStruct.Argument[NameIndex].StrValue
	
	
//	if (!StringMatch(MovieName,"*.avi"))
//		MovieName += ".avi"
//	endif
	
	String PName = cOfflinePName
	
	
	DoWindow/F $GraphStr
	if (!LoopCounter)
		DoUpdate
		NewMovie/F=(FrameRate)/A/L/O/P=$PName as MovieName
		
	endif

	if ((NumberByKey("ScanDown",Note(Imageparms.ImageWave),":","\r",0)+1) & (ParmStruct.Argument[DirectionIndex].Value))
		DoUpdate
		AddMovieFrame
	endif
	RemoveImage/W=$GraphStr/Z $NameOfWave(ImageParms.ImageWave)
	//DoWindow/K $GraphStr
	if (LoopCounter+1 >= LoopLimit)
		DoWindow/K $GraphStr
		CloseMovie
	endif
	
	
																								//<End Main Body>
	
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageMovieModule


Function/S ImageDisplayModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Display Offline Image"
		ParmStruct.Pict = "DisplayImage"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Display,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and Display it."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

//		Index = SomeIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "Popup"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = "Any;Nap;Map;None;"
//		Argument.StrValue = "Any"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Prefix:"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument
//
//		
//		Index = ChannelIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "String"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = ""
//		Argument.StrValue = "Height"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Name"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument

		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
																								//<Main Body>
	
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
		DoWindow/F $GraphStr
	else
		DisplayImage(ImageParms.ImageWave)
	endif
	
																								//<End Main Body>
	
	
																								//<Update Graph>
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageDisplayModule


Function/S ImageSaveModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable PathIndex = 2
	Variable SkipIndex0 = 0
	Variable SkipIndex1 = 1
	Variable ARDFIndex = 3
	Variable OverWriteIndex = 4
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Save Image"
		ParmStruct.Pict = "SaveImage"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 5
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Save,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and Save it.\r"
		ParmStruct.Help += "The Path can be either the full path, or a relative path from where the image was loaded.\rIf the path is empty, it will overwrite the original.\r"
		ParmStruct.Help += "The Path can be Igor (:) or PC (\\\\) style, Network or local.\r"
		ParmStruct.Help += "If overwrite is turned off, it will skip the file if there is a name conflict."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = PathIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Absolute or Relative Path"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		Index = SkipIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex1
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument
		
		Index = ARDFIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "ARDF;IBW;"
		Argument.StrValue = "ARDF"
		Argument.Value = 1
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Save ARDF as:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		
		
		Index = OverwriteIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.Value = 1
		Argument.Title = "Overwrite if name conflict"
		ParmStruct.Argument[Index] = Argument
//
//		
//		Index = ChannelIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "String"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = ""
//		Argument.StrValue = "Height"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Name"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument

		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
																								//<Main Body>
	String PathStr = ""
	String RelAbsPath = ConvertPCPathToIgor(ParmStruct.Argument[PathIndex].StrValue)
	if (!Strlen(RelAbsPath))
		PathStr = ImageParms.LoadPathStr
	elseif (cmpStr(RelAbsPath[0],":") != 0)		//full path
		PathStr = RelAbsPath
	else
		if (cmpStr(ImageParms.LoadPathStr[Strlen(ImageParms.LoadPathStr)-1],":") == 0)
			RelAbsPath = RelAbsPath[1,strlen(RelAbsPath)-1]
		endif
		PathStr = ImageParms.LoadPathStr+RelAbsPath
	endif
	String PName = NewFreePath(PathStr)
	if (!ParmStruct.Argument[OverwriteIndex].Value)
		//we need to double check the file for them
		if (WhichListItem(NameOfWave(ImageParms.ImageWave)+".ibw",IndexedFile($PName,-1,".ibw"),";",0,0) >= 0)
			PathInfo $Pname
			ARPrint(S_Path+NameOfWave(ImageParms.ImageWave)+" was not saved due to FileName Conflict","Error")
			execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
			return(output)
		endif
	endif
	//PathInfo $PName
	//print S_Path
	if (ImageParms.IsARDF && StringMatch(ParmStruct.Argument[ARDFIndex].StrValue,"ARDF"))
		if (Strlen(RelAbsPath))
			String PartialStructureSupport = ImageParms.LoadPathStr
			CopyFile/O PartialStructureSupport+NameOfWave(ImageParms.ImageWave)+".ARDF" as PathStr+NameOfWave(ImageParms.ImageWave)+".ARDF"
		endif
		ARSaveAsImageSubFunc(NameOfWave(ImageParms.ImageWave)+".ARDF",PName,ImageParms.ImageWave,"ARCallbackFunc(\""+ParmStruct.CallbackName+"\")")
	else
		ResaveImageFunc(ImageParms.ImageWave,PName,"ARCallbackFunc(\""+ParmStruct.CallbackName+"\")",AsARDF=0,Offline=true)
	endif
	
	
																								//<End Main Body>
	
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>
	
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	//execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageSaveModule


Function/S ImageKillModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Kill Image"
		ParmStruct.Pict = "KillImage"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 0
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Kill,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and remove it from memory.\rThe file on the HD is NOT touched."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

//		Index = SomeIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "Popup"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = "Any;Nap;Map;None;"
//		Argument.StrValue = "Any"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Prefix:"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument
//
//		
//		Index = ChannelIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "String"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = ""
//		Argument.StrValue = "Height"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Name"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument

		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
																								//<Main Body>
	
	KillARImage2(ImageParms.ImageWave)
	//now we have to reset the loop counter if we are in a loop.
	Struct ARMacroStruct LoopParms
	Variable LoopIndex = FindMacroLoopIndex(GV("MacroCurrentStep"),"ImageLoop")
	if (LoopIndex >= 0)
		Wave/T CurrentMacro = $GetDF("Macro")+"CurrentMacro"
		ARMacroString2Struct(LoopParms,CurrentMacro[LoopIndex][1])
		if (StringMatch(LoopParms.Argument[0].StrValue,"Memory"))
			ImageParms.LoopLimit[1] -= 1
			//ImageParms.LoopCounter -= 1		//we don't have to subtract 1, the value in the storage wave is already 1 ahead of this value
			ImageParms.IsWrite = 2
		endif
	endif
	
																								//<End Main Body>
	
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
//	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
//	if (IsWindow(GraphStr))
//	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
	if (ImageParms.IsWrite)
		MacroImageInfo(ImageParms,Index=LoopIndex)
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageKillModule


Function/S ImageRestoreModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable MethodIndex = 0
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Restore"
		ParmStruct.Pict = "Restore"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Undo,Restore,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and restore it to a previous state.\r"
		ParmStruct.help += "Undo Last Step will only undo the last flatten or planefit.\r"
		//ParmStruct.help += "Undo Last type will undo all the last type of operation (planefits or flattens) that have been done.\r"
		ParmStruct.help += "Restore layer will bring the layer back to disk state.\r"
		ParmStruct.help += "Ultra Restore layer will bring the layer back to disk state and\rundo any modification done in the saving."
		
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = MethodIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Undo Last Flatten;Undo Last Planefit;Restore Layer;Ultra Restore Layer;"
		Argument.StrValue = "Restore Layer"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Degree of Restoration"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
//
//		
//		Index = ChannelIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "String"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = ""
//		Argument.StrValue = "Height"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Name"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument

		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
																									//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>
																								

	
																								//<Main Body>
	StrSwitch (ParmStruct.Argument[MethodIndex].StrValue)
		case "Undo Last Flatten":
			ARUndoLastFlatten(ImageParms.ImageWave,ImageParms.Layer)
			break
			
		case "Ultra Restore Layer":
		case "Restore Layer":
			if (IsWindow(GraphStr))
				//I need to set the layer first.
				ARrestore(GraphStr)
			else
				ARRestoreFunc(ImageParms.ImageWave,ImageParms.Layer)
			endif
			if (!StringMatch(ParmStruct.Argument[MethodIndex].StrValue,"Ultra*"))
				break
			endif
			
			ARUndoLastFlatten(ImageParms.ImageWave,ImageParms.Layer)
			//dont break
		case "Undo Last Planefit":
			ARUndoLastPlanefit(ImageParms.ImageWave,ImageParms.Layer)
			break
			
			
			
	endswitch
	
	
	
//	ARUltraRestore(GraphStr)
																								//<End Main Body>
	
	
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageRestoreModule


Function/S RoughnessModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable MaskIndex = 0
	Variable SkipIndex0 = 1
	Variable SkipIndex1 = 7
	Variable MaskSizeIndex = 2
	Variable MaskRatioIndex = 3
	Variable XOffsetIndex = 5
	Variable YOffsetIndex = 4
	Variable OutputIndex = 6
	Variable StorageIndex = 8
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Roughness"
		ParmStruct.Pict = "Roughness"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 9
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Analysis,roughness,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and Append the roughness parameters to the specified wave."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = MaskIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 1
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Make Box Mask"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument



		Index = SkipIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument

		Index = SkipIndex1
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument


		Index = MaskSizeIndex
		Argument.ParmName = "RoughMaskSize"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		ARMacroVarWave2Arg(Argument)
		Argument.High = 90e-6
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		Index = MaskRatioIndex
		Argument.ParmName = "RoughMaskRatio"
		Argument.Type = "Value"
		ARMacroVarWave2Arg(Argument)
		Argument.ColumnLabel = "Description"
		Argument.StrValue = GDS(Argument.ParmName)
		Argument.Type = "String"
		Argument.FuncName = "MMRoughnessFunc"
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		Index = YOffsetIndex
		Argument.ParmName = "RoughMaskYOffset"
		Argument.Type = "Value"
		ARMacroVarWave2Arg(Argument)
		Argument.FuncName = ""
		Argument.Low = -45e-6
		Argument.High = -Argument.Low
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		
		Index = XOffsetIndex
		Argument.ParmName = "RoughMaskXOffset"
		Argument.Type = "Value"
		ARMacroVarWave2Arg(Argument)
		Argument.FuncName = ""
		Argument.Low = -45e-6
		Argument.High = -Argument.Low
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument
		

		Index = OutputIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		Argument.StrList = "Full Image;Masked Image;Both;"
		Argument.StrValue = "Masked Image"
		Argument.Value = 1
		Argument.Type = "Popup"
		Argument.Title = "Store Roughness Values"
		
		ParmStruct.Argument[Index] = Argument

		Index = StorageIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		Argument.StrList = ""
		Argument.StrValue = "root:RoughnessValues"
		Argument.Value = 1
		Argument.Type = "String"
		Argument.Title = "Append Values to Wave:"
		
		ParmStruct.Argument[Index] = Argument

//
//		
//		Index = ChannelIndex
//		Argument.ParmName = "ModuleParm"+num2str(Index)
//		Argument.Type = "String"
//		Argument.ColumnLabel = "Description"
//		Argument.StrList = ""
//		Argument.StrValue = "Height"
//		Argument.Value = 0
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Channel Name"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument

		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
																								//<Main Body>
	if (ParmStruct.Argument[MaskIndex].Value)
		Variable BoxSize, XOffset, YOffset, BoxRatio, XSize, YSize, XBoxSize, YBoxSize
		
		XOffset = ParmStruct.Argument[XOffsetIndex].Value
		YOffset = ParmStruct.Argument[YOffsetIndex].Value
		BoxSize = ParmStruct.Argument[MaskSizeIndex].Value
		BoxRatio = str2num(StringFromList(0,ParmStruct.Argument[MaskRatioIndex].StrValue,":"))/str2num(StringFromList(1,ParmStruct.Argument[MaskRatioIndex].StrValue,":"))
		
		XBoxSize = BoxSize*Max(BoxRatio,1)
		YBoxSize = BoxSize*Max(1/BoxRatio,1)

		XSize = (DimSize(ImageParms.MaskWave,0)-0)*DimDelta(ImageParms.MaskWave,0)
		YSize = (DimSize(ImageParms.MaskWave,1)-0)*DimDelta(ImageParms.MaskWave,1)

		XOffset = Limit(XOffset,-(XSize-xBoxSize)/2,(xSize-XBoxSize)/2)
		YOffset = Limit(YOffset,-(YSize-yBoxSize)/2,(YSize-yBoxSize)/2)		
		ARboxMaskFunc(ImageParms.MaskWave,XOffset,YOffset,BoxSize,BoxRatio,XYOffsetIsFromCenter=true)
	endif
	
	Wave StorageWave = InitOrDefaultWave(ParmStruct.Argument[StorageIndex].StrValue,0)
	String ParmList = "V_npnts;V_avg;V_sdev;V_max;V_min;V_rms;V_adev;V_skew;V_kurt;percent;Area;AreaPercent;Volume;"
	Variable Nop = ItemsInList(ParmList,";")
	
	if (DimSize(StorageWave,0) < nop)
		Redimension/N=(nop,1) StorageWave
		SetDimLabel 1,0,$NameOfWave(ImageParms.ImageWave),StorageWave
	endif
	SetDimLabels(StorageWave,ParmList,0)
	Variable ImageIndex = FindDimLabel(StorageWave,1,NameOfWave(ImageParms.ImageWave))
	if (ImageIndex < 0)
		ImageIndex = DimSize(StorageWave,1)
		InsertPoints/M=1 ImageIndex,1,StorageWave
		SetDimLabel 1,ImageIndex,$NameOfWave(ImageParms.ImageWave),StorageWave
	endif
	Make/FREE/N=(Nop) MaskStats,FullStats
	SetDimLabels(MaskStats,ParmList,0)
	SetDimLabels(FullStats,ParmList,0)
	
	String DataType, Units
	DataType = GetDimLabel(ImageParms.ImageWave,2,ImageParms.Layer)

	Struct ARDataTypeInfo DataTypeStruct
	DataTypeStruct.GraphStr = ""
	Wave DataTypeStruct.DataWave = ImageParms.ImageWave
	Units = Get3DScaling(DataType,InfoStruct=DataTypeStruct)
	Variable/C VolumnScale, AreaScale
	AreaScale = ARRoughnessFunc(ImageParms.ImageWave,ImageParms.Layer,ImageParms.MaskWave,FullStats,MaskStats,DataType,Units,VolumnScale)
	
	
	//we don't have formating in our storage wave, so store in meter units
	if (!NumType(Real(VolumnScale)))
		FullStats[%Volume] /= real(VolumnScale)
	endif
	if (!NumType(Imag(VolumnScale)))
		MaskStats[%Volume] /= imag(VolumnScale)
	endif
	
	if (imag(AreaScale))
		MaskStats[%Area][0] /= imag(AreaScale)
	endif
	
	FullStats[%Area][0] /= Real(AreaScale)
	
	
	StrSwitch (ParmStruct.Argument[OutputIndex].StrValue)
		case "Both":
		case "Full Image":
			Index = FindDimLabel(StorageWave,2,"FullStats")
			if (Index < 0)
				Index = DimSize(StorageWave,2)
				if (Index == 0)
					Redimension/N=(-1,-1,1) StorageWave
				else
					InsertPoints/M=2 Index,1,StorageWave
				endif
				SetDimLabel 2,Index,FullStats,StorageWave
			endif
			
			
			StorageWave[0,nop-1][ImageIndex][Index] = FullStats[P]
			
		
			if (StringMatch(ParmStruct.Argument[OutputIndex].StrValue,"Full Image"))
				break
			endif
		case "Masked Image":
			
			Index = FindDimLabel(StorageWave,2,"MaskStats")
			if (Index < 0)
				Index = DimSize(StorageWave,2)
				if (Index == 0)
					Redimension/N=(-1,-1,1) StorageWave
				else
					InsertPoints/M=2 Index,1,StorageWave
				endif
				SetDimLabel 2,Index,MaskStats,StorageWave
			endif
			
			StorageWave[0,nop-1][ImageIndex][Index] = MaskStats[P]
			break
	endswitch
	
	
																								//<End Main Body>
	
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
		UpdateImageMask(GraphStr)
	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //RoughnessModule


Function/S ImageSectionModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable StartIndex = 0
	Variable SkipIndex0 = 1
	Variable DoEndIndex = 2
	Variable EndIndex = 3
	Variable StorageIndex = 4
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Section"
		ParmStruct.Pict = "ImageSection"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 5
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Analyze,Section,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and extract a section from it.\r"
		ParmStruct.help += "Inside an Image loop, it will interpolate between the\rstarting section and ending section.\r"
		ParmStruct.help += "The Section is appended to the output wave."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = StartIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "MMSectionList(\"\")"
		Argument.StrValue = StringFromList(0,MMSectionList(""),";")
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Starting Section"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = SkipIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument


		Index = DoEndIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Use End Section"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		Index = EndIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "MMSectionList(\"\")"
		Argument.StrValue = StringFromList(1,MMSectionList(""),";")
		Argument.Value = 1
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Ending Section"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		

		Index = StorageIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		
		Argument.StrList = ""
		Argument.StrValue = "root:SectionValues"
		Argument.Value = 1
		Argument.Type = "String"
		Argument.Title = "Append Values to Wave:"
		
		ParmStruct.Argument[Index] = Argument


		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
																								//<Main Body>
																								
	//****************************************************				Wave Keeping
	Wave/Z StartSectionY = $""
	Wave/Z StartSectionX = $""
	Wave/Z EndSectionY = $""
	Wave/Z EndSectionX = $""
	Variable MacroIndex = GV("MacroCurrentStep")
	Wave/T MacroData = $GetDF("Macro")+"MacroData"
	String ExtraData = MacroData[MacroIndex]
	String SavedDataFolder = GetDataFolder(1)
	String TempName
	Variable DoInterp = 0, LoopCounter, dX0, dY0, dX1, dY1
	Struct SectionParmsStruct SectionParms
	Struct SectionParmsStruct EndSectionParms


	if (!Strlen(ExtraData) || IsNan(NumberByKey("StoreSectionWaves",ExtraData,cMacroKey0,cMacroSep0,0)))		//first time in, we need to set this.
		Wave/Z StartSectionY = $MMSectionList(ParmStruct.Argument[StartIndex].StrValue)
		Wave/Z EndSectionY = $MMSectionList(ParmStruct.Argument[EndIndex].StrValue)
		if (!Isnan(ImageParms.LoopCounter))
			SetDataFolder(BuildDataFolder(GetDF("Temp")))
		endif
		
		//Start Section Block
		if (WaveExists(StartSectionY))
			TempName = GetWavesDataFolder(StartSectionY,2)
			TempName[Strlen(Tempname)-1,Strlen(Tempname)-1] = "X"
			Wave/Z StartSectionX = $TempName
		endif
		if (WaveExists(StartSectionY) && !IsNan(ImageParms.LoopCounter))
			TempName = UniqueName(GetFuncName()+"TempWave", 1, 0)		//make a copy of the wave for use later.
			Duplicate StartSectionY,$TempName
			Wave StartSectionY = $TempName
		endif
		if (WaveExists(StartSectionX))
			TempName = UniqueName(GetFuncName()+"TempWave", 1, 0)		//make a copy of the wave for use later.
			Duplicate StartSectionX,$TempName
			Wave StartSectionX = $TempName
		endif
		
		//End Section block
		if (WaveExists(EndSectionY))
			TempName = GetWavesDataFolder(EndSectionY,2)
			TempName[Strlen(Tempname)-1,Strlen(Tempname)-1] = "X"
			Wave/Z EndSectionX = $TempName
		endif
		if (WaveExists(EndSectionY) && !IsNan(ImageParms.LoopCounter))
			TempName = UniqueName(GetFuncName()+"TempWave", 1, 0)
			Duplicate EndSectionY,$TempName
			Wave EndSectionY = $TempName
		endif
		if (WaveExists(EndSectionX))
			TempName = UniqueName(GetFuncName()+"TempWave", 1, 0)		//make a copy of the wave for use later.
			Duplicate EndSectionX,$TempName
			Wave EndSectionX = $TempName
		endif
		SetDataFolder(SavedDataFolder)
		
		ExtraData = ReplaceWaveByKey("StartSectionY",ExtraData,StartSectionY,cMacroKey0,cMacroSep0,0)
		ExtraData = ReplaceWaveByKey("StartSectionX",ExtraData,StartSectionY,cMacroKey0,cMacroSep0,0)
		ExtraData = ReplaceWaveByKey("EndSectionY",ExtraData,EndSectionY,cMacroKey0,cMacroSep0,0)
		ExtraData = ReplaceWaveByKey("EndSectionX",ExtraData,EndSectionX,cMacroKey0,cMacroSep0,0)
		ExtraData = ReplaceNumberByKey("StoreSectionWaves",ExtraData,1,cMacroKey0,cMacroSep0,0)
		
		
		if (!IsNan(ImageParms.LoopCounter) && ParmStruct.Argument[DoEndIndex].Value && WaveExists(EndSectionY) && WaveExists(EndSectionX))
			ExtraData = ReplaceNumberByKey("DoInterp",ExtraData,1,cMacroKey0,cMacroSep0,0)
			StructGet/S EndSectionParms,Note(EndSectionY)
			StructGet/S SectionParms,Note(StartSectionY)
			ExtraData = ReplaceNumberByKey("LoopCounter",ExtraData,1,cMacroKey0,cMacroSep0,0)
			dY0 = (EndSectionparms.YStart-SectionParms.YStart)/(ImageParms.LoopLimit[1]-ImageParms.LoopLimit[0]-1)
			dX0 = (EndSectionparms.XStart-SectionParms.XStart)/(ImageParms.LoopLimit[1]-ImageParms.LoopLimit[0]-1)
			dY1 = (EndSectionparms.YStop-SectionParms.YStop)/(ImageParms.LoopLimit[1]-ImageParms.LoopLimit[0]-1)
			dX1 = (EndSectionparms.XStop-SectionParms.XStop)/(ImageParms.LoopLimit[1]-ImageParms.LoopLimit[0]-1)

			ExtraData = ReplaceNumberByKey("dX0",ExtraData,dX0,cMacroKey0,cMacroSep0,0)
			ExtraData = ReplaceNumberByKey("dY0",ExtraData,dY0,cMacroKey0,cMacroSep0,0)
			ExtraData = ReplaceNumberByKey("dX1",ExtraData,dX1,cMacroKey0,cMacroSep0,0)
			ExtraData = ReplaceNumberByKey("dY1",ExtraData,dY1,cMacroKey0,cMacroSep0,0)
		else
			ExtraData = ReplaceNumberByKey("DoInterp",ExtraData,0,cMacroKey0,cMacroSep0,0)
		endif
		
		
	else
		Wave/Z StartSectionY = $StringByKey("StartSectionY",ExtraData,cMacroKey0,cMacroSep0,0)
		Wave/Z StartSectionX = $StringByKey("StartSectionX",ExtraData,cMacroKey0,cMacroSep0,0)
		Wave/Z EndSectionY = $StringByKey("EndSectionY",ExtraData,cMacroKey0,cMacroSep0,0)
		Wave/Z EndSectionX = $StringByKey("EndSectionX",ExtraData,cMacroKey0,cMacroSep0,0)
		if (!WaveExists(StartSectionY))
			Wave/Z StartSectionY = $MMSectionList(ParmStruct.Argument[StartIndex].StrValue)		//try and find the original
			if (WaveExists(StartSectionY) || !WaveExists(StartSectionX))
				TempName = GetWavesDataFolder(StartSectionY,2)
				TempName[Strlen(Tempname)-1,Strlen(Tempname)-1] = "X"
				Wave/Z StartSectionX = $TempName
			endif
		endif
		DoInterp = NumberByKey("DoInterp",ExtraData,cMacroKey0,cMacroSep0,0)
		LoopCounter = NumberByKey("LoopCounter",ExtraData,cMacroKey0,cMacroSep0,0)
		dX0 = NumberByKey("dX0",ExtraData,cMacroKey0,cMacroSep0,0)
		dY0 = NumberByKey("dY0",ExtraData,cMacroKey0,cMacroSep0,0)
		dX1 = NumberByKey("dX1",ExtraData,cMacroKey0,cMacroSep0,0)
		dY1 = NumberByKey("dY1",ExtraData,cMacroKey0,cMacroSep0,0)

		ExtraData = ReplaceNumberByKey("LoopCounter",ExtraData,LoopCounter+1,cMacroKey0,cMacroSep0,0)
		
	endif
	MacroData[MacroIndex] = ExtraData
	
	
	if (!WaveExists(StartSectionY) || !WaveExists(StartSectionX))
		print "Lost first section Wave, Skipping "+NameOfWave(ImageParms.ImageWave)
		DoWindow/H
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif

	//***********************************************************Interpolate between start and end
		
		
		
	StructGet/S SectionParms,Note(StartSectionY)
	if (DoInterp)
		if (SectionParms.ProfileMode)		//freehand
			SectionParms.XStart += dX0*LoopCounter
			SectionParms.YStart += dY0*LoopCounter
		else
			SectionParms.XStart += dX0*LoopCounter
			SectionParms.YStart += dY0*LoopCounter
			SectionParms.XStop += dX1*LoopCounter
			SectionParms.YStop += dY1*LoopCounter
			
		endif
	endif

	//***********************************************************Set parameters to call SectionEngine
	Make/FREE/N=(0) SectionWave,SectionWaveX,XBox,Ybox

	SectionParms.Layer = ImageParms.Layer
	SectionParms.UseAngle = 0
	TempName = ""
	StructPut/S SectionParms,TempName
	Duplicate/FREE StartSectionX,SecX
	Duplicate/FREE StartSectionY,SecY		//the section engine corrupts these waves
	Note/K SecY
	Note SecY,TempName
	SectionEngine(SecX,SecY,ImageParms.ImageWave,SectionWave,SectionWaveX,XBox,YBox)

	
	//*****************************************************************************Store the output
	String ImageName = NameOfWave(ImageParms.ImageWave)
	Variable OutputWaveIndex = -1

	Wave/Z outputWave = $ParmStruct.Argument[StorageIndex].StrValue
	if (!WaveExists(outputWave) || (Dimsize(outputWave,0) == 0))
		OutputWaveIndex = 0
		Make/O/N=(DimSize(SectionWave,0),1) $ParmStruct.Argument[StorageIndex].StrValue
		Wave outputWave = $ParmStruct.Argument[StorageIndex].StrValue
		SetDimLabel 1,OutputWaveIndex,$ImageName,OutputWave
		SetScale d,0,0,WaveUnits(SectionWave,-1),OutputWave
		SetScale/I x,0,WaveMax(SectionWaveX),"m",outputWave
	else
		OutputWaveIndex = FindDimLabel(OutputWave,1,ImageName)
		if (OutputWaveIndex < 0)
			OutputWaveIndex = DimSize(OutputWave,1)
			InsertPoints/M=1 outputWaveIndex,1,OutputWave
			OutputWave[][OutputWaveIndex] = Nan
			SetDimLabel 1,OutputWaveIndex,$ImageName,OutputWave
		endif
		if ((Max(DimSize(SectionWave,0),Dimsize(OutputWave,0))-1)*DimDelta(OutputWave,0) != WaveMax(SectionWaveX))
			SetScale/P x,0,1,"",outputWave
		endif
	endif



	Variable OutputWaveSize = DimSize(outputWave,0)
	if (DimSize(SectionWave,0) > outputWaveSize)
		InsertPoints/M=0 OutputWaveSize,DimSize(SectionWave,0) - outputWaveSize,OutputWave
		OutputWave[outputWaveSize,DimSize(outputWave,0)-1][] = Nan
	endif
	
	OutputWave[0,DimSize(SectionWave,0)-1][outputWaveIndex] = SectionWave[P]
	
	
	
																								//<End Main Body>
	
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageSectionModule


Function/S ImageFilterModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable FilterIndex = 0
	Variable SizeIndex = 1
	Variable PassesIndex = 2
	Variable ModLayerIndex = 3
		
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Filter"
		ParmStruct.Pict = "Filter"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 4
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Modify,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and apply a matrix filter to it\r"
		ParmStruct.Help += "The Size only applies to median,avg,gauss,min,max,NaNZapMedian\r"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = FilterIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "median;avg;gauss;min;max;NaNZapMedian;SurfaceAngles;Median3x1;FindEdges;Point;Sharpen;SharpenMore;gradN;gradNW;gradW;gradSW;gradS;gradSE;gradE;gradNE;"
		Argument.StrValue = "median"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Filter:"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument



		Index = SizeIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.Low = 2
		Argument.High = 100
		Argument.Value = 3
		Argument.Title = "Size"
		Argument.FormatStr = "%d"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument

		Index = PassesIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Low = 1
		Argument.Value = 1
		Argument.Title = "Passes"
		ParmStruct.Argument[Index] = Argument




		Index = ModLayerIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.StrList = "Overwrite Orginal Layer;Mod Layer;"
		Argument.StrValue = "Mod Layer"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Output"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	
	
									 															//<Main Body>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
	
	String TempFolder = GetDF("ImageDataRoot")
	if (StringMatch(ParmStruct.Argument[ModLayerIndex].StrValue,"Mod Layer"))
		Layer = ImageParms.Layer
		InsertModLayer(GraphStr,ImageWave,Layer,AllowDialogs=false)
		if (Layer != ImageParms.Layer)
			ImageParms.Layer = Layer
			ImageParms.IsWrite = 1
			if (WaveExists(ImageParms.MaskWave))		//this may or may not have been done by InsertModLayer, lets make sure it is.
				Duplicate/O ImageParms.MaskWave $TempFolder+NameOfWave(ImageParms.ImageWave)+"Mask"+num2str(Layer)
				Wave ImageParms.MaskWave = $TempFolder+NameOfWave(ImageParms.ImageWave)+"Mask"+num2str(Layer)
			endif
		endif
		
	endif
	
	ARFilterFunc(ImageParms.ImageWave,ImageParms.Layer,ImageParms.MaskWave,ParmStruct.Argument[FilterIndex].StrValue,ParmStruct.Argument[passesIndex].Value,ParmStruct.Argument[SizeIndex].Value,$"")
																								//<End Main Body>
	
	
																								//<Update Graph>
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:
	if (ImageParms.IsWrite)	
		MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageFilterModule


Function/S ImageScaleModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable ScaleMethodIndex = 0
	Variable ScaleValueIndex = 1
	Variable OffsetMethodIndex = 2
	Variable OffsetValueIndex = 3
	Variable AutoMethodIndex = 4
	Variable ColorTableIndex = 6
	Variable SkipIndex0 = 5
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Display Range and Offset"
		ParmStruct.Pict = "ImageColor"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 7
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and Set the Color Scale and offset for the currently set layer.\rIf the Change Display Scale is set to auto, the display scale value is ignored.\rSame thing with the offset."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = ScaleMethodIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Don't Change;Set to value;Auto;"
		Argument.StrValue = "Auto"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Change Display Scale"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = ScaleValueIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 10e-9
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Display Scale"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = OffsetMethodIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Don't Change;Set to value;Auto;"
		Argument.StrValue = "Auto"
		Argument.Value = 2
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Change Display Offset"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		


		Index = OffsetValueIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Display Offset"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		
		Index = ColorTableIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "GetMBColorMapList()"
		Argument.StrValue = "Don't Change"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Color Map"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


		Index = SkipIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument

		
		Index = AutoMethodIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Popup"
		Argument.ColumnLabel = "Description"
		Argument.StrList = "Entire Image;Masked Image;"
		Argument.StrValue = "Entire Image"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Auto Method"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument



		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	ARMacroString2Struct(ParmStruct,ParmStr)

	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)
	if (!WaveExists(ImageParms.ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	Wave/Z ColorTableLock = OpticalColorTableManager(ImageParms.ImageWave,ImageParms.Layer,Get=1)
	if (WaveExists(ColorTableLock))
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(output)
	endif

	
	
	
																								//<Main Body>
																								
	Wave/Z MaskWave = $""
	if (StringMatch(ParmStruct.Argument[AutoMethodIndex].StrValue,"*Mask*"))
		Wave MaskWave = ImageParms.MaskWave
	endif
																								
	Variable Range, Offset
	String ColorMap = "", NameVar
	if (stringMatch(ParmStruct.Argument[ScaleMethodIndex].StrValue+ParmStruct.Argument[OffsetMethodIndex].StrValue,"*Auto*"))
		CalcRangeandOffset(ImageParms.ImageWave,ImageParms.Layer,Range,Offset,Mask=MaskWave)
	endif
	
	
	StrSwitch (ParmStruct.Argument[ScaleMethodIndex].StrValue)
		case "Auto":
			break
			
		case "Set to Value":
			Range = ParmStruct.Argument[ScaleValueIndex].Value
			break
			
		case "Don't Change":
			Range = Nan
			break
			
	endswitch
	
	
	StrSwitch (ParmStruct.Argument[OffsetMethodIndex].StrValue)
		case "Auto":
			break
			
		case "Set to Value":
			Offset = ParmStruct.Argument[OffsetValueIndex].Value
			break
			
		case "Don't Change":
			Offset = Nan
			break
			
	endswitch
	
	if (!StringMatch(ParmStruct.Argument[ColorTableIndex].StrValue,"Don't Change"))
		ColorMap = ParmStruct.Argument[ColorTableIndex].StrValue
	endif
																								//<End Main Body>
//print Range,Offset,ColorMap
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageParms.ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
		Index = GetLocalDisplayIndex(graphStr)
		if (Strlen(ColorMap))
			Wave/T DisplayGraphTextData = $GetDF("ImageDataRoot")+"DisplayGraphTextData"
			DisplayGraphTextData[Index][%ColorMap] = ColorMap
			PopupMenu $"ColorMapPop",win=$GraphStr,mode=WhichListItem(ColorMap,GetColorMapList(),";",0,0)+1
		endif

		if (!Isnan(Range))
			NameVar = UnitsGraphCalcFunc("RangeSetVar",Range,"",Index)		//this calculates any typed in units and also returns the new varNum
			RangeandOffsetSetVarSubFunc(Index,graphStr,Range,NameVar)
		endif
		if (!Isnan(Offset))
			NameVar = UnitsGraphCalcFunc("OffsetSetVar",Offset,"",Index)		//this calculates any typed in units and also returns the new varNum
			RangeandOffsetSetVarSubFunc(Index,graphStr,Offset,NameVar)
		endif
		SetGlobalRangeandOffset()

	else
		RangeAndOffsetNoteFunc(ImageParms.ImageWave,ImageParms.Layer,Range,Offset,ColorMap)
	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageScaleModule


Function/S ImageHistModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable StorageIndex = 8
	Variable SkipIndex0 = 0
	Variable SkipIndex1 = 1
	Variable SkipIndex2 = 3
	Variable SkipIndex3 = 7
	Variable NumberIndex = 2
	Variable UseMaskIndex = 6
	Variable MinIndex = 4
	Variable MaxIndex = 5
	
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Histogram Module"
		ParmStruct.Pict = "ImageHist"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 9
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Analyze,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and Append the current layer to a 2D histogram.\r"
		ParmStruct.help += "The number of bins will be the default (will not change an existing histogram wave).\r"
		ParmStruct.Help += "If Min and Max are -inf or inf, they will be set to include the full range of the first image they process.\r"
		ParmStruct.Help += "Exclude Mask Points is just like the histogram panel"
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	

		Index = StorageIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "String"
		Argument.ColumnLabel = "Description"
		Argument.StrList = ""
		Argument.StrValue = "root:HistogramWave"
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Append Histograms to wave"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		
		Index = SkipIndex0
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Skip"
		ParmStruct.Argument[Index] = Argument

		Index = SkipIndex1
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument

		Index = SkipIndex2
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument

		Index = SkipIndex3
		Argument.ParmName = "ModuleParm"+num2str(Index)
		ParmStruct.Argument[Index] = Argument

		Index = NumberIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.Value = 256
		Argument.Units = 1
		Argument.Low = 3
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.0f"
		Argument.UnitString = ""
		Argument.Title = "# Bins"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = MinIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.Value = nan
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Min Data Value"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
	
		Index = MaxIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Value"
		Argument.Value = nan
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Max Data Value"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
		Index = UseMaskIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.Type = "Checkbox"
		Wave PanelParms = $GetDF("Windows")+"HistogramPanelParms"
		Argument.Value = GV("HistogramUseMask")
		
		Argument.Title = "Exclude Mask points"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
		
	
	

		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	
	

																								//<Main Body>
	
	Wave StorageWave = InitOrDefaultWave(ParmStruct.Argument[StorageIndex].StrValue,0)
	Variable Nop = DimSize(StorageWave,0)
	Variable ImageIndex
	if (!nop)
		nop = ParmStruct.Argument[NumberIndex].Value
		Redimension/N=(nop,1) StorageWave
		ImageIndex = 0
		SetDimLabel 1,ImageIndex,$NameOfWave(ImageParms.ImageWave),StorageWave
	else
		ImageIndex = FindDimLabel(StorageWave,1,NameOfWave(ImageParms.ImageWave))
		if (ImageIndex < 0)
			ImageIndex = DimSize(StorageWave,1)
			InsertPoints/M=1 ImageIndex,1,StorageWave
			SetDimLabel 1,ImageIndex,$NameOfWave(ImageParms.ImageWave),StorageWave
		endif
	endif
	
	Make/FREE/N=(nop) HistWave
	
	Duplicate/FREE/R=[][][ImageParms.Layer,ImageParms.Layer] ImageParms.ImageWave,LayerWave
	
	
	Variable UseMask = ParmStruct.Argument[UseMaskIndex].Value
	if (UseMask)	
		if (Sum(ImageParms.MaskWave,-inf,inf) < numpnts(ImageParms.MaskWave))	//this means we will actually do some work
			//ok, to try and go faster, we are going to substitude
			//nans in the data based on the mask
			LayerWave = ImageParms.MaskWave[P][Q] ? LayerWave[P][Q] : Nan
			//OK, now we have the speed we should have.
		endif
	endif
	
	
	
	Variable MacroIndex = GV("MacroCurrentStep")
	Wave/T MacroData = $GetDF("Macro")+"MacroData"
	String ExtraData = MacroData[MacroIndex]
	
	Variable MinValue = Nan
	Variable MaxValue = Nan
	Variable UpdateData = 0
	if (numtype(ParmStruct.Argument[MinIndex].Value))
		MinValue = NumberByKey(ExtraData,"MinValue",cMacroKey0,cMacroSep0,0)
		if (IsNan(MinValue))
			MinValue = WaveMin(LayerWave)
			ExtraData = ReplaceNumberByKey("MinValue",ExtraData,MaxValue,cMacroKey0,cMacroSep0,0)
			UpdateData = 1
		endif
	else
		MinValue = ParmStruct.Argument[MinIndex].Value
	endif
	
	if (numtype(ParmStruct.Argument[MaxIndex].Value))
		MaxValue = NumberByKey(ExtraData,"MaxValue",cMacroKey0,cMacroSep0,0)
		if (IsNan(MaxValue))
			MaxValue = WaveMax(LayerWave)
			ExtraData = ReplaceNumberByKey("MaxValue",ExtraData,MaxValue,cMacroKey0,cMacroSep0,0)
			UpdateData = 1
		endif
	else
		MaxValue = ParmStruct.Argument[MaxIndex].Value
	endif
	
	if (UpdateData)
		MacroData[MacroIndex] = ExtraData
	endif
	
	
	
	
	
	Histogram/B={MinValue,(MaxValue-MinValue)/(nop-1),nop}/C LayerWave,HistWave


	Struct ARDataTypeInfo InfoStruct
	InfoStruct.GraphStr = ""
	Wave InfoStruct.DataWave = ImageParms.ImageWave
	String Units = Get3DScaling(GetDimLabel(ImageParms.ImageWave,2,ImageParms.Layer),InfoStruct=InfoStruct)

	if (!strlen(Units))
		Units = WaveUnits(ImageParms.ImageWave,1)
	endif
	
	SetScale/P x, DimOffset(HistWave,0), DimDelta(HistWave,0), Units, HistWave,StorageWave
	
	
	
	StorageWave[][ImageIndex] = HistWave[P]
	
	
	
																								//<End Main Body>
	
	
																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
//	ImageParms.IsWrite = 1		//tell the function we are writing this structure
//	MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImageHistModule


Function/S ImagePlaneSubModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	Variable Index
	Variable PasteIndex = 0
	
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Image Plane Subtract"
		ParmStruct.Pict = "ImageSub"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 1
		ParmStruct.Type = "Offline"
		ParmStruct.KeyWords = "ImageProcessing,Modify,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "This will take the Image set by the Image loop module, or the topmost Image and subtract a previously defined plane from it."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = PasteIndex
		Argument.ParmName = "ModuleParm"+num2str(Index)
		Argument.ParmName = "ARDoIVCycles"
		Argument.Type = "Value"
		Argument.ColumnLabel = ""
		Argument.Title = "Which ClipBoard"
		Argument.StrValue = ""
		Argument.StrList = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = 0
		Argument.High = 300
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = "%.0f"
		Argument.UnitString = ""
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument


	
		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	Struct MacroImageStruct ImageParms
	MacroImageInfo(ImageParms)

	ARMacroString2Struct(ParmStruct,ParmStr)
	Variable Layer
	Wave/Z ImageWave = ImageParms.ImageWave
	if (!WaveExists(ImageWave))
		OfflineMacroMessageFunc(ImageParms.RunMode,ParmStruct.CallbackName)
		return(output)
	endif
	if (ARLockDownImageMod(ImageWave))
		execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
		return(Output)
	endif

																								//<Update Graph>
	//if we need to work on the topmost display of the image, here is the graph:	
	String GraphStr = StringFromList(0,WinList(cOfflineBaseName+"*"+NameOfWave(ImageWave),";","WIN:1"),";")
	if (IsWindow(GraphStr))
	endif
																								//<End Update Graph>

	
																								//<Main Body>



		Wave/Z ClipBoard = $"Root:Images:Planes:ClipBoard"+num2str(ParmStruct.Argument[PasteIndex].Value)
		if (WaveExists(ClipBoard))
			MultiThreadFixer()
			MultiThread ImageWave[][][ImageParms.Layer] -= poly2D(ClipBoard,X,Y)
			UpdatePlanefitNote(ImageParms.ImageWave,ImageParms.Layer,ClipBoard)
			if (IsWindow(GraphStr))
				UpdateModifiedImageAnalysis(GraphStr)	
				ForceOfflineActivateHook(GraphStr)
			endif
			UpdateNavData(ImageParms.ImageWave,ImageParms.Layer)
		endif


	
																								//<End Main Body>
	
	
																								
																								
	//if we needed to write back the ImageParms structure, this is how:	
	if (ImageParms.IsWrite)
		MacroImageInfo(ImageParms,Index=FindMacroLoopIndex(GV("MacroCurrentStep"),"(?i)^(ImageLoop|ARISLoop)$",IsRegEx=True))
	endif
	
	//if your function is synchronous [compleats all work in this function, and does not need a callback]
	//then you should enable the following line:
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	
	
	return(output)
End //ImagePlaneSubModule


Function/S VideoModule(ParmStr)
	String ParmStr
	
	String output = ""
	
	Variable Index
	Variable SaveMemIndex = 0
	Variable SaveDiskIndex = 1
	Variable FormatIndex = 2
	Variable BaseNameIndex = 3
	Variable SuffixIndex = 4
	Struct ARMacroStruct ParmStruct
	Struct ARMacroParmStruct Argument
	if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],"Info*"))
		ParmStruct.Name = "Video Capture"
		ParmStruct.Pict = "Video"		//some generic 50x50 picture.
		ParmStruct.FuncName = GetFuncName()
		ParmStruct.CallbackName = "None"		//Name of the UserCallback that will trigger the next step.
		ParmStruct.NumParms = 2
		ParmStruct.Type = "RealTime"
		ParmStruct.KeyWords = "Video,Capture,"
		ParmStruct.Requires = ""		//works on all systems.
		ParmStruct.help = "Clicks on the video Capture button for you.\rIf you are saving to disk, and have not set the video path it saves to the AFM image folder."
		if (StringMatch(ParmStr[0,strlen(cMacroShort)-1],cMacroShort))
			ParmStruct.NumParms = 0
			output = ARMacroStruct2String(ParmStruct)
			return(Output)
		endif
	
		Index = SaveMemIndex
		Argument.ParmName = "ARVSave2Mem"
		Argument.Type = "Checkbox"
		Argument.ColumnLabel = ""
		Argument.StrList = ""
		Argument.StrValue = ""
		Argument.Value = 0
		Argument.Units = 1
		Argument.Low = -inf
		Argument.High = inf
		Argument.MinUnits = 1
		Argument.StepSize = 1
		
		Argument.FormatStr = ""
		Argument.UnitString = ""
		Argument.Title = "Save to Memory"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument
	
		Index = SaveDiskIndex
		Argument.ParmName = "ARVSave2Disk"
		Argument.Title = "Save to Disk"
		Argument.FuncName = ""
		ParmStruct.Argument[Index] = Argument



//		Index = FormatIndex
//		Argument.ParmName = "ARVSaveFormat"
//		Argument.Type = "Popup"
//		Argument.ColumnLabel = ""
//		Argument.StrList = GFS(Argument.ParmName)
//		Argument.StrValue = GTS(Argument.ParmName)
//		Argument.Value = GV(Argument.ParmName)
//		Argument.Units = 1
//		Argument.Low = -inf
//		Argument.High = inf
//		Argument.MinUnits = 1
//		Argument.StepSize = 1
//		
//		Argument.FormatStr = ""
//		Argument.UnitString = ""
//		Argument.Title = "Save2Disk Format"
//		Argument.FuncName = ""
//		ParmStruct.Argument[Index] = Argument




		output = ARMacroStruct2String(ParmStruct)
		return(Output)
	endif
	//we are passed all the parms we need.
	//convert them to a structure for use.
	
	ARMacroString2Struct(ParmStruct,ParmStr)
	
	Variable SaveBit = ParmStruct.Argument[SaveMemIndex].Value + ParmStruct.Argument[SaveDiskIndex].Value*2
	String PName = VideoPath()
	if ((SaveBit & 0x2) && !SafePathInfo(PName))
		NewPath/O/Q/Z $PName GS("SaveImage")
	endif
	
	
	PV("MacroIsRunning",1)		//hack it in, this is safety to make sure the suffix conflict never gives up a dialog
	ARVideoButtonFunc("ARVCaptureButton")
	
	
	execute/P/Q/Z "ARCallbackFunc(\""+ParmStruct.CallbackName+"\")"
	if (SaveBit)
		
	endif
	
	return(output)
End //VideoModule

Function CalcAMFMStiffness(RowIndex,ColIndex)
	Variable RowIndex
	Variable ColIndex
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Stiffness",RowIndex=RowIndex,ColIndex=ColIndex)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
	return(sAMFMCalc.PointOutput)
End //CalcAMFMStiffness

Function	CalcAMFMIndentation(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Indentation",RowIndex=RowIndex,ColIndex=ColIndex)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
	return(sAMFMCalc.PointOutput)
End //CalcAMFMIndentation

Function	CalcAMFMElasticity(RowIndex,ColIndex)
	Variable RowIndex, ColIndex
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Elasticity",RowIndex=RowIndex,ColIndex=ColIndex)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
	return(sAMFMCalc.PointOutput)
End //CalcAMFMElasticity

//Static Function CalcRoger(RowIndex,ColIndex,IsIndent)//this calculates indentation or elasticity
//	Variable RowIndex, ColIndex
//	Variable IsIndent
//	
//	
//	Variable IsImage = ColIndex >= 0		//image or force curve
//	
//	String DataFolder = GetDF("Variables")
//	Wave FMVW = $cFMVW
//	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave MVW = $DataFolder+"MasterVariablesWave"
//	Wave/T FMVD = Var2Desc(FMVW)
//
//	
//	if (!IsImage)
//		ColIndex = 0
//	endif
//	
//	//if aren't in dual AC mode, or if we don't have a tip geometry, or if we don't have the CalcPixelWidth function, then abort
//	if (!TVW[%DualACMode][0] || (FindDimLabel(FMVD,0,"AMFMTipGeo") < 0) || ARCheckFuncRef("CalcPixelWidth","AMFMCalcKc"))
//		return(0)
//	endif
//	
//	Wave Amplitude = GetRTUserCalculatedData("Amplitude",IsImage)
//	Wave Phase = GetRTUserCalculatedData("Phase",IsImage)
//	Wave Frequency = GetRTUserCalculatedData("Frequency",IsImage)
//	if ((RowIndex >= DimSize(Frequency,0)) || (IsImage && (ColIndex >= DimSize(Frequency,1))))
//		return(0)			//error
//	endif
//
//	Variable DriveFreq0, DriveFreq2, SpringConstant0, SpringConstant2, QFactor, Freq0
//	String Geometry
//	Variable TipParm, output, AmpInvols = 1
//	SpringConstant0 = MVW[%SpringConstant][0]
////	SpringConstant2 = FMVW[%AMFMKc][0]
//	DriveFreq0 = TVW[%ResFreq1][0]
//	DriveFreq2 = TVW[%ResFreq2][0]
//	Variable RealDriveFreq2 = 0
//	if (IsImage)
//		//force plots are scaled before they call the user calc functions
//		//so we don't have to do these scales
//		RealDriveFreq2 = MVW[%DriveFrequency1][0]
//		AmpInvols = MVW[%AmpInvols][0]
//	endif
//	QFactor = TVW[%LossTanQ1][0]
//	Geometry = FMVD[%AMFMTipGeo][%Title]
//	FuncRef CalcPixelWidth CalcFunc=$"AMFMCalcKc"
//	SpringConstant2 = CalcFunc(DriveFreq0,DriveFreq2,SpringConstant0)
//	Freq0 = ConvertPhase2Freq(Phase[RowIndex][ColIndex],DriveFreq0,QFactor)	//calculate first frequency from the phase
//	if (IsIndent)			//indentation
//		FuncRef IndentationRogerPunch IndentFunc=$"IndentationRoger"+Geometry		//do some math vvvv
//		output = IndentFunc(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex]-(DriveFreq2-RealDriveFreq2))
////		StrSwitch (Geometry)		//cant funcref statics...
////			case "Punch":
////				output = IndentationRogerPunch(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex])
////				break
////				
////			case "Sphere":
////				output = IndentationRogerSphere(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex])
////				break
////				
////			case "Cone":
////				output = IndentationRogerCone(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex])
////				break
////				
////			Default:
////				output = 0
////				break
////				
////		endswitch
//	else						//elasticity
//		TipParm = FMVW[%$"AMFM"+Geometry+"Parm"][0]
//		FuncRef ElasticRogerPunch ElasticFunc=$"ElasticRoger"+Geometry
//		output = ElasticFunc(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex]-(DriveFreq2-RealDriveFreq2),TipParm)
////		StrSwitch (Geometry)		//cant funcref statics...
////			case "Punch":
////				output = ElasticRogerPunch(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex],TipParm)
////				break
////				
////			case "Sphere":
////				output = ElasticRogerSphere(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex],TipParm)
////				break
////				
////			case "Cone":
////				output = ElasticRogerCone(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex],TipParm)
////				break
////				
////			Default:
////				output = 0
////				break
////				
////		endswitch
//	endif
//
//	return(output)
//End //CalcRoger

Function CalcAMFMIndentationWave(OutputWave,StartLine,FinishLine)
	Wave/Z OutputWave
	Variable StartLine
	Variable FinishLine
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Indentation",OutputWave=OutputWave,StartLine=StartLine,FinishLine=FinishLine)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
End //CalcAMFMIndentationWave

Function CalcAMFMElasticityWave(OutputWave,StartLine,FinishLine)
	Wave/Z OutputWave
	Variable StartLine
	Variable FinishLine
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Elasticity",OutputWave=OutputWave,StartLine=StartLine,FinishLine=FinishLine)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
End //CalcAMFMElasticityWave

Function CalcAMFMStiffnessWave(OutputWave,StartLine,FinishLine)
	Wave/Z OutputWave
	Variable StartLine
	Variable FinishLine
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Stiffness",OutputWave=OutputWave,StartLine=StartLine,FinishLine=FinishLine)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
End //CalcAMFMStiffnessWave

Function CalcLossTan1Wave(OutputWave,StartLine,FinishLine)
	Wave/Z OutputWave
	Variable StartLine
	Variable FinishLine
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"LossTangent1",OutputWave=OutputWave,StartLine=StartLine,FinishLine=FinishLine)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
	return(0)
End //CalcLossTan1Wave

Function CalcStiffnessWave(OutputWave,StartLine,FinishLine)
	Wave/Z OutputWave
	Variable StartLine
	Variable FinishLine
	
	STRUCT sAMFMCalc sAMFMCalc
	sAMFMCalc.InitRT(sAMFMCalc,"Stiffness",OutputWave=OutputWave,StartLine=StartLine,FinishLine=FinishLine)
	sAMFMCalc.CalcAMFMChannel(sAMFMCalc)
	
	return(0)
End //CalcStiffnessWave

//wave type user calc functions are for images only currently
//function CalcRogerWave(OutputWave,startLine,finishLine,isIndent)		//this is a wave type user calc function, with an extra switch so it needs a front end 
//	wave OutputWave				//the wave that we will fill with data
//	variable startLine, finishLine, isIndent		//the start and finish lines. This has an extra switch about which function to use
//
//	String DataFolder = GetDF("Variables")
//	Wave FMVW = $cFMVW
//	Wave TVW = $DataFolder+"ThermalVariablesWave"
//	Wave MVW = $DataFolder+"MasterVariablesWave"
//	Wave/T FMVD = Var2Desc(FMVW)
//
//	//if aren't in dual AC mode, or if we don't have a tip geometry, or if we don't have the CalcPixelWidth function, then abort
//	if (!TVW[%DualACMode][0] || (FindDimLabel(FMVD,0,"AMFMTipGeo") < 0) || ARCheckFuncRef("CalcPixelWidth","AMFMCalcKc"))
//		return(1)			//there was an error
//	endif
//	
//	Wave Amplitude = GetRTUserCalculatedData("Amplitude",1)
//	Wave Phase = GetRTUserCalculatedData("Phase",1)
//	Wave Frequency = GetRTUserCalculatedData("Frequency",1)
//
//	Variable DriveFreq0, DriveFreq2, SpringConstant0, SpringConstant2, QFactor, Freq0
//	String Geometry
//	Variable TipParm, AmpInvols
//	SpringConstant0 = MVW[%SpringConstant][0]
////	SpringConstant2 = FMVW[%AMFMKc][0]
//	DriveFreq0 = TVW[%ResFreq1][0]
//	DriveFreq2 = TVW[%ResFreq2][0]
//	Variable RealDriveFreq2 = MVW[%DriveFrequency1][0]
//	AmpInvols = MVW[%AmpInvols][0]
//	QFactor = TVW[%LossTanQ1][0]
//	Geometry = FMVD[%AMFMTipGeo][%Title]
//	FuncRef CalcPixelWidth CalcFunc=$"AMFMCalcKc"
//	SpringConstant2 = CalcFunc(DriveFreq0,DriveFreq2,SpringConstant0)
////	Freq0 = ConvertPhase2Freq(Phase[RowIndex][ColIndex],DriveFreq0,QFactor)
//	if (IsIndent)	//we want indentation
//	
//		FuncRef IndentationRogerPunch IndentFunc=$"IndentationRoger"+Geometry		//which tip geometry
//		OutputWave[][startLine,finishLine] = IndentFunc(Amplitude[p][q]*AmpInvOLS,springConstant0,springConstant2,driveFreq0,ConvertPhase2Freq(Phase[p][q],driveFreq0,qFactor)-driveFreq0,driveFreq2,Frequency[p][q]-(driveFreq2-realDriveFreq2))
////		output = IndentFunc(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex]-(DriveFreq2-RealDriveFreq2))
//	else				//we want elasticity
//		TipParm = FMVW[%$"AMFM"+Geometry+"Parm"][0]
//		FuncRef ElasticRogerPunch ElasticFunc=$"ElasticRoger"+Geometry		//which tip geometry
////		output = ElasticFunc(Amplitude[RowIndex][ColIndex]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,Freq0-DriveFreq0,DriveFreq2,Frequency[RowIndex][ColIndex]-(DriveFreq2-RealDriveFreq2),TipParm)
//		OutputWave[][startLine,finishLine] = ElasticFunc(Amplitude[p][q]*AmpInvols,SpringConstant0,SpringConstant2,DriveFreq0,ConvertPhase2Freq(Phase[p][q],driveFreq0,qFactor)-DriveFreq0,DriveFreq2,Frequency[p][q]-(DriveFreq2-RealDriveFreq2),TipParm)
//	endif
//
//	return(0)	//this is now an error check thing
//	
//end //CalcRogerWave


Static Function/Wave GetRTUserCalculatedData(Name,IsImage)		//gets the correct real time data for CalcRoger
	String Name
	Variable IsImage
	String DataFolder = ""

	if (IsImage)
		DataFolder = "root:Packages:MFP3D:Main:"
	else
		DataFolder = "root:Packages:MFP3D:Force:"
	endif


	Variable DualACMode
	Wave/Z TVW = $""
	if (StringMatch(Name,"Amplitude") || StringMatch(Name,"Phase"))
		Wave TVW = $GetDF("Variables")+"ThermalVariablesWave"
		DualACMode = TVW[%DualACMode][0]
		if (DualACMode)
			Name += "1"
		endif
	elseif (stringMatch(Name,"User*") || StringMatch(Name,"BackPack*"))
		Name = FindUserName(Name,"Name")
	
	endif

	if (IsImage)
		Name += "Wave"
	endif


	Wave/Z output = $DataFolder+Name
	return output
End //GetRTUserCalculatedData

Threadsafe Function ConvertPhase2Freq(Phase,DriveFreq,QFactor)		//calculates frequency using phase
	variable Phase, DriveFreq, QFactor


	Variable SignFactor = -1
	if (Phase > 90)		//attractive
		SignFactor = 1
	endif
	Variable output
	Variable TanPhase = Tan(Phase*Pi/180)
//	output = -SignFactor/((SignFactor+sqrt(1+4*QFactor^2*TanPhase^2))/(DriveFreq*2*QFactor*TanPhase))
	output = -SignFactor*((DriveFreq*2*QFactor*TanPhase)/(SignFactor+sqrt(1+4*QFactor^2*TanPhase^2)))	//this is more readable to me CC
	//print output
	return(output)

End //ConvertPhase2Freq

Function ConvertFreq2Phase(ResFreq,DriveFreq,QFactor)	//This is for testing the Phase2Freq Conversion (above)
	variable ResFreq, DriveFreq, QFactor
	
	return atan2(ResFreq*DriveFreq,QFactor*(DriveFreq^2-ResFreq^2))*180/pi
End //ConvertFreq2Phase


//ThreadSafe 
Function IndentationRogerSphere(Amplitude1,SpringConstant1,SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2) 
	variable Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2

	return (Amplitude1*SpringConstant1*ResFreq2*DeltaFreq1)/(SpringConstant2*ResFreq1*DeltaFreq2)
End //IndentationRogerSphere


//ThreadSafe 
Function ElasticRogerSphere(Amplitude1,SpringConstant1,SpringConstant2,ResFreq1,DeltaFreq1,ResFreq2,DeltaFreq2,Radius) 
	Variable Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2, Radius

	Variable output
	output = (2*sqrt(2/(Amplitude1*Radius))*SpringConstant2^2*ResFreq1*DeltaFreq2^2)/(ResFreq2^2*SpringConstant1*DeltaFreq1)
	return(output)
End //ElasticRogerSphere


//ThreadSafe 
Function IndentationRogerCone(Amplitude1,SpringConstant1,SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2) 
	variable Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2

	return (5*Amplitude1*SpringConstant1*ResFreq2*DeltaFreq1)/(4*SpringConstant2*ResFreq1*DeltaFreq2)
End //IndentationRogerCone


//ThreadSafe 
Function ElasticRogerCone(Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2, Theta) 
	variable Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2, Theta

	return (3*pi*sqrt(2/5)*tan(theta*pi/180)*SpringConstant2^2.5*ResFreq1^1.5*DeltaFreq2^2.5)/(5*Amplitude1*ResFreq2^2.5*SpringConstant1^1.5*DeltaFreq1^1.5)
End //ElasticRogerCone


//ThreadSafe 
Function IndentationRogerPunch(Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2) 
	variable Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2

	return (3*Amplitude1*SpringConstant1*ResFreq2*DeltaFreq1)/(4*SpringConstant2*ResFreq1*DeltaFreq2)
End  //IndentatonRogerPunch


//ThreadSafe 
Function ElasticRogerPunch(Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2, Radius) 
	variable Amplitude1, SpringConstant1, SpringConstant2, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2, Radius

	return (sqrt(ResFreq1*2/3)*pi*SpringConstant2^1.5*DeltaFreq2^1.5)/(ResFreq2^1.5*sqrt(SpringConstant1*DeltaFreq1)*Radius)
end //ElasticRogerPunch


//ThreadSafe 
Function ElasticRogerOP(Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, am, Exponent) 
	variable Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, am, Exponent
	
	
	Variable M = Exponent;
	Variable G1, G3
	RogerGamma(Exponent,G1,G3);
	
	Variable output
	if (DeltaFreq1 < 0 || DeltaFreq2 < 0)
		//Negative deltaFreqs are invalid but can sneak past the equation when raised to integer powers, such as the default value of m=1.5.
		output = NaN
	else
		output = (sqrt(pi)*f1^(m-0.5)*k2^(m+0.5)*G3^(m-0.5)*DeltaFreq2^(m+0.5))/(am*Amplitude1^(m-1)*f2^(m+0.5)*k1^(m-0.5)*G1^(m+0.5)*DeltaFreq1^(m-0.5))
	endif
	
	return output
end //ElasticRogerOP


//•EOPWave:=NormElasticRogerOP(Amp1nmWave, f01, Freq1Wave-f01, f02, Freq2Wave-f02, spring1, spring2, OPPrefactor, mfactor, 80e-9, 2e9) 

//ThreadSafe 
Function ElasticRogerOliverPharr(YoungsWave,AmplitudeWave,ResFreq1,Frequency1,ResFreq2,Frequency2,SpringConstant1,SpringConstant2,OPPrefactor,Exponent,AmplitudeNorm,YoungsNorm)
	Wave YoungsWave, AmplitudeWave
	Variable ResFreq1
	Wave Frequency1
	Variable ResFreq2
	Wave Frequency2
	Variable SpringConstant1, SpringConstant2
	Variable OpPreFactor, Exponent
	Variable AmplitudeNorm, YoungsNorm
	
	FindLevel/P/Q AmplitudeWave, AmplitudeNorm
	
	if (NumType(V_LevelX))
		return(Nan)
	endif
	
	Redimension/N=(DimSize(AmplitudeWave,0)) YoungsWave
	variable DeltaFreq1 = Frequency1[V_LevelX]-ResFreq1
	variable DeltaFreq2 = Frequency2[V_LevelX]-ResFreq2
	variable Eref = ElasticRogerOP(AmplitudeNorm, ResFreq1, DeltaFreq1, ResFreq2, DeltaFreq2, SpringConstant1, SpringConstant2, OPPrefactor, Exponent)
	
	OPPrefactor *= (Eref/YoungsNorm)
	
	YoungsWave = ElasticRogerOP(AmplitudeWave, ResFreq1, Frequency1-ResFreq1, ResFreq2, Frequency2-ResFreq2,SpringConstant1,SpringConstant2, OPPrefactor, Exponent)
end //ElasticRogerOliverPharr


//Function NormElasticRogerOP(Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, am, Exponent, Anorm, Enorm) 
//	variable Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, am, Exponent, Anorm, Enorm
//	
//	wave Amp1nmWave=Amp1nmWave
//	wave Freq1Wave=Freq1Wave
//	wave Freq2Wave=Freq2Wave
//	FindLevel/P/Q Amp1nmWave, Anorm
//	
//	if (NumType(V_LevelX))
//		return(Nan)
//	endif
//	
//	
//	variable DeltaFreq1 = Freq1Wave[V_LevelX]-f1
//	variable DeltaFreq2 = Freq2Wave[V_LevelX]-f2
//	variable Eref = ElasticRogerOP(Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, am, Exponent)
//	
//	am*=(Eref/ENorm)
//	//print am
//	
//	return ElasticRogerOP(Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, am, Exponent)
//end //NormElasticRogerOP


//ThreadSafe 
Function IndentationRogerOP(Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, Exponent) 
	variable Amplitude1, f1, DeltaFreq1, f2, DeltaFreq2, k1, k2, Exponent

	Variable G1, G3
	RogerGamma(Exponent,G1,G3);
	
	return (DeltaFreq1*Amplitude1*f2*k1*G3)/(2*f1*k2*G1*DeltaFreq2)
	
end //IndentationRogerOP


ThreadSafe Function RogerGamma(M,G1,G3)
	Variable M, &G1, &G3
	
	Variable G0 = Gamma(M+1);
	G1 = G0/Gamma(M+0.5);
	G3 = G0/Gamma(M+1.5);
End //RogerGamma


//
//ThreadSafe Function FMapCalcHeightTS(FileRef,RegionIndex,PointIndex,LineIndex)
//	Variable FileRef, RegionIndex, PointIndex, LineIndex
//	
//	
//	
//	
//End //FmapCalcHeightTS


Function FMapCalcBaseLine(Data,DataB,ParmWave)
	Wave Data
	Wave/Z DataB		//Not used
	Wave/Z ParmWave		//not used

	Variable Start, Stop, IsLoading, output

	Start = 0
	Stop = DimSize(Data,0)-1
	if (Data[Start] < Data[Stop])
		IsLoading = 1
	endif
	
	if (IsLoading)
		WaveStats/Q/R=[Start,Start+9] Data
		SwapVars(Start,Stop)
	else
		WaveStats/Q/R=[Stop-9,Stop] Data
	endif
	output = V_Avg
	Return(output)
End //FMapCalcBaseLine


Function/S FmapCalcBaseLineInfo()
	String output = "DataType:Defl;Section:Ext;DataTypeB:None;ParmWave:None;CalcType:Deflection;"
	return(output)
End //FmapCalcBaseLineInfo

Function FmapCalcFFMDelay(CalcStruct)
	STRUCT FMapCalcStruct &CalcStruct
	
	Variable output = FMapCalcFFMDelayTS(CalcStruct)
	
	return(output)
End //FmapCalcFFMDelay