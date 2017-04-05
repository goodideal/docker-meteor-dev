FROM node:4

MAINTAINER Jerry "jerry@xqopen.com"

#RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX
#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y curl git

RUN npm install -qg cnpm --registry=https://registry.npm.taobao.org

RUN curl https://install.meteor.com/?release=1.4.3.2 | sh

WORKDIR /opt/application

EXPOSE 3000

CMD [ "meteor" ]
