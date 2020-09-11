kind delete cluster --name kind
kind delete cluster --name kind-3
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)