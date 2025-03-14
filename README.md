User Application with Django, Docker and Kubernetes

Ce projet est une application backend développée avec Django et Django REST Framework, conteneurisée avec Docker et déployable sur Kubernetes.


Endpoints API:
L'API expose deux endpoints :
  POST /api/users/create/ - Créer un nouvel utilisateur
  GET /api/users/ - Récupérer tous les utilisateurs

Prérequis:
  Docker
  Docker Compose
  Kubernetes (pour le déploiement Kubernetes)


Installation et exécution locale avec Docker Compose

Clonez ce dépôt :

  git clone https://github.com/niangbaba/Docker-Kubernetes-project.git
  cd userappli

Lancez l'application avec Docker Compose :
  docker-compose up -d

L'API sera accessible à l'adresse http://localhost:8000/api/


Récupérer l'image Docker babacarniang/backend:v1.0.0 depuis Docker Hub
  docker login
  docker pull babacarniang/backend:v1.0.0


Déploiement sur Kubernetes

Assurez-vous que votre cluster Kubernetes est configuré et accessible.
Appliquez les manifestes Kubernetes :
  kubectl apply -f kubernetes/mysql-pv.yaml
  kubectl apply -f kubernetes/configmap.yaml
  kubectl apply -f kubernetes/secret.yaml
  kubectl apply -f kubernetes/mysql-deployment.yaml
  kubectl apply -f kubernetes/backend-deployment.yaml

Vérifiez que les pods sont en cours d'exécution :
  kubectl get pods

Accédez à l'API via Minikube Service :
  minikube service backend-service