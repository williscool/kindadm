manual starup script

https://github.com/kubernetes-sigs/kind/issues/702#issuecomment-664569840

```
kind create cluster --config local-cluster/kind-cfg.yaml 
helmfile -f local-cluster/helmfile.yaml apply

# service you can deploy to test things are working
kubectl apply -f local-cluster/echo-server-infra-test.yaml
kubectl expose replicaset echo --type=LoadBalancer

kubectl port-forward --address localhost,0.0.0.0 service/echo 8080:8080
wget localhost:8080

# NOTE: tilt up is broken until I can figure out why helmfile template command doesn't create pods in teh correct namespaces

# admin for local cluster only use this for prod https://github.com/kubernetes/dashboard/issues/4179#issuecomment-610078007
kubectl apply -f local-cluster/dashboard-admin.yaml 
kubectl proxy # start proxy so you can access admin panel
visit
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:https/proxy/#/overview?namespace=default

# disable admin-user
kubectl delete clusterrolebinding kubernetes-dashboard
```

get scret for kubectl dasboard

```
# https://thorsten-hans.com/access-kubernetes-dashboard-on-rbac-enabled-azure-kubernetes
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep kubernetes-dashboard-token | awk '{print $1}')
```

get get pod scheduling events

```
# https://stackoverflow.com/a/61409507/511710
kubectl get events
```