#!/bin/bash

# This script collects the output of stdout_graham.

# Path to partition where data is stored
basePath="/home/uday/MountPoints/ExchangeVolume"

# Path to parent directory where data is stored
echo "Enter parent directory where data is stored:"
read pathParentDir

# Creating a log file in parent directory
touch $pathParentDir/analytics.log

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
echo lbDropSize
echo "Enter the upper bound value of drop size:"
echo ubDropSize
echo "Enter the increments in drop size:"
read incDropSize
echo

# Looping through the folders
for EDR in $(seq $lbEDR $incEDR $ubEDR)
do
	for DropSize in $(seq $lbDropSize $incDropSize $ubDropSize)
	do



