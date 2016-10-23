FROM node:latest

MAINTAINER Jerry "jerry@xqopen.com"

#RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX

#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y curl git
RUN npm install -qg pm2-meteor
WORKDIR /opt/application

RUN curl https://install.meteor.com/?release=1.4.1.1 | sh

EXPOSE 3000

CMD [ "meteor" ]
