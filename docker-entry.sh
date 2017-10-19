#!/bin/sh

/usr/local/mongodb/bin/mongod --fork --logpath /data --logappend
export MONGO_URL=mongodb://localhost:27017/meteor

exec "$@"
