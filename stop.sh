
docker ps -q -a | xargs docker stop
docker ps -q -a | xargs docker rm
docker container prune
