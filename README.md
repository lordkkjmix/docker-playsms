docker-playsms-ngnix
==============

Item            | Info
--------------- | ---------------
Project update  | 230922
Project version | 2.3
playSMS version | 1.4.7

This project is playSMS docker image project.

playSMS is a Free and Open Source SMS Gateway Software. Not A Free SMS Service.

Visit [playSMS](http://playsms.org) website for more information.


## Install

Run this for installation, just the first time:

```
docker run -d -p 80:80 lordkkjmix/playsms:1.4.7
```

```
docker run -d  -p 80:80 -v --env-file .env  lordkkjmix/playsms:1.4.7
```

Get `<CONTAINER_ID>` of your image:

```
docker ps -l
```

Follow logs:

```
docker logs -f <CONTAINER_ID>
```

Use `docker compose` runs:

```
docker compose up
```

## Usage

Start your container:

```
docker start <CONTAINER_ID>
```

Stop your container:

```
docker stop <CONTAINER_ID>
```

Running command inside the container:

```
docker exec <CONTAINER_ID> <COMMAND>
```

Example of running command `playsmsd check` on `CONTAINER_ID` `dce344`:

```
docker exec dce344 playsmsd check
```


## Build

To build the image `yourname/playsms`, execute the following command on the `docker-playsms` folder:

```
docker build -t yourname/playsms .
```

Push your new image to the docker hub:

```
docker push yourname/playsms
```


## Maintainer

- Kouakou koffi josué <lordkkjmix@gmail.com>


## References

- https://github.com/tutumcloud/tutum-docker-lamp
- https://github.com/tutumcloud/tutum-docker-wordpress
- https://github.com/playsms/docker-playsms
