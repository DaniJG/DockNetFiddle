# This is the quick and easy way of running your app in docker
# Build by opening a docker command line in this folder and executing:
#	docker build -t docknetfiddle -f docknetfiddle.dockerfile .
# Start container with 
#	docker run --rm -it --volumes-from coderunner --name docknetfiddle -p 8080:80 docknetfiddle:latest
# Attach additional shell by opening another docker command line and running:
#	docker exec -it docknetfiddle /bin/sh
# For the proper way, check: https://blogs.msdn.microsoft.com/stevelasker/2016/09/29/building-optimized-docker-images-with-asp-net-core/
FROM microsoft/dotnet:latest
WORKDIR /app
ENV ASPNETCORE_URLS http://+:80
ENV ASPNETCORE_ENVIRONMENT development
EXPOSE 80
COPY . .
RUN dotnet restore
RUN dotnet build
ENTRYPOINT ["dotnet", "run"]
