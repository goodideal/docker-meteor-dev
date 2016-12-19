FROM node:latest

MAINTAINER Jerry "jerry@xqopen.com"

ENV METEOR_ALLOW_SUPERUSER=1
RUN curl https://install.meteor.com | sh
RUN meteor update --release 1.4.3-beta.1

RUN npm install -qg cnpm --registry=https://registry.npm.taobao.org

WORKDIR /opt/application
EXPOSE 3000

CMD [ "meteor" ]
