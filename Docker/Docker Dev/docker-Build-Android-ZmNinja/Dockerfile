FROM ubuntu:15.04


RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl wget apt-transport-https lsb-release -y
RUN apt-get install software-properties-common python-software-properties -y
RUN apt-get install openjdk-8-jre openjdk-8-jdk -y

#RUN add-apt-repository -y -r ppa:chris-lea/node.js
RUN wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo 'deb https://deb.nodesource.com/node_4.x vivid main' > /etc/apt/sources.list.d/nodesource.list
RUN echo 'deb-src https://deb.nodesource.com/node_4.x vivid main' >> /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install -y nodejs git

COPY locale-fr.json /locale-fr.json
COPY DataModel.js /DataModel.js
#COPY app.js /zmNinja/www/js/app.js

COPY run.sh /usr/bin/
RUN chmod +x /usr/bin/run.sh

VOLUME ["/android-sdk-linux";"/zmNinja"]

