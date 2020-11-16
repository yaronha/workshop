# workshop

MLOps workshop

## Pull images

```
docker pull quay.io/nuclio/dashboard:stable-amd64
docker pull mlrun/jupyter:TMLS
docker pull mlrun/mlrun-ui:0.5.4
```

## Run containers

You can change the `SHARED_DIR` to another path for storing the data/artifacts

```
SHARED_DIR=~/mlrun-data
docker network create mlrun-network
docker run -it -p 8080:8080 -p 8888:8888 --rm -d --network mlrun-network --name jupyter -v ${SHARED_DIR}:/home/jovyan/data mlrun/jupyter:TMLS
docker run -it -p 4000:80 --rm -d --network mlrun-network --name mlrun-ui -e MLRUN_API_PROXY_URL=http://jupyter:8080 mlrun/mlrun-ui:0.5.4
docker run -p 8070:8070 --rm -d --network mlrun-network --name nuclio -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp quay.io/nuclio/dashboard:stable-amd64
```

Open the browser pointing to Jupyter, Nuclio, and MLRUn UIs at:
* Jupyter: http://localhost:8888/
* MLRun: http://localhost:4000/
* Nuclio: http://localhost:8070/

## Open and run the jupyter notebooks

In the jupyter home directory you can find 3 notebooks open and run them 