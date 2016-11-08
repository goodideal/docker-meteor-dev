FROM node:latest

MAINTAINER Jerry "jerry@xqopen.com"

#RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX

#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y curl git
RUN npm install -qg https://github.com/goodideal/pm2-meteor

RUN curl https://install.meteor.com/?release=1.4.2 | sh

WORKDIR /opt/application

EXPOSE 3000

#RUN useradd noroot -u 0 -g 0 -s /bin/bash
#USER noroot

CMD [ "meteor" ]
