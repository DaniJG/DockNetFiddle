#!/bin/sh

# get args
zipFilePath=$1
zipFileDir=$(dirname $1)
zipFileName=$(basename $1)

tempAppFolder="/tmp/$zipFileName"

# was a project.json included?
unzip -l $zipFilePath | grep project.csproj
hasProjectFile=$?

if [ $hasProjectFile -eq 0 ]; then
    #there is a project json, treat it as new application requiring dotnet restore

	# unzip program into temp folder
	unzip -o $zipFilePath -d $tempAppFolder
	cd $tempAppFolder	

	# restore and run program, saving output in same folder as original file
	# the compilation output can be removed from the output file by running a separated "dotnet build" command before "dotnet run"
	dotnet restore && dotnet run > "/$tempAppFolder/$zipFileName.output" 2>&1
else
	#there isnt a project json, use the default app as starting point

	# copy default app into temp folder
	cp -r /defaultApp $tempAppFolder

	#unzip program files into the temp folder, overwriting program files but leaving project.json intact
	unzip -o $zipFilePath -d $tempAppFolder
	cd $tempAppFolder

	# build and run program, saving output in same folder as original file
	# the compilation output can be removed from the output file by running a separated "dotnet build" command before "dotnet run"
	dotnet run > "/$tempAppFolder/$zipFileName.output" 2>&1
fi

#copy entire output 
cp /$tempAppFolder/$zipFileName.output /outputs/$zipFileName.output

# remove temp folder
rm -rf $tempAppFolder
