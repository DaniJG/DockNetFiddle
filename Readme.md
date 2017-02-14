# DockNetFiddle

This repo contains the code for the article _Building DockNetFiddle using Docker and .NET Core_ published in the [DotNetCurry](http://www.dotnetcurry.com/windows-azure/1339/docknetfiddle-using-docker-dotnet-core) magazine.

It is the full source code of the proposed **DockNetFiddle** site, an ASP.Net Core application built with the aim of learning about docker and .Net Core.

DockNetFiddle is a simple site where users can enter minimum but complete .Net Core applications (providing the contents for the files program.cs and project.json ) which will be then executed inside a docker container. The results of the program execution will be send back and displayed to the users. In the end is a very simple version of the real [.NetFiddle site](https://dotnetfiddle.net/).

The project uses 2 containers, one running the ASP.Net Core application and a separated one which will run the programs entered by the user.

## VS2015 vs VS2017

The project was originaly built in VS2015 and used the "old" .Net Core project style based on the project.json file. Since then, VS2017 has been released and .Net Core has moved back to csproj and its XML based project file.

- If you want to use VS2015, stay on the **master** branch
- If you want to try VS2017, use the **VS2017-csproj** branch
- If all you want to do is `docker-compose up`, you can try either branch :). The dockerfiles in **master** are locked to the old project.json base images while the dockerfiles in **VS2017-csproj** use the latest .net core images.

## Instructions

1. clone the repo in a new folder
1. cd into `src/DockNetFiddle`
1. run `docker-compose up`. This will generate the docker images and start new containers
1. fire up a browser and open [http://localhost:8080]() (replace localhost with the ip of your docker host or docker VM if using docker toolbox in win7/8)
1. the site home page should load: ![alt](http://www.dotnetcurry.com/images/azure/docker-core/docknetfiddle-design-sample.jpg)
1. press **Run** to execute the code
1. stop the containers with Ctrl+C (console will be attached to both containers, so you will need to press it twice)
1. optionally remove the containers with `docker-compose down`

#### Running in the background
If you run `docker-compose up` your console gets attached to both containers (making the output hard to follow) and you will stop them if you stop the console.

You can also run them in the background and attach/detach the console when needed

1. run `docker-compose up -d`
1. attach to one of the containers with `docker attach webapp` or `docker attach coderunner`. You will see the output in your console (although coderunner will be in its infine loop without printing anything). Press Ctrl+C to detach and leave the container in the background.
1. attach an interactive shell on one of the containers as in `docker exec -it coderunner /bin/bash`. You will be then in a new terminal inside that container. Enter `exit` when finished, the container will keep running in the background.
1. stop and remove the containers with `docker-compose down` (Or manually send `docker stop` and `docker rm` commands)


