# Build by opening docker command line in this folder:
#	docker build -t coderunner -f coderunner.dockerfile .
# Start container with:
#	docker run -it --rm coderunner:latest
# Attach additional shell by opening another docker command line and running:
#	docker exec -it coderunner /bin/sh
FROM microsoft/dotnet:latest

# Update apt-get package cache
RUN apt-get -qq update

# Install zip
RUN apt-get --assume-yes install zip

# Install incron
RUN apt-get --assume-yes install incron
RUN echo 'root' >> /etc/incron.allow

# Expose required volumes
VOLUME /requests
VOLUME /outputs

# Copy script files
COPY init.sh coderunner.sh launcher.sh ./

#Create precompiled app with default project.json
RUN mkdir defaultApp \
    && cd /defaultApp \
    && dotnet new \
    && dotnet restore \
	&& dotnet build

# Monitor folder where new programs will be copied
RUN touch incron.rules \
    # Use an intermediate script "launcher.sh" that we use to run as root with its environment variables
	&& echo '/requests IN_CREATE /launcher.sh $@/$#' >> incron.rules \	
    && incrontab incron.rules \    
	# Files are not marked as executable by default when building on windows
	# Incron needs launcher executable
	# entry command needs to be executable when using docker compose, see  http://stackoverflow.com/questions/37666462/docker-compose-up-permission-denied-on-windows
    && chmod +x /launcher.sh \
	&& chmod +x /coderunner.sh \
	&& chmod +x /init.sh

# Start incron service when container starts and keep container alive
CMD /init.sh && bash
