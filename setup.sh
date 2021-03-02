minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metrics-server
minikube addons enable dashboard
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
docker build -t nginx-image ./services/Nginx
docker build -t mysql-image ./services/MySQL
docker build -t phpmyadmin-image ./services/PhpMyAdmin
docker build -t wordpress-image ./services/Wordpress
docker build -t ftps-image ./services/Ftps
kubectl apply -f metallb.yaml
kubectl apply -f ./services/Nginx/nginx.yaml
kubectl apply -f ./services/MySQL/mysql.yaml
kubectl apply -f ./services/PhpMyAdmin/phpmyadmin.yaml
kubectl apply -f ./services/Wordpress/wordpress.yaml
#kubectl apply -f services/influxdb/influxdb.yaml
#kubectl apply -f services/grafana/grafana.yaml
kubectl apply -f services/Ftps/ftps.yaml
minikube dashboard