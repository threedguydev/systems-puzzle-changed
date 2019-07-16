
#docker network prune
#docker system  prune -a
#docker volume rm $(docker volume ls -f dangling=true -q)

echo "***************************************************************"
docker-compose down
echo "--- docker-compose after down"
docker ps -a
echo "***************************************************************"
docker-compose up -d db
echo "--- after docker-compose up -d db"
docker ps -a
echo "***************************************************************"
# may need to add --restart=always to flaskapp invokation
docker-compose run --rm flaskapp /bin/bash -c "cd /opt/services/flaskapp/src && python -c  'import database; database.init_db()'"
echo "--- after run flaskapp"
docker ps -a
echo "***************************************************************"
docker-compose up -d
echo "--- after up -d"
docker ps -a
echo "***************************************************************"
google-chrome http://localhost:8080 >& /dev/null
echo "started chrome browser at localhost:8080"
