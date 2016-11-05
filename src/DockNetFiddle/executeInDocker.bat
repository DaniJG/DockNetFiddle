@ECHO off

REM setup docker environment so docker is available in this cmd session
FOR /f "tokens=*" %%i IN ('docker-machine env default') DO @%%i

REM Execute command in running container named "coderunner"
SET zipFileName=/requests/%1
SET "dockerCommand=./coderunner.sh %zipFileName%"
docker exec coderunner /bin/sh -c "%dockerCommand%"
