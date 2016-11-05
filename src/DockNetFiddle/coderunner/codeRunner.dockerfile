# Build by opening docker command line in this folder:
#	docker build -t coderunner -f coderunner.dockerfile .
# Start container with:
#	docker run -it --rm --volumes-from testapp coderunner:latest
FROM microsoft/dotnet:latest

# Update apt-get package cache
RUN apt-get -qq update

# Install zip
RUN apt-get --assume-yes install zip

# To be removed, install nano to make debugging easier
RUN apt-get --assume-yes install nano

COPY coderunner.sh /coderunner.sh

