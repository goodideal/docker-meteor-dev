# dockerized meteor for development or CI

## How to use
```
cd app
docker run -v `pwd`:/opt/application -p 3000 goodideal/docker-meteor-dev:latest
```

## Env
- APP_ROOT, default `/opt/application`
- APP_PORT, default `3000`

example:
```
docker run \
    --env APP_ROOT=\app \
    --env APP_PORT=4000 \
    -v `pwd`:\app \
    -p 4000 \
    goodideal/docker-meteor-dev:latest
```
