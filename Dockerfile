# Utiliser une image de base Python 3.12
FROM python:3.12-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Installer les dépendances système nécessaires pour mysqlclient
RUN apt-get update && apt-get install -y default-libmysqlclient-dev build-essential pkg-config

# Copier uniquement le fichier requirements.txt dans le conteneur
COPY requirements.txt .

# Mettre à jour pip pour éviter les problèmes de compatibilité
RUN pip install --upgrade pip

# Installer les dépendances Python avec un timeout augmenté
RUN pip install --no-cache-dir --default-timeout=1000 -r requirements.txt

# Copier le reste du code de l'application dans le conteneur
COPY . .

# Exposer le port sur lequel Django va fonctionner
EXPOSE 8000

# Commande pour démarrer l'application
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]



# FROM python:3.12-slim

# WORKDIR /app

# # Installer les dépendances nécessaires pour mysqlclient
# RUN apt-get update && apt-get install -y default-libmysqlclient-dev build-essential pkg-config

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# # Exposer le port sur lequel Django va fonctionner
# EXPOSE 8000

# # Commande pour démarrer l'application
# CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]