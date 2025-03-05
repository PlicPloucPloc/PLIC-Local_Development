docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker image prune --all --force
docker network prune --force
