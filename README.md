# zammad-docker
a simple zammad Docker Container based on mysql

first clone the repo
```
git clone https://github.com/celevra/zammad-docker.git
```

then build the Docker Container
```
docker build -t zammad .
```

then start the Container and tell it the Database server and credentials and give it persistant storage on /data
```
docker run --name zammad --env DB_NAME=zammad --env DB_USER=zammad --env DB_PASSWORD=password --env DB_HOST=192.168.0.1 -v /storage/data:/data zammad
```

the container starts up and installs all needed dependencies, downloads latest zammad, start to build zammad, on first boot it sets up the database and then starts the ruby webserver.
You will need to put a nginx or apache or whatever infront of it


