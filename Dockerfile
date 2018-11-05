FROM node:8-alpine

# https://download.unity3d.com/download_unity/b8cbb5de9840/CacheServer-2018.1.1f1.zip
RUN apk add --no-cache --virtual build-dependencies

RUN npm install unity-cache-server -g && mkdir -p /cacheserver/config && mkdir /cacheserver/data

ADD default.yml /cacheserver/config/

WORKDIR /cacheserver
VOLUME [ "/cacheserver/data", "/cacheserver/config" ]
EXPOSE 8126

ENTRYPOINT [ "unity-cache-server", "--cache-path", "/cacheserver/data", "--workers", "4", "--NODE_CONFIG_DIR", "/cacheserver/config" ]
