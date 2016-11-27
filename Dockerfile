FROM node:latest

MAINTAINER Jerry "jerry@xqopen.com"

#RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX

#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y curl git
RUN npm install -qg https://github.com/goodideal/pm2-meteor.git; npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN curl https://install.meteor.com/?release=1.4.2.3 | sh

WORKDIR /opt/application

EXPOSE 3000

#RUN useradd noroot -u 0 -g 0 -s /bin/bash
#USER noroot

CMD [ "meteor" ]
