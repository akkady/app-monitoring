
## How to Clean Up Everything in Docker

You can clean up everything or clean up specific resources in Docker like images, container volumes, or the build cache.
### Simple clean up

To clean up as much as possible excluding components that are in use, run this command:

   > $ docker system prune -a

   - Clean up unused volumes
   
   > $ docker volume prune
### Clean Restart of a Docker Instance

 - Stop the container(s)

    > $ docker-compose down
    
 - Delete all containers 

    > docker rm -f $(docker ps -a -q)

 - Delete all volumes

    > docker volume rm $(docker volume ls -q)

### Forcefully Remove Images

 - remove all the Docker images

    > docker rmi -f $(docker images -aq)

### A Docker Cleanup Guide

https://www.freecodecamp.org/news/how-to-remove-all-docker-images-a-docker-cleanup-guide/