FROM node:6

MAINTAINER Jerry "jerry@xqopen.com"

#RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX
#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y curl git

RUN curl https://install.meteor.com/?release=1.5.2.2 | sh

WORKDIR /opt/application

EXPOSE 3000

CMD [ "meteor" ]
