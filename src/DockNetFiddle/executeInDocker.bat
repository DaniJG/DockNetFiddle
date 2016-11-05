@ECHO off

REM setup docker environment so docker is available in this cmd session
FOR /f "tokens=*" %%i IN ('docker-machine env default') DO @%%i

REM Execute command in running container named "coderunner"
SET folderName=%1
SET "dockerCommand=cd /requests/%folderName% && dotnet restore && dotnet run"
docker exec coderunner /bin/sh -c "%dockerCommand%"
