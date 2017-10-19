FROM ubuntu:16.04

MAINTAINER Jerry "jerry@xqopen.com"

# build arguments
ARG APP_PACKAGES
ARG APP_LOCALE=en_US
ARG APP_CHARSET=UTF-8
ARG APP_USER=app
ARG APP_USER_DIR=/home/${APP_USER}
ARG METEOR_REL=1.5.2.2

# run environment
ENV APP_PORT=${APP_PORT:-3000}
ENV APP_ROOT=${APP_ROOT:-/opt/application}

# exposed ports and volumes
EXPOSE $APP_PORT
VOLUME $APP_ROOT

# add packages for building NPM modules (required by Meteor)
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl python build-essential locales ${APP_PACKAGES}
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

# set the locale (required by Meteor)
RUN locale-gen ${APP_LOCALE}.${APP_CHARSET} &&\
    localedef ${APP_LOCALE}.${APP_CHARSET} -i ${APP_LOCALE} -f ${APP_CHARSET}


# create a non-root user that can write to /usr/local (required by Meteor)
RUN useradd -mUd ${APP_USER_DIR} ${APP_USER}
RUN chown -Rh ${APP_USER} /usr/local
USER ${APP_USER}

# install Meteor
RUN curl https://install.meteor.com/?release=${METEOR_REL} | sh

# run Meteor from the app directory
WORKDIR ${APP_ROOT}

VOLUME /${APP_USER}/.meteor

CMD ["metoer"]
