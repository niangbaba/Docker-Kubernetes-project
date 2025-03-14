User Application with Django, Docker and Kubernetes
Ce projet est une application backend développée avec Django et Django REST Framework, conteneurisée avec Docker et déployable sur Kubernetes.
Structure du projet

userappli/
├── kubernetes/               # Manifestes Kubernetes
│   ├── backend-deployment.yaml
│   ├── configmap.yaml
│   ├── mysql-deployment.yaml
│   ├── mysql-pv.yaml
│   └── secret.yaml
├── userappli/                # Dossier du projet Django
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── users/                    # Application Django
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations/
│   ├── models.py
│   ├── serializers.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── Dockerfile
├── README.md
├── docker-compose.yml
├── manage.py
└── requirements.txt

Endpoints API
L'API expose deux endpoints :

POST /api/users/create/ - Créer un nouvel utilisateur
GET /api/users/ - Récupérer tous les utilisateurs

Prérequis

Docker
Docker Compose
Kubernetes (pour le déploiement Kubernetes)

Installation et exécution locale avec Docker Compose

Clonez ce dépôt :

git clone <url-du-repo>
cd userappli

Lancez l'application avec Docker Compose :
bashCopydocker-compose up -d

L'API sera accessible à l'adresse http://localhost:8000/api/.

Déploiement sur Kubernetes

Assurez-vous que votre cluster Kubernetes est configuré et accessible.
Appliquez les manifestes Kubernetes :
bashCopykubectl apply -f kubernetes/mysql-pv.yaml
kubectl apply -f kubernetes/configmap.yaml
kubectl apply -f kubernetes/secret.yaml
kubectl apply -f kubernetes/mysql-deployment.yaml
kubectl apply -f kubernetes/backend-deployment.yaml

Vérifiez que les pods sont en cours d'exécution :
bashCopykubectl get pods

Accédez à l'API via le NodePort (par défaut sur le port 30080) :
Copyhttp://<node-ip>:30080/api/


Construction et publication de l'image Docker
Pour construire et publier l'image Docker sur Docker Hub :
bashCopy# Construire l'image
docker build -t <your-dockerhub-id>/backend:v1.0.0 .

# Se connecter à Docker Hub
docker login

# Publier l'image
docker push <your-dockerhub-id>/backend:v1.0.0
Tests avec curl
Une fois l'application en cours d'exécution, vous pouvez tester les API avec curl :
bashCopy# Créer un utilisateur
curl -X POST http://localhost:8000/api/users/create/ \
  -H "Content-Type: application/json" \
  -d '{"name": "John Doe", "email": "john@example.com"}'

# Récupérer tous les utilisateurs
curl http://localhost:8000/api/users/