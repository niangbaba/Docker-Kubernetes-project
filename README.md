# User Application avec Django, Docker et Kubernetes

Ce projet est une application backend développée avec Django et Django REST Framework, conteneurisée avec Docker et déployable sur Kubernetes.

## Endpoints API

L'API expose deux endpoints :
- `POST /api/users/create/` - Créer un nouvel utilisateur
- `GET /api/users/` - Récupérer tous les utilisateurs

## Prérequis

- Docker
- Docker Compose
- Kubernetes (pour le déploiement Kubernetes)

## Installation et exécution locale avec Docker Compose

1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/niangbaba/Docker-Kubernetes-project.git
   cd userappli
   ```

2. Lancez l'application avec Docker Compose :
   ```bash
   docker-compose up -d
   ```

3. L'API sera accessible à l'adresse http://localhost:8000/api/

## Récupérer l'image Docker depuis Docker Hub

```bash
docker login
docker pull babacarniang/backend:v1.0.0
```

## Déploiement sur Kubernetes

1. Assurez-vous que votre cluster Kubernetes est configuré et accessible.

2. Appliquez les manifestes Kubernetes :
   ```bash
   kubectl apply -f kubernetes/mysql-pv.yaml
   kubectl apply -f kubernetes/configmap.yaml
   kubectl apply -f kubernetes/secret.yaml
   kubectl apply -f kubernetes/mysql-deployment.yaml
   kubectl apply -f kubernetes/backend-deployment.yaml
   ```

3. Vérifiez que les pods sont en cours d'exécution :
   ```bash
   kubectl get pods
   ```

4. Accédez à l'API via Minikube Service :
   ```bash
   minikube service backend-service
   ```