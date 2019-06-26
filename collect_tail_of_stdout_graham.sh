#!/bin/bash

# This script collects the output of stdout_graham.

# Path to partition where data is stored
basePath="/home/uday/MountPoints/ExchangeVolume/Research"

# Path to parent directory where data is stored
echo "Enter parent directory where data is stored:"
read pathParentDir

# Gathering sub directory information
# EDR information
echo "Enter the lower bound value of EDR:"
read lbEDR
echo "Enter the upper bound value of EDR:"
read ubEDR
echo "Enter the increment of EDR:"
read incEDR
echo

# Drop size information
echo "Enter the lower bound value of drop size:"
read lbDropSize
echo "Enter the upper bound value of drop size:"
read ubDropSize
echo "Enter the increments in drop size:"
read incDropSize
echo

# Gathering flag information
echo 'Enter value of gomic (gomic0/gomic1/gomic2ihydro0/gomic2ihydro1):'
read finalDir

# Creating logfile ine ~/MountPoints/ExchangeVolume/Clones_<0-9>/<EDR>/<DropSize>
logFilePath=$basePath/$pathParentDir
echo "log file path is : $logFilePath"
cd $logFilePath
touch "analytics_$finalDir.log"

# Looping through the folders
for EDR in $(seq $lbEDR $incEDR $ubEDR)
do
	for DropSize in $(seq $lbDropSize $incDropSize $ubDropSize)
	do

		# Changing into subdirectory
		finalPath="$basePath/$pathParentDir/$EDR/Rr$DropSize$DropSize/$finalDir"
		cd $finalPath
		
		# ecording data
		# Writing label
		echo $finalPath >> $logFilePath/analytics_$finalDir.log
		echo
		# Extracting data
		tail stdout_graham >> $logFilePath/analytics_$finalDir.log
	done
done






