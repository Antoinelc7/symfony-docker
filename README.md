# Projet Symfony Dockerisé

Ce projet est un exemple de projet Symfony dockerisé avec les étapes de développement, de préproduction et les configurations de services de base.

## Prérequis

- **Docker :** Assurez-vous d'avoir Docker installé sur votre système. [Télécharger Docker](https://www.docker.com/get-started)
- **Docker Compose :** Docker Compose est utilisé pour simplifier le processus de gestion des conteneurs Docker. Assurez-vous de l'avoir installé. [Installer Docker Compose](https://docs.docker.com/compose/install/)

## Configuration du Projet

1. **Cloner le Projet :** Clonez ce projet sur votre machine locale.

   ```bash
   git clone https://github.com/Antoinelc7/symfony-docker.git
   cd docker-symfony
   ```

2. ## Lancer le Projet en Mode Développement

Pour lancer le projet en mode de développement, utilisez la commande suivante :

```bash
docker compose -f docker-compose.dev.yml up --build
```

Le serveur sera accessible à l'adresse `http://localhost:8080`.

3. ## Lancer le Projet en Mode Preprod

Pour lancer le projet en mode de preprod, utilisez la commande suivante :

Le serveur sera accessible à l'adresse http://localhost:8080.

```bash
docker compose -f docker-compose.preprod.yml up --build
```

## Structure du Projet

- **`/config` :** Contient les fichiers de configuration pour nginx.
- **`/symfony_docker_project` :** Contient le code source de l'application Symfony.
