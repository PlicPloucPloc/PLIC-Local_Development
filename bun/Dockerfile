# use the official Bun image
# see all versions at https://hub.docker.com/r/oven/bun/tags
FROM oven/bun:1 AS base
WORKDIR /usr/src/app

COPY *.ts ./

# run the app
USER bun
EXPOSE 80/tcp
ENTRYPOINT [ "bun", "run", "index.ts" ]
