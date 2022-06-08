### How to Do a Clean Restart of a Docker Instance

 - Stop the container(s)

    > docker-compose down
    
 - Delete all containers 

    > docker rm -f $(docker ps -a -q)

 - Delete all volumes

    > docker volume rm $(docker volume ls -q)

### Forcefully Remove Images

 - remove all the Docker images

    > docker rmi -f $(docker images -aq)