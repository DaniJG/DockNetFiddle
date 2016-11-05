#!/bin/sh

#intermediate script so we can run coderunner as root with all its environment variables!
#Otherwise environment variables get lost:
#	http://serverfault.com/questions/531296/incrond-running-but-not-executing-commands-centos-6-4
#	http://stackoverflow.com/a/31710029/1836935
#	http://serverfault.com/questions/337631/crontab-execution-doesnt-have-the-same-environment-variables-as-executing-user
su - root -c "/coderunner.sh $1"