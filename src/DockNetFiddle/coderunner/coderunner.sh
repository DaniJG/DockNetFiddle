#!/bin/sh

# get args
zipFilePath=$1
zipFileDir=$(dirname $1)
zipFileName=$(basename $1)

tempAppFolder="/tmp/$zipFileName"

# unzip program into temp folder
unzip -o $zipFilePath -d $tempAppFolder
cd $tempAppFolder	

# restore and run program, saving output in same folder as original file
# the compilation output can be removed from the output file by running a separated "dotnet build" command before "dotnet run"
dotnet restore && dotnet run > "/$zipFileDir/$zipFileName.output" 2>&1

# remove temp folder
rm -rf $tempAppFolder
