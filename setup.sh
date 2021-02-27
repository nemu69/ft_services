minikube start --vm-driver=virtualbox
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
docker build -t nginx ./services/nginx
docker build -t phpmyadmin ./services/PhpMyAdmin
minikube addons enable dashboard
minikube dashboard