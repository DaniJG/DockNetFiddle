@ECHO off

REM setup docker environment so docker is available in this cmd session
FOR /f "tokens=*" %%i IN ('docker-machine env default') DO @%%i

REM run program using docker dotnet:latest image and automatically remove image
REM docker options
REM		--rm						remove container once finishes executing the default command
REM		-t							attach terminal so we get standard output back into cmd
REM		-v %programfolder%:/app		mounts folder passed as argument as the /app folder inside the container
REM		-w /app						sets working directory inside container
REM		microsoft/dotnet:latest		creates container from latest microsoft/dotnet image (official .net core image)
REM		/bin/sh	-c "..."			container entry point program (bash) with extra arguments (command to be executed in the bash)
docker run --rm -t -v %1:/app -w /app microsoft/dotnet /bin/sh -c "dotnet restore && dotnet run"
