#!/bin/sh
if [ -z $EXT_MONGO ];then
    echo "using internal mongodb"
	/usr/local/mongodb/bin/mongod --fork --logpath /data --logappend
    export MONGO_URL=mongodb://localhost:27017/meteor
else
	echo "using external mongodb"
fi

exec "$@"
