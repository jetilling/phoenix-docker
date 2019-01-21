# phoenix-docker
Phoenix Framework dockerfile

Forked from: https://github.com/indatawetrust/phoenix-docker.

Develop with Phoenix locally, while running Phoenix inside of a docker container.  As per the instructions below, the Phoenix code itself is on a volume residing on your local machine, but linked into the container.  Due to Phoenix's hot reloading, any changes you make to the code on your machine are automatically implemented server side (this fork neglects any front-end bundling or reloading).


### Clone phoenix-docker
```
git clone https://github.com/porlan1/phoenix-docker
cd phoenix-docker
```

### Build the image
```
docker build -t phoenix-docker .
```

### Copy the app directory out of the container
```
mkdir app
docker create --name phoenix phoenix-docker
docker cp phoenix:/app/. ./app
docker rm phoenix
```


### Run the container
```
docker run -d --name phoenix -p 4000:4000 -v /Users/porlan1/phoenix-docker/app:/app phoenix-docker
```

You will have to substitute your own absolute path for the above command.

In your browser visit localhost:4000.

### Running shell commands in the container
```
docker exec -it phoenix bash
```

Once in the container, you can execute `mix` commands.


### Phoenix docs
see the docs for more info: https://hexdocs.pm/phoenix/overview.html
